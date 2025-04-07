Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D21C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 17:05:02 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.53403.1744045493188682189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlN69j12;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c40235c34so1070434a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045492; x=1744650292; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Ea9hK51M5nHK38NL+/dBrDfKT0YY7fKpsE/82hsPE=;
        b=YlN69j12ANjwqtMTCraYSIPGC7jA+7FS4WpZG60b5bSC3hBGnv0JFIcJmquRTunc0t
         Y8eIOLMr2IE9Q3LoZBX2uF6tCD5apQT0UdP/gVPsk+8SjY30DY0iptuAhZ54ujmsLKO9
         zeLUG167PYyC7ODtSgHktoV63TmmJLkxVXP7BgiiHEdXqQENx5KB8maoy2sLd4YXD92/
         LuS6gRq5/tnlwOZDDDVKaoAGOEZvMnLN6iN1IVYA3kk//C3QbJ14ucRX6VtebiwM32l0
         P48ikw1WadjNybV6gVGd3voMPO+N1T/Za4VCFEl+mstT2o0DekQDNCWf0gHDBbzGiYx8
         CXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045492; x=1744650292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Ea9hK51M5nHK38NL+/dBrDfKT0YY7fKpsE/82hsPE=;
        b=xSCl5B8OD6GpdxreaAokVzeeuKFeEZV1IusIllPWtjl9TNHj0vet1KH3tXqq3hOsJk
         Vgsr7NYuKSXd545y1yyZH/w754s1UXx/O0rfjkIVNbGq7wHMyDpZF+5cvaQPExCBIhsP
         lhcuP5ODJhib4MZIr7UrZWgrUyORvssUwF1ikZcopWidN9ythwPAyC78gRCM4KgQZXTF
         fvawnP2DwASzp4906iuhgDIaMnxq9zP4ImvuSoiUZu+YlD9sfnyUlyYa+msREXG026SC
         1axxNjghXxgfPwiWL2uNRpPgQF1Lvu/PM9WHF5qeKCcD8gL86KlUU/6Wg4Ub1tI0tLib
         izFQ==
X-Gm-Message-State: AOJu0YwOQarjE/578VmGZKGUNAwAEUYmMUuvNdJjDQ58li+vH3fNcG32
	uOFm8dyQZzdNBG6jGelzv8CLP2Y5U3COfWy1Tl0g65sxDS/h/i3hBfCZkc/urdYOJUCV40EuGPo
	RdkBA5nyKiApUezizdxvhpOqeikY=
X-Gm-Gg: ASbGncteRdJs7mUOMga5QgN0qia15uBziVFNWBJg7ElfR9RxWItEH1XJdW/l+JSQ8g7
	nXV24Vp7sHUvLrL2JTIW3kiKp1pyFCea9k/UD3Yhe2vztqqoG6U7Hv5woTgPU+lRAnR+3h8YZn9
	cOVpIvXy/68aBzTWPtKcEgn7Ns
X-Google-Smtp-Source: AGHT+IFvBITyJaRCi7pcX8TUjkNtZTFjVqVY3bxB612gLQy8OYdBZcfKfwu8aHqJEMV6skkdBAk0V2CPC9aDX6S+Rwc=
X-Received: by 2002:a05:6808:1385:b0:3f6:7cd2:8187 with SMTP id
 5614622812f47-400455c4d59mr8047241b6e.20.1744045492341; Mon, 07 Apr 2025
 10:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250407164456.4845-1-gavrosc.ref@yahoo.com> <20250407164456.4845-1-gavrosc@yahoo.com>
In-Reply-To: <20250407164456.4845-1-gavrosc@yahoo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 10:04:26 -0700
X-Gm-Features: ATxdqUEaDecN-Q9ETO3XQmRcdnTpCMDiBHRr53GLEnB5ROiqDitCMKSgzcnkX2E
Message-ID: <CAMKF1sqHSmryz3LSpsJiL1AMGdaoSGZK0vWgYfw3xymBAiEz0w@mail.gmail.com>
Subject: Re: [PATCH v2] initramfs-framework: remove hard dependency with busybox
To: Christos Gavros <gavrosc@yahoo.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>, Randy MacLeod <randy.macleod@windriver.com>, 
	jbk <jbk@mm-software.com>, Adrian Freihofer <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 17:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214468

On Mon, Apr 7, 2025 at 9:45=E2=80=AFAM Christos Gavros <gavrosc@yahoo.com> =
wrote:
>
> In 'finish'script the Switch_root command with option -c is busybox speci=
fic.
> When package-core-base-utils is selected the boot is breaking with messag=
e
> "Switch_root: invalid option =E2=80=94 =E2=80=98c=E2=80=99.It was reprodu=
ced using qemu.
> Remove -c option to make it compatible with both providers.
> It is tested using qemu with busybox and package-core-base-utils. In both=
 cases
> qemu boots successfully and filesystem is accessible.
> Fixes [YOCTO #15716]
>


Looks good

> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: jbk <jbk@mm-software.com>
> CC: Raj Khem <raj.khem@gmail.com>
> CC: Adrian Freihofer <adrian.freihofer@gmail.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * the commit message is extended with more info
> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b=
/meta/recipes-core/initrdscripts/initramfs-framework/finish
> index ac0de9f996..716c2f44af 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
> @@ -41,7 +41,7 @@ finish_run() {
>                 mount --move /sys $ROOTFS_DIR/sys
>
>                 cd $ROOTFS_DIR
> -               exec switch_root -c /dev/console $ROOTFS_DIR ${bootparam_=
init:-/sbin/init}
> +               exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init=
}
>         else
>                 debug "No rootfs has been set"
>         fi
> --
> 2.34.1
>

