Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B14BC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 16:19:26 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.1235.1751905158245864101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 09:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvmsvZXW;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e740a09eb00so2872126276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751905157; x=1752509957; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkSyI+KRHHsNhPRUx2KTisuWIuVV4dXYvPIl4UTEq5E=;
        b=UvmsvZXWC9sfCVgOn5exh9Xsjc/Dmro3QO/xA14utvAXJmGtlxhU6S3lABlKPS+gTI
         /SVQIX6QqVF2kDPBiQnsBTgqXswEyKNNb0cxRG6656irH3gB/VU4ZbACG0aAxnxAIuYG
         Nx2NE26byDVJNqQ7HH8gsXpb6FsOBaypoP1bhd2oMIao4Sjhvyw6W7lu3flYk6Xkiwsl
         CzKhfc6GWhgjHkjIJpwKlYBumQYljlJgbHq9ELSOgIKNXYpfhbBoF7hLPqRyLRIrU61N
         tBYigkcqbRyCHjr9gaqJhNA00ERMGP3q0cHhSFyfFtXTsOn0aQEJLwEz/V2XtlMWk4As
         iUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751905157; x=1752509957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkSyI+KRHHsNhPRUx2KTisuWIuVV4dXYvPIl4UTEq5E=;
        b=WDts289zCV035WecL9nmAEoD2hwpDPL4y0AlEMqxsjjUcWuU53EpNBpgWGH0dMLWFW
         5ik05tE6w5auTfPQhjjSiJUTFcHGRy/0NVYPgK1t0jQlsZuN9g3CWoLkSkKU74KKGZIv
         QQVMQNoraoq+aEY4M+4m19Ng9jK2qR/tGo24ADHXV7EeUTt4jAQY0FZ9WUwS4MCRBxSh
         1j7TvvskEtybeLlfchJmlsXObW1iN++qQrIOdppYTOjbab3ZHlIzVaIE+r7pZdjG3cOh
         Iup//S0SlyUHjg4jIpOBFfOtGuC0Sn1qTxtlcDZFUIo9KS1a3TWcTMyys2KHWnN1Cvbv
         m8JA==
X-Gm-Message-State: AOJu0Yw1pfX2VmQ/c9DYNDvEdTV7pY9LUrgE+C1K6f7/qxgEdVCApW3K
	nJeHWZW+Ml76pH0PKdkuqBafd0YMKLbLFf0vxZ2W8KvVFmrQTtxqBN4SvoE4DNAgQngdZpM3FT7
	LkfbnySP1TNUduj+46l3iD6LxcCx/6xnWJqnx
X-Gm-Gg: ASbGncvEIuyEnFDo/z69NWPdUrpQsSvc9rHV0ZgzsRlrXTzxZdIIEL6KUwo28QLcNHZ
	+sxdQzqGeXl2rZ6zUkDRN+mU7vt7R1+4YQdOCo5kYcw1BecN9Lsq4c5TJ78tputWa0OeRaeEqIX
	Pv49jD6CQtI7GAlordpK+dWVGSTlg/QNJEClI6dfg6IQ==
X-Google-Smtp-Source: AGHT+IGxf2Wvht4U9QNe9ZaeAcCpyzK/XMq1AoGOemBSygmScxE4GJBK/Ltdjh1YAiGiNwyty81nFppvCP3KB5z/noE=
X-Received: by 2002:a05:690c:b84:b0:711:a4af:43ad with SMTP id
 00721157ae682-7166b5f3114mr170226347b3.14.1751905157101; Mon, 07 Jul 2025
 09:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250701221135.966025-1-anibal@limonsoftware.com>
In-Reply-To: <20250701221135.966025-1-anibal@limonsoftware.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jul 2025 09:18:50 -0700
X-Gm-Features: Ac12FXx2yMFHZizRSbtiCDvBz7KtUZ0DAGVOp3OmmlW3PNSKg-YK3VuKK1oBXFo
Message-ID: <CAMKF1spy2XGxWkw5A4V1JJZd0szCfa2zw96KDVEQsensmqhfRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-core: initrdscripts overlayroot allow
 boot partition
To: anibal@limonsoftware.com
Cc: openembedded-core@lists.openembedded.org, alhe@linux.microsoft.com, 
	johannes.schneider@leica-geosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 16:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219991

On Tue, Jul 1, 2025 at 3:11=E2=80=AFPM Anibal Limon via lists.openembedded.=
org
<anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:
>
> Test if /boot is previously mounted on the OLDROOT and move it
> into NEWROOT (ro).

While change looks innocuous, I am curious what prompted this change.
Secondly, these changes can have subtle side-effects
for that it would be good to have a testcase so this behaviour does not reg=
ress.

>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  .../initrdscripts/initramfs-framework/overlayroot        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayr=
oot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> index 0d41432878..db164d9846 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> @@ -38,10 +38,10 @@
>  PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
>
>  # We get OLDROOT from the rootfs module
> -OLDROOT=3D"/rootfs"
> +OLDROOT=3D"${ROOTFS_DIR}"
>
> -NEWROOT=3D"${RWMOUNT}/root"
>  RWMOUNT=3D"/overlay"
> +NEWROOT=3D"${RWMOUNT}/root"
>  ROMOUNT=3D"${RWMOUNT}/rofs"
>  UPPER_DIR=3D"${RWMOUNT}/upper"
>  WORK_DIR=3D"${RWMOUNT}/work"
> @@ -115,4 +115,9 @@ mount -n --move /proc ${NEWROOT}/proc
>  mount -n --move /sys ${NEWROOT}/sys
>  mount -n --move /dev ${NEWROOT}/dev
>
> +# Mount/move boot if is already mounted
> +if mountpoint -q ${OLDROOT}/boot; then
> +    mount -n --move ${OLDROOT}/boot ${NEWROOT}/boot
> +fi
> +
>  exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully=
 "Couldn't chroot into overlay"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219735): https://lists.openembedded.org/g/openembedde=
d-core/message/219735
> Mute This Topic: https://lists.openembedded.org/mt/113938218/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

