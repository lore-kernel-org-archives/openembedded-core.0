Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D44CA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 08:27:44 +0000 (UTC)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19915.1791102454082431912
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 01:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BQ0NeUAg;
 spf=pass (domain: smile.fr, ip: 74.125.225.98, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso373310f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791102452; x=1791707252; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ubzo01mkS9243JswhH6ErfpYcazR4AWU77xnwpvnDDw=;
        b=BQ0NeUAgiSi/EEdw55jAWknWvHWJfFwrPIvRviMZrQaqijv45XKjgl13aRbKREHOaS
         G2e2bvx7E2y+HNDVSn3KPYI45Qf7aNTszOBeQGVjH3wZq15NeaWJNlgbqSl2yceY3l2p
         4VN28fLTy/fd4Y4sxICOeoeCyeVdrJc4ourN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791102452; x=1791707252;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ubzo01mkS9243JswhH6ErfpYcazR4AWU77xnwpvnDDw=;
        b=fOyho5jvYGEbas2OtJpy95Gy8IfSgeg5lJVzQIjO4+NJ8a931HLEZ8LeHjx48Dzyfr
         Eo+Y4XiD4ZcFYsRwuKlYXntj/nHAvzIOhkwW3gRQkcn+4UldJvF/aCPuJgwI8dNnAbtY
         RRowuI6yLdC6c9sRkyM0vPVTRi8CjoWyoSDZnfOGpjKAfNjeNGa8c1JSTx4xlQP0pyJs
         BWhsPRTzda7WM4n2a+gHtfzVAZiO+x7GupJQXFj6GNXlZBE1w8ThPMWk5dNI+iUjuW7F
         6RpF/EjBcI+I6LFFZGitdnP92twc3I+9iPfKqqzOmCAZJLDPWnr+XPuDgQ/KeyOJGRAv
         rMpw==
X-Forwarded-Encrypted: i=1; AKwUvBwHscgVaiX2vNHJZqyJqADxvQWk84MF/LiIiA+KAybYRWoWI/QqAHDPzolqnVC1pbiuKhx/nhofMoIP1nxHHfW8hw==@lists.openembedded.org
X-Gm-Message-State: AFuF++m4zd7eMUPzUdN8eg9/WS8NfzzrYreXWEq4HhmHUdMgRD8YjdZf
	bnEjcU4oLaid0q+YHN85A5m36U1hLuO1Sr0r5VFJp/+l/6BlUVk6i4Qp32sOoYXbb7Y=
X-Gm-Gg: AYBFou2SKWOckJpnag/QgeLYK2pc7A0RVV+MlV+G8i9uLCQWa6ZVbxjkDdnIVcBhmSq
	+R/i8HK/GbbQFddoROH+qZAn+SSWiu2aw3PICu5DPLNa0zkTbri4jSnko92R9oWT+i8REn1ajdz
	whnKTCtO+qe+L3vDeozBnnv3Az7/MfWUV3pIn4qAFyNYpApyxOUdfnoafW0e4xfOYg1w7Ii1q6B
	f8bk89fnl5kNr17DVvKgkGPc8i5/ourGKamPT7qPmbVo98JgP5iOdm4TPebqFucRfrEtBq/u7Ss
	nH4HCTKeHfp4/Rr3/0uMZ1rz68YZGq270vyxrSpK8s3sjjpyDR/OF3+WsIXQPZi+ahTFjR2v7cj
	Cw31aQiMO09UkZ51mj7xafpPhuCchPQbktDn795ej0V/2+/LxTH32QCVmtXmlwFAPcnUiMa03rD
	blWLdM++KBHYqWs4stVzY7Mo1jiDpuDVQoqgOzTpYXPIE3p2fhkYl+VMwYQRHtyC3npbvxXXHx2
	X4WnQPkervC72ZDWyfb5HIcdPTBUEIe0rD7xvLA7vifklzoioNBBlGWsxTLCQ==
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a02769ac74mr119775285e9.35.1791102451996;
        Sun, 04 Oct 2026 01:27:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fac3csm17341801f8f.21.2026.10.04.01.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 01:27:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Oct 2026 10:27:31 +0200
Message-Id: <DLVWTUYUN7V4.3NAGXC9ZGHDTC@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: patch CVE-2026-4105
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261003194926.1818550-1-peter.marko@siemens.com>
 <DLVVMW89P2VR.3URHAQSDYGZM1@smile.fr>
 <AS8PR10MB50736590C11386E097CE5C96FD972@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50736590C11386E097CE5C96FD972@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 08:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247197

On Sun Oct 4, 2026 at 9:52 AM CEST, Peter Marko wrote:
>> > diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recip=
es-
>> core/images/core-image-ptest.bb
>> > index 72081f938de..024c69e9fda 100644
>> > --- a/meta/recipes-core/images/core-image-ptest.bb
>> > +++ b/meta/recipes-core/images/core-image-ptest.bb
>> > @@ -36,7 +36,7 @@ QB_MEM:virtclass-mcextend-python3-cryptography =3D "=
-m
>> 5100"
>> >  TEST_SUITES =3D "ping ssh parselogs ptest"
>> >
>> >  # Sadly at the moment the full set of ptests is not robust enough and=
 sporadically
>> fails in random places
>> > -PTEST_EXPECT_FAILURE =3D "1"
>> > +#PTEST_EXPECT_FAILURE =3D "1"
>>    ^
>> I don't think you meant to add this hunk to this patch.
>
> Yes, I'll send a v2 shortly.
> For scarthgap it's important to run the testimage with this disabled as i=
t's easy to miss failures otherwise.

You mean that they only trigger a warning like in this run:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4784
... or something even more discreet?

Since I do consider ptests failures as errors, I may think about
removing 'PTEST_EXPECT_FAILURE =3D "1"' from my runs (but I usually spot
the warnings).
--=20
Yoann Congal
Smile ECS


