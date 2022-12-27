Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38841C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 18:41:39 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.163659.1672166498039791969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 10:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tc88vDa4;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1447c7aa004so16308453fac.11
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 10:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4x2OjbRC23+gGGLWFARLKE2GOzquhK8bDJ0UsyOIEY=;
        b=Tc88vDa4fDFpYscnnXS3Eg2cbe9gF5J2Ia1aW4t3uPxdcn61ppeNjoMCjUw//bYSRU
         TaTzW+FJ1h/t/RocENdXnrVwEig49ozLCPBeUjNK45uCxt5imke53IwnraJYYmAWhyYh
         fhRrv4FDhpbkWbIlvGD8iZNdgNNFzG1hQIwlD4gCIsKHimI7odld8vGwCwzoe8r0NtBZ
         ViOVFqjBLzWi/P/16us24Bj0BGLO82wrpB2qGlKiMFSnqTgRpd0LUdpAWoXJ6N+26uAJ
         /j410owkoy0PFscqo23w9znkU5zgwfcUIh9JQ5zVpy5uD8gGqV3MsR4+LzrrFuQNi0oo
         S/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4x2OjbRC23+gGGLWFARLKE2GOzquhK8bDJ0UsyOIEY=;
        b=5jk7+SRH5w+Av07dZznYGpif4WoSge+jazOqM0zS42MDnw+9fx2Ol5gh0dTgKbM7Ya
         /+dchoqs0aRWTOoYVAM1HvCpKK+0i182JguuV34NLnBBRiLblRmedtQGUTIWIAPmngXN
         v8eB5jnr8T9L1dcrW9MiuaoVkjh84Pp6sE487VLi5UgC6oX1IchOH85l8Nk4w4SQ5V3j
         XWxSIBab4SiHVyZDVfOcgjhJ1A65mhaBPD8yVlVE1dGTExhBTV/wdda9T0YuEiwZ0jin
         Pew5sXa5h5qPBnm0nj1HrGxNhZAYE03wiNmjBohu0xi48ccmvam0f6OAHO9cp0gQeQQG
         I7Ig==
X-Gm-Message-State: AFqh2kqfGL/Y7ZIPR8EbklKl3msKzf3ZMuOnfLaZWRFF32jiTTl5rbuq
	mCOWAKCMHpoIl9A0IL/Qko1DS0KJeMfLBd+9/mY=
X-Google-Smtp-Source: AMrXdXsi1gms9y1CGLWX8m6henAVQe/Obv5DJvTX2FyTKVGBaFaeoEMhrEgGMSmE8tIJKDSUgODWVbICFz3TD15/71o=
X-Received: by 2002:a05:6870:b01d:b0:144:e1eb:419 with SMTP id
 y29-20020a056870b01d00b00144e1eb0419mr1543950oae.262.1672166497179; Tue, 27
 Dec 2022 10:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20221224165943.1324800-1-alex@linutronix.de> <20221224165943.1324800-4-alex@linutronix.de>
In-Reply-To: <20221224165943.1324800-4-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Dec 2022 10:41:11 -0800
Message-ID: <CAMKF1spOeeVjL=xudaCoUwx+7YTYU_FCupHdMUw=O6v8Ribqgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] python3-native: further tweak to
 sysconfig.py to find python includes correctly
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 18:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175034

This is regressing following recipes from meta-openembedded

python3-uefi-firmware
https://errors.yoctoproject.org/Errors/Details/685605/

python3-greenlet
https://errors.yoctoproject.org/Errors/Details/685600/

its installing the headers in wrong place

On Sat, Dec 24, 2022 at 9:00 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Without this, sysconfig would report the target location, which is not
> what we want in cross-builds. This is used in particular by
> latest autoconf-archive m4 macros, which have migrated from
> (removed in py 3.12) distutils to setuptools.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...py-use-prefix-value-from-build-configu.patch | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> index 2f519e4917..5ca855e7ed 100644
> --- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> +++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> @@ -1,24 +1,23 @@
> -From 05d676ddf675d9c8229b723e64717aa485d6809e Mon Sep 17 00:00:00 2001
> +From 45548f40668d429adcb7532d35db1ac16fe74562 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 10 Sep 2021 12:28:31 +0200
> -Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
> - file
> +Subject: [PATCH] Lib/sysconfig.py: use values from build configuration file
>
> -This allows correctly substituting them for target installs using
> +This allows correctly substituting them for target builds using
>  native python.
>
>  Upstream-Status: Inappropriate [oe-core cross builds]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
>  ---
> - Lib/sysconfig.py | 5 +++++
> - 1 file changed, 5 insertions(+)
> + Lib/sysconfig.py | 7 +++++++
> + 1 file changed, 7 insertions(+)
>
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index 93c6f73..ff399e2 100644
> +index 93c6f73..a87870f 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
> -@@ -668,6 +668,11 @@ def get_config_vars(*args):
> +@@ -668,6 +668,13 @@ def get_config_vars(*args):
>               _CONFIG_VARS['VPATH'] = sys._vpath
>           if os.name == 'posix':
>               _init_posix(_CONFIG_VARS)
> @@ -27,6 +26,8 @@ index 93c6f73..ff399e2 100644
>  +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
>  +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
>  +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
> ++        _INSTALL_SCHEMES['posix_prefix']['include'] = _CONFIG_VARS['INCLUDEPY']
> ++        _INSTALL_SCHEMES['posix_prefix']['platinclude'] = _CONFIG_VARS['INCLUDEPY']
>           if _HAS_USER_BASE:
>               # Setting 'userbase' is done below the call to the
>               # init function to enable using 'get_config_var' in
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174986): https://lists.openembedded.org/g/openembedded-core/message/174986
> Mute This Topic: https://lists.openembedded.org/mt/95864507/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

