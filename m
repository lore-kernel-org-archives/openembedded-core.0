Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.44.1589484337801410004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 12:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pn8cHzV2;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id e2so3747884eje.13
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LW/NDFJC5NuHGRYfkaDG8AkAREBj5JWJKgQzCkYqarc=;
        b=Pn8cHzV2QKD/jWebIPv4Y3vRgcKP7CSaScjqOnr2X3v4c+1rDAknz1xu/FUIQGZONT
         y0fuaQo0hjTc/0qwmiqhfvnNzJkiIu0KBrBeEcI6YvtE0WgRPz34LYdpGyyZjN4k+yJ+
         DTsWHwaPS9BSMN6tiLxIBmj03PqrGiD7DMp2k1ZCLYfEeNcCPnSMK43SFyWsX7WsRgp4
         VRRX3CYJtAA6glLiQL1qAWweO6Wg3IKyVrKd6EW2/C/PkQySBVVOOCY9zOFFuYMoTO0p
         WTgzI3HakcKef6x2l4zzqTaMZNQgHQB889IhryDupl+iz0Y6nHMpAjtabzzGTnb11xxg
         IJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LW/NDFJC5NuHGRYfkaDG8AkAREBj5JWJKgQzCkYqarc=;
        b=GmBhy62+8X4+ho7U8ssKc0Zx1BkFHJJ9GmwaRRi4kkjPjE3A82PdRsDMEHFA836JIa
         eJmzBaPy/DktWMM9gBH+UVe71IBUKeA3R3z1LdOGieXaw4mNnuU8wutHeyEmYmCQeviI
         W1wqrToNrOWfEOeyJesAnU4qqDM2YIY03hReJDrpSDUK5C2G7X0unHjRBbeO9IrtwK1m
         sU7sMHRvGsAMcuFkP9flLXwBHhXI2lBunMzph1d3lI3FxtxpraUGiBnPg8MJLc4yQQ3N
         2VSCcF5Mh3psWs538lO+gr3DcSaaZE94H4fzeNeLSIjAjgL+1ZI8Y1jJZhq5uGvr9DMP
         SdLQ==
X-Gm-Message-State: AOAM532hlBHv3nJ4Gb+OlZOcjgpN+IjTdOA+sgP7qBBvF3OqfJahO6+c
	F6l9aECbFuOkaZghSfL75WM6x3TFhLVtam0nBSQ=
X-Google-Smtp-Source: ABdhPJwE6NR16jrKtxu8FzxYtvZMFb6TLJ/ha0QXsS5gfrOWgV2lANiK5L8Ev+OFn3TecnOGCgnhc2lqP0blaZtOjbQ=
X-Received: by 2002:a17:906:1f16:: with SMTP id w22mr5491179ejj.327.1589484336062;
 Thu, 14 May 2020 12:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
 <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
 <3cecc535-4291-4ce1-a25d-51db2b9d0415@gmail.com>
In-Reply-To: <3cecc535-4291-4ce1-a25d-51db2b9d0415@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 14 May 2020 15:25:23 -0400
Message-ID: <CADkTA4N=MwDmhcDRztDoha8-ezAioPOn4dWCvjWG4R_pS=U9uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] kernel/reproducibility: factor kernel source epoch for common use
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 1:11 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
> On 5/13/20 9:24 AM, Bruce Ashfield wrote:
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
> +    s_d_e =3D d.getVar("SOURCE_DATE_EPOCH")
> +    if not s_d_e:
> +        s_d_e =3D subprocess.check_output(['git', '--git-dir=3D%s/.git'=
 % d.getVar('S'), 'log', '-1', '--pretty=3D%ct']).decode('utf-8')
> +        if not s_d_e:
> +            s_d_e =3D d.getVar("REPRODUCIBLE_TIMESTAMP_ROOTFS")
> +
> +    env =3D os.environ.copy()
> +    env['LC_ALL'] =3D 'C'
> +    ts =3D subprocess.check_output(['date', '-d @%s' % s_d_e]).decode('=
utf-8')
> +
> +    return ts
> +
>
> Is there something special about the kernel that it can't use the SOURCE=
_DATE_EPOCH guessing code from classes/reproducible_build.bbclass? If so, i=
s it possible there is some minor change we could make to the code to make =
it work? It seems a little unfortunate to replicate the logic to calculate =
the SDE when that class does it already.
>

That's where it is getting the SOURCE_DATE_EPOCH from in the first
line. Only if it isn't set is it falling back and querying the top git
commit and finally the timestamp.

Or at least that's what I understood it to be doing :D

Bruce

>
>  inherit kernel-arch deploy
>
>  PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
> @@ -291,19 +306,9 @@ get_cc_option () {
>  kernel_do_compile() {
>   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>   if [ "${BUILD_REPRODUCIBLE_BINARIES}" =3D "1" ]; then
> - # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> - # be set....
> - if [ "${SOURCE_DATE_EPOCH}" =3D "" -o "${SOURCE_DATE_EPOCH}" =3D "0" ]=
; then
> - # The source directory is not necessarily a git repository, so we
> - # specify the git-dir to ensure that git does not query a
> - # repository in any parent directory.
> - SOURCE_DATE_EPOCH=3D`git --git-dir=3D"${S}/.git" log -1 --pretty=3D%ct=
 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> - fi
> -
> - ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`
> - export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> + export KBUILD_BUILD_TIMESTAMP=3D"${@ get_kernel_source_date_epoch(d)}"
>   export KCONFIG_NOTIMESTAMP=3D1
> - bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> + bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
>   fi
>   # The $use_alternate_initrd is only set from
>   # do_bundle_initramfs() This variable is specifically for the
> @@ -332,19 +337,9 @@ kernel_do_compile() {
>  do_compile_kernelmodules() {
>   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>   if [ "${BUILD_REPRODUCIBLE_BINARIES}" =3D "1" ]; then
> - # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> - # be set....
> - if [ "${SOURCE_DATE_EPOCH}" =3D "" -o "${SOURCE_DATE_EPOCH}" =3D "0" ]=
; then
> - # The source directory is not necessarily a git repository, so we
> - # specify the git-dir to ensure that git does not query a
> - # repository in any parent directory.
> - SOURCE_DATE_EPOCH=3D`git --git-dir=3D"${S}/.git" log -1 --pretty=3D%ct=
 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> - fi
> -
> - ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`
> - export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> + export KBUILD_BUILD_TIMESTAMP=3D"${@ get_kernel_source_date_epoch(d)}"
>   export KCONFIG_NOTIMESTAMP=3D1
> - bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> + bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
>   fi
>   if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
>   cc_extra=3D$(get_cc_option)
>
>
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
