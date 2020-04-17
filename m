Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2796.1587089407917616690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 19:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03H2A6JL018499
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2020 19:10:06 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 16 Apr
 2020 19:10:05 -0700
Subject: Re: [OE-core] [PATCH v2] buildall-qemu: automate build testing for qemu MACHINEs
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
        <openembedded-core@lists.openembedded.org>
References: <20200225141115.876047-1-trevor.gamblin@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <55b9b8f7-1d5d-3b32-772a-0e918d0b0b66@windriver.com>
Date: Thu, 16 Apr 2020 22:10:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225141115.876047-1-trevor.gamblin@windriver.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-02-25 9:11 a.m., Trevor Gamblin wrote:
> buildall-qemu simplifies the process of build testing an upgraded or
> patched recipe 

I think this is a useful little script. please rebase and re-submit
once master opens up.

../Randy (will use an alias using the original name: bitbakery) MacLeod

> by cycling through the build steps for each available qemu
> target, with desired LIBC specified by the user as an option (defaulting
> to both glibc and musl if no option is provided). While building, a log
> file with the name "<recipe>-buildall.log" is written, containing a PASS
> or FAIL line upon completion of the build for each architecture. For now,
> qemu targets are not selectable (i.e. the recipe is built for all qemu
> targets found in meta/conf/machine), but this functionality can be added
> in the future along with other useful options.
> 
> The log file created by buildall-qemu also includes some basic system
> info (e.g. build start time, hostname, host OS, host kernel). Since it is
> not guaranteed that tools such as lsb_release will be available on the
> host (it isn't by default on my Fedora machine), this information is
> collected manually. Additionally, the previous run's log is retained for
> comparison by renaming it in the format <recipe>-buildall.log.old once a
> new set of builds is triggered for the same recipe.
> 
> We've seen multiple variations of this concept in use as one-liners and
> as bash functions in dotfiles, so it seemed appropriate to submit it in
> script form to oe-core for everyone to use.
> 
> Sample log output:
> 
> BUILDALL-QEMU LOG FOR aspell
> START TIME: 2020-02-11_19:50:02
> HOSTNAME: yow-tgamblin-fedora2
> HOST OS: Fedora 31 (Server Edition)
> HOST KERNEL: 5.4.10-200.fc31.x86_64
> ===============
> BUILD RESULTS:
> [glibc]
> PASS: qemuarmv5
> PASS: qemux86
> PASS: qemuppc
> PASS: qemumips64
> PASS: qemux86-64
> PASS: qemumips
> PASS: qemuarm
> PASS: qemuarm64
> PASS: qemuriscv64
> [musl]
> PASS: qemuarmv5
> PASS: qemux86
> PASS: qemuppc
> PASS: qemumips64
> PASS: qemux86-64
> FAIL: qemumips
> FAIL: qemuarm
> FAIL: qemuarm64
> FAIL: qemuriscv64
> ===============
> PASSED: 14
> FAILED: 4
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   scripts/buildall-qemu | 120 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 120 insertions(+)
>   create mode 100755 scripts/buildall-qemu
> 
> diff --git a/scripts/buildall-qemu b/scripts/buildall-qemu
> new file mode 100755
> index 0000000000..ca9aafadf7
> --- /dev/null
> +++ b/scripts/buildall-qemu
> @@ -0,0 +1,120 @@
> +#!/bin/sh
> +#  Copyright (c) 2020 Wind River Systems, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# buildall-qemu: a tool for automating build testing of recipes
> +# TODO: Add support for selecting which qemu architectures to build
> +# TODO: Add support for queueing up multiple recipe builds
> +# TODO: Add more logging options (e.g. local.conf info, bitbake env info)
> +
> +usage ()
> +{
> +    base=$(basename "$0")
> +    echo "Usage: $base [options] [recipename/target]"
> +    echo "Executes a build of a given target for selected LIBCs. With no options, default to both libc and musl."
> +    echo "Options:"
> +    echo "-l, --libc            Specify one of \"glibc\" or \"musl\""
> +}
> +
> +
> +buildall ()
> +{
> +    # Get path to oe-core directory. Since oe-init-build-env prepends $PATH with
> +    # the path to the scripts directory, get it from there
> +    SCRIPTS_PATH="$(echo "$PATH" | cut -d ":" -f 1)"
> +    OE_CORE_PATH=$(echo "$SCRIPTS_PATH" | sed 's|\(.*\)/.*|\1|')
> +
> +    # Get target list and host machine information
> +    TARGET_LIST=$(find "$OE_CORE_PATH"/meta/conf/machine -maxdepth 1 -type f | grep qemu | sed 's|.*/||' | sed -e 's/\.conf//')
> +
> +    # Set LIBC value to use for the builds based on options provided by the user
> +    if [ -n "$2" ]
> +    then
> +	LIBC_LIST="$2"
> +	echo "$LIBC_LIST"
> +    else
> +	LIBC_LIST="glibc musl"
> +	echo "$LIBC_LIST"
> +    fi
> +
> +    START_TIME=$(date "+%Y-%m-%d_%H:%M:%S")
> +    LOG_FILE="$1-buildall.log"
> +    OS_INFO=$(grep "PRETTY_NAME=" /etc/os-release | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
> +
> +    # Append an existing log file for this build with .old if one exists
> +    if [ -f "${LOG_FILE}" ]
> +    then
> +       mv "${LOG_FILE}" "${LOG_FILE}.old"
> +    else
> +	   touch "${LOG_FILE}"
> +    fi
> +
> +    # Fill the log file with build and host info
> +    echo "BUILDALL-QEMU LOG FOR $1" >> "${LOG_FILE}"
> +    echo "START TIME: ${START_TIME}" >> "${LOG_FILE}"
> +    echo "HOSTNAME: $(uname -n)" >> "${LOG_FILE}"
> +    echo "HOST OS: ${OS_INFO}" >> "${LOG_FILE}"
> +    echo "HOST KERNEL: $(uname -r)" >> "${LOG_FILE}"
> +    echo "===============" >> "${LOG_FILE}"
> +    echo "BUILD RESULTS:" >> "${LOG_FILE}"
> +
> +    # start the builds for each MACHINE and TCLIBC
> +    for j in ${LIBC_LIST}
> +    do
> +	echo "[$j]" >> "${LOG_FILE}"
> +	for i in ${TARGET_LIST}
> +	do
> +	    echo "$i" "$j"; \
> +	    TCLIBC=$j MACHINE=$i bitbake "$1" && echo "PASS: $i" >> "${LOG_FILE}" || echo "FAIL: $i" >> "${LOG_FILE}"
> +	done
> +    done
> +
> +    # Get pass/fail totals and add them to the end of the log
> +    PASSED=$(grep "PASS:" "${LOG_FILE}" | wc -l)
> +    FAILED=$(grep "FAIL:" "${LOG_FILE}" | wc -l)
> +
> +    echo "===============" >> "${LOG_FILE}"
> +    echo "PASSED: ${PASSED}" >> "${LOG_FILE}"
> +    echo "FAILED: ${FAILED}" >> "${LOG_FILE}"
> +}
> +
> +
> +# fail entire script if any command fails
> +set -e
> +
> +# print usage and exit if not enough args given
> +[ $# -eq 0 ] && usage && exit 1
> +
> +# handle arguments
> +RECIPE=
> +while [ $# -gt 0 ]
> +do
> +    arg=$1
> +    case $arg in
> +	-l|--libc)
> +	if [ "$2" = "glibc" ] || [ "$2" = "musl" ]
> +	then
> +	    LIBC_LIST="$2"
> +	else
> +	    echo "Unrecognized libc option."
> +	    usage && exit 1
> +	fi
> +	shift
> +	shift
> +	;;
> +	*)
> +        RECIPE="$1"
> +	shift
> +	;;
> +    esac
> +done
> +
> +set -- "$RECIPE"
> +
> +# run buildall for the given recipe and LIBC
> +if [ -n "$1" ]
> +then
> +	buildall "$1" "$LIBC_LIST"
> +fi
> +
> 


-- 
# Randy MacLeod
# Wind River Linux
