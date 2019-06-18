Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E41BD7E97A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:59:42 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h21so15899508qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RoAaek84+/kR9ydFlqrU0l4XEp/JfIeJJ/DrHxLMFWc=;
	b=st+p+7rWey1RiwNjGqBGDs853sHq8l7jfgxNneCrCwsjgmLjHdmnFTD/CoTEBvmtuD
	G0F6HT1YkIhOFG6ODx4mzjIGtF+QgKaj/8lo1FcrAVrziPWNJHS4pCGBAb9TMlF7YzZO
	t5o1xrISBZkJcHQcYX8cPo63EB/DtjmW9gNhiUKdXDQhgy/8N1IHDx8fjfKGUYv95nUk
	mqqKWeeFRSnDNrcggV73fzff7wRYMydQYuc//yYa9g660wC+3CEHmd90ZrQouHYbenMp
	muLxnr4HqwfQUJ/LB4dXowZAHTmhQG6ALE6s7Ry9tUPS/5b1FXCt/5IumQEze0n8nKaE
	Pk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RoAaek84+/kR9ydFlqrU0l4XEp/JfIeJJ/DrHxLMFWc=;
	b=ETknJUqZxA5TktzFs+gjDyXr8ng+ORWJuCGLLQpnitzbK+Hz2UkmFmq3GV0hDqc5KX
	XxnCLnX+PiJJc/HrGXbeKHd3ttLy09SLBkObGx5QtyDI6rEymz54m4fz5ocH8n0Qevt/
	BmenRbDTZ/iOnEq+n2KBcLPYv3G/pYrPClYhF+sx4+OFCimiwdznYdAmO554QGEcmI1Z
	5djqHO18eg4dvwth9McCVEMhk3ohx7i3v10X0Ps8ipHJkASxw5+01Fk37GEw8LwrflBT
	o9OYueFkIKNDMsDZVuU+GSGm+tFV8QK45nF/l5NXysjYscDRXXgsnp0cJGFFcgb5Zk+X
	57xg==
X-Gm-Message-State: APjAAAUJ/5Gwp68CRcn6JJf/tc2mFsQQrqpcUEMFCqfTst4Ms+uANwQB
	qUx48BS2c9DOs9pyGmWe5U6/JxOea7CLQFLGsT+Oy4Um9dk=
X-Google-Smtp-Source: APXvYqw2ZjgLYQGryxR4PEAKshWEckvdxoBjH/3mbdnKbAWAhl7/viC447iSt/9kUfFhN5ktigDR50zGaKn5MCp3XBw=
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr28136119qvc.65.1560873583439; 
	Tue, 18 Jun 2019 08:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
	<1560844016-105234-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1560844016-105234-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 08:59:16 -0700
Message-ID: <CAMKF1sqnCrE8G52LQHMeC-E_6uaH_NVN+Eg7+irdbBPM1fxHRw@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Tue, 18 Jun 2019 15:59:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 12:47 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> The SDK was unable to find the C++ header pieces correctly since it's
> using a generic compiler, not one specifically targeting the multilib
> vendor prefix and default tune.  This adds the right mapping to ensure
> SDKs work as expected. And fix problem in below configurations:
>
> multilib configuration 1:
> MACHINE="qemumips64"
> MULTILIBS ?= "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> require conf/multilib.conf
>
> ignoring nonexistent directory "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32
>
> multilib configuration 2:
> MACHINE="qemumips64"
> MULTILIBS = 'multilib:lib64 multilib:lib32'

machine is already 64bit so default lib config will be 64bit, what is
multilib:lib64 for here ?

> DEFAULTTUNE = 'mips64-n32'
> DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
> DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
> require conf/multilib.conf
>
> For this configuration:
> for target gcc-runtime, need to create symlink like mips64-poly-linux --> mips64-poky-linux-gnu32
> for target lib64-gcc-runtime, need to create symlink like mips64-poly-linux/32 --> mips64-pokymllib64-linux
> in order to avoid conflict during populate_sdk, create symlink for subfoler bits/ext for target gcc-runtime,
> this is ugly, but seems no better way to cover all kinds of configuration.
>
> single lib configuration:
> MACHINE="qemumips64"
> DEFAULTTUNE = "mips64-n32"
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 3d03d8e..ba767e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -86,10 +86,6 @@ do_install () {
>         if [ -d ${D}${infodir} ]; then
>                 rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>         fi
> -       if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> -               ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
> -       fi
> -
>  }
>
>  do_install_append_class-target () {
> @@ -98,20 +94,29 @@ do_install_append_class-target () {
>         fi
>
>         if [ "${TARGET_OS}" = "linux-gnun32" ]; then
> -               if [ "${MULTILIBS}" != "" ]; then
> -                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
> -                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
> +               if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
> +               elif [ "${MULTILIB_VARIANTS}" != "" ]; then
> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
>                 else
>                         ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>                 fi
> -       fi
> -       if [ "${TARGET_OS}" = "linux-gnux32" ]; then
> -               if [ "${MULTILIBS}" != "" ]; then
> -                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
> -                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
> +       elif [ "${TARGET_OS}" = "linux-gnux32" ]; then
> +               if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
> +               elif [ "${MULTILIB_VARIANTS}" != "" ]; then
> +                       mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> +                       ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
>                 else
>                         ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
>                 fi
> +       elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> +               mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> +               ln -s ../${TARGET_SYS}/bits ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
> +               ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
>         fi
>
>         if [ "${TCLIBC}" != "glibc" ]; then
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

