Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7A7C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:44:19 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.35649.1751276652118810860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3PBKr9Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6face367320so21854576d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276651; x=1751881451; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jh42hyA9Bm4YAO1yivQ/JIgCWPt86ufBK3xHEVaL30=;
        b=S3PBKr9ZZQeIe8hnJXgYeeu6bg3B7e5j3n1H+CcQv32VhyGw/c6zytC66jCmSp7fuQ
         EaDwkm9kgBEHQdBcQ5VCvFDLVttGVIt5EyYMHxTZ+k51OmL0xz4Lqm5KlssdcojM+Aux
         fv3mOoImUuZZOAoQ1GtKvTUA/cfNi0sLj6DNxeuKCJEyufmT0CULEl4MQr1g/QP5iYo7
         +1T5PR3ZveFJl4t2vhSYHwx/rPKDviPinRyG6w0RQ0uupibxPREp6Na2QOUa+ShjFDA3
         Pedy1QTObapEfNvEqvSV3JlIDz469LQz+DmB4wB5c2GBUlfvi82gb8LIzHkT/mANcX+W
         N1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276651; x=1751881451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jh42hyA9Bm4YAO1yivQ/JIgCWPt86ufBK3xHEVaL30=;
        b=KUSEgTO6l8AebxoRJCNfjYs/H+T6AkJQQmzKK5Kbh7NQ+DjJbrgzAw1oLXwa7d4cRa
         q2NHHMpsSVdeK/RykpQ5B3zyLA4T2Y5fZG6gbbzOxkMapkNIyVjFL3KPd3uBl7HvBVGn
         01f3DeArg/S0Y2aEZJ0VuE2QC1T6pkBwV3qD4HZpsYPL8QAI20IsxkZZzETMb84skYId
         OBF3lmOBmvGiOYHu0W7H137cgwKKwe5jIwupnZ47vUSIc2ZTiDYgSW0Ks8iO5pLvxeF/
         nDFwm7XY7wP3IkOO3XCdvfcQ1FcyikjLGvqzo6zSgEFQEFfPCNiO1Ovz4u/rOieC+Qkr
         6b5g==
X-Gm-Message-State: AOJu0YzjTVv3ffE7Q0ubUBbFVLi5bJG77vAaT19xe1Qd3OeoRnpsi2q0
	Cc6zH8ntmifKH84fe55+fYUyPnyPV1vSaZDW5Iildh45oJzomS0jioLxp0Ap2feXLqKgvCAGJL8
	2Ts+ymzdi3ENzLqT80lrkp0NSvAa2EPE=
X-Gm-Gg: ASbGnctds+Ts05mk+k7txuCqapKvec8FEMxW7L6U21+axVo6UcUCe091oMIQAwNnmVb
	RAteWu1h+Dk8BCs5ZJe8jUtOuDDLnch0/+3P3caMmFS3bY8vVDDENW7qqRRp9V6vUGCYjDf+UQ9
	eClDNPaAjDWPTkgQRB4poYpS4EaDm760OXY/+3Gibyjx9nBRjhQd85IQZT6TNyEPIyHwfdU3JXT
	FWJ5A==
X-Google-Smtp-Source: AGHT+IElxJ8bH2weatylC+1ivD0MKx/TGB172pir0H0el7/zNUs3CsZ/ehHxhcn07LYr7UXORq6l4X/EMH7cndPIyXU=
X-Received: by 2002:a05:6214:5a02:b0:6fa:bb26:1459 with SMTP id
 6a1803df08f44-7000174dc81mr216854666d6.7.1751276651062; Mon, 30 Jun 2025
 02:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250630091315.1897-1-wangmy@fujitsu.com> <20250630091315.1897-21-wangmy@fujitsu.com>
In-Reply-To: <20250630091315.1897-21-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 11:44:00 +0200
X-Gm-Features: Ac12FXyimZ34Q3qjVfsdaqoNc-7DXBDmi6MM0YXwrrJMCTbQunz529A5Y4ocgrs
Message-ID: <CANNYZj-=ZUBC5ExDMueorJ7aGFyfaFxUbe7NWAE9SFwAzpu__Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/37] lttng-ust: upgrade 2.13.9 -> 2.14.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219501

On Mon, 30 Jun 2025 at 11:13, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb

This is a major new release, and so this recipe should be updated in
lockstep with other lttng recipes (tools and module).

> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"

This needs an explanation via License-Update.

Alex

