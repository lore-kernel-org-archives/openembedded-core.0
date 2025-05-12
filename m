Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625E1C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 19:42:47 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.59352.1747078953297584025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 12:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IzDkiE+K;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-400fa6b3012so3902870b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 12:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747078952; x=1747683752; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqXQn3u8QQatuqud17TU+9K7JVeGX6QambOeRKuvJCg=;
        b=IzDkiE+KmwZXR0vdPo8QWWqJzRHtoPLCltm25DY7kmKBvj/cSuqRKVGn8tdkV6p7rQ
         VoNiqiZ7P6tdxFLpOwQJMTew3PLsaVil5lpdd+t8CXf90dKamde/vOR8ySd+sGZrrG//
         PzoOYqD/KeB3V4LQdl6/fEBhN7aBvb0nLhKVSJOXVhX2Z+lcvEOrFh94ln945o5zizYO
         OcawV7xWj4Sk6DMReL0mnukt6V6DF1VajhNWwzx5kuJKr3Wv7TdFo6pHZLUWaszFJLgn
         yTMCdbsK/Sz2tBS8WXzLgoSviO3CzcJFOQ1rmv4hfatzxWvDWTApG0gcA+vfWRVjfDXI
         /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747078952; x=1747683752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqXQn3u8QQatuqud17TU+9K7JVeGX6QambOeRKuvJCg=;
        b=kS9bwhaXigvX6bCbulxGE9L+vdwsw4iawiUq7RTb0nn0A6t5yXa5Wf5ZJfFuk0y5+A
         S7v18u8FCxzOFh2HDuhsq+ZCLQ98sCeQ0hLLAlPbkd83mqtj5j64X+EMpNinj1e33syH
         HUK9sBwcg6i49/87jVDiknxbcxbxZMYJgSfgYOQnmVYKJ/4RzFBGPYOQK2y3kqznLf06
         WPHd5wbe0vocgvtIdezGyqJ4Q5i4FimDy4gN+wwQC6bzY8Y54FfZ8/39K1nwhsBXnud7
         jcjdoiE/SSAQVUZ6t8wCYuwAsrV6s3EbYBLRjWr2jdi2bWl8zdLFxec0PVJCllyowkCX
         43kQ==
X-Gm-Message-State: AOJu0YzmmU6dU9M39aOcVrocq74gZh+W7gDFXbJr0Kk1zf8R5aSc0uSc
	LBVH6Emj4mDa5vru7+/48mfZWEk0J2MrejXAePTnriPESbrWYGqawhsFRsMz25mLDow2xPlKZTO
	sD0DoE/PdR3TtJ0Avm885RfEWPXc=
X-Gm-Gg: ASbGncuHV0wwK0D65WnRdYr5/knWdY2uCfsDXlrfgjVRu0x/5qFBEKPngGl/NuINI2U
	YnmjzgmOSmhsUfzfzr8CvV4/GXMX8aBLFpxR2EbWA1GBePOJy4twNENCugZSBPO5mMUKX1B4F9B
	OR7LPDzvxLHgCxhp8RUhaS0Ui/uF4gzp1nwSYuS5mELhUFegwzZBc48WLaheL0
X-Google-Smtp-Source: AGHT+IG55z5gU6sYOLNyv2N38/2YhoVT+jX539npqMSkS2+M1Z7jQSQFvRyBN71Atg647t5GbfCd2nQhm0VLHjcpzQU=
X-Received: by 2002:a05:6808:2448:b0:3f9:6df8:1d37 with SMTP id
 5614622812f47-404bad92791mr532419b6e.10.1747078952438; Mon, 12 May 2025
 12:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250512190451.1363972-1-erick.shepherd@ni.com>
In-Reply-To: <20250512190451.1363972-1-erick.shepherd@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 May 2025 12:42:06 -0700
X-Gm-Features: AX0GCFufCaeutKMnVIsVXuQtlM9HYlb4vhi_Ow4owe4cxkEhK3-htyqfbiLEOp4
Message-ID: <CAMKF1sqdmeJE1tHDBXra=j8vcEVcJHONkJKm+rvp8H+a6HuYMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc.bb: Remove extra System.map file
To: erick.shepherd@ni.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 19:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216386

On Mon, May 12, 2025 at 12:04=E2=80=AFPM Erick Shepherd via
lists.openembedded.org <erick.shepherd=3Dni.com@lists.openembedded.org>
wrote:
>
> Currently there are two .map files being copied to $kerneldir/build.
> One of the files is System.map and the other is
> System.map-<kernel version>. Each .map file takes up about 5MB and
> have identical sha256sum hashes. This change will make it so only
> System.map is copied in order to save disk space.
>
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 1500aff2e2..9729a25440 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -75,7 +75,7 @@ do_install() {
>          if [ -s Module.symvers ]; then
>              cp Module.symvers $kerneldir/build
>          fi
> -        cp System.map* $kerneldir/build
> +        cp System.map $kerneldir/build

I wonder if copying the versioned file and creating symlink System.map
pointing to it might
provide both the files and yet reduce the size duplication

>          if [ -s Module.markers ]; then
>              cp Module.markers $kerneldir/build
>          fi
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216385): https://lists.openembedded.org/g/openembedde=
d-core/message/216385
> Mute This Topic: https://lists.openembedded.org/mt/113076831/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

