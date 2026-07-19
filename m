Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F0CC4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 14:47:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6468.1784472444543707334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 07:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cfIz1vgm;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f707e5d75so329321f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784472443; x=1785077243; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyBflbNhuLLIRqL8A1F8D6DmxdzshY6wx/of6D34q8E=;
        b=cfIz1vgmi0HeTD77gMsMz9M5aqmmiEjDrphKsTe36SujT5wqdIdmvpsw12+XFVJ4Qs
         1pqtXJNfCCT6pJATpGSe+pr5hCZX4sFmRZsOFaBKGF+ZVH9v5drQ3mwh2/CfkdWgn9Uc
         X/AVt7AseZNwDe0bomzL+EWRCCvH6C4VqLSMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784472443; x=1785077243;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyBflbNhuLLIRqL8A1F8D6DmxdzshY6wx/of6D34q8E=;
        b=LCfXB4bDzH+LW/tV4oU71fkaqfPmflABSl1xiIAnq+DlMy2ISyiJxrRe13BUT4rCAu
         oGNpuvVV6jsBelHVevQqcWL7rUyBujdhip7Zb+o9GhZG2rYmPSz7wqQTOztHOT3caNt0
         shESvgpH7T6sJZH6gyOL64P2cwx390G6P5IO5aZaJYN37c0MHWZR4u/ctZmziZicQRmE
         5tGTVCdRqS3eI7KHFTzdyzmO9h8Hh5lhjZIjMPbGWP9hK6sN7PZ83l6Sk25afkd/XR+b
         PDF/nB4+gqF1nz2jXi/MikRlO9CqJSb/APkxJpCn+USq7hcCepUh0tY9q0pB++iqGn1h
         gEAw==
X-Forwarded-Encrypted: i=1; AHgh+RrrxXVMX8yKJ2QSDqyR2TcAnH2yhiH4mj+6/Sia7OqeT0/Kpc9aMouootfvVSA6wonbytrk2PNssvshfPG1YjnIhg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwH1Mv2NjkB3CUH/mi4VJf6XQgnrfCy/lk4cUat3ZbJeo6JVmvV
	xOVHNObdgHKxlERO7FsXz8bcT7LWhmTjHA04qc5Bd/tn+NfZ9hPYL4BmlfkfzEMNm9E=
X-Gm-Gg: AfdE7cnFirtY0sWrmr9F9NIqIeQpy7iUNjkONP6CihD1inC1sk68zfzo0ZEA9Bfn7FK
	oGOSk5/H9mF0Zn67kO5HCB5ofCt1c2Bpm18eigI4C24Tq1gwsZOYV2LDV2BTHsyu7IJAPo73e0O
	ckI00QN6V1OrN0X5YlgDNSV6/NzRWumHUCo8pEzRM6+wZa8RbNstwMYoNnlIfvFLQmSPI0/oiGs
	lTh3RfOEn1T4Nqne3e51czoTZcO6sQmfEyLXSwXX6Y5psPmsXY/Ca++uKerE/bu9YNvu3xF2Hov
	pJOlG28CI9XXhw2Shd8RckC/k7PtYc0Mnf4UGdxj5xWYxD/IUE5HCU2cxBza9Cbez6QTMT/8svS
	O4YyIYQgZGAV/ywPyYvhYcsiCNwbS8w/uhGcnso/qAvBASGymeqVJu9lQ6ZMBxCcTcVuA6Wlx0p
	HWsu+cd0remA2e/SQ7C1ju0CmZxhx0J9AVbGxvKKX3IAXPrAo7xSkUORVgU+Rv4owikKhvAxNHf
	z3RiA==
X-Received: by 2002:a05:6000:1842:b0:47f:7067:395b with SMTP id ffacd0b85a97d-47f706739camr4601655f8f.10.1784472442745;
        Sun, 19 Jul 2026 07:47:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm22569104f8f.5.2026.07.19.07.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:47:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 16:47:21 +0200
Message-Id: <DK2MOQQ5LVAO.129QSWARK4ZFJ@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <rl@karo-electronics.de>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/5] sign_ipk.bbclass: add missing
 'd' parameter to raise_sanity_error()
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260602142132.976138-1-rl@karo-electronics.de>
 <DJAJVFJKICFA.NKWQQAQP6953@smile.fr> <DJRNO3IHV9C8.25R1KSCEBO276@smile.fr>
In-Reply-To: <DJRNO3IHV9C8.25R1KSCEBO276@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 14:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241286

On Mon Jul 6, 2026 at 7:14 PM CEST, Yoann Congal wrote:
> On Tue Jun 16, 2026 at 4:40 PM CEST, Yoann Congal wrote:
>> On Tue Jun 2, 2026 at 4:21 PM CEST, Robin Lintermann via lists.openembed=
ded.org wrote:
>>> The second raise_sanity_error() call in this class lacks the 'd'
>>> parameter which would lead to a python exception rather than the
>>> desired error message when the corresponding error condition is
>>> fulfilled.
>>>
>>> Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
>>> ---
>>
>> Hello,
>>
>> We have a strict "master-first" policy so any patch needs to be merged
>> on all the more recent supported branches before merging on scarthgap
>> (in this case: master and wrynose).
>>
>> This patch (and the other patches of this series by quickly glancing at
>> them) is needed on master.
>>
>> Can you please sent it there first, and then, ping back here so I can
>> take them for scarthgap.
>
> Hello Robin,
>
> Gentle ping for these patches, do you plan to get them merged on master
> and wrynose?

Hello,

I will now drop this patch. Please send a new submission if the above
situation changes.

Regards,
--=20
Yoann Congal
Smile ECS


