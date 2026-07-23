Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91052C531D1
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:20:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26021.1784820037753692571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tn2SZ1y9;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7872abb6so424485f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784820036; x=1785424836; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DzaIF7JPz8UpxffLELIimfwM9Ugeib4jzk1rkF79dro=;
        b=tn2SZ1y9v0uwij12b8O3zhE/ROuJW1YJ5VDsB06dp1hb5HlAhtkmubflZl4T6/An3b
         YFhW0mGw5krkjFoJlT4RGjn0NlDZ5MHeipZI4WaiJ1zYzup3T8H1OnQzkgtnFxC4X1Ze
         UKuonFkL6TdkUjCotIYEFPpPNTa3NAMHs5OOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820036; x=1785424836;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzaIF7JPz8UpxffLELIimfwM9Ugeib4jzk1rkF79dro=;
        b=sU5Qxdc6+2z9MU3XZFGsKxxelP5WItggg/HzS+Tps92FD9oPN/n4+APgR/PTbcQthS
         I8L+dC9h3BfxToLI51QSIJLnXs2AiuOTxlZkFeGkDk0XfYEEdRPjisBZhtckKKZL3aU8
         nBCMUuUKrenbbbL0CmHOK5XibLIOKcQtnnojf2H8H5uwckQfvdg+S100yMY9CeH2X7O1
         ZuW+orFDiHSNPaOGmlb0rNtDt7oo0seX2jy6PtqLpjbCQssew2ZFTTh53JPIowNi0QKz
         1YI25naVCuUdBdSPuaFDg9RuVyT1+lHC/GJLuyZxbTysyVyyXuGLawHRynk/PvJYuS7h
         qoWQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro78cCZzqMBRT+DBmOsu/+XITlj/rMJCgYorHbsjWCSV6IGFolUXLBK78ALvIHOtAZQhbVGOjdFByth1OZZMdh/bQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz4PUKLM5MnrXoxg/nT0skEN96b4/BD5wNU/LSSvW+Oj5PIdc/U
	8b/RBBZPgKV6r4t5IpqISGBocO4QCzYy701lsgVN0+R3k8OLnozt4NS9rzZdteU2wTY=
X-Gm-Gg: AR+sD11URJgX/kn3YUEArOrN/kFm9sQCMXlFmRPyz3h7rmRDLfhSYbybHoph3LBWNIe
	jleRtqLPnDa/PjRz1l4HO/hpfukw9PyC7iArEYvhpO1G+tMukCZaE41fCEWszty0RDkGvUXYYkG
	p8E/+6hORM5IeUXQuKPcs6tqx4OBDxlV51eJjbgaK3TB9ZrjZorY8BFfAoql7xizVKCs86ghZ8H
	5M7G2FHJQFuU7MzN+16pCEGdSd0xuGbHOVAajfZcAUfFgrHb+DhPLUjIqhT0c7/05z1w5N05KYm
	s2aYDhUuK8l0OdOZw8a9qNNxFYzrh88HPbosZbhJDDY2BVIrdvSWuyFvVtA6PktpxOu2bRikCR7
	d3Cp74s1RFS3XzKaWaC2uMCLdLAnujHzonKlB+NbiYGQyaZnBYyM2L4jNqv1qU/sledOIOhf4KR
	Vz+qNjvuYJCPQC+MAFarqj/brjz0Fj3SQFfsvbcs7J7q2t/926Zzig/gAOj6bCUXGhpA==
X-Received: by 2002:a05:6000:25c3:b0:47f:7154:9dfc with SMTP id ffacd0b85a97d-47f8da60030mr4215946f8f.9.1784820035862;
        Thu, 23 Jul 2026 08:20:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm16168861f8f.18.2026.07.23.08.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 08:20:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 17:20:34 +0200
Message-Id: <DK61WCMPQZSR.23U8FFRDU3P0@smile.fr>
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>,
 <jan@centricular.com>
To: "Taruntej Kanakamalla" <tarun@centricular.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new
 package
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260707081701.1525114-1-tarun@centricular.com>
 <20260714105541.2812170-1-tarun@centricular.com>
 <20260714105541.2812170-2-tarun@centricular.com>
 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
 <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
 <d460480501e19d59ac2a7bec0f15020692f0b855.camel@centricular.com>
 <DJZTA3XYAG4T.1DDQE4ASD7JPI@bootlin.com>
 <4d95a8c8b8bcb0e1f5e01576466301f69eb2aa9b.camel@centricular.com>
 <DK54RIOEU340.33ALWQ7AGPKEJ@bootlin.com>
 <613be9d21a4a0f6fbec1c71aeca3a5874fbe4e60.camel@centricular.com>
 <DK61927PZM4C.2UUP8BSKKC6NY@smile.fr>
 <9b05bc4c4c0ae9e817111347a473a268d3fd3584.camel@centricular.com>
In-Reply-To: <9b05bc4c4c0ae9e817111347a473a268d3fd3584.camel@centricular.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241856

On Thu Jul 23, 2026 at 5:08 PM CEST, Taruntej Kanakamalla wrote:
> Hi Yoann,
>
> On Thu, 2026-07-23 at 16:50 +0200, Yoann Congal wrote:
>> On Wed Jul 22, 2026 at 5:13 PM CEST, Taruntej Kanakamalla via
>> lists.openembedded.org wrote:
>> > Hi Mathieu,
>> >=20
>> > On Wed, 2026-07-22 at 15:22 +0200, Mathieu Dubois-Briand wrote:
>> >=20
>> > > We do have issues with freedesktop gits, I hope to discuss this
>> > > during
>> > > the next patch review meeting. No change needed on your side so
>> > > far.
>> >=20
>> > Thanks for the confirmation.
>> >=20
>> > Regards,
>> > Tarun
>>=20
>> Hello,
>>=20
>> "issues with freedesktop gits" were a red-herring.
>>=20
>> The root cause is that the submitted recipe gstreamer1.0-plugins-rs
>> is
>> "floating": ie has not SRCREV value to anchor it to a particular git
>> commit.
>>=20
>> Please send a new version with the appropriate SRCREV value.
>>=20
>> Thanks!
>
> Thanks for spotting it, I will send a new version shortly.
>
> Now while building after pulling the latest master, I notice the
> warnings Mathieu previously mentioned about using old syntax for
> LICENSE for this recipe as well multiple others.
>
>> gstreamer1.0-plugins-rs: LICENSE is using an old syntax and should be
> upgraded to: "Apache-2.0 OR MPL-2.0"
>
> Should I make the LICENSE format change as well in the new version?

I guess, yes. Sounds like the consequence of the recent LICENSE
developments.
--=20
Yoann Congal
Smile ECS


