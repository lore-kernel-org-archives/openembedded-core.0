Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E1ACD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:23:58 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9405.1778153036094380036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oVTWoZcB;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-512f750d4b2so5140621cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 04:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778153035; cv=none;
        d=google.com; s=arc-20240605;
        b=MutCl/Bld0YAcPlkA4foyLRS1eis0FSMhOtYbIrYzf7PZ55Eiml83YdxumaI3iIDRo
         FQwKjduXS3HGvsabXYsS0EOQGeTRZxre5zpWoLLSdWnUf1SIMBhLiZFSseLqW7JoEEii
         at5Cz7F20CnOs9klQJ4IrpqxT9tJaIWPe7sYZys/gmvVznmbvCLb0JPpSrErD5F33ZQn
         vEu+/WFHKp2JENW/RIHl1/57p5Bqq+0f1r57WwInR6OfJstxS1DxKR6YUs8ySl6DwfYc
         eoESTY/ekJcpt0GDCGy+ifshSn4Rn/+VRmCuurxSJ+8kJSGR2dk3hXnUoIkc3QfKc16s
         VC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UHcOmZ9H5H1tsKwhCA0RG8/OXYfRextO99ZVk+4ipX8=;
        fh=SZlaEGZ7YYupt88/Sw339uqnvSy+bxY8nibKjhKqbGU=;
        b=ilyypG+8jEw2m0DAY3rLKcvhaFtZtz5oVB7zN8vHSaN9/Et9lmKfXfxRhRZF4DiD99
         QU3LUP2iN6nKo5jvPb7b8bvUpdtElgkN7FJI4bYV1KOSmnBNf2397WHdmvkTp4fQ952d
         kEo4WMw5EOSMNvLXyNz8HqFxatMTInY9Nvuhve7Frz0ooa5w0Hmx9sw2zcdIRwrut3Cg
         H4qk9PyP32+izOcwWRm2B+byhDbFqO/T2hQSCeH6MTZT+S3Wu9VODDmAe4VdjO/bopmJ
         yvst7p+UTz0C3inuimOAL+D4vsNV50KqmZ/IR5hZq0WJO24uQ1MldC4OD8Plsq5DUiDr
         ZAOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778153035; x=1778757835; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UHcOmZ9H5H1tsKwhCA0RG8/OXYfRextO99ZVk+4ipX8=;
        b=oVTWoZcB8UreYJTzx/TQjE51FQ+pEXlzVfLGsAwGNG4pCdA2EOSp9fxxkfalDmL6Zm
         BY43CfNTqg7NWWWrgTWWqmlRLvHucV05u9Ox5H5LzLZfPViywRPehUtgQHXPHD1CGsJl
         mMQCbd9VA6dntaEIf79WTYh5dv2X56dZsE/QqTjrautaRrO5EtqXDQVNwwciwhfivPyT
         zT1OflgbanD+vQINdSAvGWbpMcVUHiF2YF7SjXYzCNLtlRD0LLGaW1PZ3lNiCTK039sk
         t0hPKfQnl8Emwz66xlDfPUjM5WrUvz+x7S7/VuhlSYlBixEmMQa22n28AQeFJn6pHGG6
         mMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153035; x=1778757835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHcOmZ9H5H1tsKwhCA0RG8/OXYfRextO99ZVk+4ipX8=;
        b=pKTWV5etTxpoUgFaaOGz4arMwL69aJA95FXMC5GuYRGDOs8VwcBU9j7gHBE3flb+AP
         cp6aPzzCixB+hbgQsIuCCtGkOD26DqowaEMmGqB/uF6vJHKBONnr4Ugw0iov8Q9hjQrR
         E73AOd3En01RoF12/6FVtzaJJvCqlHKcuo8eeX8GKMXEo5gBmXhbxbqXr5Yf4iHU8G0s
         g7eORAfYxZ5z8KAVLc5VSlLKQGFA6aMGaWkGbRSfTbt+eLRVZkUzkUB8FHBGyDCWUU8y
         EX26/J7Apff3MUt0onPABN5/qR2o22izmkcSOU+kvE2CRJe22qm7qnjrDagdXO6yzdhW
         kiJA==
X-Gm-Message-State: AOJu0YwqwA80GzCrqnpN6hj1/vRZNTZrI61XhP+DG6d5bepxugMXoJbq
	po00RjoMiIxx88MlDRYnZCoypUvpuc+XbQ3XSVDF5MlOPlK+NhDjrnG1j+zV4eixgMHM/ZFRIie
	/t3vQLh1pGdwFupr8OjOFNVEDRBZiOc0=
X-Gm-Gg: AeBDies/wvYg7OxvgBbC5CIDtza11UMvgWBCDSswYC46tKTt3bQwB2aRPucKMUIr7OA
	/IYzjbbyNsM18U0ZefphVoeYSMMtiPtWc6KcgI1OKC7PEk/Qn18KKAK5c0nWlQpc2Xs7ff2GFFT
	KdVOEFQ7a6v4LZZM3rHzXtYx5j1A2ybyN5S2WDtRAz7UfpoFGhSqNVCmZ22jmOA3/mhxJQrhnnl
	ZB+M45NUEKFBViXocbVbLmYrOmqq0dqNIMUtoCrROx5R2H3WYBPbnnk7Oe8uIrjVR1G9DLVkixh
	QcZZBX7jBUEIU6+QdJfYUxbu6baX/c0+37OVJlfLRlAx0HtrMynxRZupE3zQ0sQ=
X-Received: by 2002:ac8:5a54:0:b0:50d:7384:a660 with SMTP id
 d75a77b69052e-51461be0587mr99211801cf.6.1778153034957; Thu, 07 May 2026
 04:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
In-Reply-To: <20260506214835.1578529-1-Quan.Sun@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 13:23:43 +0200
X-Gm-Features: AVHnY4K04VSMrauUnTcZDGwaSapxDKcs8s8-rJ3NvVmrPu1A391PiwUYV0R-JEY
Message-ID: <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236578

On Wed, 6 May 2026 at 23:49, Quan.Sun via lists.openembedded.org
<Quan.Sun=windriver.com@lists.openembedded.org> wrote:
> +SRC_URI += "git://gitlab.com/qemu-project/python-qemu-qmp.git;protocol=https;branch=main;destsuffix=python-qemu-qmp;name=qemu-qmp"
> +SRCREV_qemu-qmp = "82006cb788d27b090a8b84fc7831feb9c528bcdc"

This component should be provided with a separate recipe.

> +From f013e84d382bc1bd7d49206bdf47c689b0c6fbb5 Mon Sep 17 00:00:00 2001
> +From: Quan Sun <Quan.Sun@windriver.com>
> +Date: Fri, 1 May 2026 13:53:24 -0700
> +Subject: [PATCH] meson: fix subproject include paths for standalone builds
> +
> +Upstream-Status: Inappropriate [OE-specific]

This should include an explanation of what makes it inappropriate.
Don't just say 'oe specific', a lot of other patches do it, but it
doesn't actually expain anything. What happens without the patch? Can
we find a solution that would be acceptable upstream? Adding
Inappropriate patches should be avoided if possible.

Alex

