Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F23CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:43:19 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.12140.1758872594226409855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxPPYgsp;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7a97ed209cfso14490286d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758872593; x=1759477393; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b1bMvrdfE+MHvQnDMsLaRyF3cOaI7ovHZ7H5x9myT5s=;
        b=hxPPYgspoRP+xBvkc3hgKr9vwxGJ2hOBRqXn4tBjFTHQvz+m2sCCB450FPJChURMlM
         Xv3gNtQIm8qcV6kBI5ymwQvYLADN9Me7dxmLZY/O+LV6vJy84+3eOOyMuQxQrsv5v0sh
         5P1AhqMqidlhuSkkSv0NKoW5CjZWzW6Bb0EsS403lMm1+LgiFG3+6QdLrk7On/9kgGw/
         lFZESfI1NlsoeyIu/uYREAVUz8ozPtfxl/C0wrQ7k6FjRY/q5WyAtA3F1Jdz0d+hMUVn
         EbAGfBJO92SVaoGZ+FLsuJ/qLdZJ7szQb2Tufz7AaccijsSF8O1h/e5GktM8iuZjcf4I
         z7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872593; x=1759477393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1bMvrdfE+MHvQnDMsLaRyF3cOaI7ovHZ7H5x9myT5s=;
        b=SzmLGU5LqiNIE7nUcKBRXUvZ3xWOnpwYgbrQAvRpp9RFmd+J4UNXxnWk0vp2C6w6jN
         MnWnwqhZnBgRKJ8+CBgXxP07cUa2wTYF84emZiqNc2OSxmwGX245e+YNHZA75W85+L7f
         2AQZQ3jx2Zhv8XXRdtw0B6JKgND5vxPXROb0X90yTRAudsRG13ehZhDFjiAC0icK+qNn
         ynJMlV8SacJxkr/ABQNUGMRIElfvLS/2LeTCeLnE7W009G/LJGgw8pyQpeNE9UFB9VBd
         r82MFEhw8e6ccWghylVpD07jx11r2BuLx85TFU8DQvVgDIwan9+CrUviEkhyuMpk4Osn
         On+A==
X-Gm-Message-State: AOJu0Yzv/98VSfggJEu6sdOGna3feRFLqBRIoLkNe66yxCpKO31BWGcY
	2kHvuGF+x/2RQR8DPGjdiNrjziAttcaO4XlqdtBFc0QDGctkZ4L6mZCD436kA1BKyiOtUJ+YiRx
	LH5C7qwTuhWLoF37AifI9k7H77gu3n8uBtQ==
X-Gm-Gg: ASbGncu0R5/6YGFfzsR/Sd9LpZlhTEeXzmKD9PxVU7cg5X80WGIPjuhJbiCxtSwanIJ
	kkJG/8vl1X9XrTfcZnBdNY0TK0NXrsqhjRumoqN7jV/3UQf5dKgiKcuFks7DACIXNcLglET0Vb1
	2sbibAyYa4MDIor93hKmgAix9DRaQlHOL/pO67zsb+2fouT4qu+21+KUd8znyLk8xi25AHMZCTl
	hBng6tastnqpBJLspQ0kOanui/7gEaod9dLTxgTkiZm6jU6zUji0fVXkJWl5BzfOOuquTCK7iiY
	JNVX24x8MLDDAU8=
X-Google-Smtp-Source: AGHT+IEkZ8y+o3g7+n7bUPFzwT8gQDL8q6rYTy0QrIC4syFZgKowdS+KlCEy7ZT3cc4ovaIP7x+NkWD2F343Vp+++SA=
X-Received: by 2002:a05:6214:1c4b:b0:792:fd55:c30c with SMTP id
 6a1803df08f44-80103dc44fbmr55400356d6.17.1758872593128; Fri, 26 Sep 2025
 00:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 09:43:02 +0200
X-Gm-Features: AS18NWDKaf6b11UdEj_QXpmfEFZ7lYcpD2xFQp8YY-oDP6yOr_Hwuqh3w59ccjQ
Message-ID: <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] syslinux: clean old object and dependency files
 before do_install
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224060

On Fri, 26 Sept 2025 at 09:37, Yan, Haixiao (CN) via
lists.openembedded.org
<Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
> make[4]: *** No rule to make target
> '/build/tmp-glibc/work/corei7-64-wrs-linux/syslinux/6.04-pre2-r1/recipe-sysroot-native/
> usr/lib/x86_64-wrs-linux/gcc/x86_64-wrs-linux/12.4.0/include/stdarg.h',
> needed by 'zlib/adler32.o'.  Stop.
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> index 449a75ebf8ab..ea4bf6e6a88b 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> @@ -107,6 +107,7 @@ do_compile:class-target() {
>  }
>
>  do_install:class-target() {
> +       oe_runmake firmware="bios" clean
>         oe_runmake firmware="bios" install INSTALLROOT="${D}"

I'm not sure I understand what happens here. The issue seem to be that
Makefile refers to a file that no longer exists in the sysroot. How
would performing a 'make clean' address that issue?

Alex

