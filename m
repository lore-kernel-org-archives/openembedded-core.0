Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1FEC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 21:05:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.112055.1701119115662838498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 13:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WHlmvHfW;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c72e275d96so63136771fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701119113; x=1701723913; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nUr+nOKObsLwB+m1vVA2xcVK0wKXxsID4fYkAh/Tp90=;
        b=WHlmvHfWOf/DuywkYLSkEoI063lRPN2ra8ZOqgNWItoNTcLQ0cZiLEvEiWc64YO/T5
         Dq4aOWHAC1cse5MGEkbR4Us0TWyHw2lAnCIcLoN3laV3CTNmw9bXv2tcTjw1L2YCnU98
         EQJ+IPn8cMKkKZmbztIcYhqr6pagroJJnxWrBdtIzyO1TOVKPzxMP7eHa1Tg0tCPrMZY
         JZrPEymf8Dd3QTllGEiyqOH7AtXpyyCPxlINeqWyziV/WGZykzjOGoJBUW0SxSNZ0j60
         nARq788Hax6hcplZ/M+SuuxvsSO/8945BqlMsyB8lXrTv9cT/6Ci//ip37GnoAFqbwtP
         bLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701119113; x=1701723913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUr+nOKObsLwB+m1vVA2xcVK0wKXxsID4fYkAh/Tp90=;
        b=eqM/Bt+wRf8dn+coU2HHxQGLuKvK7ynPP4AlIqZVUBR5DyhYlSvIQ7H2p0JR3DuA7e
         AoDZM925ovBe3QHEiyj2taSQlXNhHOoxDcZttl4KstMo7kwHMRSfMN+tvw11VFszCi1+
         LJzVK/7USuDPgUT6efo4v0k1Xi0oHuPjWuVCbtiqCPxaeX0q6OO48st0M5phvZyjsQxL
         NvMRMLweAjxffKaj4x9h/zaq7qQJ2yGebGtGZclv+u7Dsdxrx6FE4dcBt8FYmFWS3cOZ
         M/0zVFJl2lP/30TQhgAQR5lcrHM/tqShs+XJZkccBYwY9P4KajnyLgABXdUtGWjPz230
         BaVg==
X-Gm-Message-State: AOJu0Yw/yJpYvNlb822Yp4V6oLy2X6E4lWhmSCV8urgrbeLHl0tuE03G
	I0uXvA4TJbKQVOpRINGyLB9QjsqXYcbE1+TPtb4=
X-Google-Smtp-Source: AGHT+IG9p+7hWNnmgTsMXMY2Dx7WUTVNnnvioeL9iMOWRO6LV1WgurNdLcoZExh6h7mtAqgI7Im41cEir9CODl+QOss=
X-Received: by 2002:a05:6512:3b09:b0:509:43ec:dd4c with SMTP id
 f9-20020a0565123b0900b0050943ecdd4cmr8095140lfv.3.1701119113175; Mon, 27 Nov
 2023 13:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20231127145643.986904-1-quic_vkraleti@quicinc.com> <56AF193C-6DA6-435A-8C6B-06EF0F5B15F3@arm.com>
In-Reply-To: <56AF193C-6DA6-435A-8C6B-06EF0F5B15F3@arm.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 27 Nov 2023 23:05:01 +0200
Message-ID: <CALT56yNtJMP8rv+7MGOCL-bPn2XnDVLDVa2SBhVmTiFZUGDp5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: Extend recipe to compile native
To: Ross Burton <ross.burton@arm.com>
Cc: "quic_vkraleti@quicinc.com" <quic_vkraleti@quicinc.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 21:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191327

On Mon, 27 Nov 2023 at 18:49, Ross Burton <ross.burton@arm.com> wrote:
>
> On 27 Nov 2023, at 14:56, Viswanath Kraleti via lists.openembedded.org <quic_vkraleti=quicinc.com@lists.openembedded.org> wrote:
> >
> > systemd has ukify, a native tool, which will combine the kernel/initrd/stub
> > components to build the UKI (unified kernel images). systemd-boot recipe
> > isn't providing this tool.
> >
> > In order to use ukify, one need systemd-boot native recipe that can be
> > added as a dependency to get the tool under recipe-sysroot-native.
>
> Feels like it might be neater to just have a new recipe that builds that one binary, instead of a mess of overrides in an other wise simple recipe.

This was one of the concerns during patch development. I suggested
patching the existing .bb on the premises of having the same version
for native and target recipes.

-- 
With best wishes
Dmitry

