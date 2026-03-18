Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E05103E177
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:15:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13740.1773839718226958505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ggpb6O3/;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-485409ab264so6992235e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773839716; x=1774444516; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABE9LIqjOaoVBkistxbV8N9ai1t4tSADsniL5jiQWxM=;
        b=Ggpb6O3/qrCWxrSaZiU/4haQJtkB1qdWlGB/VRsszlKisGTB2gEhAEzkTv9XFlD9Od
         uPYqAYYLb9Gne+GJBGvJ7lCgB6tLdR5GFNKiU3tcyOnt7TwTkapSKQn5CQKeaThdt9OO
         0iTYi/oc6VhzicdSW4ktndlqAwrdceeYy8GoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839716; x=1774444516;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABE9LIqjOaoVBkistxbV8N9ai1t4tSADsniL5jiQWxM=;
        b=Yj3KHSPCMIChSySSk1BYp3ThxYtpcaMYtPHlA6s0uxYIOhuYUQ+VldNs1d+b7KdvmW
         9DgSlItzfDG/oyvmhRBq1fjDHuk01D5cFsFPkQbNOiNlzVYVXPLsr/7K/+jLlHgxj0hZ
         bAdc/qdd3D/6FP1FcIyDYZil+JG6DRudf4/uPQYeRyGk45QlpONsMQG62C3rBRBg4qXR
         /4HTNNaMhBfa9z7TVWNzHBa2dbfDasASTXQFuiYTuQFf5A8ntRwrtAgNk3BLqXewc9lf
         +mbFFmfI/GzCr7csmRz5y8MJYc61gbVKW1K5iMoiUpLhNawsFomVH6O06Tgn1TZFPcXU
         rbCw==
X-Forwarded-Encrypted: i=1; AJvYcCXvZa7vqmm8d5R/2ctNqf/fiYU0sNetExCtMKhrpGGYuFR2IZEwkbr7w2iv+RtfjFbynk6yJlNBHagwVwLOO7ivww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzKWoYZsLsWhaog14KA0x8Yyq/I5HwW1Jjj7hTvcRIerHIWG8p
	9DV+t1iILy6HesmtsLjvKiAe5LNDM8F3pFbfoU5TO2kmSOcf9QypHogNrreIOHeN278=
X-Gm-Gg: ATEYQzxuVgZLIxd/HMr9ix7WujERTD9LPmXH191h1MFH4g+8zbqSA2kSVzM+koALVHm
	F9TjgJ7IFTqYD3eJ9uIQxq3e5D6mta5bsHxEQfeL7gEZaXGqZXHijvrQLREB3+g4pXutZFQ2nXm
	/PMm8i2wZ1ML3FeIv1AdbJZXpXdeWkL9Og5vHG0wWMGgGYkb72Cb+LdYYVlc/twGGbpY5hSIFAF
	Ws/hS2Gy3kSudwmhrnFLAb4wG+Q8cxdZZDcdzVq2YQT3jBkHC38/VbmEqQjARAcaneCRqTdPmcb
	wU3dvzdNkijez6WMUN6WST1UEQeClVdReEpetdbKdkdJ3zzp9vK7UOAuLMet/1PXbSR1plJ0yhE
	9MiBZRE3/nAeKGITRRlvF4HVPeKn6iUfHRGPn+ae0d51MCrL3B/771/pdHK8Jt5vdufIZYhcun8
	zS8EYrLJ+qLiYBtgGmFgrrArag1AIp6gQjHhfQf/L21yy4AqxXKhTZnUWWX26bvUAnT2/SkioQI
	u++8qZgymIWL08wfJ6VfQ==
X-Received: by 2002:a05:600c:3485:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-486f40cdff4mr51639325e9.15.1773839716478;
        Wed, 18 Mar 2026 06:15:16 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e48ad5sm81603675e9.1.2026.03.18.06.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:15:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 14:15:15 +0100
