Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B7CF3095A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:13:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43643.1772716408088690573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 05:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HWs/D8wf;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f454be5bso82883125e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 05:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772716406; x=1773321206; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iTQG11Vs478RsF5mW7V3nO1vVbizbCc3j1f4LStBo8=;
        b=HWs/D8wf+SQDatpc0C7iqm+HjrxHWhxFVG0GO5EQ61PTAvrmGop5ax3ZgkiF3pPICP
         20yFtsondlK+4zcM3laZX07QG3pKQUiLNZT06au5Z2N7+XPLVGbiYNVHkUJHCLG1cELd
         uBC3kBGRStfdJMZP2odUkcEapwbfgRo3dTWmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716406; x=1773321206;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iTQG11Vs478RsF5mW7V3nO1vVbizbCc3j1f4LStBo8=;
        b=WiH5pHT/2gGmogBSlwgSrCBq40o4SdCS1qWbYevp8C2Mg+yrIhwIC07BzzhO5PHTx3
         5VFYYf5FKd+4f9d3jWw7bf7EWR0qaWrXz0S6RUGYePR0ri+t22MhwBrY4xZVHkEGsVel
         vws5mdJoHgbMhh4KEdtl/fwDjzVou4BJit9W3sNzQsF3/52ZXdbAnTwyF+vRQW0d3TD0
         HQQe8OLqmNmEKdChCe7mtamN0uqHmx4+cVSfjV1qDNCeG9fi188WiGGbodzni0QeLd5E
         c3foxhOWIxkyQEAimrVMO34Atc3sRDYfX1uiZQkoaFt3A4jW50afSID7Angcz1QsAGAQ
         mAlg==
X-Forwarded-Encrypted: i=1; AJvYcCVCbWWXQbbrCOJ1DSlhsoMedT/SwrUKP2htqDvPJZCTjFY2jVBxhB/dteXdQnoyz2zd+o5Bu8R0xt9ZkoH9xGTL5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7KUU79WanaiLxy7hc5ERmwMpZXcxU3M59bQSWTwAji944KR7Z
	6FEMxdadpcEyetEJHmSlWKC7HanOrwHTRU5nLmgyigF11VpUaVxUeQGJitryP6VJeK8=
X-Gm-Gg: ATEYQzyxmzVSRYie/C5oPGsIspOmRPo7XAdINhEdFndf3J7mzbmjKRJc6V+8pTXot7W
	q7WrodqtyqRtbUK3BVH3BpoDEq64A9MmTY1ODg7V5kh/BVtfzPsPrGUy9+3ga0d7XGiNTWOxpmx
	P8GKBk4NLrtdRaz3XPhFkbYYunZIyNY/VFY7TS5FxsSJa3pyJFIjmkIDtGNMM2RCf1ajWlMxUuK
	lGLjf/6uqo14qRpwV0QibN2WLhJAk4RMbtntfIkPdladO+AW0iMvUx1zfsDhxtPHYda+17FVgJE
	k8iJRZ6+JcLsN3/J0tuMdDMfEdH3ILtrTViKr+u9BaGY7KkbGCZA66WSYy2KuCedqEh1qRtQj3s
	N2rCTGCBNFNmgXmMqZ5uDZ+g2pfdTGtGkU1S3ShiD/Mj1q4JL4N9zO316crr1OS9diecGCetzWi
	J8e0p0RezGCBM82eMqa4KqtCsEQBwvV272VJ6BlRYJxDh/Zyl0czI0ta8hCBxG+eR7JgCqwAijB
	Fb3KEEIJ0zVqPtJ
X-Received: by 2002:a05:600c:4e08:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-4851ee80b4fmr40622095e9.5.1772716406367;
        Thu, 05 Mar 2026 05:13:26 -0800 (PST)
