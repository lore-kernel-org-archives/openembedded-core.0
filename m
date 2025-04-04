Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD3CC36014
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:47:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.336.1743781644511325487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ewTm+xzG;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54ac9d57173so3487035e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743781643; x=1744386443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJPQ7snuGqA2p6ERMLhBuB1jjBTb7P5UosC7IkI6ugg=;
        b=ewTm+xzGdNxikjF5Q5RUyiXSghSbpPbKtM6tq4KdgsJ+OsEcueUOaSEgV13IH9dAsV
         YwrQWPqUFDZSjjJr+4j9c/SjB1eAOm6QpLYdKjinJb8Jv65sHhHEy0pZO19bV3rsCtYe
         QJ7u40C0ue7ke1+cQKisSHMQPrl1ndTXtq7ZCl5+R5ZIjJkO51vjnuycX32tOkF8mKGX
         CT/Y5bmO4ktlTAiCmL/bBBrV8GXG8R5DCB8PwSd1ZFdQ91og4DDAMBsIL6p/4pIHuVMQ
         wQt1HjpRpfqN5HpiX35VJBNPtHM4CsDVTLYRCWTmbguBzEQw6LSufBFQAN47zqSgURuW
         mSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743781643; x=1744386443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJPQ7snuGqA2p6ERMLhBuB1jjBTb7P5UosC7IkI6ugg=;
        b=sfCMEWrcGZakVZ0TTipGdHF7MF81KdUa+ZK6AfweRoz/4y+mbokecjr6kS+HZNnxdx
         tKWT94BNAZgfGHdh+3dmpPoVafA9bkkQ65am89mK18yPCqdIBuWspC53OAlcPKm2Dxq7
         0kw26XfKvCTYv7HzGeokFp+yQk6qLR8sxHy773lYGDiDWGkvWRDaCYrMzfAWnGZJ4qTv
         cbZn08tPWY/8idhxklnybx/WTrQ3l6hcutZYCyoIq6e8KsK63QGxP75QhvJNgn+eDDYt
         JwMt6WMZEvF6TYTNyE7OItdXFukiHJbf0BrXqKjMTCwl6KmPx8mQ/YznUbpjxK8kkOYl
         5MMA==
X-Gm-Message-State: AOJu0Yz3hbYtIeD/+pJca49r0Uz5cHbmYalrNCzU+P1ECA7v5ZSrMwKz
	T0kd58HNSYQyBVZTVZ+HToaNCzJbffiBO8y1n7d7Mq0ePVoFpWk4ocqh9SyGb0pgmCSc+GtVha2
	MOHQ=
X-Gm-Gg: ASbGncvihAAPA9Ecth2iTWHBWV89KDX4gntFjcGPjU1LDdo7ONOu5pN85Ta0hJnFhxG
	jFJ3CaH5iZoUrqxAUfbwXWK/TuzLfCMK33ByvW4WwKD5XHTcplGF0sYnOE4f9WGf24d5vUAW6V+
	Kdzi9MbFEbf8N5H2w/ytxRV++LKt/zNzjRp8pz/RER7DK0aVnCxgPQedvDUT9AFSJ9YWTp5CU5e
	AxsmzKmsAhd9atXCw77eNAl28ICsOaWPu8WzV89iDkHMPG+4EeHixNI2thbVltl3V+5okJVrNq1
	sO8d/JnKtO9XiXZIFMFtG6vRDl57R82ZB4beBOaG4Zf5fmyXvQoouJBwR1UArudmiIYsKHBBQWE
	DPnX4HL3LJFCOvlZ2Lf55gw==
X-Google-Smtp-Source: AGHT+IH1teFPjwTDpAQqajO8N2q1wNI5Tt7ig7KGMsuLqU2alvRqAnliQ8HULp0KvgtGwkn8SC7/5w==
X-Received: by 2002:a05:6512:3984:b0:549:744c:fffb with SMTP id 2adb3069b0e04-54c2262b852mr1154378e87.23.1743781642653;
        Fri, 04 Apr 2025 08:47:22 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c72sm462931e87.152.2025.04.04.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:47:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] selftest pokybleeding.py: add test for poky-bleeding.bbclass
Date: Fri,  4 Apr 2025 18:47:02 +0300
Message-ID: <20250404154702.441150-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404154702.441150-1-mikko.rapeli@linaro.org>
References: <20250404154702.441150-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 15:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214350

The class sets SRCREV to AUTOINC for recipes with single
or multiple repositories. Test those cases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/pokybleeding.py | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/pokybleeding.py

diff --git a/meta/lib/oeqa/selftest/cases/pokybleeding.py b/meta/lib/oeqa/selftest/cases/pokybleeding.py
new file mode 100644
index 0000000000..dc12f761b9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/pokybleeding.py
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.utils.commands import bitbake, get_bb_var
+from oeqa.selftest.case import OESelftestTestCase
+
+class PokyBleeding(OESelftestTestCase):
+
+    def test_poky_bleeding_autorev(self):
+        """
+        Test that poky-bleeding.bbclass sets SRCREV to "AUTOINC" for recipe
+        with a single scm in SRC_URI and for recipe with two scm's in SRC_URI.
+        """
+
+        self.assertNotEqual( get_bb_var('SRCREV', 'mtd-utils-selftest'), "AUTOINC")
+
+        self.assertNotEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
+        self.assertNotEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
+        
+        features = '''
+INHERIT += "poky-bleeding"
+POKY_AUTOREV_RECIPES = "hello-rs mtd-utils-selftest"
+'''
+        self.write_config(features)
+
+        self.assertEqual( get_bb_var('SRCREV', 'mtd-utils-selftest'), "AUTOINC")
+
+        self.assertEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
+        self.assertEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
-- 
2.43.0


