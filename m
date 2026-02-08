Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1775EF06FB
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 23:50:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36922.1770594599270799174
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 15:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hbN2q1Sz;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso41087075e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 15:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770594598; x=1771199398; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFCr37ZQsX9xTy5sM/CkRC0PLpUMWpnWVrEnUte68Ow=;
        b=hbN2q1Sz2YZJAmjTENxlOJmO+/8tAlQm801Tq0nLaqg0spcP1ZxWZIgyRuQylEyJoh
         l7gBLsJkZdeCJK9B937BbN0tG94e3kHj+zwKccf32Bhoj49M1JadDn/wsF91ec8+uqUi
         ryyh2r71dZde4Qg1iY0VHNAt6eyL2RQsFzow4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594598; x=1771199398;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFCr37ZQsX9xTy5sM/CkRC0PLpUMWpnWVrEnUte68Ow=;
        b=PlN0FaOnb6jyxdDkmEtcc22+zGPaMxCuGkY8UtKm1bMeD7QyAapcDgDkG9gltetMox
         ItDzWGa/Qbg+9tJf6/t7ggo6KhV+AwuMBEWStYvTZ9pYeL4kwKSgvFPwCf6bB78YUe3K
         twmVUpiWFJQmjVcEAqPBOSWfT/Vn6cLNmYOAV7Cniwfy0q9X2mJViSIg9oyShzCszzTJ
         Hg8+a678rCtvkP0qoYY625K54o126FkOUi/5yuEBDaGPUJGQZcSoV/3tQZcmMJKoXhvH
         YekuUq55AcE6fv08pU/fqNk+YPjan2yNLDBCj8WfOQVt7riQklMvvgebT64DQWNbtv9k
         2+4g==
X-Forwarded-Encrypted: i=1; AJvYcCXoN2fMeXYtA0VeNvT/J+KEfLra4Pf5jOpagC1WoT7vehtdauvhSr4WsKZXt2R78Lgtu3FTX/F70JcQdhSIulDnoA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEchxFCu//UkmIuLwG+LuIt3NSFA4/3mXj1qy+eBnuv1HlOX28
	bVC683oXCiJwqpcCnWQ73uuibwQgijGj190Il75pshtvMkGw9dRhVAbfagdjidMlSx8=
X-Gm-Gg: AZuq6aKf9tBAnVRB5IckUuOPSbWe0nBmwKbL4O0qodhsdrhYU3LAVJcsnMDtSgamj3M
	FJ+kL48A5f2NEHMXgs9/rD4GpvxgqKvs5HkFLrGNzewK7Ek7IrzyR3UmoZi0QtsybCGSfND1dAV
	P5vy/Aa1+eZsyFDqyGwp6dCzOkKUpSWgbl7lYtdMff4WDSBj99bYRa9n/WAOgfTj7IYF1jolxgY
	sBPDPD6b+yp/AzmcqFrBKfTToFbS3L+U/WEjlrADrNOIudGjSU+x64EWt7EdCFVWE1zGl1Zzhlz
	9l6D1NdGmlys2q+z7GCYHmkjuppLnrkNwNfFqK/1ACOLkWdeq+tSf6+EkzkRRXtzQ202G2p7rxa
	lAPTBPX//2k3SJ1XYi4iMOG/ipxFVzsEuXhpENvkHZjdWICASK/NDJcuSyZNGJUcxNdIH7/WC3J
	e5eDto5Xoa6f2uG3RkoZXCg8X+CqdSr5QkfqCz6b7b7zGubna88qQyuOo2tOFawxbYoiXAGnjbk
	eM=
X-Received: by 2002:a05:600c:4f13:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-483209336d4mr137069355e9.13.1770594597568;
        Sun, 08 Feb 2026 15:49:57 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209af8e0sm127839565e9.5.2026.02.08.15.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 15:49:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 00:49:56 +0100