Message-Id: <DH5XP7PLM89W.30LD1MONER7UF@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Het Patel -X (hetpat - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect
 CVE assessments and runtime warnings - cover letter
X-Mailer: aerc 0.20.0
References: <20260318053906.26606-1-hetpat@cisco.com>
 <DH5UZL3U1MAB.1SVC41PGSAO8X@smile.fr>
 <DS0PR11MB740501DF6D22149CE85C0E31DC4EA@DS0PR11MB7405.namprd11.prod.outlook.com> <DH5XLO9F5I2T.2Z3KW1VFQBH4G@smile.fr>
In-Reply-To: <DH5XLO9F5I2T.2Z3KW1VFQBH4G@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233388

On Wed Mar 18, 2026 at 2:10 PM CET, Yoann Congal wrote:
> On Wed Mar 18, 2026 at 1:57 PM CET, Het Patel -X (hetpat - E INFOCHIPS PR=
IVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>>
>> I will share the new series of patches, which includes a few additional =
ones. I will attach the corresponding output files to that.
>
> Hmmm, I wrote that I felt that the series was too intrusive and now you
> want to add more patches? Are you sure this is the right direction?

Oh, I see now that you are talking about patches from Peter
suggestion. The series might still be too intrusive but it will be more
coherent. Got it.

> (I'm trying to prevent you from losing time to something that could
> ultimately be unmergable...)
>
> Regards,
>
>>
>> Best regards,
>> Het
>> ________________________________
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Wednesday, March 18, 2026 4:37 PM
>> To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat=
@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@li=
sts.openembedded.org>
>> Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral =
Chavda (vchavda) <vchavda@cisco.com>
>> Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorre=
ct CVE assessments and runtime warnings - cover letter
>>
>> Hello,
>>
>> On Wed Mar 18, 2026 at 6:39 AM CET, Het Patel via lists.openembedded.org=
 wrote:
>>> From: Het Patel <hetpat@cisco.com>
>>>
>>> The patches address the following bugs:
>>>
>>> 1. Incomplete CVE Assessment Details: Currently, the `detail` field is =
missing for approximately 81% of entries, rendering reports unreliable for =
auditing. These changes ensure that the rationale for a "Patched" or "Unpat=
ched" assessment is properly recorded, allowing for a clear distinction bet=
ween version-based assessments and missing data.
>>>
>>> 2. Runtime Warnings: Corrects four instances where debug calls were mis=
sing the required log level parameter. This change eliminates the runtime w=
arnings that currently trigger during every CVE scan.
>>
>> I appreciate that you trimed down your previous try to cleanup CVE
>> checking code[0]. But I still feel like it is too intrusive for stable
>> inclusion.
>>
>> Can you please provide examples of some CVEs having "Incomplete CVE
>> Assessment Details:" so I can understand the problem?
>>
>>> Testing:
>>> - Applied cleanly to the current `scarthgap` HEAD.
>>> - Verified via a full CVE scan.
>>> - Confirmed that all existing CVE statuses are preserved with no regres=
sions observed.
>>
>> Can you provide output (log+json) both before/after to verify this
>> claim?
>>
>> Thanks!
>>
>> [0]: https://lore.kernel.org/openembedded-core/20260220053443.3006180-1-=
hetpat@cisco.com/#r
>>
>>> Het Patel (4):
>>>   cve-check: encode affected product/vendor in CVE_STATUS
>>>   cve-check: annotate CVEs during analysis
>>>   cve-check-map: add new statuses
>>>   cve-check: fix debug message
>>>
>>>  meta/classes/cve-check.bbclass | 246 +++++++++++++++++++++------------=
--------
>>>  meta/conf/cve-check-map.conf   |   9 +
>>>  meta/lib/oe/cve_check.py       |  74 +++++++++---
>>>  3 files changed, 197 insertions(+), 132 deletions(-)
>>
>>
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


