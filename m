Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 19A3B60245
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 00:28:46 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id y8so4178001qvk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 16:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hz7NXR9FC7tHFzwI+BY9z6VnIp7JlFhgIG5Fl7eRZMA=;
	b=nDVPTQ5rzOGIiInq3UZiRLlcgu/juTCHgdLD8x+u0GUlhSl0J3MQt1b19Ia5g2xgox
	BRT8CkpIR+vxMkr7NrjnC/iybWZEenNPgFn3mrfRi85yu1cCfSq0VZAMnPcWaAhmM7rE
	jphWeJFjPOVA2PFMAJFCSEvejFKV08eyWvsuU4w9eKPw28KHFNasuqk41If9VSHvMaP5
	DX6Y5F6WSt/H1fnHpchSA4i9PAgeHU3qQgR6en77GygaKZAXimN30Df4JEGK5BykIZm9
	vzkMDJGqRfVe81pVx3SL8lvvPKmW+UoJz/WKfh/FiH1qlY1CX/BdFFGBA23ObSdgjcYa
	6NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hz7NXR9FC7tHFzwI+BY9z6VnIp7JlFhgIG5Fl7eRZMA=;
	b=HxP6IJ3oSluDlFCCWP6Jsu4fufZkNpk7BXdnHLVO2grGEVlFK/sLpqd4DzI2WYxfGx
	ZcqkTgFk9ZhPG0/QZfh/Qb1xS8o4dQJ1gJFiENvZ6pk3a41g2MgXD/bgctRqWvTNCJmD
	j6RXQES+xNCvavBuzloxtv4zL0gSTIWnaYXWMjY89CxqnOEUaIUiSIJlOiWe41KsEYKV
	vtVbgIu7R0TycwdxI/NgnmJEZRj9oOf0CvNh8W15U6kcq/sJtlnxw5FfuO7VZUB6Y5IK
	i0rOImssGT4m/y1KG7pBDGqQM0EkjJs1YLxBPTgrYsppfg1ALq3Lug9u/CRVz545HM9z
	OyoA==
X-Gm-Message-State: APjAAAVBpGiwnotBG4h2JwYMcKhm4zIjpUvfI+KogqjcBDtNdfxZjnNt
	zlhaljGdkq3kaeEKx0kfLStp19QamTNWyhDHyVvMIBIj
X-Google-Smtp-Source: APXvYqxJBnhMSfYqvbv7zaqkwHVbFbi20NbIw9MZjc/NaqqNwSanJVKk14iWuLqGmSJlAWPr/QwdiCD9NXDiMzTg8GQ=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr12616839qvo.55.1581380927567; 
	Mon, 10 Feb 2020 16:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20200210234603.1718190-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200210234603.1718190-1-trevor.gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2020 16:28:20 -0800
Message-ID: <CAMKF1spA0NSOd9m=T2AHJ0xULm8=9FBgpz4kCAUk_7O_+ONeJg@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
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
X-List-Received-Date: Tue, 11 Feb 2020 00:28:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 3:47 PM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> bitbake-buildall simplifies the process of build testing an upgraded or
> patched recipe by cycling through the build steps for each available qemu
> target, with desired LIBC specified by the user as an option (defaulting
> to both glibc and musl if no option is provided). While building, a log
> file with the name "<recipe>-buildall.log" is written, containing a PASS
> or FAIL line upon completion of the build for each architecture. For now,
> qemu targets are not selectable (i.e. the recipe is built for all qemu
> targets found in meta/conf/machine), but this functionality can be added
> in the future along with other useful options.
>
> The log file created by bitbake-buildall also includes some basic system
> info (e.g. build start time, hostname, host OS, host kernel). Since it is
> not guaranteed that tools such as lsb_release will be available on the
> host (it isn't by default on my Fedora machine), this information is
> collected manually. Additionally, the previous run's log is retained for
> comparison by renaming it in the format <recipe>-buildall.log.old once a
> new set of builds is triggered for the same recipe.
>
> Finally, in v2, the line "set -o pipefail" has been removed to be fully
> POSIX-compatible.
>
> Sample log output:
>
> BITBAKE-BUILDALL LOG FOR aspell
> START TIME: 2020-02-05_15:57:41
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
> FAIL: qemux86-64
> FAIL: qemumips
> FAIL: qemuarm
> FAIL: qemuarm64
> FAIL: qemuriscv64
> [musl]
> PASS: qemuarmv5
> PASS: qemux86
> PASS: qemuppc
> PASS: qemumips64
> PASS: qemux86-64
> PASS: qemumips
> PASS: qemuarm
> PASS: qemuarm64
> PASS: qemuriscv64
> ===============
> PASSED: 13
> FAILED: 5
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  scripts/bitbake-buildall | 120 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100755 scripts/bitbake-buildall

if its building qemu machines only, then naming it build-qemuall.sh or
some such would be
better, I would avoid usine bitbake- prefix. That can confuse with bitbake tools

>
> diff --git a/scripts/bitbake-buildall b/scripts/bitbake-buildall
> new file mode 100755
> index 0000000000..74a5994f2f
> --- /dev/null
> +++ b/scripts/bitbake-buildall
> @@ -0,0 +1,120 @@
> +#!/bin/sh
> +#  Copyright (c) 2020 Wind River Systems, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# bitbake-buildall: a tool for automating build testing of recipes
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
> +    echo "-l, --libc            Specify one of \"libc\" or \"musl\""
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
> +       LIBC_LIST="$2"
> +       echo "$LIBC_LIST"
> +    else
> +       LIBC_LIST="glibc musl"
> +       echo "$LIBC_LIST"
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
> +          touch "${LOG_FILE}"
> +    fi
> +
> +    # Fill the log file with build and host info
> +    echo "BITBAKE-BUILDALL LOG FOR $1" >> "${LOG_FILE}"
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
> +       echo "[$j]" >> "${LOG_FILE}"
> +       for i in ${TARGET_LIST}
> +       do
> +           echo "$i" "$j"; \
> +           TCLIBC=$j MACHINE=$i bitbake "$1" && echo "PASS: $i" >> "${LOG_FILE}" || echo "FAIL: $i" >> "${LOG_FILE}"
> +       done
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
> +       -l|--libc)
> +       if [ "$2" = "glibc" ] || [ "$2" = "musl" ]
> +       then
> +           LIBC_LIST="$2"
> +       else
> +           echo "Unrecognized libc option."
> +           usage && exit 1
> +       fi
> +       shift
> +       shift
> +       ;;
> +       *)
> +        RECIPE="$1"
> +       shift
> +       ;;
> +    esac
> +done
> +
> +set -- "$RECIPE"
> +
> +# run buildall for the given recipe and LIBC
> +if [ -n "$1" ]
> +then
> +       buildall "$1" "$LIBC_LIST"
> +fi
> +
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

