Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A97C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 13:40:39 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.52147.1748353236683038280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 06:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wfk1mt/9;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6faa01a3a5cso33226266d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748353236; x=1748958036; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ovy4MmMrOn+PcMM1tQUCGlZXElMXvT2TJ5UE/W20CMU=;
        b=Wfk1mt/9NmpsNePa0xeDPPiQCv/6e3OR8FcT83Tt+NzvozgyXIXA2sB/s5533jFPW6
         93cUJ4xNJqa8bRfr4Zs+vTcyZTC8C2yG6yGK1/QCxRQ63+AyHe6h0/JO8tK2pvI/z1Cy
         HHUDE+pn/Gr62moUFP/BUay0DgSXMRk5UXCMCxHaJFqtlOfxTFN7TMjVPiF+Ag+ivYJ8
         fMJc/26V93nN8Yb0IxRi8NSAAJw1iafGOPL4CoHNxex28DYwO3Ng90XLT31xTHUyPNb+
         1cSSc6jJwIMJfR+dHQ0j6/zjo9U8L6iFU11IIhordwSeKS0wP/etEoxG8N89p852Bh+x
         urjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353236; x=1748958036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovy4MmMrOn+PcMM1tQUCGlZXElMXvT2TJ5UE/W20CMU=;
        b=H9/iEQIhilJcOVgpM+JacRukzAM68/Ecp2NH9WwkouMQ9HZ+cMNIwIFdpaYtW8AR2g
         4T6gLp8FtCX1ozOq3bvBmIz8uTxxRkqb6DPySj2r2f/G/DrXJLT7LlgctVN+DHx8VFbs
         IJeZtJDSS/NX4hK7pW54KyKc6wX3MXi7AwgTCJOvN43swOD3FbnaiLUQM81DPbSkzlZx
         O6Ud5LffvuOTSCdiANtWci4ltSbzIrcfYa/iRydkWcumPbaBoPG9idtJ9ZW1WUprkD7V
         OIm4q84Osee3wAUEH+dGnCzUEDy3acCMxn0CN1121zT8W0J2EXjfsA06uRbaGBBfBYcv
         ccJQ==
X-Gm-Message-State: AOJu0Ywapv7/5yNyDSxJxvD+nXuuvsv+EkUpBdnl3sb2ZzLWhFF5Fl32
	/cqke8H+huBAm78VWkT3ATITbcNmtgosfN24CkSLPbAgS/Ctn1H5ZjjQVyhExYxar5VD9+D18TW
	kKJCn2/cPNhlKSqNUvtFSfPhzl+BaE6goAg==
X-Gm-Gg: ASbGncub+POqBOEE1V9J2R7VyY2WkrxYZYPoPG6nSSqY5Uhx4Y6IUuhiZ/4D2VaO1FP
	20A75oqcYa3o2u+TrJPn1Qv4NmeS1sX/psEIsDGF6HWoMwTWZhB8eM+xOrZtTJfTa9++2Vgtq/c
	4aWaOE/EO2IiCaFvz0c/nhGpeof5SQUSU=
X-Google-Smtp-Source: AGHT+IHnbqQC8TegBfcGnszJS2D4qH62UaJ7uW5Vyi/Ws/1c7GpOhAeCyw7h0BA13PD0X2zWqKkT+Inv5eSbFmVlmE0=
X-Received: by 2002:a05:6214:21c2:b0:6e4:4274:aaf8 with SMTP id
 6a1803df08f44-6fa9d172ddcmr253238386d6.17.1748353235415; Tue, 27 May 2025
 06:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com> <184363192F51E64D.13855@lists.openembedded.org>
In-Reply-To: <184363192F51E64D.13855@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 May 2025 15:40:22 +0200
X-Gm-Features: AX0GCFslhbfKi-wXZjVu8WK9zCe2RG3s5LPV8J03JQw3JbelupVWe8s6d9gAJNg
Message-ID: <CANNYZj-tN0ONWxYPb9JJms3hj0fUp_9i3xhwd=GtXsEdkXb7AA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash" <Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 13:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217304

On Tue, 27 May 2025 at 14:47, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> I'll try to see if ldflags issue can be addressed properly, but first
> I have to note that there's a significant build performance regression
> in rust-native: where 1.85 do_install finishes on my machine in under
> 9 minutes, 1.86 from your branch took 23 minutes. You need to
> carefully review the logs to see if somehow rust-native builds the
> whole set of tools, rather than just the compiler. Or if it's doing a
> full bootstrap, where 1.85 is able to avoid stage2 because it's
> building a native compiler.

Target rust as well regressed: 18 min -> 33 minutes. This does need to
be addressed :-/

Alex

