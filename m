Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 837A960CCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 14:06:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01BE6JtQ010068
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 11 Feb 2020 06:06:29 -0800
Received: from [128.224.22.210] (128.224.22.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 11 Feb 2020 06:06:08 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20200210234603.1718190-1-trevor.gamblin@windriver.com>
	<CAMKF1spA0NSOd9m=T2AHJ0xULm8=9FBgpz4kCAUk_7O_+ONeJg@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <54185c02-4e1c-008f-b3d1-a97bea80771c@windriver.com>
Date: Tue, 11 Feb 2020 09:06:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spA0NSOd9m=T2AHJ0xULm8=9FBgpz4kCAUk_7O_+ONeJg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake-buildall: automate build testing for qemu MACHINEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2020 14:06:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/10/20 7:28 PM, Khem Raj wrote:
> On Mon, Feb 10, 2020 at 3:47 PM Trevor Gamblin
> <trevor.gamblin@windriver.com> wrote:
>> bitbake-buildall simplifies the process of build testing an upgraded or
>> patched recipe by cycling through the build steps for each available qemu
>> target, with desired LIBC specified by the user as an option (defaulting
>> to both glibc and musl if no option is provided). While building, a log
>> file with the name "<recipe>-buildall.log" is written, containing a PASS
>> or FAIL line upon completion of the build for each architecture. For now,
>> qemu targets are not selectable (i.e. the recipe is built for all qemu
>> targets found in meta/conf/machine), but this functionality can be added
>> in the future along with other useful options.
>>
>> The log file created by bitbake-buildall also includes some basic system
>> info (e.g. build start time, hostname, host OS, host kernel). Since it is
>> not guaranteed that tools such as lsb_release will be available on the
>> host (it isn't by default on my Fedora machine), this information is
>> collected manually. Additionally, the previous run's log is retained for
>> comparison by renaming it in the format <recipe>-buildall.log.old once a
>> new set of builds is triggered for the same recipe.
>>
>> Finally, in v2, the line "set -o pipefail" has been removed to be fully
>> POSIX-compatible.
>>
>> Sample log output:
>>
>> BITBAKE-BUILDALL LOG FOR aspell
>> START TIME: 2020-02-05_15:57:41
>> HOSTNAME: yow-tgamblin-fedora2
>> HOST OS: Fedora 31 (Server Edition)
>> HOST KERNEL: 5.4.10-200.fc31.x86_64
>> ===============
>> BUILD RESULTS:
>> [glibc]
>> PASS: qemuarmv5
>> PASS: qemux86
>> PASS: qemuppc
>> PASS: qemumips64
>> FAIL: qemux86-64
>> FAIL: qemumips
>> FAIL: qemuarm
>> FAIL: qemuarm64
>> FAIL: qemuriscv64
>> [musl]
>> PASS: qemuarmv5
>> PASS: qemux86
>> PASS: qemuppc
>> PASS: qemumips64
>> PASS: qemux86-64
>> PASS: qemumips
>> PASS: qemuarm
>> PASS: qemuarm64
>> PASS: qemuriscv64
>> ===============
>> PASSED: 13
>> FAILED: 5
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   scripts/bitbake-buildall | 120 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 120 insertions(+)
>>   create mode 100755 scripts/bitbake-buildall
> if its building qemu machines only, then naming it build-qemuall.sh or
> some such would be
> better, I would avoid usine bitbake- prefix. That can confuse with bitbake tools

The intent is that it can be extended to machines other than just qemu 
with later patches, so I'm hesitant to give it a qemu-specific name.

I could rename it to something like buildall-targets.

>
>> diff --git a/scripts/bitbake-buildall b/scripts/bitbake-buildall
>> new file mode 100755
>> index 0000000000..74a5994f2f
>> --- /dev/null
>> +++ b/scripts/bitbake-buildall
>> @@ -0,0 +1,120 @@
>> +#!/bin/sh
>> +#  Copyright (c) 2020 Wind River Systems, Inc.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# bitbake-buildall: a tool for automating build testing of recipes
>> +# TODO: Add support for selecting which qemu architectures to build
>> +# TODO: Add support for queueing up multiple recipe builds
>> +# TODO: Add more logging options (e.g. local.conf info, bitbake env info)
>> +
>> +usage ()
>> +{
>> +    base=$(basename "$0")
>> +    echo "Usage: $base [options] [recipename/target]"
>> +    echo "Executes a build of a given target for selected LIBCs. With no options, default to both libc and musl."
>> +    echo "Options:"
>> +    echo "-l, --libc            Specify one of \"libc\" or \"musl\""
>> +}
>> +
>> +
>> +buildall ()
>> +{
>> +    # Get path to oe-core directory. Since oe-init-build-env prepends $PATH with
>> +    # the path to the scripts directory, get it from there
>> +    SCRIPTS_PATH="$(echo "$PATH" | cut -d ":" -f 1)"
>> +    OE_CORE_PATH=$(echo "$SCRIPTS_PATH" | sed 's|\(.*\)/.*|\1|')
>> +
>> +    # Get target list and host machine information
>> +    TARGET_LIST=$(find "$OE_CORE_PATH"/meta/conf/machine -maxdepth 1 -type f | grep qemu | sed 's|.*/||' | sed -e 's/\.conf//')
>> +
>> +    # Set LIBC value to use for the builds based on options provided by the user
>> +    if [ -n "$2" ]
>> +    then
>> +       LIBC_LIST="$2"
>> +       echo "$LIBC_LIST"
>> +    else
>> +       LIBC_LIST="glibc musl"
>> +       echo "$LIBC_LIST"
>> +    fi
>> +
>> +    START_TIME=$(date "+%Y-%m-%d_%H:%M:%S")
>> +    LOG_FILE="$1-buildall.log"
>> +    OS_INFO=$(grep "PRETTY_NAME=" /etc/os-release | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
>> +
>> +    # Append an existing log file for this build with .old if one exists
>> +    if [ -f "${LOG_FILE}" ]
>> +    then
>> +       mv "${LOG_FILE}" "${LOG_FILE}.old"
>> +    else
>> +          touch "${LOG_FILE}"
>> +    fi
>> +
>> +    # Fill the log file with build and host info
>> +    echo "BITBAKE-BUILDALL LOG FOR $1" >> "${LOG_FILE}"
>> +    echo "START TIME: ${START_TIME}" >> "${LOG_FILE}"
>> +    echo "HOSTNAME: $(uname -n)" >> "${LOG_FILE}"
>> +    echo "HOST OS: ${OS_INFO}" >> "${LOG_FILE}"
>> +    echo "HOST KERNEL: $(uname -r)" >> "${LOG_FILE}"
>> +    echo "===============" >> "${LOG_FILE}"
>> +    echo "BUILD RESULTS:" >> "${LOG_FILE}"
>> +
>> +    # start the builds for each MACHINE and TCLIBC
>> +    for j in ${LIBC_LIST}
>> +    do
>> +       echo "[$j]" >> "${LOG_FILE}"
>> +       for i in ${TARGET_LIST}
>> +       do
>> +           echo "$i" "$j"; \
>> +           TCLIBC=$j MACHINE=$i bitbake "$1" && echo "PASS: $i" >> "${LOG_FILE}" || echo "FAIL: $i" >> "${LOG_FILE}"
>> +       done
>> +    done
>> +
>> +    # Get pass/fail totals and add them to the end of the log
>> +    PASSED=$(grep "PASS:" "${LOG_FILE}" | wc -l)
>> +    FAILED=$(grep "FAIL:" "${LOG_FILE}" | wc -l)
>> +
>> +    echo "===============" >> "${LOG_FILE}"
>> +    echo "PASSED: ${PASSED}" >> "${LOG_FILE}"
>> +    echo "FAILED: ${FAILED}" >> "${LOG_FILE}"
>> +}
>> +
>> +
>> +# fail entire script if any command fails
>> +set -e
>> +
>> +# print usage and exit if not enough args given
>> +[ $# -eq 0 ] && usage && exit 1
>> +
>> +# handle arguments
>> +RECIPE=
>> +while [ $# -gt 0 ]
>> +do
>> +    arg=$1
>> +    case $arg in
>> +       -l|--libc)
>> +       if [ "$2" = "glibc" ] || [ "$2" = "musl" ]
>> +       then
>> +           LIBC_LIST="$2"
>> +       else
>> +           echo "Unrecognized libc option."
>> +           usage && exit 1
>> +       fi
>> +       shift
>> +       shift
>> +       ;;
>> +       *)
>> +        RECIPE="$1"
>> +       shift
>> +       ;;
>> +    esac
>> +done
>> +
>> +set -- "$RECIPE"
>> +
>> +# run buildall for the given recipe and LIBC
>> +if [ -n "$1" ]
>> +then
>> +       buildall "$1" "$LIBC_LIST"
>> +fi
>> +
>> --
>> 2.24.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

