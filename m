Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05FFE9D41C
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25719.1770224873298137888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CLtapc4l;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f454be5bso9985125e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770224871; x=1770829671; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj9nSbP46A1UBkNnxDo72iQtOyuXJj0CIgNorPFrolk=;
        b=CLtapc4leLreL/csm/GQ4KxJqj/7nQPAKSlC8nICu6698sYQW52/uAfqTGUCgtHY3w
         3mfvnxHwrxTFk1haQgGaYjjIm10l1gxBvOvi8PjSafK/ThwbgRtLu3pNOWKPCRxgd+Yw
         qvMMv1Q4XH1KkZaoGles7WVGhiZDY7at3AYNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224871; x=1770829671;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj9nSbP46A1UBkNnxDo72iQtOyuXJj0CIgNorPFrolk=;
        b=KVAwe+MIsx4GaGMpyhTEpTxicwtNJ8tW6dak2PT0JeCo1lFYG23uPHPcLn2Tp7rJAw
         JvcOc7baKFl6z4sBnYTcrm3OIVpVS2X1KFK2NLgbAnG9nArtS9X953QAgCcPpuimwhP7
         rxW6ghJZ2SMy8wqQrPPg/pBoHVRcU9xM8Hcm75Qb9voR/Mn2t5ITNCya0EBI4BtYy2j3
         NTkckLje6ifj2WIm9AeBiKiWluZZTSxHbiIR636XuFFw7cMWj8NCNzcT5fA7JPpAtNir
         R76S+801d0lEEuXkqxqb3cSuqZAtNh/ZPSB/FkivrcCWs2iUKWFGmuye5PPzEfYY7mhN
         ImMw==
X-Forwarded-Encrypted: i=1; AJvYcCUEvr+jTZjTeiagEvS79KOqDrGFgdSI9/dWIucilLhb0NjHUV3yiVDqcaxQB4aBFXsz/LgVBeSRXGj6DtmPCKdmFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yygt/v6C3uQUrMjXXKJsA2lsAUabhIN/v4fSmln8kx5cdMH5/n3
	zVn4Sf2XqQ5Wb6UHTVx5Aaa0RvCJShuFGENgsmL80vlV6HJNmmLdrv71riWBlCWrXW8/mWFyvI0
	Ya5LlAmc=
X-Gm-Gg: AZuq6aIszjc8ZYRcCroWzAMZcW1/E5hXQK4YGhK/NYvvQCBI9E21NoovHbDs+bSPsiE
	3cEMjCwOMOVVaseB1aq2n6m7fsiL2bNtubHaPxPZh+mILAmx/DLir5OMJKeg5Wvjk9aioVtMHf3
	32GeIZIrYLZyMOpjo+v+7uMsUZgs3xFVa31PFuwsv4HM7kJcy5P5jn44pt6U5k8KEfogE5qgAhS
	ek+G4NBIIbZt+IPDIPR4wNllq5duOiamxcuAmAWlMeC7NkT/T+tfSN6ulYXG2Xup8GbZa9dVS62
	Ef//7XM/e6j+xDRkrJDNApem9Zr8NEDOjXr5lcwV9JZlglRVOaCFro2mQt6yGf6lvSArmGN2DUF
	fo7cx/GNxcioa2gPuZfQIBHnsNXr9qtbRsDUmAfgB9zdSCWe9SJhtU8EmFDwoJe+MJIgEd0YTwV
	b/7xh8rBWnP1oebcOJrPNurWtepLKv/vlm1uaON/SVlHvLVOX21YQkVZIkL5M1f1B5Am4fPCvDX
	1E=
X-Received: by 2002:a05:600c:8216:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-48317916887mr161575e9.9.1770224871504;
        Wed, 04 Feb 2026 09:07:51 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831093650esm81536395e9.15.2026.02.04.09.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:07:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 18:07:50 +0100
Message-Id: <DG6CCEUJ3JEF.29RWL9KVCTC90@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15468
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260202043432.92025-1-hprajapati@mvista.com>
In-Reply-To: <20260202043432.92025-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230554

On Mon Feb 2, 2026 at 5:34 AM CET, Hitendra Prajapati via lists.openembedde=
d.org wrote:
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
1f08e54bad32843044fe8a675948d65e3b4ece65
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-15468.patch      | 39 +++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
468.patch

Hello,

Thanks for the patch.

(Same as CVE-2025-15467)
As far as I can tell, CVE-2025-69419 does also impact whinlatter. Can you
send a fix there (either by then backport or maybe an upgrade?)

Thanks!
--=20
Yoann Congal
Smile ECS


