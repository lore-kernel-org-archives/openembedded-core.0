Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F62C55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:48:26 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9666.1785412098142007300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 04:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j2O5gV7X;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5276d598b96so11093021cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785412097; x=1786016897; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfiwlGbmtHAGVri+MdbNk+q8/38qxMTOWSF/jXHSjEU=;
        b=j2O5gV7X7X+FGvUOZZjBbE4OxD76jjhXOAZ/FwrYPODuGxaUGZ0TtcRs6IHbQWW2z9
         LOZg1QTG8h4LgXwTboIewqHOdZ8rS830GAWmsry4YdXtDicnfDu4sIeytp3Giy084xkC
         hl/EEyNOMkZvWdEvlaKTSXmzBJPF7OZZHR0hbBJmiF0momKxAeKQgmgxqp+9GmwMtoik
         wxVpWAyUicKcgl8yxmLHjl97Ls7Na0M2y8H40ZjRL2UdORekEQrf74OjSwzy1ttC/ynZ
         RFyi3vxPTiDEO9Ns5qru/Ql5WotSLT+T6Zne+0EPkRAJq1SRHeEknVxLNPG88qQp6YI2
         TyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412097; x=1786016897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfiwlGbmtHAGVri+MdbNk+q8/38qxMTOWSF/jXHSjEU=;
        b=bT6DJbWMe4A8l4RbBteK/bcNVk2xlvTrhtL1aWiQU6/oRzQk5rWO70E4JljkiteCZ+
         CDfb2oZfwZMNJBo3t69ZFezVq0q0sbXF8q/SBCu6Nw2oY4EYH4d2MLCB5wO+T9iF5SAk
         NxDXs/Z3Yv5d6JEfl9Abgid5ARFNZ+1Yk4q3AlGAgm1zipQBb2i5FbVKS6G1TYhs+M50
         Dnbj6f+ut2ZsI1mNDJxZ9I/EI+fyYhHZ6B6mcNwg/KUKx3Gcw1gySFWN10FAbHWU9YNr
         DDGwzQcfenGAH+SvtduNFywaX1qDu4lJfUGj1ePu8feTzV3/jnhVPsW/ERlDW0pEytvb
         NbXQ==
X-Gm-Message-State: AOJu0YzX1UzlJjVSF/KwmYmvIhQ76n89++c9C8fIsjfqJMDQD8xOQF1G
	fhVbn3w5Otoda9tPqRAO40zAN2xcPOp3VTKnmXEc9Za3BDk500XeQ/yf
X-Gm-Gg: AR+sD120yz948F204FNCL8UNmuvvUTx9RbuKN/kLY9wzFo3b/Ka4DyIzH1HpL/yft5F
	TR2B2/ly6izYiu77xne6zi4GJHSzvEzAkPF/M790Wa2QN4H9aVZur2Z938nOGrS3RQVFTG0oLqH
	DJQNDlJ9aM8Yqo8c8vondbwCwUpGw05lPwDj2KnztUPdIc72VewQ/MXpWaSMNZZacbpIuTklRPz
	8J6InUKMRY0RIhH6Fxs/YitCniNryqrxGzZtcE2j5MoHBJ0uBinOJKmSsFKs8g8KslAHALOS1mL
	LCD795Pezt4SrHPq/2TniTSON843u+HBI8y/GAQzrlDkG/q0kaYFRgicTSfMm3KEqRGZF1Zifhg
	37lBCExwUcBfshQCKC9txihTBuG+gcE2Z2eoZM0Dzx2wMpytYZWQJ89dXPAVZbamoxDA0/Ky9U7
	nzdYMmsDkAY6uc8/oZh6R7gAsv5ZeW2yZaXSH8zTk8WQ8nxJ1WEljctuXGNtjzeq38csRNgK7FD
	txphGj23lhcnAGcFDRNEw9yF9uRA14=
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr22519181cf.33.1785412096942;
        Thu, 30 Jul 2026 04:48:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2dd8ac8sm38837841cf.25.2026.07.30.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:48:15 -0700 (PDT)
Date: Thu, 30 Jul 2026 07:48:13 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 06/10] nativesdk-packagegroup-sdk-host: add
 wic to SDK_FEATURES
Message-ID: <ams5_Qwxn95WDGXd@localhost.localdomain>
References: <20260724090146.19924-1-twoerner@gmail.com>
 <20260724090146.19924-7-twoerner@gmail.com>
 <76897f53eff588bb67e0e5f0b04dac7be6fa0ac2.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76897f53eff588bb67e0e5f0b04dac7be6fa0ac2.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 11:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242340

On Thu 2026-07-30 @ 11:40:13 AM, Richard Purdie wrote:
> Hi Trevor,
> 
> Firstly, thanks for the patches, this is the right general direction
> but we need to get the details right and I think there are a few tweaks
> needed to make this as usable as we need it.
> 
> In 5/10 you introduce SDK_FEATURES and document it as behaving as
> IMAGE_FEATURES, bit as implemented below, it wouldn't.
> 
> [cont. below]
> 
> On Fri, 2026-07-24 at 05:01 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > wic is useful from an installed SDK for assembling or inspecting a wic
> > image, but adding it is not free: nativesdk-wic pulls in the tools it
> > runs (parted, gptfdisk, dosfstools, mtools, bmaptool, grub, btrfs-tools,
> > squashfs-tools, e2fsprogs, util-linux, tar, erofs-utils, and syslinux on
> > x86). Most SDKs do not need any of that, so wic should not be in the
> > host packagegroup unconditionally.
> > 
> > Gate wic in the host packagegroup on the "wic" SDK feature, which is not
> > enabled by default. A configuration that wants wic in its SDK adds the
> > "wic" feature to SDK_FEATURES and gets a working wic, together with the
> > tools it invokes, in the SDK.
> > 
> > AI-Generated: codex/claude-opus 4.8 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v4:
> > - split out from the v3 "add wic via a new SDK_FEATURES lever" patch:
> >   this patch now only wires wic to the "wic" SDK feature
> > ---
> >  .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> > index 51e48f250b19..c2974a57fe3e 100644
> > --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> > +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> > @@ -29,6 +29,7 @@ RDEPENDS:${PN} = "\
> >      nativesdk-bison \
> >      nativesdk-flex \
> >      nativesdk-perl-module-integer \
> > +    ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
> >     "
> 
> This means that the recipe/package would rebuild every time you change
> SDK_FEATURES. IMAGE_FEATURES can be set per image recipe, this would
> mean SDK_FEATURES can be set once, globally.
> 
> This is why SDK_TOOLCHAIN_LANGS is handled at the class level in
> populate_sdk_base.bbclass. It looks for values and pulls in a
> packagegroup for a given feature. You can then change the langs on a
> per sdk basis.
> 
> Instead of the above, you could add:
> 
>   ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} 
> 
> there, probably for TOOLCHAIN_HOST_TASK.
> 
> Generally we'd create a packagegroup if there are multiple items being
> gated on a config. wic is probably fine, sbom might need a
> packagegroup.
> 
> Other feedback on the series:
> 
> * patch 5/10 should have a subject prefix of bitbake.conf as 
>   it doesn't touch nativesdk-packagegroup-sdk-host
> 
> * We need to migrate SDK_TOOLCHAIN_LANGS to SDK_FEATURES, 
>   probably using BB_RENAMED_VARIABLES
> 
> 
> Are these tweaks you're ok to make?

Yes, absolutely! Thanks for the feedback; much appreciated.

> Cheers,
> 
> Richard
> 

