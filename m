Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B3BC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:25:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34885.1787833532736228408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 05:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MCnsvXvA;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e4998d28so1054760f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787833531; x=1788438331; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fdXhU1DPevvZVxsFFAARNlb03JV7TmXnNyBXhep1V0=;
        b=MCnsvXvAX5FBhA+Pdb6gFT5vMzi8lTMUUlIVqzpvbOz5Ee+cnLN/uleU3YzHo5T1yT
         jO6ZTfjhlOTI3r1GAiY4zERLcqAs54MqWNUN1L8JRZlTulFIWBDGUfioNHgp7wMtStFw
         Mi0F6RGVKbLIJoNNBe/oH0qQ0clH7eNLDctPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787833531; x=1788438331;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+fdXhU1DPevvZVxsFFAARNlb03JV7TmXnNyBXhep1V0=;
        b=WCKY43Hoetrg2jKJu6ODANLxsEWurCu8N4cHJ1FpRYYvIdENyhYgf0irOaEtMJioWp
         h8K6fcixx5xUkvoGKrO+Eu9UugY823bfby/yLO0EMwrnjO7PlEONIro821upXpY8Q1da
         qoUW6sqtm+MXAY7MXAcrjnAqK7pBQCiQ54LMiZ6ECVD/HEU/Mp1QsZ7guwFZ8rxtpK3Y
         1WDSinIyI/TiZvQa9N+bIgBZg6rFYWQhiwTFY9gLf7RMva+q7t7Dzkwt5ZAMy0e2mbU1
         H2Q232XI2KQRLhCml4mgI/vahSHhtMHPegn4S6CJO11ErgXE7py6EiNiL5NIS908lweB
         RqbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYieIP5EECpM9XNCOosV/RIBlXEPYJ6qO9O6VdjWa12DSH9UyAPqhok5jRbPz7Aj/YJRS7y/x7GlDUIBCBYAcqTg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mOVM27DmrcoVqGiyp/bNdFlDXrxuJTpy6aCDsGB1TZXRLmJ+3W
	04p8CU7WRXhywZXcTPeTZIAe//0UtECFrnxq65Zc0egHOxuAOI+yR4P37uy2ZNtbA3U=
X-Gm-Gg: AR+sD132spvqMhkCozcR39wRSiUKWz9968G8v7buUQsMDLVk8sTVU/6zXuM2Lm4ok55
	H0WplWI6WYpbrnA+yB5VrzBtBzJxrpLwfr/b4zisJ9/VozuHNDalDYr9rKAkSmypUNaJIRJcY6r
	BCjF2ElHSNqxo/RPh4wQRMhpDy22mngCCPQad9t29acsvMinLrjoMtYc38HILSn+cJjKv98fb9X
	5FKRGxs3JBXpw0WP6h8wGv56bUN/p1AQVXeRkLg2BhGVLgqBN/bs/snnb02NeQgUoRSONgMFy+O
	TtkOd/hldT9U78tfPHP9ELF1qxCk6Xy5XiC/bjgmDtQ5LKWR7gN6GMxaJTMxwivkQ/OiHuBdWiA
	V9mSChVNf7wAQ5RnQK6sMIvxWsMSHZz7HvEmJdv46QvXxQ1BhKZRNThQuZ2oNPcT8aWJRSeg5wL
	oddg8NAY4fdDG/vY8plRGGdUvT/aab+bECWpDKfS3B2FDVoj9nGDXCMn/IlqRYgFauLuUwG4Dq7
	MNATSSB13CNa+ilk70i/2Cq54geER0CZtDf/umF7VohJtGVtmL0
X-Received: by 2002:a5d:43cf:0:b0:481:5d18:eb9e with SMTP id ffacd0b85a97d-482e26c40c3mr15117324f8f.17.1787833530941;
        Thu, 27 Aug 2026 05:25:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm9479179f8f.10.2026.08.27.05.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 05:25:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 14:25:29 +0200
Message-Id: <DKZQ3D64CM1E.3IRQBQ2SFDOMA@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2 1/2] binutils: fix CVE-2026-3441
 and CVE-2026-3442
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
 <20260513172734.3995341-1-sudumbha@cisco.com>
 <DIZPUVCH66VP.2S19RRFXIN3RT@smile.fr>
 <400669.1783512925172136878@lists.openembedded.org>
 <2326647.1787828526675209926@lists.openembedded.org>
In-Reply-To: <2326647.1787828526675209926@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244483

On Thu Aug 27, 2026 at 1:02 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> Hi Yoann,
>
> Any update on this? As per last update, Sudhir has sent the patches for m=
aster and wrynose branch as well. Can you please review?

See https://patchwork.yoctoproject.org/project/oe-core/patch/20260513172734=
.3995341-2-sudumbha@cisco.com/#40079
I've dropped this series. Please refresh/resend it.

Thanks!
--=20
Yoann Congal
Smile ECS


