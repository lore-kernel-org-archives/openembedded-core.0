Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4F2C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 16:55:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.1274.1724432119061966759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 09:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xm3R+SRp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso17388465e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724432117; x=1725036917; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sF5gmX3IRc/85t1EilrzFHesRI1P1ZtHrcdx2Rg7Ahw=;
        b=Xm3R+SRplzgbzm7DFmCqCFrMUehFBU26Z+tD4cl29qXmw4UrlVNvsHmPLr3gk0I9az
         /QJyiRcgCzCupvmXBr4bM5S02pLdjY5ekKwfXdavKcB67g1qDNwC/NIbFbyXmI6g2K2I
         YdGoGAwn2m2vFrvS2eJOgtoLXlK5fWL51lOZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724432117; x=1725036917;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sF5gmX3IRc/85t1EilrzFHesRI1P1ZtHrcdx2Rg7Ahw=;
        b=RAUScDtEcwWqGQg5LAXNOwU8EZWco6rsSAEAa2kPSoxbTN2vdncfec0Yc35v3S0pzi
         r2heORVC4lUY+YbwS0X6qgZS4K3gaAWTdeYpGvJu0F54YJrLDhsfVTUI7dZIKurjKghy
         jStv+Lxc/zOXPrRij2zH47awVJ0AOiGfoJWfrKIWXzD+Ski48AF92n+10lD7SuEfuZZp
         1jbbbFm2StiL6MRnSuIuAxbkEFFumd9uOAJFSxxoFhHVgmYmk3wxXFVDdxo8+vMIc+ED
         K53dpoyXrKlvRB85hD6qwm9u4P9UTASMc7KVni/yLhD2c05WlHSD7obb8G++qby2s5LP
         VZdA==
X-Forwarded-Encrypted: i=1; AJvYcCVi2JxJkSNR/ixUS3JnKoQ/1u4drpPP61kqPIjgZW39zwh1yA0f3PPPc+jbFzAv5hHR1LgNgHYcDP3gNxNey7O9hQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4406IeA7NYcccBYUpCageJGMPUBjYcA56/ez+RcH6xv9jV2Xe
	F7GeY6xeLmEYUreWX5dUl7jB7lHd5PHeZ0BMFeKfs0/Ur8DHERenoVdXnbI4UEo=
X-Google-Smtp-Source: AGHT+IFy8az7EntUzdelhAAfP6SbFMCt3QPykAZiQF+JPU6/knXzCbNysnV/QfkUx6sWVhFeex9Fyg==
X-Received: by 2002:a05:600c:1d16:b0:428:b4a:7001 with SMTP id 5b1f17b1804b1-42ac38dfc60mr41611825e9.15.1724432116982;
        Fri, 23 Aug 2024 09:55:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842? ([2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abeffe93bsm103624225e9.42.2024.08.23.09.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 09:55:16 -0700 (PDT)
Message-ID: <bd1ef278fd375a6f5e819bad5eabc6b81071089c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] piglit: add a patch to address host
 contamination for wayland-scanner
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Trevor Gamblin
	 <tgamblin@baylibre.com>
Date: Fri, 23 Aug 2024 17:55:15 +0100
In-Reply-To: <20240823135024.699680-1-alex.kanavin@gmail.com>
References: <20240823135024.699680-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 16:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203699

On Fri, 2024-08-23 at 15:50 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0...o-not-obtain-wayland-scanner-path-fr.patch | 38 ++++++++++++++++=
+++
> =C2=A0meta/recipes-graphics/piglit/piglit_git.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A02 files changed, 39 insertions(+)
> =C2=A0create mode 100644 meta/recipes-graphics/piglit/piglit/0001-CMakeLi=
sts.txt-do-not-obtain-wayland-scanner-path-fr.patch
>=20
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-n=
ot-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/pigl=
it/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
> new file mode 100644
> index 00000000000..b47e16af6b3
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obta=
in-wayland-scanner-path-fr.patch
> @@ -0,0 +1,38 @@
> +From 8f25cdf54e35ab1a174cabf5078784b8e48bda01 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Fri, 23 Aug 2024 15:29:45 +0200
> +Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
> + pkg-config
> +
> +cmake can only use target wayland-scanner.pc which (correctly) points to=
 /usr/bin/wayland-scanner
> +
> +However in cross builds it should be using wayland-scanner from native s=
ysroot,
> +otherwise builds will break if wayland-scanner is not installed on the h=
ost
> +distro.
> +
> +Upstream-Status: Inappropriate [yocto specific]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + CMakeLists.txt | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d169fb481..8394f5236 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
> +=C2=A0		message(FATAL_ERROR "Failed to find wayland-protocols XML path")
> +=C2=A0	endif()
> +=20
> +-	pkg_check_modules(WaylandScanner REQUIRED wayland-scanner)
> +-	pkg_get_variable(WaylandScannerPath wayland-scanner wayland_scanner)
> +-	if (NOT WaylandScannerPath)
> +-		message(FATAL_ERROR "Failed to find wayland-scanner path from pkg-con=
fig")
> +-	endif()
> ++	set(WaylandScannerPath wayland-scanner)
> +=C2=A0	add_executable(WaylandScannerExe IMPORTED)
> +=C2=A0	set_property(TARGET WaylandScannerExe PROPERTY IMPORTED_LOCATION =
${WaylandScannerPath})
> + endif()

Is there any notion of cross compiling in cmake? This might be
upstreamable if you could make "wayland-scanner" conditional upon cross
compiling?

Cheers,

Richard


