Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C69EC88E73
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 18:10:58 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4272.1789409452463823265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 11:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lyrD2a1P;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so17322305e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789409450; x=1790014250; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8xzBnUeehspXCkKO7WaHp41gOSrzQ9QXYn4rlc9xKr4=;
        b=lyrD2a1PxHNJEtKtSVBwFT3ke9IhOTR1WZrfC0vTjjB7XvjyqwfLuErIFgqe8FjeuA
         nB7aOMB9zqVhsl+9ZuTa/AHplIQLj+7r5Pb+g1A5wBjfQPGMkC06v6gzZT/9y7uYq2E1
         Oijj3g7jQ/skh/C7QqjxSWdg4RMgVTEUXnX2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409450; x=1790014250;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xzBnUeehspXCkKO7WaHp41gOSrzQ9QXYn4rlc9xKr4=;
        b=q63mvmFw4mPnfmGKWBt2V8IfONcK0MTPZWCSmofUhI0LqFoRz+hes86+Hvei1ZAW2i
         b6Pe/f6SY11zTLqu0lxZy1qATUop1tpXRM0uNzrh2nMbuDsaS4ofNPB11/iZmTsiqbf3
         3vTlFxj+4VhTtnn8zfoj35Yu4pYfYx6PufkWn9yApqNkVdm6Mc4rFArGOlx51NSKr/yR
         uyIuqXSuVmvFW7slUKcIcconYBxqE7LTrYNNFO2GE5ALUVZzBXlfPAO7ouEc7O5eFViW
         pmZAkBM1LuhvPslDyelEyV0BxxRZyu6tN1vgEHK3vi9/l4QO0lg3njujyZjKaRUmLXAx
         wnUg==
X-Forwarded-Encrypted: i=1; AKwUvBx5hOUFrmIAgbQtoUGr2F0+zI8Fe0mKhJq5KYKvaJ4tsJmwhHH6t02EoMS48h5G0VIdLcVWlKFUPAjBLN4wroGgtA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nJDcq/WTadPZxOgobU66f5eVGo8IyG4YxxRZ3gwC1AmS5Q4Owr
	N98CXfECTdS5MPI49ZBB0ZcHysyWz5HD1YiBKbXRzacCjwx50mmBYkjOWQ4qBrJGVCg=
X-Gm-Gg: AYBFou3k/48q5FWEfuth+t4yhEJH7xrKKmCQLjZPgyL8Swud9lU6qeVB+gQ/dQGD8+F
	Z5dXFBYXikCfSyqH/yZ2nMIUuwaBpr0xHSDeBjiKa8MZuAWEMiW0Su9B80+eSaE7uK6bYM8HBZU
	hzYL0nvU2PpFfbBRaFMWLObPoN2vvltSnyCCS+Lh6BQA9PbOIsNDvE3pbguddnpWMSNo9gf8l80
	FNG6234rZ6Lhw3MT6nzhJOIfXx9Rycbx39vg/YqjbnMeIEMwbG63sJski8GTQ0zs0pePAXOhftd
	pOZUbC2iYLSap1CCeqk+w2SYhz9BozHRti2PawqMTd8hcPSPyLmKtnb0XlcxSNmj8JLXda+Tpfz
	bz7XjUQmZwhNKpZ7BGOEnw9K3N579NLrd8NySmQ2NJMJWUw/4gmiEkuuOxpGcbAwj095x8tAy9Y
	TyQeDN1aODBirRUQNotvfOp2P9tQde8dOIXEJTTzKowtkljqhXOHIo+4V1VKwEeHY2C1oNmTfSI
	REpWGd1nrPts/5s895xMEVKtjpGjZpFz4Hkx8WXOe+wC8j4+BjBEMEC9KeP/hM=
X-Received: by 2002:a05:600c:a00d:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e7a686db5mr108545795e9.15.1789409450404;
        Mon, 14 Sep 2026 11:10:50 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm14701145e9.2.2026.09.14.11.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:10:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 20:10:49 +0200
Message-Id: <DLF8PKQZWT9D.QFDCJVVGNT03@smile.fr>
Subject: Re: [OE-core] [PATCH] python3-sbom-cve-check: update to version
 1.3.5
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <ross.burton@arm.com>, <Peter.Marko@siemens.com>,
 <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260914-sbom-cve-check-update-1-3-5-v1-1-5d2d69902368@bootlin.com>
In-Reply-To: <20260914-sbom-cve-check-update-1-3-5-v1-1-5d2d69902368@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 18:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245791

On Mon Sep 14, 2026 at 6:49 PM CEST, Benjamin Robin via lists.openembedded.=
org wrote:
> For details on this new release, see:
> https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
>  ...{python3-sbom-cve-check_1.3.4.bb =3D> python3-sbom-cve-check_1.3.5.bb=
} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hello,

Should I plan to upgrade to 1.3.5 on wrynose as well?

For reference, the changelog is:
| ## v1.3.5
|=20
| ### Added or Changed
|=20
| - Reduced peak memory usage while building database indexes.
| - Cached compiled-source path validation results to avoid repeated valida=
tion
|   and duplicate warnings about missing important files in Linux kernel bu=
ilds.
| - Added the `--rich-logging` command line option.
|=20
| ### Fixed
|=20
| - Prevented redundant database updates when multiple `sbom-cve-check`
|   processes initialize the same database concurrently. Database initializ=
ation
|   and indexing are now serialized across processes, allowing waiting proc=
esses
|   to continue once initialization is complete, thereby substantially impr=
oving
|   the parallel execution of multiple `sbom-cve-check` instances when a da=
tabase
|   update is needed.

Regards,
--=20
Yoann Congal
Smile ECS


