Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2AACD5BD1
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 10:18:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7754.1779963474671693580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 03:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J4pcZx7v;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1860558fso7936358f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779963473; x=1780568273; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AemjC2Yfhf9kc/nv3rUlU0limW5VOMCDHIiOV7cEpCg=;
        b=J4pcZx7vxmAzhuHky9MDwrJTZdqZcjBmUTIxtaT4tmViASRHVKJ+dcrmVh52DqiJYo
         LJVurmx+N/SbC3KcL1DnOhY0Wv9G7/NXaZYWLmG+IXAyUOKFY9IgQjYDWfHjaVdBvQbL
         9hGUY4kSp6Xi8sWyXBQ9ijhJwc/xy7hp+8rMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963473; x=1780568273;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AemjC2Yfhf9kc/nv3rUlU0limW5VOMCDHIiOV7cEpCg=;
        b=YsAOS4YWLvMvUfQhEHE/TYLZM+oYvPkvBpwgXz5y9l6MM7gFy4BBfS4AQxrvmPvm61
         Qlu7H1qknxhCCh47jRQ4eTxjE2zVSfH96Ho9wCuI/7Enmwinwqzg3MpgyRCmP0BcR9m+
         VPQ3QriusPbm3bS3CP1vE8d0lJshynfuTpZOsNIZ+FrtjeG9keVTHlwYcrRlOEPVnDnc
         tIEZcr9sWdJAH8gHy5OV/QqoNIpSZB8HSCnZtjnri7jKW0VQydaSx/x5p7XQ2cKvDQjU
         og6ROXIxRtuIqp0zeWfNtYoJoZjbiEXpmEBxgse2Q6guyliM6/coKosaudbGa+TPKbEI
         /kAA==
X-Gm-Message-State: AOJu0Yy0SJ0u1fM4jmMXPNBb2tivGJHp2wejqOMGQeortnZYqduj5UVC
	jw073Dlu4UfFVS5+gTYofmHQyzI8gtsQJRtnTblYEJJCHpKXRLRX0j+6zaPDEiVKelY=
X-Gm-Gg: Acq92OGOZqySEq3Luw29gbSBMpk6sMhG/I0SqRrVlYzI1Ln8dDRP+Q16aUflh4S1vZu
	cyf/pEgJVhCV2iNSL7AEvWes9FT8P4pIP9cOQc56s2GLVY/MDPoH4ZJin7gxv6rSWC/POx4S5XD
	1j9MydAGgCnkhpR8ZdlL7ZWcSn8JDNFpcnl7TDgfylNM8jraZlNS+tsA0xqIgOe4WVE8STDD4lA
	zGb2BpnRyTcjP/Cwl/NTB9szQTZ1NtE0w8p2mBHpTcYRS7wKXhFxpephVV06B+vuovXD8ejOGzS
	MCaauqF0kvrDtefZAUcx57SgOTHgvddy2aI6FJlbhI0LDefcEzCOEUwBLZ6YuLaIBd9TmJYLSDj
	WERFoUU4NV1Fjch6VcOwrGk1L+JF4eCGXFEcnh0Qm+af0BLYL7Gfifirl4sN8axXuTMPnSpzqaI
	moEkqoLVb/cgSKmdAueB3HuvuSFNXC1/XQmaMULYpX9TWntyIvDRxaQ9sTcf9XkrOgxdTNw074t
	tTXV6uSgwbpUMzzkMDE1cthKQ==
X-Received: by 2002:a05:600c:35d6:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-4904973932amr416966855e9.10.1779963472786;
        Thu, 28 May 2026 03:17:52 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908eab2109sm11719045e9.19.2026.05.28.03.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 03:17:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 12:17:51 +0200
Message-Id: <DIU8E2FCHHHT.QPOO8VDUUIP5@smile.fr>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: handle padded
 buffers in wl_shm buffer creation
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: <ross.burton@arm.com>, "tdarote@qti.qualcomm.com"
 <tdarote@qti.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20260504081223.2361368-1-tdarote@qti.qualcomm.com>
 <FAC6696C-2859-491B-B9CD-BAAED7F15F71@arm.com>
In-Reply-To: <FAC6696C-2859-491B-B9CD-BAAED7F15F71@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237698

On Mon May 11, 2026 at 7:18 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> On 4 May 2026, at 09:12, Tushar Darote via lists.openembedded.org <tdarot=
e=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>>=20
>> Use GstBuffer metadata when constructing wl_shm buffers so stride and si=
ze reflect the actual buffer layout.
>> This fixes incorrect rendering with DMA-backed buffers that include padd=
ing or custom strides.
>
> This is in the review queue but I see that the upstream merge request has=
 now been accepted, so could you update this with the final committed patch=
?

Upstream merged patch is: https://gitlab.freedesktop.org/gstreamer/gstreame=
r/-/commit/199b144a7c626ea71b9373e4c4fc4c29fb099568

FYI, the added patch and the upstream patch have non-trivial
differences: For exemple, this patch touches gstgtkwaylandsink.c files
but the upstream one does not. If those differences are consequences of
the backporting process, then a quick comment explaing the differences
whould be appreciated.

Thanks!

>
> Thanks,
> Ross


--=20
Yoann Congal
Smile ECS


