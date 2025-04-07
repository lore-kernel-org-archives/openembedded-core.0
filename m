Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C682C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 17:01:12 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.53281.1744045271911303523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cX14uay/;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6044db3b45bso130313eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045271; x=1744650071; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uZxr7XeCpKIRo7LrHUF84my6MMYng1HsG4J4uTLQ0Q=;
        b=cX14uay/7XYpgi6AzNKISxgf7K2DLgw27n3X2ZgLZjQvAmTiLpDOteFlbitV4VnkAX
         l+rO/qhMTMnEwTukmXLIccykwPtevc4h2SA0xPJQOr7eiuzNeMBNdsaVY8a/j8XMk/VJ
         UtUoBDoUy0A3EWBS10XrsvbGIYNqtn7VO5lktyRgiLsSnAfMskCBJ2O+HLVB6XQwP0oN
         z0lupCNEb1i/RlkVZoKklD5sckR906pLQGqCDo9xyaWrcLxBsVQPzQSTG7fk/Mdmdp7m
         mWC1iZimkCzmlcT3Kn5YLgc75yjxUP+rwWTXokZu9oDKBPZAMorQcPZclu27RBpcC0O6
         vT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045271; x=1744650071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uZxr7XeCpKIRo7LrHUF84my6MMYng1HsG4J4uTLQ0Q=;
        b=koX+VDvkW24+6d1+gQv+UEtbRpU1dezqcD2VFTcmeQhMXPDz0CK249ApMF13CWys9U
         9oHoDDNipvxV2rkE7v8IBAKhYzmFtXRXxa8zs+43OxiUPmFLhH0sfl68kLPi1z4Rt8lM
         tAEyyGAIwSMeN/M7bQ5ShdBHUE+1dmbTLr+XZuHdR9yVRd/+86EzIkvkFnt1tykqkFf3
         QpeG7PHqsnXJQxXSY77L9uYFUacK4LI2RwIBvwDC1ONSE37K7WoDXJWiRIFsXxusaYxK
         y1Be7K1eNjK7rj/DOWJppjzTWXHtjBKhZOC4cNiWJiOfCacOAcpAigaPEn/HMv3f5+p5
         wY6w==
X-Gm-Message-State: AOJu0YwVZVIIwFv7dK1zfdRMYLWuU+uY8Zz2qmiIrcHqNHRxS0ZZ8KJH
	61/GcidxIP0/rhKvQPAXeHb5XE9ynKZFuH7htGp8ZeTJyQhPgQTNcWytvi66WDFo8D9spbYlCkx
	ZCmyJ57hmvmG+epsl+nSRaFMjqLQ=
X-Gm-Gg: ASbGnctdTvAWZ3gYUhr2hYk60HxaBqPZY8wzY3TPyQw/AOZuI3U17OU/nrYYg0tItSF
	oUdsTJXxF62r+SXfrtifInbGikR50s6n43xX2/6qx/Ec8yRkZnX1Uxusksbqpn4VHJltGfqmWMg
	u+1xmL6oMpDbGl1Ap9Wu8HZalE
X-Google-Smtp-Source: AGHT+IH92I9RKzfoNw6tvtT9YvvJrj+HLdt1T4OM4JhcOww31QFi295cfmBbQDYB6LmYphnxw6Tg9TxYBlcRfvtM0w0=
X-Received: by 2002:a05:6820:1c8e:b0:603:f526:5e76 with SMTP id
 006d021491bc7-604156f3c2fmr6776090eaf.6.1744045270939; Mon, 07 Apr 2025
 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250404084324.3024896-1-samuli.piippo@qt.io>
In-Reply-To: <20250404084324.3024896-1-samuli.piippo@qt.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 10:00:44 -0700
X-Gm-Features: ATxdqUE67bD-7ZQkr5ohOL3GaKyxPwj89yWGHfoS5LDy4SnaEGPUlzS-dN5MpbA
Message-ID: <CAMKF1spFa9aPEbJmdXJu9aAwHKr6AwxLiiWFZX1SUMUaWhzb7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: don't use chrpath on mingw32 builds
To: samuli.piippo@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 17:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214466

On Fri, Apr 4, 2025 at 1:43=E2=80=AFAM Samuli Piippo via
lists.openembedded.org
<samuli.piippo=3Dgmail.com@lists.openembedded.org> wrote:
>
> chrpath doesn't work on mingw32 binaries:
>
> | `/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/nativesdk-libjpeg=
-turbo/3.0.1/image//usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-w6=
4-mingw32/usr/bin/cjpeg.exe' probably isn't an ELF file.
> | elf_open: Exec format error
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> index 4ff4cec721..a91adf5f72 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
> @@ -55,9 +55,11 @@ FILES:jpeg-tools =3D "${bindir}/*"
>  DESCRIPTION:libturbojpeg =3D "A SIMD-accelerated JPEG codec which provid=
es only TurboJPEG APIs"
>  FILES:libturbojpeg =3D "${libdir}/libturbojpeg.so.*"
>
> +CHRPATHS =3D "${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}"
> +CHRPATHS:mingw32 =3D ""

Can we try using
-DCMAKE_SKIP_INSTALL_RPATH=3DON

and avoid the need to tweak the rpath in elf headers.

>  do_install:append() {
>      # The binaries have RUNPATH=3D$libdir, which is redundant
> -    chrpath -d ${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}
> +    chrpath -d ${CHRPATHS}
>  }
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214337): https://lists.openembedded.org/g/openembedde=
d-core/message/214337
> Mute This Topic: https://lists.openembedded.org/mt/112080987/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

