Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB7BC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 19:08:01 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.31729.1747940879049419388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 12:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HkwOmF1H;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742b614581dso6878486b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747940878; x=1748545678; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GrxQh3ffjFCigiRqUGzvUsV865mRLAS+R4AvkRkfWU=;
        b=HkwOmF1HUWei74VSzVU7iJPFb0U5GjrRlAmqL06FEknu9dBRxRM9uHYiS+42ghdlbv
         XaBC7EhjUOoufCpYmys0xI588ODdQdm9pP9jH8ZVVu7SfWbwbkwQ4t4PBNNdfURl/yIc
         Hke23rwmgpQy9zGTZwGLTvX/ZJICVJSr7voU04nxlnV0oKDqCqDI8XFik4Mq/GVxlnF6
         iryV4j7oX4pSJ7qJ8vvX/hpuc3orbuP8A8oTYGIhGRYRZpyhM3fmxOe6iPW6jLZXGAjM
         5gQzqNY4bFdPcgANWlOf2Mc1KF/aVdyOtsBB2qTLMK71xbGaq/hgYziz4aNn8RYkd/Jj
         eaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940878; x=1748545678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GrxQh3ffjFCigiRqUGzvUsV865mRLAS+R4AvkRkfWU=;
        b=JwiQRo5XtyyYGTgQX+Y9WLDLLLMfQE5Q5kc+Y1Cs0v0E8Z3rt46JMS3oKOvGuk+zwN
         lB8tZGuA2dYV6sMhb3VZBUvcWqSYMp4Rpeo6+JIA8X2/4iShk2uBkvAIHpaKUOn88idE
         Ah2NiEZk8tik4J7e5027LtYC8hCw5hC2pokkmrb+LlEwcL8UPK7Vefx/eOJCtwQ51nZo
         eAqGWA23hCPLVSBS73TJ4+hUcnz1emsqp8TqXUS0YpvxB50Wg0G20qz0lWrFOevjBi+W
         tEUYyi5yVKfI+LDYdtl0sAkp6hnyPevGnNBb3W4pj/hO8cJvpFLsEZAX6zFRCrmVhvUf
         dLqQ==
X-Gm-Message-State: AOJu0Yw+sPPAsA8pM9U+0Zvsq116uBXw3EloGYocRsxSzwo7j8tlzYy3
	A6KiUE7x9CYa0MOSo6gEh7pAXaLjLNC2JnGMZYrIR42vCLi32UmgA/7H4o+B3w==
X-Gm-Gg: ASbGncuwhLF1iKS5eVKP76JVTqwcxRxWZiZiqe17zboMwN/hIljzXiIX8BLw/CxcxRz
	nSa/MAHGJCZqH7UfdrGariFp4VizXivJzFfSR9CFR/m1pnWc0ceOTA3i91suAj8mX/ix+NYlOIR
	27cfxhN+ECooqcaHc432yfT9JuKMGAWMNhOscSQ6Vr3EhIbG6LoZ4vER/aqfF4H0qjQPGh/FW1H
	I8pq7M4BZJtA/H7iLf3DiljC5i4yqNxakonUfzuK+2Unh/I4Nn79CKFfB4yxMbq4TSALi85WmEm
	4xdoIxYjl4pD5Ya5unHEhSKCXfRqGvTnsXlytEaKTox8f6NW2YywrLGf2Ber
X-Google-Smtp-Source: AGHT+IEVJbiPeKZvx1QHPTOXjzllsGHxjF8tooeGVrqczWCEcUyRrFcIW+Gd7lWeJeoJCWwJpg+sKg==
X-Received: by 2002:a05:6a00:9168:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-742acce71d9mr34256754b3a.14.1747940878282;
        Thu, 22 May 2025 12:07:58 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98771cdsm11958186b3a.144.2025.05.22.12.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:07:57 -0700 (PDT)
Date: Thu, 22 May 2025 16:07:54 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Anuj Mittal <anuj.mittal@intel.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] base-files: refresh patch to fix fuzz
Message-ID: <20250522190754.lbvzv554c6a34hoa@hiago-nb>
References: <20250521202337.113556-1-hiagofranco@gmail.com>
 <CANNYZj-Tp_s_Bg16bDA6XcDKZOtxjvuYy3h+oup4g40WTCf3Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-Tp_s_Bg16bDA6XcDKZOtxjvuYy3h+oup4g40WTCf3Ww@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 19:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217148

On Thu, May 22, 2025 at 01:01:43PM +0200, Alexander Kanavin wrote:
> On Wed, 21 May 2025 at 22:24, Hiago De Franco via
> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> wrote:
> > This is due to changes to nsswitch.conf file on commit 0cb122f17cf2
> > ("base-files: add gshadow entry in nsswitch.conf"). Fixes:
> >
> > ERROR: base-files-3.0.14-r0 do_patch: QA Issue: Fuzz detected:
> >
> > Applying patch 0001-add-nss-resolve-to-nsswitch.patch
> > patching file nsswitch.conf
> > Hunk #1 succeeded at 9 with fuzz 2 (offset 1 line).
> >
> > The context lines in the patches can be updated with devtool:
> >
> >     devtool modify base-files
> >     devtool finish --force-patch-refresh base-files <layer_path>
> >
> > Don't forget to review changes done by devtool!
> >
> > Patch log indicates that patches do not apply cleanly. [patch-fuzz]
> 
> It helps to mention that the patch is conditional, and that's why the
> fuzz thingy isn't seen in default builds:

Ok, I can add this to the commit description in a v2. Thanks.

> 
> SRC_URI:append:libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd systemd-resolved', '
> file://0001-add-nss-resolve-to-nsswitch.patch', '', d)}"
> 
> Which makes me wonder, should we rather ship two versions of
> nsswitch.conf in /meta/recipes-core/base-files/ and install one, or
> the other?

We have the benefit to not touch two files at the same time when any
modification is needed, by using this patch. However I agree that this
conditional patch is not ideal, and looking at the git history of
nsswitch.conf, it was added in 2010 it has only one modification in
2025. I think we should be good by using two versions of this file.

I will do it on a v2 patch, thanks for your suggestions.

> 
> Alex

Regards,
Hiago.

