Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED88DC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 06:36:02 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32313.1790490961775269654
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 23:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rqcrNlKQ;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso15156615e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 23:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790490960; x=1791095760; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lMzitJxdMinA8yc9hIYubFRq/nY+2PnmLqIyiXmfzA=;
        b=rqcrNlKQP1egdWcxRjgRqzlaUl87MtKvrZVyOjwdj5fbFzPs/bd6lJmObo7MufQtoU
         P26mG6Oi4H2FgbjuzHv1xiwNGSFWFP4xnVSMjZcCg3MAJTLsad8yd9dU0/7G7lZE4E2B
         OnByfgIJdheS/JdeR83GjUXf1Enb9HpliVoIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790490960; x=1791095760;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4lMzitJxdMinA8yc9hIYubFRq/nY+2PnmLqIyiXmfzA=;
        b=LOfMfRYgI20dpqI5mLJpXxyJA5cda5v0ZK4Z9lxfwLt9+TyPJXp+thLWyvy2zBNQKo
         ZxSXou+pCr+4cFoGWI99v37aVyS2K14TPIoCz4YPGPJEydl5nzaqlqZKq61z1j3GaxrP
         9j0eRUin8Rb9eyqG3Sw+xWqLcDHNPcfSecBJABxxc428MIouORD+MKcW5KHSGKB5od2A
         k1I+k40cimJ+RwgjWiVoq4fowjGCALRwTZNWiKWcQ2VzA30g4/MEnwVAIgUDzOk+CIYL
         O8p5LdWzt7TiGte8aJVwXI3/hWIXEPHBZ6W9i0DTxA6B1yTcsjn2EFPHAoAo5xS8zWAC
         ugyQ==
X-Forwarded-Encrypted: i=1; AKwUvByTN8p0Zigt73fkFzzCZcO2JEyEVWxgCv2l1qLJ5fwIMehD8gimrwgDTX51cOH6JD+/No02OzU8jUd01GGBGzVAmw==@lists.openembedded.org
X-Gm-Message-State: AFuF++meqtz0U7IzOLGttb9FYBF30924CeDCWlmJgK/cCdQ1yqGSRuy3
	H1IuVTj9pIjKMPXfD/viip1svRm+e1uHQWrAJN87x7IrpJ9m43h37GNqC6fINv0aMKw=
X-Gm-Gg: AYBFou0Kh4X3LTm5FoedNhO0/pT/YCMSx9Lwcx72CJzl0ryPyiPijjFTB+RSmW/+p/p
	nJFsniXzpAmaP2B8SuRH3/4LGpeYvNhT5Vt4wuuwF/gMAkdIcrcUQUZtvIqgT7MFBr0J05+k+dG
	jdL9t3vH3aJP7d800Wy5NfXIPO7pnjSqSAZUh+JXqebkF6NtO7vyg3F/eNq4QYpq4h5rNBRho+s
	ckFA0mAmRSArj2ubIpbUTNCPH+1tI8/t8D2OAokb9ic3eZR4IaKeijpU5zdzQyMbvTEf2BVlKK2
	+zovjZUEleFcH4nK6s9CkJT6vOJLNalCPfJhuOQeo53XLw01Zixi69CzRYGl+ttgZcG+K1ACQN5
	1k24bCoWlrpdt7nD9hEwcVhW6lh8Hb4QgCt1Fpm8JvYkwi08qb4W4kTm3mWb9p51SBNYnc9eDTq
	aoZliMlG7dWOZJ1vitDJRv9Y7rF/m7l0Ndd7iHRbwMVGkCjeeSZSYlG+Mfp+kEqZXbbQdbVgZr5
	oOzAdYyS5vIybpCeCksjbff9cAKu/UHHScUVI+nppT9EeSkSdAYyw81HIQUDg==
X-Received: by 2002:a05:600c:870c:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fe7bd0128mr167254355e9.33.1790490959885;
        Sat, 26 Sep 2026 23:35:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff13b3c59sm31274645e9.0.2026.09.26.23.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 23:35:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 08:35:59 +0200
Message-Id: <DLPW2NB37STE.2TIDAT0U3P29F@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 2/6] curl: Security Fix for
 CVE-2026-18924
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260909203324.765094-1-sdoshi@mvista.com>
 <20260909203324.765094-2-sdoshi@mvista.com>
In-Reply-To: <20260909203324.765094-2-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 06:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246648

On Wed Sep 9, 2026 at 10:33 PM CEST, Siddharth Doshi via lists.openembedded=
.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> [1] https://curl.se/docs/CVE-2026-18924.html
> [2] https://security-tracker.debian.org/tracker/CVE-2026-18924
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

Hello,

I could reproduce the same issue as the scarthgap patch, I dropped this
wrynose patch from my branch:
See https://lore.kernel.org/all/CA%2BchaQdq4NaDUJN7Zuxnmdv6EH0%3Dz2Ru6HEXqT=
qk3jR0ei0W9g@mail.gmail.com/

If/when sending a fixed series, be mindful of the recent merges on
wrynose, I took the patches in the series I could apply.

Regards,
--=20
Yoann Congal
Smile ECS


