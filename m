Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7A8C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:30:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1808.1787905824854491413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 01:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AK45NePd;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e5733a5aso425789f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787905823; x=1788510623; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgPXIBl3opxO0E2a3vDCcrZroP52LVvdvMf36cyTulw=;
        b=AK45NePdtx8E6sWZCrRMYQ+CDgZH5DHZqh8BcfkAhKF4Q3rbHcZ9OGG2K+jZ369brj
         Y9iNHwH/mu+BIYpkUvJsT9jc2TfazIfvk+jF6F1qT1e8zwUNg2+Hvj40xn9QkN2aVIAd
         1bu9CtQJNLpMDfKB9poimVeRAge9A6itPMx7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905823; x=1788510623;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgPXIBl3opxO0E2a3vDCcrZroP52LVvdvMf36cyTulw=;
        b=dFugZjkvr7tIgbVlfVUsx/UEFI0GnCE/ENdx8engxmVzvph5fqz5r72iket/PrULH9
         fqYV6DfYUTprPu5jkx6Ej9rdo9sQv5fTYIFdP7k4PiDxH2BknMyqE97Ed5geBnl5h8eo
         NfvIrdW7dEdmqewh69TBfqZ7biSLuTBFebDRJ0HzhY/rc7a+oY+uKXIDCPfWtJngOpzG
         AgjwwU9l240R9Bg+tYpeLcnIkK828RhBSq3CRnlBkjfkbiQ0cuKKPO8VTIy0bo/BvrJV
         FdiSG9wu79bWeDodnpYY9xLKWazg1ilPPLlaQ5L02YXOeVd9j166tK9lHo8kUgtV9NJy
         nXLg==
X-Forwarded-Encrypted: i=1; AHgh+RrxIdbSNH2yL5UUdOhB8TEXURw6Qo9WWwIVSb7iTXw5BFb9Ori8q81/pyE68rBTvmZDRMuqjJdmwP+pWjysntby5Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++n19HKDgj3DKTRmSqaBeEEdWgffLO4fGNs10t/dTPbARdbcmpK/
	63W1R/9ktF4Qg2xer27Q+dOdV1cyHyAmf7dQXhZhZ4eCVIAGhXoSUq/N+iHHcLIsu7Q=
X-Gm-Gg: AR+sD11OIhLQxul0vpDC0qrnGka+NNhAtx3AK40RIuJJoimJ3lbgGVoGcVxvvA0BqJI
	nH5E0q9QAd3ZV6fD9xcF1RNf7OjpNo83lc1JlYURnPGJP2oTLB8Wh2NvKLEHoJdLKb+QvDkASYl
	3hDj3eGNdOujpcAiPvSHO5JhUd1pU3uKvgFIVzCHTuyzvtgd1viizM7jGrii2Nq7wsAVeiJQFwZ
	wKaB2AjOJplqLLlQLWrHZ1ERNXTxr/Qf9ayNvq/IY3O61rcOr5nKJKTSfpDv8CjPjKWAR4p0vxV
	DGOqTtcprmovfsxTEnEvIcU8wzFdnvw7fy9mux+rDfSOxqLULriBb3TA58fHmjbOLYAwHWX8kEA
	0GM2sj+/t01Y1Xt/bZK9iJnxYPqh0H5GFtjImzg90DjDQ0xB5e9f3xE+4k5HrNnwrAHuALMc1NS
	ICsJCpQJ3R1iqKLgus1xOfGeYvZVdR1FD+DkXvM9VPzXpFDwHyff9Z48xoIK4ki5lC1ZnL4Jf8V
	AfylxifJKCMt4Gj5O0F6XrH5qZb+Iys5T3aK9oBRhW47yFusEEc
X-Received: by 2002:a05:6000:703:b0:47f:e760:e5b9 with SMTP id ffacd0b85a97d-482f7a1eceemr7275237f8f.18.1787905822580;
        Fri, 28 Aug 2026 01:30:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20526sm2744199f8f.19.2026.08.28.01.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 01:30:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 10:30:21 +0200
Message-Id: <DL0FPVOD1A36.2ZJQZ9RK0WSN8@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-4360
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Leonid Iziumtsev" <leonid.iziumtsev@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260729093555.426053-1-leonid.iziumtsev@est.tech>
 <DKZRZV1Q6L2C.3AZRHXJZ8RXKV@smile.fr>
 <d5e4f76a-1f84-4822-bff3-76422e4463c0@est.tech>
 <8c105cf7-7491-453a-95a4-606b560e5d67@est.tech>
In-Reply-To: <8c105cf7-7491-453a-95a4-606b560e5d67@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244524

On Fri Aug 28, 2026 at 10:19 AM CEST, Leonid Iziumtsev wrote:
> On 8/28/26 08:45, Leonid Iziumtsev wrote:
>> On 8/27/26 15:54, Yoann Congal wrote:
>>> On Wed Jul 29, 2026 at 11:35 AM CEST, Leonid Iziumtsev via=20
>>> lists.openembedded.org wrote:
>>>> Backport patch to fix CVE-2026-4360.
>>>>
>>>> Reference:
>>>> =C2=A0=C2=A0 https://nvd.nist.gov/vuln/detail/CVE-2026-4360
>>>>
>>>> Upstream fix:
>>>> =C2=A0=C2=A0 https://github.com/python/cpython/=20
>>>> commit/5e0ef3f1afe892e4f64eb83368db57ac4c40cba0
>>>>
>>>> Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
>>>> ---
>>>> =C2=A0 .../python/python3/CVE-2026-4360.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 148 ++++++++++++++++++
>>>> =C2=A0 .../recipes-devtools/python/python3_3.14.6.bb |=C2=A0=C2=A0 1 +
>>>> =C2=A0 2 files changed, 149 insertions(+)
>>>> =C2=A0 create mode 100644 meta/recipes-devtools/python/python3/=20
>>>> CVE-2026-4360.patch
>>>
>>> Hello,
>>>
>>> In this case, I think we can consider upgrading to 3.14.7 (like master)=
.
>>> Can you look into this?
>>>
>>> I'll hold this patch for now.
>>>
>>> Regards,
>>=20
>> Hello Yoann,
>>=20
>> I will take a look.
>>=20
>
> The upgrade patch has already been submitted to the mailing list, so we=
=20
> can drop this change.

Awesome! Thanks for tracking this :)

Regards,
--=20
Yoann Congal
Smile ECS


