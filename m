Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C998AD12695
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 12:00:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.16169.1730808009158647775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 04:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1cyS7co;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso56539871fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 04:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730808007; x=1731412807; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5TvaOOoCLVGpvnlAkaL3cDQ66x/eZnlcMSH1mFSbYQ=;
        b=i1cyS7coNvdym1+UZmAerWimA19Wko5e8YSMa/jI1mjeHM0viBUHpyZSdLKMgBjiDr
         Rn+K9JV5tL+LXGoEN5Txven+FtZQBq78vSdAnvwKlHqdlhWjDpSk8rBPHzaZ8qPE0FS5
         DmAH3/FaCrMSWPcsukVqr4+r38DIVzrtkTEGI34wasjnFLQ6Ui1WkTDp+XaSSjli6Mpl
         GHz6fe3i38GvGfnF+eTIU5vgr9s2XOrfE6QhRK4hm2e2Ccu+nP/vj9s2yRBhqRoN0HQb
         MRymmwTNfgB45MiAPXvNm8D3Y3omGRI4zA/m7JVnRaM/TuRGnmrXPu/H2hzniHnl2id9
         7/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730808007; x=1731412807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5TvaOOoCLVGpvnlAkaL3cDQ66x/eZnlcMSH1mFSbYQ=;
        b=CDA4Qtnclvoec4IMidRYNk4om55lrDQR9fUR3rZs+HcfzaIcaJy9NOiJtBCZskeOca
         e877DcPSx+I9qiXp1z/LIOaIXDqsUPBX1G/F0ZAD/COPcsBsPta8YY2NRtk9/Kit1oo6
         m+gJdK8C22CzytHvqA37dLr5Lokuw8NxtCSODOMu3vV6/2RgDpClg+IhxcrRpKAZRaT7
         RM5v2xqwVQEeB3Rr+iY9EZrSENcx+Mma78d35GtWyBUjOuzq+jcTBG/PtZi04y9uwtGd
         Ecg93VzAoS8te5RoNkVDNUBAqf9dTyexcHrZ5b76spRLUP+hM21i8NSfTimMirrSZp4m
         MyKg==
X-Gm-Message-State: AOJu0YwYZEgtxwLjZ0h/XK1J2kZcT4NcLYv5ugBDHXS80SRaTc+UPDTJ
	5c+fAgdDzhJaxFzaH/FTtyItIhhuBi7Ia5L1xLju0vqQfVo1HuvIgwZ84xJM0A/HpxtBiSurYPO
	2kGJ0lHpNJal9CcWbWdYfgrnFkSo=
X-Google-Smtp-Source: AGHT+IE7ZfwWvyG/kqUGiY20G1Ipv1baxgFtA0h1LNGdvM/oMBChX510gKt33GbKOBB6MccKMPjwb+Ca/onVd50o4VE=
X-Received: by 2002:a05:651c:618:b0:2fa:c185:ac4e with SMTP id
 38308e7fff4ca-2fedb42f4c7mr38085181fa.13.1730808007091; Tue, 05 Nov 2024
 04:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20241031101556.1913400-1-alex.kanavin@gmail.com> <8da131e0-d2a0-4f9a-be25-a0f70af09886@bootlin.com>
In-Reply-To: <8da131e0-d2a0-4f9a-be25-a0f70af09886@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Nov 2024 12:59:55 +0100
Message-ID: <CANNYZj-1Amk-9dA4XFDcr3SNcphT4MzHNFmcieBw6iwfzWqEMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 12:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206705

On Tue, 5 Nov 2024 at 10:25, Joao Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
> I noticed a ptest failure potentially related to the update:
>
> https://valkyrie.yoctoproject.org/#/builders/73/builds/319/steps/12/logs/stdio (lines 432-433)
>
> Failed ptests:
> {'tcl': ['http11.test']}
>
> Could you please take a look? Thanks!

Hello,
this happened just once 4 days ago, and isn't reproducible:
https://valkyrie.yoctoproject.org/#/builders/73
 If you see this again, please let me know. We can add the specific
failing testcase to the tcl's ptest skiplist.

Alex

