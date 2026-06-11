Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AE3CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 13:46:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45991.1781185606974042947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 06:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i3YIGDRk;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b9318997so58987135e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781185605; x=1781790405; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWwz5zoQVr2SE8TTchFMWyxt4coEBIV45ROTkhtQMn8=;
        b=i3YIGDRkyisgdb6bwMfxV0rU7YE7fcP7DKxqTqsL3NhGXp2OYAQw26j/gSroJOV3Gt
         gTlsJgBKc9vFQs83nU8GnOPkBvg5eajjESTLzTG/8i4aA/8+qm4UiEWW62IJYWu8lBBz
         9A9U0nQeLDTVxM4ZAAPOfwSiV/aMkCSrPiqsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781185605; x=1781790405;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWwz5zoQVr2SE8TTchFMWyxt4coEBIV45ROTkhtQMn8=;
        b=YCMg4YB+MesuRkcQj1ZZKfnLqNTlOX2gXAYiH3QYBq2g8JBvuSmbDA8Bjaela23pP+
         RDky/n65ZEQiRAkU3VDiV4mRPwyZrWj2yi0Ik0kPtOzm1iLxwXi8MPdksIeh2RsqkKgj
         fQlzfh+45iPnFCUiLqvWIBB0ZjMz3qeg8TTz7YY6eLeX/yTWHfAsYxXwFtLvnA9U6a7O
         GmPpud6Mc3nuK0gOX/oOTN47/MHqk4jBrqRw/WWk9nTEvWPqZvjmBRqg5hhL7h/wmn8p
         o8NLCxoA7bevPF3PlvI+CWTiBUsOz5K/AgqoC7nzGm5bxodeXHtjfrB0pRKA9pex0O/E
         GXzQ==
X-Gm-Message-State: AOJu0YyimWHtRW0a0ufnZQtPZMZx6zJeS2L0rGK2T9yyyaRFKyVhNkrO
	PlQ3RqoLAG0iCtUdb0Btz41iGnDEMOFQJ3EXDekchi6OdmLIcFMpNYFzzqV/R/+MlxY=
X-Gm-Gg: Acq92OH5zmNWIUnlx2mdVAl0ioeqJtP+hAcYvZsq5jNIoZuayOeKo7TAcyHJgnoeNuD
	PW03IWBAM+YcA1zvHIxcB4KQjDQ/tgGKOcI+y/EuEIimcfM1As8jcwdSxoGj3FUUaoDdtkOslHD
	UJDeN9E1JbmvoA0V5PMmfwMbjzk+2iopTo8fYQdEumZBgXE62/EQRfLpxCkmSQokL0LVFRaxjHU
	mooklXXSdW7y/OqZ/MGkRbGxIMcRESaV8hFj79s142YSAt8PMx0tN+cGeQUq4DT1E1dDS7zmMKf
	kvldm/yBoCKaoJpwO1gySEyoj01F9r2Qa0JneNTcvTExj+vRiPCMKWGG+UsAUPI7lIPfNnQjX1C
	QXRJXPNYyRAxGjMIM5tYg/RqpkNvr2e4l0xXezmv3QftBLQypLIsaVkp0FfMWIEhgM0fKunoHBu
	esUEi3xZTYHDBGaKu4RyYjhigx8SaW9QabBv1i5xASSqQytniygWaIGNxxMEz5Remu9M0gjT6v/
	zPQbIQMT2sPWpj/er/gBMs3h3o=
X-Received: by 2002:a05:600c:e547:10b0:490:e1cd:e5a3 with SMTP id 5b1f17b1804b1-490e5611c4emr26025755e9.26.1781185605224;
        Thu, 11 Jun 2026 06:46:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa0084744357c26c6744.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8474:4357:c26c:6744])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm64707018f8f.10.2026.06.11.06.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 06:46:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 15:46:43 +0200
Message-Id: <DJ69LM2EGPKR.1T3SQIJPAJHGH@smile.fr>
Subject: Re: [wrynose] Backport request: curl: fix mbedtls detection
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Simoes Ricardo (BT-EL/ESW2)"
 <Ricardo.Simoes@pt.bosch.com>
To: "Jonas Mark (BT-EL/ESW1)" <Mark.Jonas@de.bosch.com>
X-Mailer: aerc 0.20.0
References: <DB9PR10MB5354030CAD115C7BFE8A7471AD1B2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB5354030CAD115C7BFE8A7471AD1B2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 13:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238441

On Thu Jun 11, 2026 at 3:36 PM CEST, Jonas Mark (BT-EL/ESW1) wrote:
> Hi Yoann,
>
> I kindly ask for backporting of c6ba523 "curl: fix mbedtls detection" fro=
m master to wrynose.
>
> The commit fixes the mbedtls detection logic in curl which lead to build =
paths leaking into curl-config and libcurl.pc.

Hello,

That looks doable.
Ping if you don't see it in the next review cycle (in the next 2 weeks)

Regards,

>
> Thank you,
> Mark

--=20
Yoann Congal
Smile ECS


