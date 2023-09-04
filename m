Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A818C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 07:40:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.43548.1693813205615098920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 00:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dDA4BBlI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4013454fa93so11270055e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693813204; x=1694418004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5oLg5T+G8Ohbloh9OMZCRcoW4UlADdhnyKHuOxT2I8=;
        b=dDA4BBlIfI3C57uNKZG2PqfmGfXOWSJXFQHIds5vGeM+4wV3JZfFLXnylOXRakbi31
         wZOy50iFziHxNXacE34eA21q+jRijupZXou/FyLaoFYaZ7MerV4Si9LoESM1tpqkjpE5
         FwzQYJmvGLSvEXWXsrPl249SQ2u4nSQesKdN9SzSPOy+uN8ir9nn1zhD5+u1q729EI3R
         A4Fy/WzDyDUfr+daoHo1U6IO6VzG+AOW3Mnw70JKU0p85RngjbcqA9745VE6BW7adlZ5
         b9wEzCVbPITaBucj7Jss7ypv5BYTD4oB+eazCQPZka8OGvdn9EpurElBCyx1abjerdhp
         LTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813204; x=1694418004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5oLg5T+G8Ohbloh9OMZCRcoW4UlADdhnyKHuOxT2I8=;
        b=iUTSS3ZQmZo2k+ZGIHWMSiEcTpOAV0J5oc/eXdxyFSEEAa0D7j537RIpYpYgmZOoJF
         4GIlI3IGEyAHEfsVt4rcH53RU1dyUct7Xi7SG6zRZmlmhkcYf2n1ZS3SFOaFCdx4Zg+r
         0K705jzBbO92a+ew5DYGdmuYg7sMoVqYI2wvv6aRWgTF+6n+C5J4zn86EkVCA8DGVsLL
         qjNdFFsVsj45BkvshSfYH8t6RI75y+Qdw0p8sqldvWaKSbdTX+MrdJIk11ofDdnHa0Dy
         s8dUcqvc1DGggplGlPeKrzj4BiWdVwLH7q9VTlLtsk7wWDAI5LCCTLoZO5vre6AJboIp
         VZ0A==
X-Gm-Message-State: AOJu0Yz1T9EnGPuzWI3XafWowlb6xf3tiOdIgu9sPwG8wcfaZhgt4Usk
	z38/51LVlgCL3hly17IXcpo=
X-Google-Smtp-Source: AGHT+IHs/warQ2rfiuIm90KYRLj25fhd0U43B6SZS03j2+AM2/EkTVSRKxHUWh9SlLF23vep8CzNcw==
X-Received: by 2002:a05:600c:5121:b0:402:8896:bb7b with SMTP id o33-20020a05600c512100b004028896bb7bmr5744739wms.6.1693813203821;
        Mon, 04 Sep 2023 00:40:03 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c365500b003fed7fa6c00sm16347245wmq.7.2023.09.04.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 00:40:03 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: ross.burton@arm.com
Cc: bbara93@gmail.com,
	benjamin.bara@skidata.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] insane.bbclass: introduce SIGILL finder
Date: Mon,  4 Sep 2023 09:39:46 +0200
Message-Id: <20230904073946.4134459-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0E234875-B7BC-46F4-B830-2DB4A9230955@arm.com>
References: <0E234875-B7BC-46F4-B830-2DB4A9230955@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187161

Hi Ross,

On Fri, 1 Sept 2023 at 12:19, Ross Burton <Ross.Burton@arm.com> wrote:
> On 31 Aug 2023, at 10:16, Benjamin Bara via lists.openembedded.org <bbara93=gmail.com@lists.openembedded.org> wrote:
> >
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > This commit should look for unsupported instructions depending on the
> > active tune features. For now, it checks for vfpv3d16 and other non-neon
> > machines, but it can be easily extended for other architectures/checks.
> >
> > Reason for this check is that a couple of packages assume neon support
> > for armv7, but it is actually optional.
>
> Presumably this will trigger on recipes which generate the code for all the extended instructions (neon, sve, etc) and pick and runtime what functions to run?

Yep, that's true. So far, I found openssl[1] and pulseaudio[2], but I am still
testing. I would insane_skip these in a V2 if it is considered useful.

Regards,
Benjamin

[1] https://github.com/openssl/openssl/blob/openssl-3.1.2/crypto/armcap.c#L71
[2] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/blob/v16.1/src/pulsecore/cpu-arm.c?ref_type=tags#L115