Received: from localhost (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad2812sm64890675e9.1.2026.03.05.05.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 05:13:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 14:13:25 +0100
Message-Id: <DGUVIPZ3MH5B.2FJQVLD443PNL@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, "Viral
 Chavda (vchavda)" <vchavda@cisco.com>
To: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <hetpat@cisco.com>, "Paul Barker" <paul@pbarker.dev>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [openembedded-core] [scarthgap] [PATCH v1 01/34]
 cve-check: encode affected product/vendor in CVE_STATUS
X-Mailer: aerc 0.20.0
References: <20260220053443.3006180-1-hetpat@cisco.com>
 <f3fb77d862493a82c5b4c3e592cc4352f2c774c8.camel@pbarker.dev>
 <DS0PR11MB7405ABBD1CF46072A6905F39DC77A@DS0PR11MB7405.namprd11.prod.outlook.com> <DS0PR11MB7405FFC96A5001A76F818390DC7FA@DS0PR11MB7405.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB7405FFC96A5001A76F818390DC7FA@DS0PR11MB7405.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 13:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232489

On Tue Mar 3, 2026 at 10:09 AM CET, Het Patel -X (hetpat - E INFOCHIPS PRIV=
ATE LIMITED at Cisco) wrote:
> Gentle reminder.

Hello,

Sorry but I have to reject the series.

The LTS policy is restricted to bugfixes and security updates. A
significant portion of these patches introduce new features or
refactoring, which increases regression risk.

Please split the series and resubmit only the bugfixes if that makes
sense for you.

Regards,

> ________________________________
> From: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpa=
t@cisco.com>
> Sent: Monday, February 23, 2026 6:01 PM
> To: Paul Barker <paul@pbarker.dev>; openembedded-core@lists.openembedded.=
org <openembedded-core@lists.openembedded.org>
> Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>; Viral C=
havda (vchavda) <vchavda@cisco.com>; Yoann Congal <yoann.congal@smile.fr>
> Subject: Re: [OE-core] [openembedded-core] [scarthgap] [PATCH v1 01/34] c=
ve-check: encode affected product/vendor in CVE_STATUS
>
> Hi Paul,
>
> Yes, all patches in your series are present on both the whinlatter branch=
 and master. These patches have been cherry=E2=80=91picked directly from th=
e master branch. Their primary purpose is to migrate the CVE reporting file=
s in the scarthgap branch so that they align with the master implementation=
.
>
> I have attached a comparison of the CVE reports generated on the scarthga=
p branch before and after the migration. As shown, several additional field=
s are included in the post=E2=80=91migration report, such as "patch-file", =
and "detail": "version-not-in-range". With these changes, the CVE report fo=
rmat in scarthgap now closely matches the format used in the master branch.
>
> Please let me know if you have any questions or need further clarificatio=
n.
>
> Kind regards,
> Het Patel.
>
> [cid:9392158e-5418-49ae-ac27-40de739c7c02]
>
> ________________________________
> From: Paul Barker
> Sent: Monday, February 23, 2026 3:16 PM
> To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco); openemb=
edded-core@lists.openembedded.org
> Cc: xe-linux-external(mailer list); Viral Chavda (vchavda); Yoann Congal
> Subject: Re: [OE-core] [openembedded-core] [scarthgap] [PATCH v1 01/34] c=
ve-check: encode affected product/vendor in CVE_STATUS
>
> On Thu, 2026-02-19 at 21:34 -0800, Het Patel via lists.openembedded.org
> wrote:
>> From: Marta Rybczynska <rybczynska@gmail.com>
>>
>> CVE_STATUS contains assesment of a given CVE, but until now it didn't ha=
ve
>> include the affected vendor/product. In the case of a global system incl=
ude,
>> that CVE_STATUS was visible in all recipes.
>>
>> This patch allows encoding of affected product/vendor to each CVE_STATUS
>> assessment, also for groups. We can then filter them later and use only
>> CVEs that correspond to the recipe.
>>
>> This is going to be used in meta/conf/distro/include/cve-extra-exclusion=
s.inc
>> and similar places.
>>
>> Backport Changes:
>> - Discarded the changes to meta/lib/oe/spdx30_tasks.py, as the
>> commit history for this file diverges from the base commit
>> itself (9c9b9545049a in the scarthgap branch).
>> - Additionally, the changes do not introduce any major features
>> and are primarily focused on code restructuring.
>>
>> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit abca80a716e92fc18d3085aba1a15f4bac72379c)
>> Signed-off-by: Het Patel <hetpat@cisco.com>
>
> Hi,
>
> When sending a long list of backport patches like this, please include a
> cover letter explaining the benefit you see to having these on the
> stable branch and include some test results.
>
> Have you confirmed that all the patches in your series are also on the
> whinlatter branch as well as master?
>
> Best regards,
>
> --
> Paul Barker


--=20
Yoann Congal
Smile ECS


