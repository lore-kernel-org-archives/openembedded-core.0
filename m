Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9183C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:57:40 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.17261.1704808654495484680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXj36zXE;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50ea98440a7so2862652e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 05:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704808653; x=1705413453; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rU5n1oniv3gM62PQ1dLsazDrhzRjY2ehvVsytOl++w=;
        b=IXj36zXE5OVCkGKCMYr0tZJC/bA3qDPCNCLESWfEqIh1qqCbzaJ4JN6sEStS9UvCKX
         UP6MUp803iH1uxqTKm1HROLKs3AGjucD+BGSMxdLx0EdlPJ2g5kpEGZVbv5ebCtBTdpK
         r3SUoqEegcjmuntxIJoYy5L6U6BtHT9ozTPOTmIQSdLVUvyVJIBhqFARVaMkPi5DKhyl
         hLe2w1jVjZ4GvAdRpv5ny1hXmCp1RQiphfNKUryo3e8jZ9ALXFqgr9twdfoBQ8Da8LF+
         X6fKibT7B0gPGYGiuPiQcOaxFLpmn52CWvvLqii7l9fthHpeH5WlncIxJS6/FfZmnYCl
         5V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704808653; x=1705413453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rU5n1oniv3gM62PQ1dLsazDrhzRjY2ehvVsytOl++w=;
        b=TovBofim1rklcjP32aI/iDQcg7/GePHhjOl5EZ7lHwm3UrNvVvfFRXYm1cw9GflYBd
         fgk/y7XBKpheAxFj1WSusCI3Q6P+7VF779Gn2rylGvMz0xzW4CNbzmGKZzUAuhciIX5u
         ZZiC1+oIvL9iY/cMpClzXLqIyyxgmp2yYq/bcYXN9EcW/MLYte5W2YwQMPl1ngUpFZR+
         0wtSYb0docyYDt29+O/bny4ZZK0QO0xRPvNXMitOOHE9pKGaLbotm/uS2A8HPBNIX/0u
         W2U4A8EEgCq3B6vuA89CAxY2wzpSh1piBd+nfNLa562BdcD3uoLoQAllUk7gRW8Er0y4
         cRow==
X-Gm-Message-State: AOJu0Yw9t7pUT5luevlnOB35LD3cvP3DCViAtI3qD7dLv5Ox6x+ZDx1z
	580iQDqSA8CGoFY97RaxJ/2wq9qXXP08hmiBCeI=
X-Google-Smtp-Source: AGHT+IF863+ud5/sB8W6YQ7l5K5O6p56sUd0Ezm1knFSosjqYyzi00Jsh2HxpMKvFCVyNTVnhQCrqXXCsid0xwJy3tk=
X-Received: by 2002:a05:6512:3e06:b0:50e:ccfa:56c1 with SMTP id
 i6-20020a0565123e0600b0050eccfa56c1mr488492lfv.57.1704808652420; Tue, 09 Jan
 2024 05:57:32 -0800 (PST)
MIME-Version: 1.0
References: <17A8B0DD7AD4D31C.21327@lists.openembedded.org> <PLXZ6S.UNFZMOJ43CYT3@t-online.de>
In-Reply-To: <PLXZ6S.UNFZMOJ43CYT3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 14:57:21 +0100
Message-ID: <CANNYZj_pgGyNtYQ=Vn57Oi0RYoZfkzHo+nkH-8j5d145a6k4+Q@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 13:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193458

Whatever strong opinions one has about cmake, opinions about autotools
are stronger still. It's not super controversial to say, we would
rather switch away from it whenever possible, and so have many other
upstream projects. Everyone but GNU, basically.

So I'm all for your patch, and loss of image format options shouln't
matter, as I can't imagine why one would want to cherry-pick them.

Alex

