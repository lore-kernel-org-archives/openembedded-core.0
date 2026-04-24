Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C5DFF8851
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 21:12:45 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32932.1777065164715270077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 14:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wq6Wnpt+;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64793785e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 14:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777065163; x=1777669963; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgNa/YGY9kii7Gp9fuf5HrfaW/kh/QdEEyGIFJQzNQA=;
        b=wq6Wnpt+6VnGGD3YH95pJirUQDJiKNP1d8Z7i19HjRKMlb7wVDlgUgY39Rq3XO2VTk
         jn97wpwhrjmgySsFCsHlKBbGcRzrGJuBEuekhCzYYwi1A+jJfUeMsiqgNBnCQCouPKV3
         UxfS9GaL899wg6IdlFsFq0CABogOeEoYvKtnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777065163; x=1777669963;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgNa/YGY9kii7Gp9fuf5HrfaW/kh/QdEEyGIFJQzNQA=;
        b=EazSJnbTg81GeR0ENJHOLI4ZwHR1Ursmktk5COJdxKVvemTgOFFkfdzClymcMGdli1
         mG9/VKamr2nmgly0xoCklMCfj9rhfJIUiZpHx/Ol0N4JojfJ8cfyWlUlsXrOc2PtKM9Q
         eGKzbdZneI/nNKzw2qNFPt9tdF13aIDMhBvZ10NoXRrF4LoLEiHhzailR00FAgLtTIGd
         lcqX8zgy2nAqUo0ZcfAhYkW/hMowHTQBs9Thn3sU0TAMj1ErFbYXoc+kwdEEr5VWMDVp
         VZo3bwJO6txRejG2ecplzINHd0/JmCgTpN4XcNQIAeO67eN3K8lTXsWlg2fSywiszuhT
         Qb+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6gS3cm1BIEJbTazCXw/yyL1Q2wkrYkOHKBilV/o9v1kvTfAGnfMfPWAnl0urmEPhsvgYwWkFu33pTN3bnH64kLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhH/h1q4kiPqjBP9aaiRMmka9zPwqp4FUW2Z/LFhMB46DVHpJU
	VPoyiD9hMmTsi6alwZXPrcnM7+46C0hhEQAyCI3ZsVIfXjB1VWhd+yf2d/rvhrz//Io=
X-Gm-Gg: AeBDietd1ShAhoOCe/nwuFttWLWmJ134MtDnkUmOp3/Mut/44O59ntC7z7KfSCgsQvZ
	NPuDsMVLTdmICfUMsRwirNVVxNi5s8p1DqGgPTgvh71OYgK3ANdnIs+S2qCJJeGqYqayOTIux1s
	HlA0mcwqAsz0oBELU/9MpeNp3VdFInbsEbRLCr7EKlNoSTyVxjpKWuTtkWMbcg/rHyZyjvWBnlP
	irp5sd61VNsDq7q2i557YjeRZNDeiQ3lGjsGO6nTqiALIt96csMV2PSUDppip1rrUaCQM0QNM0x
	oz73jntfsTzKH+0KY+jg+8rc60eQlikE/2JSAo+HzYm6yqQuIXzXnTp8KiZEnYfMSz8D5fLFjsl
	f9In+3uPf0PCgWI13n/FWZDe5nutenWrMmBkJwa23ofJOjvCuB3ATn76bqqAV+7S8ia7J3I9ECK
	o5vsOiLV8vs2VytOBWn5j6MDjAZXdDeJmetrokQupUou6pAh6rabOcZGJMyNTu6wodTxthS5FLU
	VwCJxop06nRsuswrjW4vNBA/g==
X-Received: by 2002:a05:600c:8b84:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488fb76e4aamr521505465e9.17.1777065163124;
        Fri, 24 Apr 2026 14:12:43 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10777csm691995295e9.8.2026.04.24.14.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 14:12:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 23:12:42 +0200
Message-Id: <DI1P0XJP7YOA.2AHZRIC9S2WJM@smile.fr>
Subject: Re: [OE-core][scarthgap 41/66] linux-yocto/6.6: update CVE
 exclusions (6.6.123)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1777064068.git.yoann.congal@smile.fr>
 <4bdf5345c32c9e294a64d61af49ce2adabdaf1db.1777064068.git.yoann.congal@smile.fr>
In-Reply-To: <4bdf5345c32c9e294a64d61af49ce2adabdaf1db.1777064068.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 21:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235940

On Fri Apr 24, 2026 at 10:55 PM CEST, Yoann Congal wrote:
> From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>
>
> This new version of cve-exclusion_6.6.inc was generated with oe-core's
> latest version of the generate-cve-exclusions.py.
>
> Regarding the database used and how this file was generated:
>
> Generated at 2026-04-03 09:30:32.247568+00:00 for kernel version 6.6.123
> From cvelistV5 cve_2026-04-03_0700Z
>
> The backporting of the generate-cve-exclusions.py script from master to
> Scarthgap is handled in a different patch.
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../linux/cve-exclusion_6.6.inc               | 21144 +++++++++++++---
>  1 file changed, 17901 insertions(+), 3243 deletions(-)

Note: this patch triggers some tooling issues due to its size:
16167 =E2=80=93 Missing (big) patch in patchwork
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16167

You will find it on my branch here:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/s=
carthgap-nut&id=3D4bdf5345c32c9e294a64d61af49ce2adabdaf1db

Regards,
--=20
Yoann Congal
Smile ECS


