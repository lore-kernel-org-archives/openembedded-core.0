Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05826E69193
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87804.1766434102590714242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mELmfHpa;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b736d883ac4so772914366b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434101; x=1767038901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuPtcf7VrViClhwYxYlH+mFCEdba+/25obYY4MAmIUo=;
        b=mELmfHpaGnTBRUPAm3oWR2sVeQEaOGhfXfy1AHBfnaMAMF6hhCy2PJPq1A3mw+lpBp
         b/2cSdtlo97ZDscvysBoExoeIpU/UFtBc114RBNiRm0UFSSj2x8IHgSM6IF5ehfgDmGT
         And+JVSMtMQh8OSrczBVue01NCtulmzGzm9dBlOGH2Y2VJA5Gi5kZf2nZwIX2CZ0zHut
         GHY8a7pPzXkQMWQZSV587+PZ6bkfBwK+kwFbGY3zYK7uCJK/c+KpkLEfFVx3SIDI6qjv
         tMX7DqLj0qhDjspmy0kQG85cLkB1pcxNhwzYPOh2GrXf5/Fg7Z7/qjBXwyrWU1QFHmFr
         EqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434101; x=1767038901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YuPtcf7VrViClhwYxYlH+mFCEdba+/25obYY4MAmIUo=;
        b=dG108ZDSMi0UcRVjmIq+Tz0BFuZctxCbHxhemJmZhQe4irfWXBqLeJ7V5zni/ZhEnd
         o0ikrdQPYQIkwXZ7GO9SgAWhN+zz0PyvJkuzAAmudIjSzEG7u4R/lEj6OejcjnH00DxR
         Gf521fBze2bzX/oaJXTiBkySJYZw7vaeDDGQXAuS1cLcWIW6581ZK6Filzb5FnmQscCJ
         aOOCtJP53mYAi6AB3R60qGYtNavB4au2MHgw2RXbQSA+Wk5XEYb7GSyLg7BygMR1M0Mo
         4GO7SpPWjHSnfeAN7/Q1NXCtK0Jg2mtPnfkvf0oocd/gKXivTBI1E3q9JC9dBCgAppvT
         VY8Q==
X-Gm-Message-State: AOJu0YzaM7CFYW6Hb5w+C0/vxFEhzn50UhnN6kMEQf/QYPToAxaBY5fF
	dU6JXI2Da5mh3g/N1SFhBmfy4C+iJuaz88Y61ICyipVHTVj4x3JL5xbFMV/yhg==
X-Gm-Gg: AY/fxX5In/xGUM2UC3EHkoHSeFf0C6x28hfyvdeBAFZNy06rEIY3ubaJLKdV0GdTd+/
	QBYDNQUmaKvAzzd+oLzvjELu9kP8dXGA4vXXS/4M4pAFrCqqRtQFUluX7qOe7muY56uZoutfMBd
	JyOHZ5IRGUCRhEgYyvX2RvQQPpp1WlLFHihN9dQcbIEVGChC5+KqprFizf6CSlzkvHmj6ku2uA8
	fkb5QCLtfn458pcwYnfUVYEoPzkLGG58MYBKCCGZIc5hU6/lboG2qG8J5jS8W6JQ/tDjKckGiZl
	9DcvpJPHSSOgmrY7Toc7yjcFU51t7tuyhB2wU0vawPlY2R/3cdVc5sPmOywV7rjO7GU3MT94YAu
	nv/V1pb7umKzGj2YUu0bMfrrmn1BuAiBBQIcdbshFN4k4wIGQfe7wWz9VBHtAsySC2V8n2O7tm0
	Dj3lqUJAEmwZdxBgBldIDbY/7b5d0X45qzTothTjA7MNaJ9Xs=
X-Google-Smtp-Source: AGHT+IGlHcQHItwx8dqxBLuAvqf/3vvf7fCDjA/HQLZ+CjyOSdKF2gqKCExEAGCg11Vas7E53oTaIQ==
X-Received: by 2002:a17:907:9345:b0:b76:6aca:f1f3 with SMTP id a640c23a62f3a-b8036f5a9abmr1048488866b.19.1766434100824;
        Mon, 22 Dec 2025 12:08:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 050/114] python3-beartype: upgrade 0.21.0 -> 0.22.9
Date: Mon, 22 Dec 2025 21:06:32 +0100
Message-ID: <20251222200739.2278706-50-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228375

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-beartype_0.21.0.bb => python3-beartype_0.22.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.21.0.bb => python3-beartype_0.22.9.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.21.0.bb b/meta/recipes-devtools/python/python3-beartype_0.22.9.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.21.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.22.9.bb
index 43427c1472..e39599ccf3 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.22.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "f9a5078f5ce87261c2d22851d19b050b64f6a805439e8793aecf01ce660d3244"
+SRC_URI[sha256sum] = "8f82b54aa723a2848a56008d18875f91c1db02c32ef6a62319a002e3e25a975f"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


