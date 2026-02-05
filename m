Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB65EE9129E
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 15:17:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23010.1770304633187144279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 07:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HB+ZGkqj;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so6983485e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 07:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770304631; x=1770909431; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSY0UT5iKfYyGe3dnSYeGMJn2ZmE/Mu6tA/uPwlVKE0=;
        b=HB+ZGkqj9hCeMAezIknXiJrLT9THmtVytMfSa8ne3+VN6uY5TmvG1nlsbEhJOcIwKn
         MeoWrgRri/HmXr3/g/GLNYzqtsCPvdlt/oItsQbu/dOZfeQ1X/elUDYKXHMxmpO7kjw/
         WvVelBGO+DBcniqRmKCj8FtSkHCXRvnQ6M2TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770304631; x=1770909431;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSY0UT5iKfYyGe3dnSYeGMJn2ZmE/Mu6tA/uPwlVKE0=;
        b=afOn3/rYmUdhB/VlAWtcoLGT/y0RiqxbBOZz4zl43hFHBk2a6S5Z7o4cSXlGnm+jez
         d6cYtipATKJip2Vq9ZVMJRqgS1qF9e7PQZOLYPgJzHqOmRCAt5RnWfMRAI/dLHEGTHNk
         Oo9RNXIHmjGObsKvS9q+0whG9vxVl/6AKatqqgVcu6h2ItDvBK1EU2hVT82SJq5H/fuB
         FCUkSLTIDs3yjDO3kL6+mJypn/z0AT1sEdmtIR3JdSanO32ufHQ1n6p93SVzRGEo6xFp
         Ry/S0hzTVgzzg2z5MH2SyiS0ycZV20mjqass70ij1OXmqjRl6PbvPMcHXsmHV4VcMZ+M
         2/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjAFjZrz+0gTrTdciDfx2RajXaHZRwQEFoGKuAKo3zocp2rcFxsZ+ePOMR/59n4eeG3UUOnsGya19X+knEeQRoiQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRtOC+khzotTWGNlf5wcb6eoYyLUCFBwyObPkDydztp407RGIo
	GPhxPX1/7CzUDlzUeC+jWIgj2FEJ+dKhHXtEHMjqo0pQ6anfWvcLMjl7pOka1JjEwvnGdoHAdm9
	U4OFGRys=
X-Gm-Gg: AZuq6aLujTYD/LRCT7C/Z+gVlRSsaOGsUoKeo6rRQH3WPjUCWOrHp/yOKxrsR7A9LKg
	qHFxYREHwCz7fk13pBKX2uY13zv5t/oNy4qwMFPLhJlU5Ip2EVx+7YttwOAh3BYmCu84pjizpxu
	ZDjpd0AeCfWZhz3NGplKMT0Bq6wTDOOmdwACJoyanySueI+VdOcZb5m7NuhzhlPfk36tPiQUskK
	m+qqcfp/3DTvUYhEh4b4OdkACAstxQyms6Bxp/p90RmEwIbbj6ZkjE9uuq0bR8pIW0JGcivlFrN
	VvoKEcK4vzCoawfhuZL8oXh/YYZG2XJKXV9GXL+9I3IfCWp3gA+3ug1rlkkNH/PdgUAFe8xCeeD
	cbKtFIjQCtWXTlxHlNjerZum9Ko9Sjvz7KpFAqiVIMgKPrr2Vp9GuEsbBe/dqd/0AiIMsUL6Bq0
	oAOB0FwFgvIqwW0Cc8gGGC5wvrax7JGq5iN8nVFf7DV2Lq4V2+q2oFDW6EUIiJswSSkF+dcWOPo
	BbRO1dhnvShEA==
X-Received: by 2002:a05:600c:3514:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-4830e923f78mr89546705e9.4.1770304631452;
        Thu, 05 Feb 2026 07:17:11 -0800 (PST)
Received: from localhost (2a01cb001331aa008fabb4f40b3eded6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8fab:b4f4:b3e:ded6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d3fd09sm62276475e9.10.2026.02.05.07.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 07:17:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 16:17:10 +0100
Message-Id: <DG74M83PX9AC.3S1J2YE0AX38T@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <ankur.tyagi85@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 2/3] ffmpeg: ignore CVE-2025-25469
X-Mailer: aerc 0.20.0
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
 <20260202040805.596021-2-ankur.tyagi85@gmail.com>
 <DG74H88QW53S.32HY2RYC20ZF5@smile.fr>
In-Reply-To: <DG74H88QW53S.32HY2RYC20ZF5@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 15:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230582

On Thu Feb 5, 2026 at 4:10 PM CET, Yoann Congal wrote:
> On Mon Feb 2, 2026 at 5:08 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Details https://nvd.nist.gov/vuln/detail/CVE-2025-25469
>>
>> This vulnerability exists in IAMF (Immersive Audio Model and Formats dem=
uxer)
>> which was introduced in version 7.0 [1]
>>
>> $ git tag --contains 4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b
>> n7.0
>> n7.0.1
>> n7.0.2
>> n7.0.3
>> n7.1
>> n7.1-dev
>> n7.1.1
>> n7.1.2
>> n7.1.3
>> n7.2-dev
>> n8.0
>> n8.0.1
>> n8.1-dev
>>
>> [1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/4ee05182b7cccfa6928d=
cb0a45c2b50b7d9ea39b
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>
> Hello,=20
>
> Thank you for the patch, I reviewed it and I'm OK with it.

A precision though, it matches master and whinlatter patches "ffmpeg: ignor=
e 10 CVEs".
Your patch will have to wait that the master and whinlatter patches
merge. And that will be too late for 5.0.16.

>
> Can I ask you to contact NVD to try to get the CPE fixed?
>
> Thanks in advance,
>
> Regards,


--=20
Yoann Congal
Smile ECS


