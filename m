Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B17F34C47
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:54:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270505.1776081145014864980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IZ3U2Mhe;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so54360235e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776081143; x=1776685943; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6L3fAnAEejScHYW1ej3446zl8R8C/t0VElJkKCSsaGo=;
        b=IZ3U2MheuBsvR7WpdXOiSKmgZmajShsyEF8/HuFsFD3GogfF2iH6wBsvydyEDfV34s
         3jexLo6IeRt+QPLY3NEspmMTiT4+Wrh3w/g2bZW7khoMQN5MyhL0jR7KIPxy+x8qwtrE
         gNmNRaCTDBkS9NlhT5dpmJ/sCqBCjqaJ5Ot1FY1PdYuyMVVlQDMvuLD4yxc5tjuK6NpW
         RUz2Th75A+gMNe8P6NZ69Co0yjFm7gcFv3riqgHB8klcLx4Q9o21Z8f7HFrxsBkvVHkm
         5c9PBCxWwAHflMt3z765ZjSOTX9RIClEitv//dVD3iGYfoe1ajOR35NBjXDfVvwzFpps
         eUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776081143; x=1776685943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L3fAnAEejScHYW1ej3446zl8R8C/t0VElJkKCSsaGo=;
        b=bwSfNDzMEva/gjheb67xfMkPYoWKIQmD8HPKZtRFjw/KN61FVMmC78uWH76Sp93GcA
         ihkO8QF7qZzhfZRbHlCNEarhFTDtuMslFgoWqFHjuoxdv+Aac9xiSUhf7KD472U3ljO0
         hs6Ux+cViIMs704Wf/zhhzPsg73Iv5J0ucGJEc3HXc/iCFhO/MYr7CQqq7YUrzPbHxqT
         YrdtWirxDvjbrKu+aJJ5uqHnQch8xZOyc4sU6+5Fv+XRp1eIHhots23rFRW+RAXMrudf
         TyWoyO2RUOsEW1I8WKSB5F6dxbQk0vdNHsAUHqY8zhocUrSw5drq+9hOW5PXE4zXofv4
         q1iw==
X-Gm-Message-State: AOJu0Yw3M9P357J7e18IidnmwrEzAzjy/mxF+nFv4bJGfe1wnjOiy5sn
	a7leIj4sG/gWv90S8mFS93F134G9mX9pS6rRCU/6F0B4mGAQzXi8FfmnlaQPbZIbFMI=
X-Gm-Gg: AeBDiesWk2erLwEFxfwTvBcHJu/W5bGamBxYzIdY7oLlrJCZz3+94r4H6WhIyGT633h
	dM2meIyuhEoiV1VutZ+mVl3zaYBgRG23b+qoEp1GLPJW2TKiRyuceDdx43EQOdW7TjbwUg5uUj/
	Kob+pmO30Em7/DzLSl8TqeNn6jAfUQlpCuOqu8XdtjWc3or4j+yNRYU8VOw39etNuzYYYcQ38DX
	F+vlno3iTPCCyoHfBFeEQ1h54XJ4e5cWXaYP2hnTVadiI/zwgf38byP/a/sMorFoMyFKuKhrAma
	BSNpsv3Z6GJz/IN8KkA1j1uLf/Srv2GL7rWSSf1iwCJOo2QnBcBF3I8QRvXKLJjHjc9y1ETz9Jo
	1kh3KrqSRpQrWmhGMKW3DFMpmckKFvO3P1w3D7S5MTn4dhReZLUxpAiLdJsHasefjmvEBj0TOM6
	eKKtVQGmTmoHGhEhjpoQtbXyxenUaKMFB774ggdiKbOJmwTJBgMk3Zs//n0if20aVNvh8zVnTeW
	WbfUYM5qDotjvTYlNC/XzxK7rw=
X-Received: by 2002:a05:600c:3149:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488d68432f2mr182760305e9.15.1776081142945;
        Mon, 13 Apr 2026 04:52:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ed4dsm276489395e9.4.2026.04.13.04.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:52:22 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:52:21 +0200
From: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
To: Peter Kjellerstedt <pkj@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 02/10] gst-examples: upgrade 1.26.9 -> 1.28.0
Message-ID: <krxzg45m7b2bxmfgsdw2wn7p5puzeu4kr7zjlaixqrszldahna@ytphj4blb2vh>
References: <20260408032023.1810147-1-pkj@axis.com>
 <20260408032023.1810147-2-pkj@axis.com>
MIME-Version: 1.0
In-Reply-To: <20260408032023.1810147-2-pkj@axis.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235107

On Wed, Apr 08, 2026 at 05:20:15AM +0200, Peter Kjellerstedt wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> 
> PATCHv2: No changes.
> 
>  .../{gst-examples_1.26.9.bb => gst-examples_1.28.0.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.9.bb => gst-examples_1.28.0.bb} (94%)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
> rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
> index febfd6736f..066454608b 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.9.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.0.bb
> @@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
>  
>  DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 json-glib glib-2.0-native"
>  
> -SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.26;tag=${PV} \
> +SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.28;tag=${PV} \
>             file://0001-Make-player-examples-installable.patch \
>             file://gst-player.desktop \
>             "
>  
> -SRCREV = "f313fae193089408e278c0dd3450145e5a12307b"
> +SRCREV = "9058212f43074ef7df229e73cea135c4ea96e0d6"
>  
>  S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
>  

Hi all,

On openembedded master this started causing build failures for us when
building gst-examples. Tested on commit f235ffc43c77 ("strace: Fix build with std=gnu23")).

| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| CMake binary for machine host machine not found. Giving up.
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-examples-1.28.0/subprojects/gst-examples/meson.build:27:10: ERROR: Attempted to resolve subproject without subprojects directory present.

I had to revert both of the below commits to get this to compile again:
- commit 23dc45429eed ("gst-examples: Upgrade 1.28.0 -> 1.28.2")
- commit c3ccac37b02e ("gst-examples: upgrade 1.26.9 -> 1.28.0")

Any ideas? Thanks!

- Ernest

