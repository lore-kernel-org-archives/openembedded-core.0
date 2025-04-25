Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07645C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:00:17 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.2115.1745568011821620087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYJm8Lz1;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f2b04a6169so20967876d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745568011; x=1746172811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5a0c+Gly8Ti1mfmgAenuH7ZwliNbTUXiC3ooztrKIMU=;
        b=GYJm8Lz1dlb28m2RCRa4Nz9yUDGuremijD1Tjsak05Se7AbSSl+bqG0YxRuS3Xp1T1
         lMvqEMfmRH1gWxKAB2r3xfzVjxgUAQmgVMjOCTQNHP6gm+MEl9r7uNFAqdLHJOVKg51m
         jcroc1oYJgEGuZib4eVJBhC1HLCxoooTox0aLNL1v2MgpSaxhOWvbiMdHdmGpXxuibea
         eqHHuA+fLhub9h6MQv0aP2ZTiWUIAGhu4zFwBv6UKxswi/WIL9j8z9B4lgqlb+XHBZVL
         EODU0pS/tFGRjTVzgnyMxUcsjCJC0gyvaMnRKxpsmk37bjllNkV3tAv9zkwoxcMtSMfg
         YFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568011; x=1746172811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a0c+Gly8Ti1mfmgAenuH7ZwliNbTUXiC3ooztrKIMU=;
        b=NhYaiKD2133NkF8yonuskeV+fFkgN/v6hoCIxOddNhREj3t0OnJldf3Hg94d+31lCh
         ERFbnFVBvxvPpNyGqZ+SgRiPRffLRX34n2Dp2W+vxDT2JzhSO4TT1elp2KgKCU7go63z
         aJTJinI6AjLDlbZl+9w+maDYxN6jxyBvgRfMpUxRsRVQi9HurWggf/ObQ8Sg/UPbuJ3U
         lBVSsGoDNqcZVhwoXAQRjiA5IEc9Kiob+R1TZCqTv5aPvzqPfPAU+9XoCufy8MfU1zy8
         8UM201yNb1n3kChakg6V4AU503modzdNymUYOiBbFHxhoRcyE7rl3XADotn1GLp0vYw3
         LHtg==
X-Gm-Message-State: AOJu0YzdtVhyTAhtE1rPNJpWsWRe01+vjKNXwbY4dNvMk0mMKHY4VRur
	Gxb72elJKpkbZaY4/8cits3CMeOjmTwzHD7ehVa5Rw/yoE4nq/dYuhrFWRMW7ybxa0VfAvnlozx
	SvboUI08RHJATS1khnqp/lPuDrVU=
X-Gm-Gg: ASbGncuEoA1RUWvQVf+1yG/hX8sGCm8sJVwniJYMCzXp/U8QjxStjwkI/bFNjKAb+gm
	IahoyD7TU/asqoVdlyjq/5WIGLqVgAC7IK7cqTF+ATXgsLhW2hoLTqjmXAHIExGjOjKNXoHFj/o
	xNd61FB5LKJvbkjH4iQK/KPWdX3qFPj2yO+f+nahbZGtEcv/Eq12NT3MNG
X-Google-Smtp-Source: AGHT+IEuab7ME2GFopFtzq16y/q/Cb0P0N/iFdaSpI8OMw1XTii+C9SoFxDncrTrvLzIxPw1j/3wDRpzeec6ieUwXVs=
X-Received: by 2002:a05:6214:194a:b0:6e8:fb92:dffa with SMTP id
 6a1803df08f44-6f4cb9edbc5mr25236016d6.25.1745568009315; Fri, 25 Apr 2025
 01:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250424213951.2514902-1-f_l_k@t-online.de>
In-Reply-To: <20250424213951.2514902-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 09:59:58 +0200
X-Gm-Features: ATxdqUGMXTIrRVyO4XV29B2pAeYr6BbqWuZx9M3r3Zww8HadI4of12OD4gtQh3k
Message-ID: <CANNYZj9POGReasMqgt6=BVRexWAMGF0FYbVoPzNwRkfojTk-7Q@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add entries for virtual/libsdl2
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215438

This is fine, but it makes me wonder: is libsdl2-compat compatible
enough to build qemu-system-native with it? Can you try that? Then we
might consider switching over to sdl3 in core.

Alex

On Thu, 24 Apr 2025 at 23:40, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat' where the latter
> is a replacement for libsdl2 that uses libsdl3 behind the scenes and should
> be favored if applicable.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/default-providers.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index cebd0400f4..ee91af8796 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -4,6 +4,8 @@
>  BB_RECIPE_VIRTUAL_PROVIDERS = "virtual/cross-cc virtual/cross-c++ virtual/cross-binutils virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++ virtual/nativesdk-cross-binutils"
>  PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
> +PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
>  PREFERRED_PROVIDER_virtual/egl ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
> @@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
>  VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
>  VIRTUAL-RUNTIME_keymaps ?= "keymaps"
>  VIRTUAL-RUNTIME_dbus ?= "dbus"
> +VIRTUAL-RUNTIME_libsdl2 ?= "libsdl2"
>
>  #
>  # Default recipe providers
> @@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
>  PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
>
>  PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
> +PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
>
>  PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
> --
> 2.49.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215406): https://lists.openembedded.org/g/openembedded-core/message/215406
> Mute This Topic: https://lists.openembedded.org/mt/112441574/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

