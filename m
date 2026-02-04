Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D3FE95398
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:44:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19524.1770209038168948554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XZ1QBeqK;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so54990875e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 04:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770209036; x=1770813836; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OjhXHfG/sZhmfZjiVlsLLrhsqGe98Wixolg/6ctlLI=;
        b=XZ1QBeqK32vnS5luTsIytPmN0wtkCvc+56dogzcvByvMZ5Lo1MMJYGs9OS3xl24SSs
         xGvFNPZl1CMucX5cbY/D5BmaaJK7jLV3ykHmF0tW/dID+J6Zyc+T/wyj99o8DdPl1nPo
         l+r0aZiz5+OHyIT1sRyuujsYiGpyBG/Omyxd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209036; x=1770813836;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OjhXHfG/sZhmfZjiVlsLLrhsqGe98Wixolg/6ctlLI=;
        b=oNerAVhIesajAfb+4NkoUswIO7cV0JQDCGTaPbLKbeTpTFgSCfU7peu1O6OtyK8W0i
         AkO0XJPqIDTk9GyQptZcaFVahiR9ljMbKKEMjy+0Tml3ZCCrskUV4f+p2HJPLFkEo//b
         q8dl14Kzl+pkGkoVO3R8pqEmXMAAsS/NRN4dn0oG3iOBF/JT5H01gl1iNG5zlnjxA7aQ
         qB7+Vm6J6zn4umSW3h0hSqcpZl4TnvmfEkRrYWkML/BVe/deqaSc00KweECc+DSSlKyi
         ERkTJJ6FIzh2S8/5eauQxAIpqjRsFJTfB5SJblAtM+hhkL6RGtVAuqKOPzyAVlsbiac9
         rAsA==
X-Forwarded-Encrypted: i=1; AJvYcCUllfqsP2WreHhI8GEZqfRvbzQUihccvDUQ7xj2rF6Kmhp/yeFsyQIMImKHPAjZtJEaPQ9nUYoth81RLvWZ0/QnIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3EgY6BO3+z5NTXnJ/Qb/j5ZgtSynDMg3VFl2QdmGE6KGokUNd
	0mhLJOBV0IOzkjktqeU1bxAmzYQkvW7QGV+eZUSDlSIozHpGk7fsu+SVAXsz0khtZMo=
X-Gm-Gg: AZuq6aLTRCMuHyrj9yS7vT1r0kVkgFhhtubQIazq4Sn5J1WkISFHEOGPhPSPva+h8ap
	PO/Q/UNjjIIr+A9RqO7HvmwIhgvtxVeZQKJrXFgsyTsch7Vk3P18h7gX8HJL9aSen0J3nMjozAy
	OJzwdeq+zMD/8UWTfnMMEveBkOrWspNiNewqa+VMCrmtHHmZGFwYX/zvyCMARX5HLg695Wh9D7W
	x5argP4VXJFkt1Q9dDU+rvzrHjoNafKO324LsT8G6xZYa4nfCzBhmtmeNO7zeThTezEJMOK55Le
	1tyYbfP7ZY5jFQQhaBk+bwBd1wRqAOwHfqHHHx9Fs9V3LVFbdOHLLYAhra6ukPBBCj+yBaplwWb
	ieMceLvgxtesEYj0kShjK2HGifzPzTyiQe2EkezJNmkLjFI+CLuNAx2dvsTCS1ohBpZ/tAovt33
	vEfvpFjP27IxP0T6LSuc/qvWn29r3OcnUE51Tv6ImYLqAXGbnnqS7U3m0jDOOP4sicZ8efODvvN
	rE=
X-Received: by 2002:a05:600c:c3cd:10b0:47e:e946:3a57 with SMTP id 5b1f17b1804b1-4830e9a3c64mr30058805e9.36.1770209036494;
        Wed, 04 Feb 2026 04:43:56 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe69e9fsm24290335e9.6.2026.02.04.04.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:43:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 13:43:55 +0100
Message-Id: <DG66QCEZ7DLD.14MZ8V8GDATG@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68471
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260123103610.32043-1-amaury.couderc@est.tech>
In-Reply-To: <20260123103610.32043-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230519

On Fri Jan 23, 2026 at 11:35 AM CET, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> avahi: fix DoS bug by changing assert to return
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.=
patch

Hello,

Same as the CVE-2025-68468 patch: the fix needs to be merged to master and
whinlatter first before getting merged on scarthgap.

Regards,

--=20
Yoann Congal
Smile ECS


