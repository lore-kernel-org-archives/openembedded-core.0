Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2104DC5AD5A
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:21:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19002.1786317704266823591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Da/TXSJC;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf52d15d88so9496155ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786317703; x=1786922503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaLAnVySXc22ebeSnbxAQ75VCekKn6ERJ85Y68KIcFg=;
        b=Da/TXSJC7qm798Dlx0ICq8za/ygFJCNUqiMx6/7aKmJxXwxXbU+0iihGRD2Cu7s1p8
         z/XV7fqVNP1oN5d4gu0/f0nvCUpzGNvXGJSFSyUz7BEon+ztAsOa3F8uBn/r39raVM1w
         i45C7CQwm2siPkyvQZgEphy17U/bJL7ZPQbx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786317703; x=1786922503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaLAnVySXc22ebeSnbxAQ75VCekKn6ERJ85Y68KIcFg=;
        b=GfbtUa7GF8gUSktqhvtUuB/5pdsrOUppjQ9tu5J8fVqnG4Sx84qvdphNMFpEkQt+N1
         GqsdsAaESKJEEz++B9xjI8snRPbCRCNz3b0fh+WxqYoUi3D/yg8qsEQqx2MXkICpE8uq
         pRi1Jv5cQkruxe3rAl0bWu1qCK7JD0N/zfzL0hqrXVeULg0PlBUsA+l9Gf/gvqUCDA5U
         XbEnJer+m1js74QCvIdlbBFnry5dSc6TEpKkqrEZoHHoAwwH0qGqYOmvkM5ZaVto/l82
         +rLgqtThq2c3edIQQL1oyKpMImWL7Jt2xh/xPoAx1cADwtcDfr6gn1eAre8C7lAWp7rL
         iCrA==
X-Gm-Message-State: AOJu0YzSeSSFCrMJqlBvfgNAfNn2qtIQAEOjERE/pSzJcoezv7fmp+CF
	5Udw2F41c/Q+TiDPfRXK3SBhRVwP2Yc3xH/dmME7bDU+cdu65wUpKgq5DJEWGjsnfOSE5xLvO43
	5AvDv
X-Gm-Gg: AR+sD11vdxn5N/6otpLern6mrfYBWB5jLD2Ev6hAhdqsnCcudJG5Myv/ojArwiyvvWG
	DPY4uWaffBWv8DWaURGBY4UzFypLjhjQ6YxFeewTnm/4xrFl4DyVv9X7WUi24eM9GJdZ7Cgoxhm
	kzyhs1ajDdBL8E8QUp53l22OTLk8eW8eqYMT6y380m9ZVLzO+bdiVEROjFOCvsXZJarVfprLwUm
	4KKP1BxzD2KG8OlTwDluCUWYW4B8Zh90yEbPQflviic/jRcmd3Xw9tqZ6GqcYDLXlS9/Oz4FwQ/
	cX5MmCIefalpzGQgNzaaZq/h9y/3voHXuhWzDdkd/T3OXEfl6xbSCWqjqkBLQ2j8tqJV/mjU0db
	QJYznUvdHN3vQBfQbyLti1BRalZ3VB/VNOgTBlX9WlhRhR5G6FaA5JQ3bdCSRY5TY/WYB0G0n3i
	Bmtl5EEriObXfOfkZIT59tJrehIXDDXT9gpqqKFQiSJ9D0DtiiscD+U9Il5evayaIR0drVUNJsf
	/l6zA==
X-Received: by 2002:a05:6a20:a11a:b0:3cb:8eb2:acbd with SMTP id adf61e73a8af0-3cbce9294abmr15408075637.25.1786317703558;
        Sun, 09 Aug 2026 16:21:43 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af992sm2950850a12.14.2026.08.09.16.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:21:43 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/5] python3-attrs: fix CVE_PRODUCT
Date: Sun,  9 Aug 2026 16:21:07 -0700
Message-ID: <20260809232107.367378-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809232107.367378-3-tim.orling@konsulko.com>
References: <20260809232107.367378-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243084

From: Tim Orling <tim.orling@konsulko.com>

No new CVEs are caught, but attrs_project:attrs matches the CPE upstream.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-attrs_26.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-attrs_26.1.0.bb b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
index 03621e41a6..1c28809728 100644
--- a/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c98
 
 inherit pypi ptest-python-pytest python_hatchling
 
+CVE_PRODUCT = "attrs_project:attrs"
+
 DEPENDS += " \
     python3-hatch-vcs-native \
     python3-hatch-fancy-pypi-readme-native \
-- 
2.47.3


