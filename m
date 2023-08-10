Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C3BC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:41:17 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.22494.1691685673377478019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VG98BfCx;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fe7e67cc77so1743810e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691685671; x=1692290471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1/Mc0o9KgYc6opiP1PVeOzvfffHEQGfm0IvW1hK4hWI=;
        b=VG98BfCx0rb3AZQq9PwJHL9LR9PZnXrWkkELVHu6NtU2Va/q8uGtRRI1qFZXPKEBla
         KEvqs7EYvB09KWrw2shQc69dnYhDpyYuxw/V4B7Ywmf+DoIi2jKkYB6bHRO+lgJXUntq
         H1gnnEEHaOEnkgA2lCB7Z8nFqbePRMGjTofGqtbYqA6466N4lzD2o7tWxlXrdxfRBCIR
         CEl+htglVHo+Y4YIlXHyPQquk/d1rYQHg7JKPSO/mXfjY6TlAsNT+qh57GbdGD+USeDJ
         k4+23XJbqqro7DLDS8K+bwMk+1khWAaiWNTPN1l5MorLxlsDqUuK4ICOlPQsjEiWbaVY
         6TAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685671; x=1692290471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/Mc0o9KgYc6opiP1PVeOzvfffHEQGfm0IvW1hK4hWI=;
        b=OwwsTJ6AH8YU7tQXVw7kZi5V4eWpZuy/4hG2s2SHEDCeuGMylMY3n1XGyYlcSELrCh
         p+S7vHF0Leo/1Z/BcBuL0bYRUQUJezONQmAXzyUmOfPIK/GFsmYfpBlMtmmnaRTS72Gz
         7JiIzLylMLhxV4AZrBh34KvZUKhnEDcDvyLfF80STP1h1sBghoanKjIT6x44gOG58ndw
         lE4kq/+LXB7BcI7nur67JtrJpJzl9//UcJmzoNXwtGwb2MXz5QRxhPCrnWUVTrTYEUhu
         QsmH/cj6nVt4LLhdOgn2eY+xTJkJ+u+78kz6V+xBXSolXqGVDvgrzD3f/HBAhSg9Lm/M
         4P3Q==
X-Gm-Message-State: AOJu0Yxa+h2R+5lbEUIe6jHRlZ05FaVBeOBJAK/hYwHysWt/gTOnG3WR
	08hNOax70MQg4WmQqI985+f2jt9OBO9pAx7HbUdXLUgc
X-Google-Smtp-Source: AGHT+IHfN52JYNHOil8Fils/qpNtq6Dju3Z/HzyU8qJb6QMCxR+l2vxFEpmF2ptdrkaqCaX5wMyMKyJsNEo2+IARRw8=
X-Received: by 2002:ac2:5f99:0:b0:4fd:d6ff:c244 with SMTP id
 r25-20020ac25f99000000b004fdd6ffc244mr2379658lfe.62.1691685671266; Thu, 10
 Aug 2023 09:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230810162451.1766532-1-ross.burton@arm.com> <20230810162451.1766532-8-ross.burton@arm.com>
In-Reply-To: <20230810162451.1766532-8-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Aug 2023 18:41:00 +0200
Message-ID: <CANNYZj9j1-s4=xN3jB+-J75+s3nGB7uCOVxm=EgzH-676TJcpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/9] python3-pygobject: add explicit check for
 qemu-usermode MACHINE_FEATURE
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185817

Adding anonymous python is not good. Can this be solved via COMBINED_FEATURES?

Alex

On Thu, 10 Aug 2023 at 18:25, Ross Burton <ross.burton@arm.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> When building for the target this recipe absolutely needs
> gobject-introspection to be enabled, so add an explict
> ---
>  meta/recipes-devtools/python/python3-pygobject_3.44.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
> index 6f7d9a09ecd..797a7cec8ba 100644
> --- a/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
> +++ b/meta/recipes-devtools/python/python3-pygobject_3.44.1.bb
> @@ -8,9 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>  GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_OPTION = ""
>
> -inherit gnomebase setuptools3-base gobject-introspection upstream-version-is-even features_check
> +inherit gnomebase setuptools3-base gobject-introspection upstream-version-is-even
>
> -REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +python() {
> +    if d.getVar('CLASSOVERRIDE') == "class-target" and not bb.utils.to_boolean(d.getVar("GI_DATA_ENABLED")):
> +        raise bb.parse.SkipRecipe("GI not available")
> +}
>
>  DEPENDS += "python3 glib-2.0"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185809): https://lists.openembedded.org/g/openembedded-core/message/185809
> Mute This Topic: https://lists.openembedded.org/mt/100666863/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

