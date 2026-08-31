Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE16C61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:27:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25765.1788168457276742431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NttbOGPP;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so23667325e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788168455; x=1788773255; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VU4l0yFqFrDI2eE069UGDxgkcieqgAIh73qT56tH/QM=;
        b=NttbOGPP9jWAqgoovFDxhNrauJiNfjiEN+5HIlmbgSkga3+waT+1FWJ/0p3Tq3W3ek
         VE5mBevGFpg+UBElJiMqdF8JNcNCsQnMw0OOnjxvywKyud84aEFRhXQC0dCuho9q2u5L
         0soqfq5vF+ABmav/NHnjUyHeATiSPUNNAC07s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168455; x=1788773255;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VU4l0yFqFrDI2eE069UGDxgkcieqgAIh73qT56tH/QM=;
        b=fLi7FIKqGVCokUs5Vryz8aUdKJE+oHtFWVR+3Bqf9NpfnYHhqZQKE3GpOH2oxe/HXf
         p3hK+IiyXIWRLIflC4+XZOY70gy/kTg0uIJbJaOQKwbanHErNW6lu37gjY785F98ekI1
         3JP6U0BtW4xu11kL8sd+chhjWWy3tKqAd0iWb4t21fX/V24Gyjx2J6S7zG8HyuzHmXeR
         XEVq4M0JGG00W30Ro4wewPUrD0M3+Z2pTwJkdZpfR9ZmYoC4S+adu+pf2LEpo6BTZHes
         4DiVEKqfp4w5vS9tay0NlMPN8MX/9UBxvGuAPe39fgSdEquYMOamjuhR5dzi1znoMASe
         8lJw==
X-Forwarded-Encrypted: i=1; AHgh+RpRYnYkEtfxVpCANjl+fqh4noNJ49jXWXUlA0pdt/r2/SSa9t9KfStoOW9llCwCmRAgUcZiluOyHqoVUIqSpTspfQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++ku7br8EhTxLt4E4F0uMHdC5dMNPpa++ZOBx8yGehv1iEQViNT9
	N1UScswQeFi6rQ6VsufLQw6rYUWYOaAlp5+rUjTcPUhnyAc0SxBADO7BmfOrIuU5pDQ=
X-Gm-Gg: AR+sD11OXBEJRxik7L9E4UGX3i+MtGME19rythHuYsqNor3nPV6VhfzTNE44Efv6ZBR
	NM6Msa5MgPnZIdMEOYzTWpdYaQeiimvGSHQ3O7B/x7KyG+1V1l0Qiy159ltPcwtsuoBBmgR+xiI
	jp0F+NcXRHSB6Tl7qPm9D6CeFgs+ZCoL98yMFyUayBxLxOKTDrSpYs2mgQQISlGNRUZ7Vav6epl
	EsYmFl6rhs/iL0dGXa2VxYHCDeWoU1H6kd6p8BlHRp/zHXk3XcBzioyWxrWpZUdwZR7i/026UGw
	AGbL9PG0O3IgZYHOvEUe1rH0+lsU+mfkwdLDzwRUaXg4+tKJ1CRAMDv0hn1aSoBy2QlnoFkmqiC
	OeGbJIZLh162TY2QzXXT+foP2MpVJvlCKxRt87DbH5LM7FLUGxItmsuer9O9ShFQ/X63D9GcLzX
	2+z2IVQzi43dSXeTgBUnXtYpYdAgNuR+q4A5Sw7nFB+RcB/J7zI7GrTJ2Rz2gl7UPbFzwGfaq6o
	l6Hzkg1jUlHKTVwKF/+FxHxWaF+XR0U5xymJkfjcIy8B3Pf4DGjRO8yFUY=
X-Received: by 2002:a05:600c:3f0c:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ccedff89amr201519195e9.16.1788168455550;
        Mon, 31 Aug 2026 02:27:35 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm305619065e9.2.2026.08.31.02.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:27:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 11:27:34 +0200
Message-Id: <DL30TBK91466.Y2UZZH9TCJWZ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: fix CVE-2026-5435
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>, "Yoann Congal via
 lists.openembedded.org" <yoann.congal=smile.fr@lists.openembedded.org>,
 "Hemanth.KumarMD@windriver.com" <Hemanth.KumarMD@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260819092634.570557-1-Hemanth.KumarMD@windriver.com>
 <DL30DF8R6J3Y.2XMP2OA0BFNV0@smile.fr>
 <DU7PPF66507B2D7A2088EC452661D307C49F3A92@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU7PPF66507B2D7A2088EC452661D307C49F3A92@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244758

On Mon Aug 31, 2026 at 11:11 AM CEST, Jaipaul Cheernam wrote:
> Hi Yoann,
>
> My patch in wrynose  glibc stable branch uplift will address this CVE.
>
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260816170737.4=
2198-1-jaipaul.cheernam@est.tech/
>
>
> Regards,
> Jaipaul

Right! I missed that.

Since the wrynose glibc upgrade is currently in review, I'll review this
scarthgap CVE-2026-5435 fix in the current review cycle.

Thanks!
--=20
Yoann Congal
Smile ECS


