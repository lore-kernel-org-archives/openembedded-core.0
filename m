Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4F8CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:26:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10450.1791800765818896074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZYSVC1eM;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20309755e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 03:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791800764; x=1792405564; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=int7wwStUxVc59V3MJNxSyjXA6+SxVcbL5x0DcDQLac=;
        b=ZYSVC1eMWJ+X3H3nTZSYv45HLS1/M13D1secRGVp2L37ZKOZ5cU9BNELS2vLemcEUj
         Yun4WLjxtbPIDys5aTLfWbmD5IVczCCVGnFHCs/2unDBr+IxAL5llS+MCsj/YV4l6WCd
         uRa8YUSLKIAtGFRc8EZEuXWWYAy9/LI2HhX20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800764; x=1792405564;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=int7wwStUxVc59V3MJNxSyjXA6+SxVcbL5x0DcDQLac=;
        b=Za1soiTptrMtD8bOWGTHQf7jhOWIlHdKDn49bQG4mCRfV+6A4HVPU++GYPObH6lbs7
         pY4xO7VPEq2KgyF9sB1XVgzP/RxD7uwOn9ul/ok3kRy6jZrkhurEjMosDCsU/cbSljEk
         RIb5Fak/hlSJJrb4gYE7JFxqHlkKH65DGPm87b5TgJFw5pkc/8ksrV8RJ2TWJfv41E1C
         1Js/kZv08SUmOAbhBGlEwuHyLaikylTRc8/repcqisKD/GQX3ozWlfBl8OHRGyeVLnhK
         VHX781Gx19PE/VmddPDttyxi8ckB3PCKq0Zg7PBkDXcYJolLHEV5kVsps90wja4GOW8h
         ocZQ==
X-Forwarded-Encrypted: i=1; AKwUvByPmO7bKBZfzy2eN9KTZcNaoBpz75EuQRQHtAlMeGU5nn7VBB5KnuAd8OOXniu8TAVRbu1Wgxz8dKKMnQ8kNLo6AA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI10FAuapnRFYHn+GisA/wHcrq4D7LeDMFETgKIC8Q9D8JO7U0q
	708R+KL6KyijNfpoFzWoxe/v7yCn6GtPY57Ld5Hx4bznOLVO082Rmgbm2vtA+yoMOsU=
X-Gm-Gg: AYBFou2B1sLXkXw3TBdmw1FoCsoi8Nh5kD77WlDmq6Qik91Y/YMFmlUNOpPTCcf43wm
	6RfQw/H0ciLl/ZoU4YF1//SBvAND2TD6Qvpcfooymf+2o5rFLaJ7S+4mjiZ9BW8mqFbfjV79wyI
	eFo9Fvi24lro9iWBIf+Gqzs7+B730nPshFno+z8Hov+FeWL6Lhd8g+/FLESBeDX1rEpK2W7yKDD
	74rLqeScA1iNnYup1Nq9dkaRTObHZ2ODAXvBeh3kzYv5oCCeM/AzD0wJOL5s0huIWbMpuD0KxdX
	zr8bEpfyVCQ9gDiAUJLntqDkeIzb2RhbhfBsA234IjtmYihJoI7jHknoLIUQ0EyMB4jKhHp7Ogq
	IKPA8JAo41GGR7BO2EBkHX4BkyC8GmZh/iIyxNr1pcNC6t5csLfi48EeO9il035FW0U9UZ+wJEA
	83OgHEwnkO+cjLt0HReHvf9x5Z1MSuotanbuZo2q+euRdOXu2lZJFO7l3ciYUSwprCVf4jLYMkb
	+bnrOFNyUkQCXawlxhqk/X77xF3P4ebqVT5RVy8QjWBI0b/yv915cNOU9xRnQ==
X-Received: by 2002:a05:600c:46c5:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a18e4cd224mr173513305e9.28.1791800763810;
        Mon, 12 Oct 2026 03:26:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a198c80cb3sm112084925e9.3.2026.10.12.03.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:26:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 12:26:03 +0200
Message-Id: <DM2SCYXOZWHY.2SXKNKXF6ZI4F@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] libarchive: fix CVE-2026-15028
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jakub.szczudlo@nokia.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261002110211.11669-1-jakub.szczudlo@nokia.com>
 <DM0OFC89C3EH.CCKMED8WYWDC@smile.fr>
 <1823924.1791788633257107744@lists.openembedded.org>
 <1823924.1791800189463127023@lists.openembedded.org>
In-Reply-To: <1823924.1791800189463127023@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247624

On Mon Oct 12, 2026 at 12:16 PM CEST, Jakub Szczudlo via lists.openembedded=
.org wrote:
> Hi,
> I spend some time today checking it and it seems that this CVE was fixed =
in 3.8.9 by cherry-pick:
> https://github.com/libarchive/libarchive/commit/22ffe8e8e459970f3bc86b026=
7493fc4aa8249b8
> What should I do on a master then?

Thanks for checking. I agree with you.
In this case, there is nothing to do on master.
But, please add this info on your v2 wrynose patch.

Thanks!
--=20
Yoann Congal
Smile ECS


