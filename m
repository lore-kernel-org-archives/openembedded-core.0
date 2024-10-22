Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278D3CDD0D8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 19:34:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.2961.1729625649372780009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 12:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xZS+vJnV;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb58980711so63470101fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729625647; x=1730230447; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rlh+NuG7pIq2Nt8XryDClQy7vmqaCYpdzgdxlxlzIsc=;
        b=xZS+vJnV8jRXbCJR/dTOhoglsiAXpakhE/zPGQftIKKsOBk6vYIbGrF5Yc8Etv/Pl+
         k78SjcPzwXemflZHkczlhxPaqPOpIGa/MxeFC64VlpTfll/E/u8Gen4Esz/ctQPPkYIt
         zLKegpXVUz6PV58nPJjr5q0Jk5sd/noINuPZ7Ohtw8tNwxQSHkYUt+NKSLVJIFDHrBiH
         ZSpKDEc/PvMnAYl7xzYo6BpdKW70wV92T0l/c1fFv/qY/J11qkVqkCEFCs/hhpeejJMQ
         Djki8sOxActEPK1pmBiRxa/pbtgHWYbgs7ZS/DW9g/uYR1gWCuHz7GiTorCx6e8ah8jR
         UD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729625647; x=1730230447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlh+NuG7pIq2Nt8XryDClQy7vmqaCYpdzgdxlxlzIsc=;
        b=IeTdtjuZUbQ6fHG0q9QwtaIt/kygYbiNf6ervVPm4gdlXGm1x3k/s4KBMNsvipZFT9
         5/jepR6qCX/Y+HDb0pV42jHFjrAnnk9KTBPwY+vwp+RbpUzm7lQjgXSxor4UEQJ268rw
         BPXIc5LRZ9JvI/4XwaNLz5Wz4qD9cs1nDSTprnd+IkGp9+wEsy02rhYDymPMwvwzk/gL
         rjNXCoC2F74zgKjJiroRtztMoWXhY9JkQOkrxCEOjL4rclN4foasCAbZrM8dNYIEneSq
         UAt6S1/nKe8Q1XOf2bC5i0qcgMbbCbmdBgh6nBuviF0slR3kOCNKG016ebXH9WDlq01e
         4/0w==
X-Gm-Message-State: AOJu0YzPDy7pSr28oTFUPJLTD/olTS0D/QGazXdySWi4dC+J3f1IOj9p
	1jqdkQsLFeBiHg36PQU6OcWetSNjtr4alNs2NhoAwoamm6WnCV9Rngu4TtIQP0o=
X-Google-Smtp-Source: AGHT+IHQX5OGfYhsFbCWxUYxiH3nTGflT/DnySyIS9XIRIZhncrSxFpKlBOkkkSLf7jTLo1iWtwCmA==
X-Received: by 2002:a05:651c:2228:b0:2fa:d9db:7bbe with SMTP id 38308e7fff4ca-2fc9d3487cbmr637591fa.16.1729625647393;
        Tue, 22 Oct 2024 12:34:07 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae24d5csm8864511fa.132.2024.10.22.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:34:05 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:34:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v9 00/11] systemd uki support
Message-ID: <Zxf-KtENbXFeTMTp@nuoska>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
 <BAB907B5-CB67-4320-BDBC-37098336FBFC@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAB907B5-CB67-4320-BDBC-37098336FBFC@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 19:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206172

Hi,

On Tue, Oct 22, 2024 at 10:26:52AM +0000, Ross Burton wrote:
> On 17 Oct 2024, at 09:45, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > v9: Fixed unrelated ext4 rawcopy wic test on genericarm64. Enabled new aarch64 target
> >    wic test on x86_64 build host only since boot with qemu is currently
> >    failing on aarch64 build host.
> 
> Sorry, but I don’t think disabling tests based on the build machine is the right thing to do here.

Well I'm running out of options to try.

> My gut reaction is that there is another test that is running with kvm enabled, thus breaking uboot.  I’ll do a build on my own machine shortly and see if I can replicate.

IMO this is a generic problem. The selftest code is not fully in control of
the bitbake build config, including runqemu. Snippets get enabled here and
there. Difficult to know what the effective config in CI is. This also not visible
in the AB build logs, or at least I could not find it.

Thanks for helping, I hope you can reproduce this.

Cheers,

-Mikko

