Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F38AC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 17:24:15 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.586.1709832247550220310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 09:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPojWr1p;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-21f0c82e97fso604640fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 09:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709832247; x=1710437047; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccyynil3c/WwqTRq7E2GB3fKCuuFGvT+D1iGGw0FGK0=;
        b=iPojWr1pESUj7jqfHQsD5Obnla/KG9SRbjxExso7kGAjjyDoN1YbKlYVKDubATyHLe
         FYUTUWohhE7Fo1jJPdbR1u6LLaixgPDZ0QPg+HqpnYTbIPuAemwwOVjIf2dlp5bUCfDV
         GBEjGgrODhHw9o1DPLy/UJ1+WbAOXaI07Ed/42ZwxTTz/wIniMnWtbqKY/GaqtwTwUJG
         9JXIBRR5Aa7DKJtBOaWAvoqVcu5ReO2a5Tnsi6EWv0kktVDa5e8zipTpA2UuhAbFWNTU
         mwxFz1OjzkFUvBqxuA52x6GJBUZ+yWZqgEa9BD+uyBKC6bVwUhuvrxI61taW9jOtCcz+
         +7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709832247; x=1710437047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccyynil3c/WwqTRq7E2GB3fKCuuFGvT+D1iGGw0FGK0=;
        b=O0+oVCBmr9IAMRlUssl+TdAVjdi66t8jUxTJ5LVSM5B/dUjgWItwH+OKMnUOPgF7pb
         hZyRaJguP8Hxrb33u4vGV+EliWn8852leD5ok7vEAts8De3cKOjH2FQJhCsF1s0OiP1B
         jCEkQoZU7uW5cwTCOXIjZTLdZ2J3GJREqZW5PPjPA4kuK74EKNMGOvJ9YNZOcKYTlGhe
         JedmfUQn/qwkM9Q1w9Zou6e7qqccICumlXCepV/WqeMkw5oGFNCD9Rz7FDzELYLhCg3V
         Ha6izv7iwv5sWIzKdN8SeXZARI2HfL4y4KLqJZE0IkNcnWNxSBCSlHwccuMlU7f5pKjx
         Y7Fg==
X-Gm-Message-State: AOJu0Yw3s27DLcd4AOHJ/D/Ux0lIO8RZ6fORK/9eetEuk9UkS+T0GoUw
	JjvDMgDpoMAPuQMcc1t7+yHH7i6mD9VhfPY+5BA4Vm7aEfjvhMfarE2U8WYEkG6RtYteYIZorkH
	x+DhNAB3A2vgazsq0liMUPoELll17duIR/x8=
X-Google-Smtp-Source: AGHT+IEjFj/q8Q052lA37dNyBRGcEnsPZ5Rw+FTYmvaSGlJIL9BmxFnoiq0Ryk3tugnV1shauPUwS4shRU1Ax+ZaAR0=
X-Received: by 2002:a05:6870:82a9:b0:220:13b5:3e9e with SMTP id
 q41-20020a05687082a900b0022013b53e9emr582718oae.4.1709832246755; Thu, 07 Mar
 2024 09:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20240307065635.1261288-1-changqing.li@windriver.com>
In-Reply-To: <20240307065635.1261288-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2024 09:23:40 -0800
Message-ID: <CAMKF1srqPZMYPH+1n4B35HgZM+CgcMqzLe2S9mNE6PZ10qq1jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6] systemd: fix dead link /var/log/README
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 17:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196809

This is causing errors in do_install

| chown: cannot access
'/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/systemd/255.4/image/var=
/log/journal':
No such file or directory

On Wed, Mar 6, 2024 at 10:56=E2=80=AFPM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> There are 2 issues here:
> First, in package systemd, there is a file /usr/lib/tmpfile.d/legacy.conf=
,
> which will create a symlink to /usr/share/doc/systemd/README.logs during
> boot time. But for oe, /usr/share/doc/systemd/README.logs is packaged in
> systemd-doc, which will make /var/log/README is dead link.
>
> Second, the symlink /var/log/README in legacy.conf use relative path:
> "L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
> But for oe, when VOLATILE_LOG_DIR is true, /var/log is a link to
> /var/volatile/log, so /var/log/README need link to
> ../../../usr/share/doc/systemd/README.logs, while VOLATILE_LOG_DIR is
> false, /var/log is a dir, so /var/log/README need link to
> ../../usr/share/doc/systemd/README.logs. So current symlink in
> legacy.conf will also make it a dead link when VOLATILE_LOG_DIR is true.
>
> Turn off CREATE_LOG_DIRS to avoid these issues.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_255.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-co=
re/systemd/systemd_255.1.bb
> index a907d60e84..9fd7eccb38 100644
> --- a/meta/recipes-core/systemd/systemd_255.1.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -247,6 +247,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dsystem-uid-max=3D999 \
>                    -Dsystem-alloc-gid-min=3D101 \
>                    -Dsystem-gid-max=3D999 \
> +                  -Dcreate-log-dirs=3Dfalse \
>                    "
>
>  # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196773): https://lists.openembedded.org/g/openembedde=
d-core/message/196773
> Mute This Topic: https://lists.openembedded.org/mt/104782978/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

