Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB02C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 17:19:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16713.1785345553945033418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 10:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rRnOX4eq;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso6597715e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785345552; x=1785950352; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtOqIPEkk8K9/wKP7ba4H5wcBV1/UYoi/U7u06Ddz+U=;
        b=rRnOX4eqb1ZzfZ4bsRrwb6uwhxDKHjj3+ePTshHJn9pHXUTqBUVYqFDWq8gzxPAwYE
         XzWJQsIuTKbX+PNHKyWelxbCDumifWaeIuR3AEdDn6xeyOZWKJVLWX5XFSnmtfVLtInM
         fa00+v3A5cfHeUnCF7zd7fA8MXjiINMYdKtZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785345552; x=1785950352;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtOqIPEkk8K9/wKP7ba4H5wcBV1/UYoi/U7u06Ddz+U=;
        b=c//9tLDyVaVFhgUtG5Vz9l2sWnRRT+650fbcGqZircdNglLpItiRL4qmHMqX8LiMXV
         9A47DOpw/23BzWug1pL+lh8duOdw2emN1Afu9uwTfJujXGyJps5B1+2/jpmyRIEfLfeE
         ZHiSErBjU47DvAyGeK2VcqhKDCtGdZN8cEszxBUc0xVZM6YgT2nwDCwLa+kwh5qgycx4
         X/a/WzTtx8r2FkQbF3DvfEEI4ungwrSN2MFtZbR2/OnaDG7nsTbgUP9cbUB6D9oL836y
         ycRbdf+WABfxzhKdyejaWCRJ4XzbMfabeUWDV0/z5G4X/n3z5wRhq6G25FX5ybi3tnF8
         tA9w==
X-Forwarded-Encrypted: i=1; AHgh+RoSDvb34i6vgBbdcmrvGR75pAeXiMYmHHFNGocB/cRGIfFeMswBY8DQg9XQ/JfFXHE0vQyFci95RR/+4u6dbbhI6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHutcD2YBX/R0/Yq34y+3ReczMOOtYSi/CkHpiVyvOZEE6tvpT
	dKeF56S0EdvopBQCMSJEoG5CImYycuioJB8X4E2ga/hsy6Y8HjXA95LVRnOdhXKBdazZlxE81PW
	aFNiqI6s=
X-Gm-Gg: AR+sD135YCz3HgOxd3Heb4eBiZwCocdSU7Pwa1tv+ZQob1tW3PCKrpwYJ9+p3lwUGHe
	F+7Vbn01PNC/pEK3fePFtHGs6lD/iKoL7oWrG+2a7WnFuAqG5zxFGfGrFBuTKLRtm+JfTzq5c5W
	VvTofQrWTRmUNhLQ3kOUlXQQPsYwWBMcDW6i2oVCFtEaHTXVhqoHVqWcBrAbJf2BK/6Wn/tTE5s
	h1uOL0n9p/nfqJ4sdXWKGegnwFq4JRRw4Ntxpfrp7vHgh2YFeyiDIo/V3pEgvItgd8L3hfecKDo
	0eVcLKLDrVkH34RAadorCqexFOmHwiWLchv5C2HkpuF/7xuHa2+GVMK3cfaW34C3csczSSLSZOX
	aStBEeaLStkij62bYwxPSr0v4H87siF8sWLvPFWYNkgcFrVNgSpK08QXhmKn87wgOHvnf5qTwnj
	BNeDz/uQgrEcAKj22UaS4q497IjK/Wb9jKrKd1dvRlIJM0xyXP4W9U0ilRFFv+RCo9M82eIYWl3
	OecPLLtg7hfwVFYXaw80TOei/ifirH1sDvyIitPYB9IVUr7lfYHRlguuMgoP/Y=
X-Received: by 2002:a05:600c:3114:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-496c65809b6mr101023335e9.26.1785345551924;
        Wed, 29 Jul 2026 10:19:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d70014sm118869815e9.3.2026.07.29.10.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 10:19:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 19:19:11 +0200
Message-Id: <DKB86FL1FCS0.HF6PEC3J15UO@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] cpan_build: disable .packlist and
 html doc
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Wes Malone" <wes@mitsi.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260729143729.3759497-1-wes@mitsi.com>
 <DKB4U4MQEPKB.3FYR6DZ0JSOE8@smile.fr>
 <SA1PR16MB5580274A84DE076199EFEE2BBECA2@SA1PR16MB5580.namprd16.prod.outlook.com>
In-Reply-To: <SA1PR16MB5580274A84DE076199EFEE2BBECA2@SA1PR16MB5580.namprd16.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 17:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242280

On Wed Jul 29, 2026 at 6:08 PM CEST, Wes Malone wrote:
> On Wednesday, July 29, 2026 09:42, Yoann Congal wrote:
>> This patch should also apply to master. We have a strong master-first
>> policy so any patch need to get an equivalent merged on master before
>> being merged on stable branches.
>>=20
>> Can you send an equivalent patch on master so I can review this for
>> wrynose?
>>=20
>
> Hi, thank you for the advice. I've resubmitted the patch on master. Sorry=
 for
> any formatting mistakes. My workplace blocks non-outlook mail clients so =
I'm
> having to jump through some hoops.

Your patch does apply clean on wrynose, so , no formatting issues to
report, well done!

Do you know about "b4"?
https://b4.docs.kernel.org/en/latest/contributor/send.html
It has a web submission endpoint for contributor with "difficult" mail
systems and should work with Yocto Project & Openembedded mailing lists.

Regards,
--=20
Yoann Congal
Smile ECS