Message-Id: <DG9ZEGMDS9PK.39L62XT8F9S4V@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/2] libpcre2: fix RunGrepTest
 Failure on Busybox systems
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260120073632.508451-1-moins@kpit.com>
 <20260120073632.508451-2-moins@kpit.com>
In-Reply-To: <20260120073632.508451-2-moins@kpit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 23:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230702

On Tue Jan 20, 2026 at 8:36 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> The PCRE2 RunGrepTest script uses the Gnu Coreutils form:
> head -1
>
> Busybox does not support this shorthand option and reports:
> head: invalid option --'1'
>
> which cause the grep tests fail when running ptest on yocto.
> Replace head -1 with head -n 1 . This makes RunGrepTest work
> correctly.
>
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---
>  .../0001-test-Fix-head-1-Busybox.patch        | 38 +++++++++++++++++++
>  .../recipes-support/libpcre/libpcre2_10.43.bb |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-support/libpcre/libpcre2/0001-test-Fix-h=
ead-1-Busybox.patch

Hello,

Is this patch also needed on master? If yes, please send it there.

Thanks!

>
> diff --git a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-B=
usybox.patch b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-B=
usybox.patch
> new file mode 100644
> index 0000000000..abfc995cee
> --- /dev/null
> +++ b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.=
patch
> @@ -0,0 +1,38 @@
> +From 1b2c3d4e5f6a7b8c9d0 Mon Sep 17 00:00:00 2001
> +From: Shaik Moin <moins@kpit.com>
> +Date: Tue, 18 Nov 2025 10:30:00 +0530
> +Subject: [PATCH] tests: Fix head options for BusyBox compatibility
> +
> +BusyBox does not accept the GNU coreutils shorthand forms:
> +  head -1
> +=20
> +It requires:
> +  head -n 1
> +=20
> +This causes RunGrepTest test data to fail on
> +Yocto-based systems that use BusyBox.
> +=20
> +Replace all occurrences of `head -1` =C3=A2=E2=80=A0=E2=80=99 `head -n 1=
`
This commit message (and also in 1/2) looks to have an encoding problem.=20

> +=20
> +This aligns the scripts with POSIX syntax and fixes failing
> +grep tests in RunGrepTest (including testtrygrep).
> +=20
> +Upstream-Status: Inappropriate [oe-specific]

I disagree: To me, this patch looks appropriate for upstream.

> +Signed-off-by: Shaik Moin <moins@kpit.com>
> +---
> +=20
> +diff --git a/RunGrepTest b/RunGrepTest
> +index 1c7bbd2..ab4f310 100755
> +--- a/RunGrepTest
> ++++ b/RunGrepTest
> +@@ -728,7 +728,7 @@ echo "---------------------------- Test
> + echo "RC=3D$?" >>testtrygrep
> +
> + echo "---------------------------- Test 132 ---------------------------=
--" >>testtrygrep
> +-(cd $srcdir; exec 3<testdata/grepinput; $valgrind $vjs $pcre2grep -m1 -=
A3 '^match' <&3; echo '---'; head -1 <&3; exec 3<&-) >>testtrygrep 2>&1
> ++(cd $srcdir; exec 3<testdata/grepinput; $valgrind $vjs $pcre2grep -m1 -=
A3 '^match' <&3; echo '---'; head -n 1 <&3; exec 3<&-) >>testtrygrep 2>&1
> + echo "RC=3D$?" >>testtrygrep
> +
> + echo "---------------------------- Test 133 ---------------------------=
--" >>testtrygrep
> +--=20
> +2.34.1
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.43.bb
> index 57c4f0d0e7..f250f35584 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D321a5eb46aca=
e6b6c1ff2c7a866d836a"
> =20
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2=
 \
>             file://run-ptest \
> +           file://0001-test-Fix-head-1-Busybox.patch \
>  "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"


--=20
Yoann Congal
Smile ECS


