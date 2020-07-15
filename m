Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.413.1594843325216400452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 13:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gSTaayyy;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id x205so1755091vsc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4pgVLuD6dlfvGd5WVdr9idIBRRil3mB+uFU4tf4jh7I=;
        b=gSTaayyyBg7uC5rufg0ABXP+/91Y0osTlh69pkUDOL38Xqg6yCjFZxJBLCWu52ol4T
         Q9rphWzz8D7qIm+U6OSV57UmfS7BRBfKgUqqr70McfGKa9sAIs1yO47BdAx6TSDLfVpz
         pmPnvQgH6A/7T1xOzmwPLHQSpym/TdZBMQWWFXBlyecETPfDogXKCYo8r5/FFYsrONZg
         qUmvChEXoBxIvVEqXlXmiWyDMT30VnZ1OacXwF8jFOoDCviTAzeGcpB7put3CZBi7m73
         RTImZu+xCyVG9lLhFSdZNeEK11p++i57HUd11MXxQBYnzcBkNI9ICbcOp+dGqIfnCEkE
         B4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4pgVLuD6dlfvGd5WVdr9idIBRRil3mB+uFU4tf4jh7I=;
        b=IM42fG2p+QWCXg+WU/3NA+C6wtPLTs3QWTNd1s5b1l6VKvy1tu35BXI9EkAum5u06h
         ihg71T2BE7nVDBdJx6I+SkebAN4vWIhR3dGmVFC5Zx/0z4tASOfjrjytklUKWqM2Itb5
         OERhWY/aWC/J4h7HupgL1k1pHs6KN3I/M2D6hxX+4ZfvqBAoQCiBREGL+xCRwF7aLzBp
         If/fL+gjg94fPCdRAXrG5zBJ9pl6zZ+r54q03LYfTGNkzaJQ3IIAuK3Z0fVgFv0aiceH
         G+oyruhMQkJhT7+gpYmRHyafr9N1wAAnjCaMSzvSjNnuAlgltG3X1v1l4e38JOr8b5Z7
         IqTg==
X-Gm-Message-State: AOAM530abLQtHNf5y9hs2j7l1pnJGvBjLeeyWgvbgM6KU+/pH0l1c8q5
	q9ICK67zx2J/CFgV9koydasRqUErVSbtfS6OT9q7jwWw
X-Google-Smtp-Source: ABdhPJxIy559Luuph0eNCjRNrreZW6AHHWGqcUlk7UGmGOHo+hNzPSpl65wd7ULLRhbEyqZNWcg0CuUv1LqxMrWJOCs=
X-Received: by 2002:a67:ef4f:: with SMTP id k15mr727896vsr.222.1594843324109;
 Wed, 15 Jul 2020 13:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593474787.git.anuj.mittal@intel.com> <d449e6b536c197b6723dab1d61e989706c14f19c.1593474787.git.anuj.mittal@intel.com>
In-Reply-To: <d449e6b536c197b6723dab1d61e989706c14f19c.1593474787.git.anuj.mittal@intel.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 15 Jul 2020 13:01:52 -0700
Message-ID: <CAJ86T=XQ9ryYztHBhvoDxMH+YPO-V-cr56Y5WkB3u+N_4PZTtA@mail.gmail.com>
Subject: Re: [OE-core] [zeus][PATCH 09/10] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 5:54 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> From: Peter Kjellerstedt <pkj@axis.com>
>
> Rewrite relocatable_native_pcfiles() so that it can handle that any of
> the checked pkgconfig directories are empty without causing an
> exception.

This seems to be causing build failures for libnsl2-native:

  | ../../git/src/yp_xdr.c:38:23: fatal error: netconfig.h: No such
file or directory
  |  #include <netconfig.h>
  |                        ^
  | compilation terminated.

The header is there under
recipe-sysroot-native/usr/include/tirpc/netconfig.h, so It looks like
this patch somehow breaks libnsl2-native's ability to find or use
libtirpc.pc

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit f9c5df6dc1c13e9b05ff1b47ad84ad339f6779a4)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/relocatable.bbclass | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
> index 582812c1cf..af04be5cca 100644
> --- a/meta/classes/relocatable.bbclass
> +++ b/meta/classes/relocatable.bbclass
> @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
>      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
>  }
>
> -relocatable_native_pcfiles () {
> -       if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> -               rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') + "/pkgconfig")}
> -               sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
> -       fi
> -       if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> -               rel=${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') + "/pkgconfig")}
> -               sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
> -       fi
> +relocatable_native_pcfiles() {
> +       for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> +               files_template=${SYSROOT_DESTDIR}$dir/*.pc
> +               # Expand to any files matching $files_template
> +               files=$(echo $files_template)
> +               # $files_template and $files will differ if any files were found
> +               if [ "$files_template" != "$files" ]; then
> +                       rel=$(realpath -m --relative-to=$dir ${base_prefix})
> +                       sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> +               fi
> +       done
>  }
> --
> 2.25.4
>
> 
