Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C234AC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 07:54:24 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.40356.1674633255723135875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 23:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lpdJ+wrt;
 spf=pass (domain: linaro.org, ip: 209.85.218.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f52.google.com with SMTP id rl14so41976248ejb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 23:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DkTg3zASJbY/R1EOGJDgePfAHHZGTpJ2//6NiVSM+M=;
        b=lpdJ+wrtIzhUljgrNVed3dB83PQ4kBZsfYmbLqbU5nEaLCo8zK5M9OZfwMzq/ex1Md
         7kPTMb6MIGZUlKbkLVMy32IJG/YH9EtkPTUX59mdtkaq4+OuuPhZy2Jfqrb029jcGzhw
         dusSaRl3lSc+43KvjYlksAJj/YTVzlKBQhbmeMW8a5f0OhigORHcmCwujiq4yL5YyRo3
         FJPUL6MKGxzlyTAIYWgRjj8cZExMtoCLxqjrBipfPCfhVBccTEPzdS3fmBu52cq0jx/g
         XZNL/wgPa5pM25GJvef4oKFU5lp+gRHT2W/3+2J1lPDtF17NEv/jyc1LDNadnlWhL+ov
         1h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DkTg3zASJbY/R1EOGJDgePfAHHZGTpJ2//6NiVSM+M=;
        b=PRWBF5dHwsYVSZHK0LVSclf4zrHfvUJUGWRZEXxnb9eD5yMYDKDv1Iw93Yh8O36kXQ
         ZaTjrrpbBxjzGybxAbWdV/3aFymConbCAcS/7FmU8+2R4xajGBgQqgRAkqNixBsoOeVe
         mMRdGShQPirqinVvPLDOVXpjltRBC0WR4PwYU5nUtHV1bjaIfdd2vED8cBWjEr4useeb
         3kuGILrcH8tFjTApn+GlKKg7aetz3a2yQp7oGhPSM4M+OTvDw5n1nDK92bhKXGdA3zM7
         2PGNRBMKxJ/ll94j42MjbXW+YDrBUwH2xgZVAJDX9aai7HtKS1V2fZdMdKE17F3thycj
         04zA==
X-Gm-Message-State: AFqh2kqG0tDtMUlen1b+H9Ldv1Nh1zSNxgyS1sKMq//kd2Ljt2Nd4/8m
	djBPtM1+kMLPl9aTxOT2cwpzgceU9u5HMq5m
X-Google-Smtp-Source: AMrXdXsqiUp2qoZuw0EfkpJnSoTsstoddCUtAULWjMCag2RUlxqT3q3u5z5vGugWukAUQ3SQCfDd3A==
X-Received: by 2002:a17:907:674c:b0:7c4:fe36:5b80 with SMTP id qm12-20020a170907674c00b007c4fe365b80mr33998869ejc.62.1674633253831;
        Tue, 24 Jan 2023 23:54:13 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id z12-20020a17090655cc00b00877e1bb54b0sm2016805ejp.53.2023.01.24.23.54.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:54:13 -0800 (PST)
Date: Wed, 25 Jan 2023 09:54:11 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 00/14] oeqa runtime tests when qemu hangs
Message-ID: <Y9DgI+HyBTGNmiFa@nuoska>
References: <173C0B9603DBAB46.24231@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173C0B9603DBAB46.24231@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 07:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176341

Hi,

On Fri, Jan 20, 2023 at 04:44:36PM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> I get a qemu hang on kirkstone, swtpm and optee. One of the
> optee-test/xtest hangs the qemu machine in some kind of deadlock.
> While this needs to be debugged and tested, the oeqa runtime tests
> also hanged and never returned. Thus this patch set. With these changes
> qemu deadlock is detected and with do_testimage() task eventually exits
> with all correct tests failing and the hangin qemu system killed.
> There are a lot of debug prints added by this patch set but I don't of
> any other way to debug complex python code. strace output from the hang
> doesn't tell where the deadlock happened.

On #yocto Richard said he doesn't like the large amount of debug prints
here. If there are some specific ones I should drop, then please let me
know. I think the logs in do_testimage() are quite readable with
these enabled. I can follow the logs and see target debug output in
larger, multi line chunks. I can see if an ssh command on target is
waiting for output for a long time, and output of the commands comes in
larger clear chunks.

I have a complex boot sequence which includes firmware, kernel,
initramfs, rootfs encryption etc before entering login prompt so
collecting all logs from the boot is criticial, and the boot takes a
long time too so seeing frequent output in do_testimage() logs is also
important. The chunk reading of output data really helps.

Cheers,

-Mikko

