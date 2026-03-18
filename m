Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D05103E175
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:10:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13651.1773839441127332385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nDLeNGu+;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48539d21b76so50742275e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773839439; x=1774444239; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUcdgahOuceqR4f/YruAqlcv91DaPEnV8groGMuiqd4=;
        b=nDLeNGu+sAYzuBQC2cX+C/Vp9sgZP+swir3D3K/bKD4SbTjUQjC2TGhfmMxk7vwnGx
         o/5HKf7pMyK2YLcGrEr26nat0G0q0bgvpf5W2KOOdCbueKzFKN+i76DhHc6y3J7/EkpT
         WtthT635P56AAT+FuKNCcNGvyjVq1ROxx/pFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839439; x=1774444239;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUcdgahOuceqR4f/YruAqlcv91DaPEnV8groGMuiqd4=;
        b=CDKAf0qb035+QWj2j9sgqj+5baiv0RlDW3D9fZdRYwlMdHu6P8+kRTNjkbYkQpi9Jo
         MeBNNU6Rw/zcrfLyw1UA7fZhSfkBmlo68KoguvJPh3z732a4TrsTRwxVwWQNeBCyjRW+
         Pp3DlU56rX+tFBXvs27GxqpLjZ84RHM/wTGROforR0XmcAgD4i1Z1UXZKM0eILenQqZc
         5DATA+6imfJ/XvxJlrSYMBUn4/8VQIIhCM3vooqlJxcpAe+xkXPfW0rxDBqGcUYccnP9
         E5e7m8ImUThr9LHhYYdwTX2s+bnmaQF64XYqViq6usPyVk9Qvn8MSiknpsqUBktgRuds
         Ir6g==
X-Forwarded-Encrypted: i=1; AJvYcCW83N7haNTeiy8uLyVaflF9ZgSjyMxQ+m47xqnfn/rxC61d7SBi0bIFGsOiuyLPNhPQKMYtYZW+cjdta2JP47JNVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yys6DSTPfiZpEER/dAjjM/VEam1R4dpzwNaFWE7SADtIkDQOKuq
	q6ihVp/oW72rdgMzJ2TId1iRxM6yt0ccubJkxN9ANRtSIuXYC3MaQVlmvFxSANLvibc=
X-Gm-Gg: ATEYQzxvejnoc/zct1N7X0xhzUYXl0klqeDFagCw8x64ne4mC1r4iyBPzDgtwuqSHMx
	sxsMAfC/vtqRxR+zIRU5i0FqaLSLTpya87J6mzVVhTX2AYbZEWzaht/Lbr4t+Cgg3rMUd4Os11M
	vp7O24Rt1URAJ82B7BdcDKM8zRpe2KjfS7NU4l3H2554mCoWWX4C8Qn8Et8mlgq87bSWlfXVVpM
	wETbLZwqknbxwS9vgJSK/KtB7uBGVlZBiRCQlU1vv7tQ4zcbm7gD5E8SJPZA4Kxanc+GxXX9Qka
	wzqQJS1xYlLRoePgMzI8CTu9w5CpsJaBNh53myTMMDSKiLC8JQYh8gNs6FXzn0ri6kM3R0a4P3g
	IByTZ/fUXdxc5RZ2cUPi8KEVIsAnCCnMPvFvvGKM9YRmDIZlUyDkiiIv7Zq0WBdpl4ZPP3HRCzx
	xBCwy1lpXU117TEN3w2haffIsY55QdFud7sfVl1dKKohcCvY1x12hF50aR9Skw85uLhcKBR9n+m
	icF+c4Go5E=
X-Received: by 2002:a05:600c:638d:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-486f441b9f2mr55938895e9.6.1773839439258;
        Wed, 18 Mar 2026 06:10:39 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f75f774fsm9012065e9.32.2026.03.18.06.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:10:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 14:10:38 +0100
Message-Id: <DH5XLO9F5I2T.2Z3KW1VFQBH4G@smile.fr>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>
To: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <hetpat@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect
 CVE assessments and runtime warnings - cover letter
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260318053906.26606-1-hetpat@cisco.com>
 <DH5UZL3U1MAB.1SVC41PGSAO8X@smile.fr>
 <DS0PR11MB740501DF6D22149CE85C0E31DC4EA@DS0PR11MB7405.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB740501DF6D22149CE85C0E31DC4EA@DS0PR11MB7405.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233386

On Wed Mar 18, 2026 at 1:57 PM CET, Het Patel -X (hetpat - E INFOCHIPS PRIV=
ATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> I will share the new series of patches, which includes a few additional o=
nes. I will attach the corresponding output files to that.

Hmmm, I wrote that I felt that the series was too intrusive and now you
want to add more patches? Are you sure this is the right direction?
(I'm trying to prevent you from losing time to something that could
ultimately be unmergable...)

Regards,

>
> Best regards,
> Het
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Wednesday, March 18, 2026 4:37 PM
> To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@=
cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org>
> Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral C=
havda (vchavda) <vchavda@cisco.com>
> Subject: Re: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrec=
t CVE assessments and runtime warnings - cover letter
>
> Hello,
>
> On Wed Mar 18, 2026 at 6:39 AM CET, Het Patel via lists.openembedded.org =
wrote:
>> From: Het Patel <hetpat@cisco.com>
>>
>> The patches address the following bugs:
>>
>> 1. Incomplete CVE Assessment Details: Currently, the `detail` field is m=
issing for approximately 81% of entries, rendering reports unreliable for a=
uditing. These changes ensure that the rationale for a "Patched" or "Unpatc=
hed" assessment is properly recorded, allowing for a clear distinction betw=
een version-based assessments and missing data.
>>
>> 2. Runtime Warnings: Corrects four instances where debug calls were miss=
ing the required log level parameter. This change eliminates the runtime wa=
rnings that currently trigger during every CVE scan.
>
> I appreciate that you trimed down your previous try to cleanup CVE
> checking code[0]. But I still feel like it is too intrusive for stable
> inclusion.
>
> Can you please provide examples of some CVEs having "Incomplete CVE
> Assessment Details:" so I can understand the problem?
>
>> Testing:
>> - Applied cleanly to the current `scarthgap` HEAD.
>> - Verified via a full CVE scan.
>> - Confirmed that all existing CVE statuses are preserved with no regress=
ions observed.
>
> Can you provide output (log+json) both before/after to verify this
> claim?
>
> Thanks!
>
> [0]: https://lore.kernel.org/openembedded-core/20260220053443.3006180-1-h=
etpat@cisco.com/#r
>
>> Het Patel (4):
>>   cve-check: encode affected product/vendor in CVE_STATUS
>>   cve-check: annotate CVEs during analysis
>>   cve-check-map: add new statuses
>>   cve-check: fix debug message
>>
>>  meta/classes/cve-check.bbclass | 246 +++++++++++++++++++++-------------=
-------
>>  meta/conf/cve-check-map.conf   |   9 +
>>  meta/lib/oe/cve_check.py       |  74 +++++++++---
>>  3 files changed, 197 insertions(+), 132 deletions(-)
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


