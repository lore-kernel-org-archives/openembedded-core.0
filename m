Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CEFCA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:29:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.22510.1694518193246470395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uIYanQ9R;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5029e4bfa22so6593547e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694518191; x=1695122991; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FIwfqRq63OEA6+VgaBphMmjGxa5Oog5yjbDlYlWdbUA=;
        b=uIYanQ9RhF6JnTugdq5pS0fKYJEOaGY7FsCbDRFFv3dU4z1mZaAV6q0nukugzo/6Xz
         333Zj2q+7VAdBICKZCgzWzJW/P5vclbcUBLgzFUkQ1rqeOF4Pqe8hmsBrgsMByAijLV7
         xbIEhgP5wWtm7DlEKh1mSijZICEBvNRFjaPDPgjpO97xbpDFTi8Dp6DL2TylpIwr0j/I
         6XQxRqJeHNDToVGfqqvVBLp8Hh0CkmsQAhUwSB/y6yYOoUS/p73Un6MNamTFqCu8Pic9
         AbuLxWkkS3cesYzfAlpGQ+CqKnCQd2NFEwhLaX6lclDEtCGRy8eNgjAmqGuBOpsyR6jx
         2XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694518191; x=1695122991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIwfqRq63OEA6+VgaBphMmjGxa5Oog5yjbDlYlWdbUA=;
        b=uY27z8PxSOQwOe06UrnWULc9P3Mf3TRjCjgq225gImu6kDnLktfRakatyJrDdm22U4
         bUsxoOOrDpleG6l9RGj34atUwL3Ivuu75ZMIaaDoh3JpOPbkMxBMOMXboHpMJFalkkuR
         fvLMLREAcL6k/StvgKiZ7dJLVm+Ym+v/H1/ZtLnPM+NG3gEOiBjkeEN5/MoioHf+2E/I
         CM+Mp91I0hscJNtPHAbVSB2ZrcmBmoktj9t8ZWzEBa6TP6v+ayo/yx84IBPu6jjMtDuG
         PcoWbteFCRz03Rz+kG+6pVkGVi+gXyM1btdjAC1Bdu+A0nA7/WOSmH9rHMA0M2YupdmQ
         P4CA==
X-Gm-Message-State: AOJu0Ywv5eLJnlPKpE8iq2tuxjja6D5g7foVUspbM4W6BGRNh5/iI1H4
	PYReG8EOYrP3TfodRQcGBLEDRPL1uD3ttka564M=
X-Google-Smtp-Source: AGHT+IE5Ms8ZWQa0mH3YF8MvQsaUaR68iKQucnLQ/HQCrNs+CG5oTfzgEsGcGQzjZcKMtvFHO9FZ0A==
X-Received: by 2002:a19:650c:0:b0:500:9026:a290 with SMTP id z12-20020a19650c000000b005009026a290mr8794904lfb.9.1694518191292;
        Tue, 12 Sep 2023 04:29:51 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id y6-20020ac255a6000000b00500a2091e30sm1717162lfg.115.2023.09.12.04.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 04:29:50 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:29:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZQBLrRsfpfu2e9JN@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <3E62B71C-8B13-47B3-BE0C-A8A1716680A3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3E62B71C-8B13-47B3-BE0C-A8A1716680A3@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187505

Hi,

On Tue, Sep 12, 2023 at 11:25:28AM +0000, Ross Burton wrote:
> On 23 Aug 2023, at 07:10, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > -    if d.getVar("QEMU_USE_SLIRP"):
> > +    if d.getVar("QEMU_USE_SLIRP") or bb.utils.contains('TEST_RUNQEMUPARAMS', 'slirp', True, False, d):
> >         slirp = True
> 
> This means we can remove the QEMU_USE_SLIRP variable too, right?

Yes. TEST_RUNQEMUPARAMS += "slirp" would be enough to run slirp with testimage.bbclass.

Cheers,

-Mikko

