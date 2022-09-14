Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F488ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:04:12 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.3718.1663142649271660050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L8Evbi3e;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id c7so5859377ljm.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eWxs29s4/ARZX8FbDZ027FYfqLMhi9NInt4sBbHRZyQ=;
        b=L8Evbi3erMxBYnBDWl+aUGqT8esV8MZlohlt9WFuF98Fwy51mGmO6S4nXAlKlZX87e
         6yqlCYvb0AGDW/+G2L3HG1xmKC+K6+DLretUZUsA9sBRg/NdCS8IvNAkKZpS91okKiwc
         d1K8+m4n4D5vxCGY4JZ+Sd14Vkg0xF8ZXvPfjQNRBgymQJ3bQ/pOC6roaq75CYpFfk7Y
         qHWpz2YiuDE7nEN0o5xMfx4UVVPW1lE9wl0DuQdRMwekWvZkd5opKTt23z6tq/yd1DRS
         YzUJVHRwnf6LI7bteA3ezKqF++6Y0q2xI0PoCMYE6Rs+QdO8WjoJa7EtkPv671Zt+mGI
         W4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eWxs29s4/ARZX8FbDZ027FYfqLMhi9NInt4sBbHRZyQ=;
        b=j08yZhkDsv6gvOmaAqPdfMomYxS4HJW447AcrinDBQmxptsetsvf0vs7gIHSAygKpY
         rQb9EYV/YHdeIBB52JMAhWnB76K7kXw/q40xT83GiU6mvTpisOHMqnIfQwNWjvInxq2w
         m/K7+vkv+Vu9/MRmY6nI5NLKWRooQGLMHtcpGpbscmZBNtD7WLs45Do9wECPP8E+taF2
         /fL99jHzVi81OYTU12/r4CeMNhBAnwo2C8LTgHlw0h8uzsTWzgzdzOlx4D4fXzYAwDvn
         exnJNHD7+CHzNXvavAIRXgEcenNgZ7VzwSVJ4jgUYqPyGRHWtMzixDhxWyl4irsHJMZP
         KF7w==
X-Gm-Message-State: ACgBeo1JnLjELaybqvxGydKYYJZgFzyUixhqU3g2jNYlOyrvdrikQiwx
	NsSjALSZOLNoGsTKpmqdXLku7gEtdSMdU9L0oyA=
X-Google-Smtp-Source: 
 AA6agR7vgwOQVyFGcc7a1epAW4M2v2vgIG0RBDbLiY9o/Avpw0l+SGkNpQ6Pn1NxmKUv0nL12jLLberrGcS244Hvizg=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr10233987ljb.257.1663142647468; Wed, 14
 Sep 2022 01:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
In-Reply-To: <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 10:03:55 +0200
Message-ID: 
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170639

On Wed, 14 Sept 2022 at 09:42, ChenQi <Qi.Chen@windriver.com> wrote:

> Yes. The bblayers.conf.sample is generated dynamically according to
> project setup.

Can we step back for a moment, I'd like to know more about how you do
this. Is the code that does dynamic generation of the list in bblayers
published somewhere? How a decision to include (or not) a layer is
made?

Alex

