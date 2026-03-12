Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CBDFED2F5
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:24:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4096.1773357884218920417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GRo4A0nb;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so12788415e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773357882; x=1773962682; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NtEdeAlSEGRZYSqlWBIS6rB/M5eG+2FVN0ZzaSF/Go=;
        b=GRo4A0nb49Tc+6G1i24sJwzGs1YpEaDHdodx3ut71ZqPN6eLW0jo2MjnaaUpO0pSfA
         GW6dHgFiWbUH0GFBvxyF67oSITgesGLuFVbcpA2pdJIrovKl0qBk//bytYjUGMgg+xiG
         6DFGKs4EDGdHazEdyLdzL6C+WqxBTpjCL20DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357882; x=1773962682;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NtEdeAlSEGRZYSqlWBIS6rB/M5eG+2FVN0ZzaSF/Go=;
        b=PzliZg/CWAncCn6VEbgKB44B9UIdYsvpdmHYon6W92/WPqSj8wXVEgjzsaBtcrkhfC
         giCW5nHGsUpfHFGPOhS54HPM8OEKF7FFs9pEF9UxRe3cNq4SlM3V1JFyYCJPjY/dQGLh
         pfqME9J48ed2n9C3z6aBusP91t8hbi+EE7mD0JTeGea+uuuumjt820ZS4TibnSluOk9M
         tXiYp5GnPe8bUYfPm8FR52bz5NIWe/VY6ETHfT9NMNyRWQ5xp3yoC/IweFjbbf0z7WyL
         4gOp8HErVEWA+VGp30windGLGxpoRpzuJgT7zyiW+nSudOX+6GqoVKLhDqrGXgYu8tEw
         ADTw==
X-Forwarded-Encrypted: i=1; AJvYcCVHEHzeYsy8dbiSwAqgGylV6s7a1Igoi07N6B7DYp5zMjSbNomrBIQf4OlIrffYg7junZJUfQtr9ZsgoGz+DTBx8g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8kalq9mBkKSZ6Lm0hxek/9B/aWhsmmmsoe1SAq6bahu+4MpDZ
	IYkKHSfGNJUnvf7pUDkLjP81fVaM93rjuorsA+HR4aKP1l07pxcV9qACEpsJZKiv7EE=
X-Gm-Gg: ATEYQzwkM3KQkAgbi3B/UmIFDnCtLL43jnccT9aFiCYhL0DsOeMDOjo3SzmxL5J9/Ks
	2dKGDQuzziMi72cjqlGso90qm/ty5fgW79Rpopc5IIEeRwJiaeaBJffjQtJFn+ACIUYe8WOwalq
	Cm74RuRGUSnuSNCOV7clK7yXGbQWcLxwAJGTqSpzp2FGZ9kaAphY4/wnWyUEspV+sqzWc3Oq+yn
	I9pJFKEqxi7IJaIIH2YRdHe/up0kbHUNLXoAMg+9dGwhXm70GjKdyr3liZhpvWEW7+G5sfYnK5M
	Bz+lCz3/Pg2GR1dyFmZHwXb9joCKLvLphI/H/wY+V31XpL/o2FXNvICULM3gHn502bTEsFuBqTu
	dxDAsj21Ml+DjjtNLQA2aZZz1nF2gg/a52uvjGRpajqBTB7ZvONjp6fXU/viLsRYSZ6wWYfDv9y
	lrU5PeZUI6HBuSZptL66AAgs8muK8DOFkuDhIKAgQhp6tZHyLfHb6BYF/8CwMQC0j5JWK/JOzB0
	5Envp2iGNrC8gYR
X-Received: by 2002:a05:600c:3b04:b0:485:3c7f:527e with SMTP id 5b1f17b1804b1-485566dd02emr18533265e9.15.1773357882507;
        Thu, 12 Mar 2026 16:24:42 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a9a19e6457d4ef2f.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a9a1:9e64:57d4:ef2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm467151835e9.10.2026.03.12.16.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 16:24:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 00:24:41 +0100
Message-Id: <DH16WK99VETV.3SSCSO4EXHGY9@smile.fr>
Subject: Re: [OE-core][whinlatter 0/6] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1773257124.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233012

On Wed Mar 11, 2026 at 8:27 PM CET, Yoann Congal wrote:
> Please review this set of changes for whinlatter and have comments back b=
y
> end of day Friday, March 13.
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3380
>
> The following changes since commit 96d653f64e6eaa919dd1f62193a5a96f43430d=
c4:
>
>   build-appliance-image: Update to whinlatter head revisions (2026-03-10 =
11:53:11 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/whinlatte=
r-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
whinlatter-nut
>
> for you to fetch changes up to b37db2db1a03c856f7b4cc94e70b7e6c1ef437b5:
>
>   lsb.py: strip ' from os-release file (2026-03-11 01:09:19 +0100)

I plan to also add to this merge: [whinlatter][PATCH] scripts/install-build=
tools: Update to 5.3.2
https://lore.kernel.org/openembedded-core/20260312231730.751467-1-yoann.con=
gal@smile.fr/T/#u
>
> ----------------------------------------------------------------
>
> Livin Sunny (1):
>   busybox: Fixes CVE-2025-60876
>
> Martin Jansa (1):
>   lsb.py: strip ' from os-release file
>
> Peter Marko (3):
>   inetutils: patch CVE-2026-28372
>   libpam: set status for CVE-2024-10041
>   go: upgrade 1.25.7 -> 1.25.8
>
> Vijay Anusuri (1):
>   freetype: Fix CVE-2026-23865
>
>  meta/lib/oe/lsb.py                            |  2 +-
>  .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
>  .../inetutils/inetutils_2.6.bb                |  1 +
>  .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++
>  meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
>  .../go/{go-1.25.7.inc =3D> go-1.25.8.inc}       |  2 +-
>  ...e_1.25.7.bb =3D> go-binary-native_1.25.8.bb} |  6 +-
>  ..._1.25.7.bb =3D> go-cross-canadian_1.25.8.bb} |  0
>  ...{go-cross_1.25.7.bb =3D> go-cross_1.25.8.bb} |  0
>  ...osssdk_1.25.7.bb =3D> go-crosssdk_1.25.8.bb} |  0
>  ...runtime_1.25.7.bb =3D> go-runtime_1.25.8.bb} |  0
>  .../go/{go_1.25.7.bb =3D> go_1.25.8.bb}         |  0
>  meta/recipes-extended/pam/libpam_1.7.1.bb     |  2 +
>  .../freetype/freetype/CVE-2026-23865.patch    | 54 ++++++++++++
>  .../freetype/freetype_2.13.3.bb               |  4 +-
>  15 files changed, 194 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-202=
6-28372.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patc=
h
>  rename meta/recipes-devtools/go/{go-1.25.7.inc =3D> go-1.25.8.inc} (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.25.7.bb =3D> go-bina=
ry-native_1.25.8.bb} (79%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.25.7.bb =3D> go-cro=
ss-canadian_1.25.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.25.7.bb =3D> go-cross_1.25.8=
.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.25.7.bb =3D> go-crosssdk_=
1.25.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.25.7.bb =3D> go-runtime_1.=
25.8.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.25.7.bb =3D> go_1.25.8.bb} (100%)
>  create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-2386=
5.patch


--=20
Yoann Congal
Smile ECS