On Tue, 9 Jan 2024 at 14:32, Markus Volk <f_l_k@t-online.de> wrote:
>
> Tested this to be working with just oe-core layers (poky and nodistro) wi=
th glibc and musl for x86_64, aarch64 rpi and qemuarm.
> Still this is quite invasive and one can have strong opinions about cmake=
, so i marked it RFC
>
> On Tue, Jan 9 2024 at 02:28:26 PM +01:00:00, Markus Volk <f_l_k@t-online.=
de> wrote:
>
> Besides the improvements that cmake offers compared to autotools, the adv=
antage would be that cmake config files get created. This is useful so that=
 other projects can find webp using cmake. Remove EXTRA_OECONF settings bec=
ause all of them are set like this by default. CMakeLists.txt doesn't provi=
de an option for selecting neon but from what I have tested it gets selecte=
d properly. Downside is that there is no way to deactivate gif,jpeg,tiff,pn=
g or opengl. The libraries are used whenever they are pulled into the sysro=
ot. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- meta/recipes-multime=
dia/webp/libwebp_1.3.2.bb | 35 +++++-------------- 1 file changed, 9 insert=
ions(+), 26 deletions(-) diff --git a/meta/recipes-multimedia/webp/libwebp_=
1.3.2.bb b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb index 63b0fd9a6c..=
c6a4b97884 100644 --- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb +++ b=
/meta/recipes-multimedia/webp/libwebp_1.3.2.bb @@ -18,40 +18,23 @@ SRC_URI[=
sha256sum] =3D "2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562 =
UPSTREAM_CHECK_URI =3D "http://downloads.webmproject.org/releases/webp/inde=
x.html" -EXTRA_OECONF =3D " \ - --disable-wic \ - --enable-libwebpmux \ - -=
-enable-libwebpdemux \ - --enable-threading \ -" +EXTRA_OECMAKE =3D "-DBUIL=
D_SHARED_LIBS=3DON" -# Do not trust configure to determine if neon is avail=
able. -# -EXTRA_OECONF_ARM =3D " \ - ${@bb.utils.contains("TUNE_FEATURES","=
neon","--enable-neon","--disable-neon",d)} \ -" -EXTRA_OECONF:append:arm =
=3D " ${EXTRA_OECONF_ARM}" -EXTRA_OECONF:append:armeb =3D " ${EXTRA_OECONF_=
ARM}" - -inherit autotools lib_package - -PACKAGECONFIG ??=3D "" - -# libwe=
bpdecoder is a subset of libwebp, don't build it unless requested -PACKAGEC=
ONFIG[decoder] =3D "--enable-libwebpdecoder,--disable-libwebpdecoder" +inhe=
rit cmake lib_package +PACKAGECONFIG ?=3D "" # Apply for examples programs:=
 cwebp and dwebp -PACKAGECONFIG[gif] =3D "--enable-gif,--disable-gif,giflib=
" -PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg" -PACKAGECONF=
IG[png] =3D "--enable-png,--disable-png,,libpng" -PACKAGECONFIG[tiff] =3D "=
--enable-tiff,--disable-tiff,tiff" - +PACKAGECONFIG[gif] =3D ",,giflib" +PA=
CKAGECONFIG[jpeg] =3D ",,jpeg" +PACKAGECONFIG[png] =3D ",,libpng" +PACKAGEC=
ONFIG[tiff] =3D ",,tiff" # Apply only for example program vwebp -PACKAGECON=
FIG[gl] =3D "--enable-gl,--disable-gl,mesa-glut" +PACKAGECONFIG[opengl] =3D=
 ",,mesa-glut" PACKAGES =3D+ "${PN}-gif2webp" DESCRIPTION:${PN}-gif2webp =
=3D "Simple tool to convert animated GIFs to WebP" FILES:${PN}-gif2webp =3D=
 "${bindir}/gif2webp" +FILES:${PN} +=3D "${datadir}" BBCLASSEXTEND +=3D "na=
tive nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193457): https://lists.openembedded.org/g/openembedde=
d-core/message/193457
> Mute This Topic: https://lists.openembedded.org/mt/103619059/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

