Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.7184.1589379994025386545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rl3RKHEt;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id o10so14369531ejn.10
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84kfK6sIOAllIK8M0+ya0LPOkmwEdahjUOJWSgleLiM=;
        b=rl3RKHEtvlir1Ypabu2vi/6hcehAUocDMcEeE1Z9QJBwArCAE1akGaFKpzaoIA4Mb1
         AupmQhkJ6lOtDioS99TgI2pfHy+oqcavl0HxDRP1qIw7WmRGF+JsgEAdeCQVti74pjmP
         QlA0mcTHVifDg4XUpIfFiyPN1bSn1hQSjGTSiNZ5ZZrgRhbi3mNH6esRYcBkSe2y07y6
         MizbqnEPNtAJCe2DFMlIZxLHGy0UOXIYabzrIdPN1F4+jnErWGz95fsrKN5D+PFvekIY
         D5s/DvDQrFZ06eyREIuWasHfW8ZqZ1LCpCPiDuP9lSbuaMGe1TBgIhw1NsRW/SowpvZw
         D2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84kfK6sIOAllIK8M0+ya0LPOkmwEdahjUOJWSgleLiM=;
        b=k/dy+pwblqK5Sif63d9RBY+KZEpKGE/N++hcPOnKfQ0ujSz0aiiB3Og4z9hy+c7iNs
         /IAtMA5UCJHMSvr1BRFnpGOWxGNHRgGbP6m9rs7/oJPEzBFr5PD80U8C8Aooeygi2FQc
         SVoLqd4thUK/bqECa2TkpzhMoT9p3LJHVMdXBO6BweT19ju8ie255o8ru48Zr0axSoGj
         V3J01PnwrKv90IRRrfiB1hYg10F8fYV36eVMVidUYAhV3p0T5O5grHWmalHNPUxdQ6/R
         i5hJwBhsGwqIruuw8Fn7bFzMloQujcTunN01DI/Ixgp0bhE4pARgqtfjWj+CPNl8pMT7
         9N7g==
X-Gm-Message-State: AGi0PuZQZFM6vrkSpqHfuJhw5qApOTI/4KxhJat5SdB7a74ql3tDrnSc
	sZzU7Ja2HV9f5IcwDVHvjhfgsm1egFbryZuIixM=
X-Google-Smtp-Source: APiQypKAlz4xEVJ0LhVViDEuSp03mwN1xhWdwMRD9eBm9u8DdBSokUqkl+EC6KxSK+nAIvCJM8QT79P+wwjRMHvjaRY=
X-Received: by 2002:a17:906:25cb:: with SMTP id n11mr23505914ejb.37.1589379992195;
 Wed, 13 May 2020 07:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com> <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
In-Reply-To: <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 13 May 2020 10:26:21 -0400
Message-ID: <CADkTA4Ps-3NAyLoUgMtsaPmP+mZ7P16tVmOAkzCSVoB-2SvT9A@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernel/reproducibility: factor kernel source epoch for common use
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020 at 10:24 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Rather than duplicating the code to generate the kbuild environment
> variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a
> python function and call it from the main image and kernel module
> do_compile routines.
>
> All paths have been checked and the timestamp is identical to the
> previous shell variant.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 43 ++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a3990aaf59..de63e1c0f6 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -153,6 +153,21 @@ python do_symlink_kernsrc () {
>  }
>  addtask symlink_kernsrc before do_configure after do_unpack
>
> +def get_kernel_source_date_epoch(d):
> +    import subprocess
> +
> +    s_d_e = d.getVar("SOURCE_DATE_EPOCH")
> +    if not s_d_e:
> +        s_d_e = subprocess.check_output(['git', '--git-dir=%s/.git' % d.getVar('S'), 'log', '-1', '--pretty=%ct']).decode('utf-8')
> +        if not s_d_e:
> +            s_d_e = d.getVar("REPRODUCIBLE_TIMESTAMP_ROOTFS")
> +
> +    env = os.environ.copy()
> +    env['LC_ALL'] = 'C'

Hah.

Of course after my send, I see that I'm not actually *using* the env.
I'll do an incremental patch to use env while this sits on the list.

Bruce

> +    ts = subprocess.check_output(['date', '-d @%s' % s_d_e]).decode('utf-8')
> +
> +    return ts
> +
>  inherit kernel-arch deploy
>
>  PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
> @@ -291,19 +306,9 @@ get_cc_option () {
>  kernel_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> -               # be set....
> -               if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -                       # The source directory is not necessarily a git repository, so we
> -                       # specify the git-dir to ensure that git does not query a
> -                       # repository in any parent directory.
> -                       SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> -               fi
> -
> -               ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> -               export KBUILD_BUILD_TIMESTAMP="$ts"
> +               export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
>                 export KCONFIG_NOTIMESTAMP=1
> -               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +               bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
>         fi
>         # The $use_alternate_initrd is only set from
>         # do_bundle_initramfs() This variable is specifically for the
> @@ -332,19 +337,9 @@ kernel_do_compile() {
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>         if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> -               # be set....
> -               if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -                       # The source directory is not necessarily a git repository, so we
> -                       # specify the git-dir to ensure that git does not query a
> -                       # repository in any parent directory.
> -                       SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> -               fi
> -
> -               ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> -               export KBUILD_BUILD_TIMESTAMP="$ts"
> +               export KBUILD_BUILD_TIMESTAMP="${@ get_kernel_source_date_epoch(d)}"
>                 export KCONFIG_NOTIMESTAMP=1
> -               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +               bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
>         fi
>         if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>                 cc_extra=$(get_cc_option)
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
