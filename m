Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28918C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 09:25:49 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.113710.1669627545285214988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 01:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOxTKhbG;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id f13so16378296lfa.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pet8dCUgaWkDYIoVgw3/AzVoSX4bqIj6gLZ8KFiHiyU=;
        b=dOxTKhbG979Y/2jX8QrASXe9Rae8gQ25tc1L/58Yhd/lsBmbeFHmoQx8FBz5LCR3eL
         pH9qwU5oq6rEE8DTKwKAB16sbWejUAv+NqPoV0Zkmz2Cttf8x9EMrX19DlO6V4W7tuQ3
         /5h5/foV27GPtzTtii8lqiZsOy+/dtlLFv5cwlEMDNnnrxNsF8Y8vpRq+y8lp4n6guwF
         fPuF5O/f7zGimOtiCArdWeQ59xfUTLqt5lUXS5dC0QVS/bihjWMT8DTetU3MLxP1Z+Fb
         NN2MsKBWh5GFvbv7m1HaFCJXIgq6tmgBGV9DHEk1M0Xq2Ibk2JYP/p7sK8OkARLJB9Wa
         ZWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pet8dCUgaWkDYIoVgw3/AzVoSX4bqIj6gLZ8KFiHiyU=;
        b=PD+R8ibzqwUaZsPzl57JhEdtjvfZbyNVpbHDu6cW9/J/y/FJ0kNIYzxGabwWBBwpWA
         NvL80/G+eIJgwWHEtd9RXxEkyh5IVvSUR8TNw1CA6jTEsLclcf8A1EhI/kv7Sy2ky//o
         IhRmiSzk4Gb80d07VS4WM1Ydeaq7I7I61VSEHavs3XKI+nUFnB1eVydqQp48sNodnYpx
         ablUzAYhK4LItfV6aIgSIIAXF+41/Vqy51/A6QZ0sCc3OGEja2Ynpd6lBgH8vdg1hBsx
         YKyn8edH1CCVmi0pQy2dmJVCES7daI81IK+E88H30ObZwqZOCFBcN6x8dZnyX2ArXg3/
         DHZA==
X-Gm-Message-State: ANoB5pna6frnLIY5GajFSRkIsEoZppNUnr7va2XXOLMOhe4IcBoWJtcx
	uPJdUcssR0rZQMmdAVlyyKPPzFrbYVzVm8exrng=
X-Google-Smtp-Source: AA0mqf7F5bT0qVm2RlVDCbbnjZTbZ3q+bbzOsuDKjK/VkFgsAG4bgwunEfwJIHdyGhHYG+fBsA1bAxO02eAqdcl4QHk=
X-Received: by 2002:ac2:53a8:0:b0:4b1:5125:2f14 with SMTP id
 j8-20020ac253a8000000b004b151252f14mr10799726lfh.345.1669627543162; Mon, 28
 Nov 2022 01:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20221127134909.72700-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221127134909.72700-1-xiangyu.chen@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 10:25:31 +0100
Message-ID: <CANNYZj95YNhEgK+ony5KyLo_DBXJg-wE8cD7F9xVH4vDMELqwA@mail.gmail.com>
Subject: Re: [OE-Core][master][langdale][kirkstone][PATCH v2] rng-tools:
 backport patch to adjust jitterentropy library to timeout/fail on long delay
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 09:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173898

On Sun, 27 Nov 2022 at 14:39, Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>   * add libgcc in RDEPENDS flag to solve testing failed in core-image-full-cmdline
> +RDEPENDS:${PN} = "libgcc"

This needs to be better investigated first. The change looks like
solving the symptom, but not the actual issue.

Alex

