Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web08.13337.1604677538502667732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 07:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tX9xmGaO;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id 7so2572241ejm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vSyMFylZ58cyvIU45ixhkLk7QoqBJejfhoceQM5V5Js=;
        b=tX9xmGaO7v/wq2JV5Z3r8vvOkkQV1zogZzq7SiOnvmXDTWphjwPwFyGQlgWfrAM/ZF
         DAAxrhW5SBVGVsnjD9aQG3lpT0XHA69aXPrrxfPmsM5PAzacw8xah8Upzov6ojOfkxUi
         jSQgChlmQFjDswLJLNFUdiAskIExXvbZ9R/nFE/YJYK83bKQH90/kOJMzjcyvgnSPSGW
         Ei0zRiBP3L4Al7jgLwFMUt42gCpz55DKYX9ZUcQ8/c+Yl2SAt2acY1qpQYLAo9BvKhQ5
         RTII04prXt3ev1kxGcSLJNA7LllLWgGf8PsXAaX/s8cLV6nbfvAR9uc93WDRgiGCZxXA
         o58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vSyMFylZ58cyvIU45ixhkLk7QoqBJejfhoceQM5V5Js=;
        b=SvDmsJvUNMA3PfV4l62WerbMF0oXR353YNyPzlS1mhYlkHplfMSR+nh64PHStASgzp
         teYUt1wMFzaDMhCzl6glJ+TX44JReZqhX37WwSzG74FshQCICyYSLrSrL9/Hwwrn5mJT
         TqSBVF9xwQ70Ih7LaL069gJCOfsFXhWZ+gOgTCQHWsxQf0myjil3kv2rS233MvGqX+2b
         0zcc/ZX9lXVRwLkjcqnj195apDlAEbYGBbxxm/29PtCvx6b5VaKIv8pGDomXrxnDdPzL
         sfI5s9C3D6nmDq569eXP9OQxFg7uqC3pO8fiX0rPuXowCfA/iWmO/M7f3YB3tw9UDQP4
         /hcA==
X-Gm-Message-State: AOAM533hqf445mJMJbgUrDAXOpn4pNBL15ivKQ6++8CDvhnf7SCphezG
	kbFgdZBFVgK2ikDprC7HJ5z0eSisp3TecvTZEwb3nQ==
X-Google-Smtp-Source: ABdhPJzjx0XElXlmbNzbAaBn8VSsQBCl1VGSRB1wpMtcOYjRqlih9PQY8UCYEZb7yle2dGcBBgPFe6iNlHr2yvm+8OE=
X-Received: by 2002:a17:906:134e:: with SMTP id x14mr2736751ejb.173.1604677536887;
 Fri, 06 Nov 2020 07:45:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604643684.git.anuj.mittal@intel.com> <1bc33490ef6c48a3665bee69be398866ffd2d76a.1604643684.git.anuj.mittal@intel.com>
In-Reply-To: <1bc33490ef6c48a3665bee69be398866ffd2d76a.1604643684.git.anuj.mittal@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 6 Nov 2020 05:45:25 -1000
Message-ID: <CAOSpxdbqAbYhhHfR3sHUzOMakcvcECmM6UpjHUdKYw-Vi+_wmw@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 22/22] update_udev_hwdb: clean hwdb.bin
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This is another patch I don't see in master -- just in case there is a
"master first" policy for gatesgarth.

Steve

On Thu, Nov 5, 2020 at 8:29 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Steps to reproduce:
> echo "IMAGE_INSTALL_append = \" udev-hwdb lib32-udev-hwdb\"" >> conf/local.conf
>
> When install both udev-hwdb and lib32-udev-hwdb as above,
> there comes below do_populate_sdk error:
>  $ bitbake core-image-sato  -c populate_sdk
>  ERROR: Task (/path/core-image-sato.bb:do_populate_sdk) failed with exit code '134'
>  NOTE: Tasks Summary: Attempted 5554 tasks of which 0 didn't need to be rerun and 1 failed.
>
>  $ cat /path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/pseudo/pseudo.log
>  [snip]
>  inode mismatch: '/path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/sdk/image/usr/local/oecore-x86_64/sysroots/core2-64-poky-linux/lib/udev/hwdb.bin' ino 427383040 in db, 427383042 in request.
>  [snip]
>
> It is because both udev-hwdb and lib32-udev-hwdb will generate
> ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/udev/hwdb.bin during do_populate_sdk
> and it triggers pseudo error.
>
> So clean hwdb.bin before generate hwdb.bin to avoid conflict to
> fix the above do_populate_sdk error.
>
> (From OE-Core rev: c7472925feb53ce92c1799feba2b7a9104e3f38f)
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 994ca65e6f828dd38e0d7d09fb5243147ba4e36b)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  scripts/postinst-intercepts/update_udev_hwdb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
> index 102e99b947..8076b8ae6f 100644
> --- a/scripts/postinst-intercepts/update_udev_hwdb
> +++ b/scripts/postinst-intercepts/update_udev_hwdb
> @@ -17,5 +17,6 @@ case "${PREFERRED_PROVIDER_udev}" in
>                 ;;
>  esac
>
> +rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
>  PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
>  chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
> --
> 2.28.0
>
>
> 
>
