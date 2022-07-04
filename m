Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F65C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:16:11 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.72753.1656944167692259448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/Ww+frf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id y8so6145512eda.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=LiDA5a+r/OgGaOMjRgjU2ox4AaiB5eS4Vmk3i/B1w8Y=;
        b=R/Ww+frfbYx4FaqggIVu+BNNeXIg2SsbwHvf/tryN5hfITw7EznjTdCC/pEVw+gx3H
         15+nfNISO3sYpHFaP4bJjr4vEyMaY5YuXd6tULYEEhecc1oCENifBpT5NlNihZVpCzQI
         0S3JPfCfAasRCCohoGoYpiDx+ItObT5v9p5E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=LiDA5a+r/OgGaOMjRgjU2ox4AaiB5eS4Vmk3i/B1w8Y=;
        b=vchD9gRk4VDLk8wlMNoo4TEoa/HO4MIwJQncJUj+yKdymrK6cmev31wwzA91R9EHbI
         Q/FHwYoGfrr07NQbISOLg0jb74ZdNGwqU0OxP4GOjBkhZnTptPhvrpr5i26PzW/VNt4t
         KvKKBgPzE+UmmY8UGeNWXBxWJAF+mfimC2t3xGXWHedbdSWbEB1P9bfwCtAG9xf0gLaR
         R6qAB9QrDd+R7Gsr2Bs7WpYzniJD8OAj0ZZ2OWlzXR7l8Uzo0tjdRqb+iqai9/czxsnP
         l+1JLrrjrUxvzGXBq/fLWSpPxu/IVEzBl5k4+SVTL3vjIgmjw1eKKQxU/x46VFYCP6KA
         QYRw==
X-Gm-Message-State: AJIora864akgW9Nha3vYXqAoGYn5SN+VzFFydGfyh+NfZcZOaM/0txiQ
	qBHRTaeTI6LWSr64R3y2uCq57A==
X-Google-Smtp-Source: 
 AGRyM1sFkeSljPHpToL0dzR2D3bTSi5bjuYxoRSKh1rmYnjYSGdBSjcAo8Hls6Vw0yzSNLRGYdMJwg==
X-Received: by 2002:a05:6402:3323:b0:435:775b:aece with SMTP id
 e35-20020a056402332300b00435775baecemr39244825eda.210.1656944166089;
        Mon, 04 Jul 2022 07:16:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a1709064ecd00b00726d6cb0c55sm8545602ejv.77.2022.07.04.07.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:16:05 -0700 (PDT)
Message-ID: 
 <69be22a57b1786c0e8a86a64fea2717a2fc73868.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] oeqa/sysroot.py: Check bitbake return
 status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Jul 2022 15:16:05 +0100
In-Reply-To: <20220703114114.2313369-2-ptsneves@gmail.com>
References: <20220703114114.2313369-1-ptsneves@gmail.com>
	 <20220703114114.2313369-2-ptsneves@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167613

On Sun, 2022-07-03 at 13:41 +0200, Paulo Neves wrote:
> bitbake ran but we incorrectly did not assert the exit status needs to
> be non 0. Now all sysroot tests commands expected to fail are verified
> to do so.
>=20
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/sysroot.py | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/self=
test/cases/sysroot.py
> index 588fc8c713..294ba4a4a0 100644
> --- a/meta/lib/oeqa/selftest/cases/sysroot.py
> +++ b/meta/lib/oeqa/selftest/cases/sysroot.py
> @@ -45,6 +45,7 @@ TESTSTRING:pn-sysroot-test-arch2 =3D "%s"
>          expected =3D "maximum shebang size exceeded, the maximum size is=
 128. [shebang-size]"
>          res =3D bitbake("sysroot-shebang-test-native -c populate_sysroot=
", ignore_status=3DTrue)
>          self.assertTrue(expected in res.output, msg=3Dres.output)
> +        self.assertTrue(res.status !=3D 0)
> =20
>      def test_sysroot_la(self):
>          """

I did have a question on this patch. Wouldn't it be simpler to remove
the "ignore_status=3DTrue" from the bitbake() call?

Cheers,

Richard

