Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C91DC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 08:49:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7889.1788338978638388534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u43eEnGe;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso8317875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788338977; x=1788943777; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+J2+QwA5ZXMb2JAvw7lGt78kpLsdRlpN3hmEl4hG7/U=;
        b=u43eEnGeNGyi1VBE89tuza8TbakPValdDHfKf5jikBNAljWBqfixOVGyRnMM3jl+OT
         KbjEF33bsc35u0eNGVIeoDOhgaFwFcwUCg8wTPBUlXbsZcI0+2GdEvtGSbSLrLhwd31q
         ELvx/dxoTS2oFp/hn7iyns4o6oU2rrbxeZOg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338977; x=1788943777;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+J2+QwA5ZXMb2JAvw7lGt78kpLsdRlpN3hmEl4hG7/U=;
        b=aLW/4AIKK4FOKuSm+CjOBaRTOpc/RHlBmwvPkbbQlNB8ZOUXBhl3F058l8+gI1eLnT
         UzfHJLKRnmu887VmV/3JcNuNcE1sF522h9rGGEUYN+4TvYxHISmkXgjYPi9xyP84UEkX
         a22VV0smfuKvgEU1SrNbOaZqO6GBtc9z/3K4j8+Q31IlZCD29taAbxflKUdWki2GI6LK
         zlBHw7beLUX7d3kNwNE1pwHgLM1wRrcThLnTJxpIyYr2FUHAK6t2hSKsW3N+ZFXyo8EX
         1XpE/KoeJXDk7QFaZiuKvs+Hnt/WEIon4BM2G4SVxhUihMK8jnE84hBeYLAWkS9fjwP5
         mXUw==
X-Forwarded-Encrypted: i=1; AHgh+RoanFszVTHRjpNNVW8rCHe4IsALij0KtsNR2cNGxlk22ksULMATNIDHladAAAB462CH5QHjm4Qva6CdRsKORpOxwQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nKc/Uq0xCLi3RHOzeyWmGHBErJvcNkfwd6LfZuPnbwGDRdxg8W
	WYwC8tcWp4YsXVBe0mhOhuQVMwVvNrhGf33NRuMSGNRlWA3BaYIBu/nrP6sOpsU1eUs=
X-Gm-Gg: AR+sD11ZN2k/qy3r5VFBhvOBxwd9UUJ4aLiuGtXJ/Y42/3vmX6HTCEiPSjftlAfDnbg
	HE3TQ+ZutKcwSaoqGzMU6VraE6Bu8D3OpDW0F3mkogJgjV1Yio08P/0YyV5aoNVB7WRxsxibbsI
	xesW9AuX+Hd/7FTBBkFn6u/GiWYvP87kvGGY2Gw/swW2PY9j8p21e522mbMePOyWHzBaA4cYKnK
	1cUTZzqIP6qaqL+4Ptaczhv3vo5wFfLRjiRjRIkockN3VhH/6jDicSU6A4Ij+x4hUnchx2NqQ73
	qhXIJQAyM078H8dJi4oPHsFDhJkWC9ygYTp64sCSUgit9vv8LhuSkiwKoihFvan3I54Cc6p+rBS
	aDC5ySRePiBLshebx+I9HdV9iMAKw6FJKClvXX5VfDwvup5mWh0Ay4EV/BzRnfmMtSpSGzau4ly
	6OHPUYfggp8Sj20lAn4+rh5ilbcBcyXoL+EE2GPRLhrsc2/teEqGQDoN3KSKBV32ZVqiSF50Qir
	/tOdaGySdEeo0N0Md306vMKFFvF5gQ032wBERAJrOF7AfpyWXi2lLCt8Bw=
X-Received: by 2002:a05:600c:3113:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49ce58163aemr48699335e9.1.1788338976832;
        Wed, 02 Sep 2026 01:49:36 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm80148245e9.0.2026.09.02.01.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:49:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 10:49:36 +0200
Message-Id: <DL4P9C29ANWC.3FP4S0YEWBR8Z@smile.fr>
Subject: Re: [OE-core] Reminder-2: [wrynose][PATCH] mesa: align x86 mesa
 config with LLVM graphics
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ashishkumar.mishra@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260820163342.12213-1-emailaddress.ashish@gmail.com>
 <2227188.1787546845267962127@lists.openembedded.org>
 <3020885.1788337871466410607@lists.openembedded.org>
In-Reply-To: <3020885.1788337871466410607@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 08:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244904

On Wed Sep 2, 2026 at 10:31 AM CEST, AshishKumar Mishra via lists.openembed=
ded.org wrote:
> Hi Team ,
>
> Can this patch be takedn in wrynose or if team have any suggestion .
> I can rework accordingly
> The patch is merged i master branch and fix the silent bug there
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics=
/mesa/mesa.bb
>
> Thanks ,
> Ashish

Hello,

Sorry, the patch pending queue is quite long at the moment and I have not
reached this patch yet.
Usually I would tell you to wait 2 weeks before pinging a patch.
In this case, I think I will need a week or 2 before clearing the queue.
So please wait 2 more weeks before pinging again.

Thanks for your patience.
--=20
Yoann Congal
Smile ECS


