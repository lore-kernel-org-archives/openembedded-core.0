Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id C681F7F7BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 14:33:33 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id r9so28837915otp.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SiYZSiHNFYBmrJY0KX/1xG2CLGx2rBfgfb/S5e7vquY=;
	b=Ih92rqE7tKVOMcmE685hdXwLmue7bcraDupL6i3M1veMouBybOZwbwIR407m7K9daA
	BduONch3Na6QQDQVVON4JAAELT2pIPHxHBMg6b90sztB/NYKXQgu8o7tgfTN3NTcCU61
	KLffPjdLyl7v/R4yY6hFD5Nktzr/4qoV9fpo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SiYZSiHNFYBmrJY0KX/1xG2CLGx2rBfgfb/S5e7vquY=;
	b=YLG63slA5L3HeCB3lDvomhvASJSfip8ia5/n9UfVKi4aEEAIPu/fvaAfnqf4UZHXwY
	JkOmMmWnKBPbco7onrZQRpF0/a8Em6zhgyQvO5aVBYESklgflMUwJQ3JNrq6JZxPm1il
	avxTuelDjMruwwIvghlz4lCc74jGYcyecblDNcFB/870S49dslq0hqjwdnSQxvPrCtyk
	Y3BzyIjRx/hDTWB0xgkACHKDuyWA2Ofjz9hr3nT53zM3McTldokA4ev8C2UszaNCRKm3
	a6pwC7wGoASh1gJmTynXIDN3hyZPCVv0Fw3gb3xehe9ojlSyMo9Pd6pukbNWNCRZzr9Y
	ukdQ==
X-Gm-Message-State: APjAAAWud9JrmOh1tBUtJn6Xs6oItw7o5W2Xgnln27lyzu9cjJuEHEFN
	gG2H5zZREMVOzWeV+DJG7rPEHcKakAcAEuwJbsCS7A==
X-Google-Smtp-Source: APXvYqzDdxzvugn4EGee26wc46TJLNakeSdjhanCtDGWU+PLf7LAQRKKgQxf8C2JTfse9SsbpuytwYFoMegbEtwXV64=
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr15756674oto.367.1579530814709;
	Mon, 20 Jan 2020 06:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20200120132954.2178532-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200120132954.2178532-1-trevor.gamblin@windriver.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 20 Jan 2020 14:33:24 +0000
Message-ID: <CAM9ZRVuWX_Bdy1-YYCe=ZCPrYyB03J95ZR8SUgn9pruO-3P6Bw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbakery: automate build testing across all MACHINEs/LIBCs
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
X-List-Received-Date: Mon, 20 Jan 2020 14:33:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2020 at 13:30, Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> bitbakery simplifies the process of build testing an upgraded or
> patched recipe. It cycles through all qemu targets for glibc and musl,
> and then generates a log file in the format "<recipe>-bitbakery.log",
> containing the results of each build along with some basic system info
> (time, hostname, OS, kernel version). Additionally, it retains the
> previous run's log for comparison, renamed to <recipe>-bitbakery.log.old
> when a new set of builds is triggered.
>
> Sample log output:
>
> BITBAKERY LOG FOR aspell
> START TIME: 2020-01-17_08:39:05
> HOSTNAME: yow-tgamblin-fedora1
> OS: Fedora 31 (Server Edition)
> KERNEL: 5.4.7-200.fc31.x86_64
> ===============
> BUILD RESULTS:
> [glibc]
> FAIL: qemuarm64
> PASS: qemuarm
> PASS: qemuarmv5
> PASS: qemumips64
> PASS: qemumips
> PASS: qemuppc
> PASS: qemuriscv64
> FAIL: qemux86-64
> FAIL: qemux86
> [musl]
> PASS: qemuarm64
> PASS: qemuarm
> PASS: qemuarmv5
> PASS: qemumips64
> PASS: qemumips
> PASS: qemuppc
> PASS: qemuriscv64
> PASS: qemux86-64
> PASS: qemux86
> ===============
> PASSED: 15
> FAILED: 3
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  scripts/bitbakery | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100755 scripts/bitbakery
>
> diff --git a/scripts/bitbakery b/scripts/bitbakery
> new file mode 100755
> index 0000000000..cb2957a7bd
> --- /dev/null
> +++ b/scripts/bitbakery

The name isn't very descriptive. You also need some help output to
explain what this script does, what the arguments are and probably
give an example of usage.

> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +#  Copyright (c) 2020 Wind River Systems, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#

I'd recommend `set -e` and `set -o pipefail` at the top of the script.

> +
> +# Get path to oe-core directory
> +OE_CORE_PATH=$( cd - || exit )

There's no guarantee that the previous directory was the top of
openembedded-core (e.g. if I cd to somewhere else then back to the
build directory).

> +
> +# Get target list and host machine information
> +TARGET_LIST=$(ls "$OE_CORE_PATH"/meta/conf/machine | grep qemu | sed -e 's/\.conf//')

`ls` is a bad choice here - it's often aliased with a user's
preferences. `find -name 'qemu*.conf'` may be a better option.

It'd also be good to make TARGET_LIST configurable.

> +LIBC_LIST="glibc musl"
> +START_TIME=$(date "+%Y-%m-%d_%H:%M:%S")
> +LOG_FILE="$1-bitbakery.log"
> +OS_INFO=$(cat /etc/os-release | grep "PRETTY_NAME=" | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')

You seem to be re-implementing `lsb_release -d`.

> +
> +# Append an existing log file for this build with .old if one exists
> +if [ -f "${LOG_FILE}" ]; then
> +   mv "${LOG_FILE}" "${LOG_FILE}.old"
> +else
> +       touch "${LOG_FILE}"
> +fi
> +
> +# Fill the log file with build and host info
> +echo "BITBAKERY LOG FOR $1" >> "${LOG_FILE}"
> +echo "START TIME: ${START_TIME}" >> "${LOG_FILE}"
> +echo "HOSTNAME: $(uname -n)" >> "${LOG_FILE}"
> +echo "OS: ${OS_INFO}" >> "${LOG_FILE}"
> +echo "KERNEL: $(uname -r)" >> "${LOG_FILE}"

You need to make clear that this is the host OS and kernel not the target.

> +echo "===============" >> "${LOG_FILE}"
> +echo "BUILD RESULTS:" >> "${LOG_FILE}"
> +
> +for j in ${LIBC_LIST}; do
> +    echo "[$j]" >> "${LOG_FILE}"
> +    for i in ${TARGET_LIST}; do
> +    echo "$i" "$j"; \
> +        TCLIBC=$j MACHINE=$i bitbake "$1" && echo "PASS: $i" >> "${LOG_FILE}" || echo "FAIL: $i" >> "${LOG_FILE}";
> +    done;

Indentation and semicolons need tidying up here to match normal shell
script style.

> +done
> +
> +# Get pass/fail totals and add them to the end of the log
> +PASSED=$(grep "PASS:" "${LOG_FILE}" | wc -l)
> +FAILED=$(grep "FAIL:" "${LOG_FILE}" | wc -l)
> +
> +echo "===============" >> "${LOG_FILE}"
> +echo "PASSED: ${PASSED}" >> "${LOG_FILE}"
> +echo "FAILED: ${FAILED}" >> "${LOG_FILE}"
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

