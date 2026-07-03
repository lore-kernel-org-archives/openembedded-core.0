Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A715C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 21:37:14 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101428.1783114628341223660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 14:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KadOWP41;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8eeb4508f29so6766476d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783114627; cv=none;
        d=google.com; s=arc-20260327;
        b=TmQcdu9OUtyPAKSmQAyCq357c2LKJ55qGsi+Iez4XM7+dPFwuK8SLekYQhwUXfMhh/
         D5VxNgVnf/DFih6r5dtVX79+K/eziNQxhV163bfSvAlA275372fI9IuhTZW34rgj6On5
         h/uEYHB0MA6UikycmhlSfLfKDFmovD4rsm2h+Pgk3nKXjtEbsF9jE6d+fDyveHSj1S4s
         nhhkEAoAaG3r5VzD/96sjMafFZRztjNitPXjOp776uwsSUzwRgi6NPwr7qv79IdWocJB
         s8K9RKS6NRa8Y5khurc9zCuH0WF5Do+9Fg5Vpia3KZ3D8h2mSeceWKpQ1aKpJsPVobQT
         C3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qgeo6nXpgmiQVJHA3UBOv4MoJGrBnpbkph0AscpWPxc=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=N0dB/M5ty14iJqbIyEnoJLRB55o1hoCQPNEhIA7R3tstph2WKQdzBf6xav5lz7Yutr
         nnOXVm/pE863mtFsN62VPlnxCK9MhOVeImEHWyn8J/2kEqTYCUwFG2j5w6F6ORaFErq3
         C+Zlhv+/AdaOpKdJKb5M5FThN4NxwcMgr/62QS1T6BI1gxx6vmpokDdRl/J/tEPC5H1p
         lgEdQUFVdZ1/5Ohze8EDEaFAV9OSuMc9PqcD1WLwwmmtV18gUAMcy5scShRhVY6+rCr7
         MikROnw78jumJdp7ruS0zdkjiO9Ya6KPTrjAk7hHcAmR61IhwjXEhzRTwAyNZkhiFuvB
         ItRQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783114627; x=1783719427; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgeo6nXpgmiQVJHA3UBOv4MoJGrBnpbkph0AscpWPxc=;
        b=KadOWP41XR70jG5U8wgwQLsMQ9txuP/e9mjIU3qYHPSC8UIWLm8wxjmfOt0c+iswze
         mmy/aFOvhGmu2oqzgMqb09igHxMn1dKFabE20X/iRs2Z20iHEy/IodUPLzZ4/EQmV13r
         2j5eZuyHt5Maboswk4B2Hz8RE2i04O3CG3sFJrZbZiCY0sCqWYCsfomC86RSpgF5FEQD
         W9/L+13IcnACcwCkY+LixYitz0rU64vwQnJckNpE78Qt+ffpKKQK5hkEmluHL8xmQxWO
         Wv358s8NsgSG053wuP/rqt6pbzoH17/9sjiU+hyfUj2VFlBZ6gwp9cIJT6CoqKilC1OL
         7zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783114627; x=1783719427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgeo6nXpgmiQVJHA3UBOv4MoJGrBnpbkph0AscpWPxc=;
        b=FlJj4g//C+jjK0IsY4PGPst5ZPPUM9NIOIDW6HVRtAIcEqioMdvDSsSR/uhMgvpcQI
         GnIHQjw1mbpJMFNsNtFsUZ2mbdTsfyBdfQ7qjxFWWJBPoDfeKe5ysorftAjBqKU1bFJp
         quM7lBl2XF9nVlgZJNjot95FpEZb+yp7CtOEPI6rxlWZYdNDm3HhTLLqXPVe1Y0ZgPP3
         PYsb4CydPGKqvD/JJk1U0NBIay/31NfyWEaxwS1vFHnimXH34BKs1rEGwpkYUUF2rtIw
         ZCHheBnxPHVAleRRbrmlrQ7vcpg8i+z7OO5oqNqZ2/pCh5CrxGmNJEHzkO1co3Ol5mcI
         HvxA==
X-Gm-Message-State: AOJu0YzizgAbsQ0g4o4Jm2F700XVj4kNVnGZ0Q5m6c2co2EsVyVATpjZ
	Y85BW359N5AzfIjMNl2uxd6N3GtnhqNsD2vNpTbnn04AL1S55YyRng4pvpv4WUOGQoFvOp0s5Ax
	4rLyxgDHaNcDMMNIt/5dzbU2KkrgOqkw=
X-Gm-Gg: AfdE7clM+CKrYu8SFbOVmFEgPAvWfotQaY7Cy0W90E4gpuHDGoUdYgYc2g3+7uqek3u
	nk+J1JtsFFgKXSlUD8nEXsdi4MPXXwEjZXvurytv8Mjjj4VD76/z7n5WvK9pwOB4pIh1lyCQpwq
	rJecKV19b+ESU3qioaOuWAELUfE+zgnynkKjnrv1JcjNN6unfzVJxclisCJqdqhc4JYvIi9sARv
	tRO0BDXFJA/2kAagL/PeabhK3z1VeUpyF7h4Rz8x69NtYG3eMbJ3DtLSqLLB7QU7mOBKBG1IVvw
	vJlSFBXN5nV3Py3s3jKUdg3h4XG2
X-Received: by 2002:a05:6214:224a:b0:8ef:bf1:6f78 with SMTP id
 6a1803df08f44-8f74abdec0fmr15098916d6.13.1783114627121; Fri, 03 Jul 2026
 14:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org> <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Jul 2026 23:36:55 +0200
X-Gm-Features: AVVi8CfNbU1p0yhkGZ-6ZPiKbKvxoVn1O_XRYY_4igpBPZKa7IlUnS9ot35jW_8
Message-ID: <CANNYZj-7NkZiXow508-rdrovftFp6S6yuGKVDYMHBPp7MR440w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/15] mesa/mesa-tools-native: Upgrade 26.1.2 -> 26.1.4
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 21:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240125

On Fri, 3 Jul 2026 at 10:30, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> -SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
> -PV = "26.1.2"
> +SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
> +PV = "26.1.4"

This will probably fail to build for qemuarmv5, for that I have a patch:
https://git.openembedded.org/openembedded-core-contrib/tree/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch?h=akanavin/package-version-updates

Alex

