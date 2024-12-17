Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14F4E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.79053.1734433973124680120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=N9QqE43D;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.47, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e971a2a0so316646f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433971; x=1735038771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+7+VR1GiiIuTVze+rcTjuGiHUiUk0AN0+G9ySlb7u4=;
        b=N9QqE43D0JbxSl9K7+teud5UyqV2vUy+3a0shyGkZ0/GSYytxnBEng68jSOy7NjfJ+
         24LjcRDmcLIFp4dMpjkm3WhyrRw1YwfRNWDgOEHZayey6O14FKuqwACe6YYHp0FggQsm
         MYcFWZ8bambiWqSWH8L1mLorUkT4GqpN1Amhcroz9ZXe5ZhO+5cdgPVB3vRwmRF09FaH
         XgICChRG1jxNxZtTsrnNEztOJfgFhS5XzDAbflwnKFAB4MqZLz93Vj3rc1AE2qteHcMb
         JZOvTDHGlv2lSGIL9tKfDptQ+yJTClAxm+NAOJ5Z+7EW72IpWKHvSmvOt3++XdWVdjYa
         9cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433971; x=1735038771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+7+VR1GiiIuTVze+rcTjuGiHUiUk0AN0+G9ySlb7u4=;
        b=J/s1UE4wv4+J1kUdJPne0tK52uGAFwEH/8NTIljoIJv7s1gIgC/j3pQsVkDuFIjqXs
         xYWzcE5ugUP3ZhnA6M6/t423PT/IxB3drr5NxXLiU2MTe04oDZtLkVmgcgbx2+D5BAWT
         T/On7TxN/EvMMt/swNAPRylB6YDaaD4HGAxHrNMw9OiZFGapmNDGUNNajiJxyEQ7UX71
         Jh0wCCrQmQzj9WS5cus6YyQN1LBAOYZSZmRLUVHih9k2PCi5DICeemqj40qFN1UMv0hd
         WQtFmcgZacuRIP2u2e/qM6t4VvuJHLspV4YEaCPxlW5iPR9EJ0OEcKkCX5LtR5RRs4TY
         GJdw==
X-Gm-Message-State: AOJu0YyzBfZ4u3oNmdgldtKCQIAFGcgZm3TZyUYh2Oryrse45C87Xypg
	GeNy4i0huK/3gMIt6qPxJM5vIEO7RSXGWtUfWy6GF3RzUPYhh7Kyvg1AivQUgkAmQopjXhbnTwE
	2LO4wIzAkRSwE28fSRFecxE+Ffr3yF9sSBy6ymOUwJ1qniaV+6Guk//OgZusJSA54gzFntZhOFh
	vJTbHd3QWa
X-Gm-Gg: ASbGnculOx6sPA7KubQ/VEQjIey7Rz/RHKlV0ta6HdV/zyas7xdGqShHcCiUfZwpaKK
	kuekh6gqIStnPtgasUEklmFr8CszOVycmATEyku5ZWlwcyeeV4geGvsxKrNJMvfQSWpHLDqYtVW
	EMBreZdiodtmfAF7BgYO3WuwcsxroYaKgULUY/5gP6cOM2cW9+YpPA87kwxO7+VGj/9j5br/eXY
	kXrzBTcb2LY1bOZtxhqOji+jnbw8SnU2xoHzSfRJPdVJiENixJvCtXdPxAe9NfapPobAy21DMvD
	jaRAB/CfNBaiB9sfSO0xM589Q2723cc3qw==
X-Google-Smtp-Source: AGHT+IGC4xK5pKEIyMubVAWZ2I3XtqMcIHaiC7dZAfOP4ugTJqXQAxupcMp6pPoRgo1vVJ2z+xNj0A==
X-Received: by 2002:a5d:47a6:0:b0:386:3afb:19a with SMTP id ffacd0b85a97d-3888dcd4479mr5407744f8f.4.1734433971463;
        Tue, 17 Dec 2024 03:12:51 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801643fsm10867848f8f.41.2024.12.17.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:51 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH kirkstone 5/6] base-passwd: fix patchreview warning
Date: Tue, 17 Dec 2024 12:12:28 +0100
Message-ID: <20241217111229.60698-6-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217111229.60698-1-jonas.gorski@bisdn.de>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 11:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208837

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fix:

Malformed Upstream-Status 'Upstream status' (meta/recipes-core/base-passwd/=
base-passwd/0007-Add-wheel-group.patch)
Unknown Upstream-Status value 'says' (meta/recipes-core/base-passwd/base-pa=
sswd/0007-Add-wheel-group.patch)

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b62b32fe154ca40a3bf731eaa5994ec351cf507)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 .../base-passwd/base-passwd/0008-Add-wheel-group.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group=
.patch b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.pat=
ch
index 00eaec38a294..d77122789d5e 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
@@ -2,7 +2,7 @@
 We need to have a wheel group which has some system privileges to consult =
the
 systemd journal or manage printers with cups.
=20
-Upstream status says the group does not exist by default.
+Upstream says the group does not exist by default.
=20
 Upstream-Status: Inappropriate [enable feature]
=20
--=20
2.47.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


