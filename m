Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72190CAC58C
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:29 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.860.1757438243133228300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkM4gM6K;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso5737980a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438241; x=1758043041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivJyvse4mFbJNxeaY5FUlilGKKr6uAEPo1LxuzCpel0=;
        b=mkM4gM6K+T93A4feNKt6EiJNqHzakr0wumW3fzh1PRgWnKwURpJDl/TBRd4JiuYUMd
         82Vz0V0XlTvHIqoUIAgOt+BtnMVb7kAmJR40wrGrmGjyEJqE4y5mrAtA/m/vzQO+DJV0
         0erOc7vtgFSvGZydZrJ2m0zV4MJ5hPBPNb9/GwInKD//JAIjNsjlpkcAwBDHnoGp7aKJ
         gcjgH7A8HDql2NDG4HWED5ETHASV/nebeAATrkZnXmqEVFhWDhVm3lg2ozcQe9wr0GGv
         Qu/dkD41+q5hgQ4apVgf7RZolYSL6xzYIYybUosGR2tQv5a4XJ4Dq1iJ4reQh5atSHY9
         pTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438241; x=1758043041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivJyvse4mFbJNxeaY5FUlilGKKr6uAEPo1LxuzCpel0=;
        b=E6XRLJ2TrVKtIvrEB5iIdvZs4QzJ0b1uhjFvM4sbeYiD1SEv/u2pRIDTG6BEDe9L9S
         voSEOUc5goLBCGBrrG4+UhYg1FNORIntyhQFweuWSK/gTRbk3rTjML/Bm1PN+1bIbqCV
         dfWYoFsGCKb7mCony/G3IARHSjbZ/Ez2a3nrnEpt19yjNPfDi5kJOlMh65ahQdToRjFw
         Dfy6jk/YsLlsvol5iM7RoJRlf2K1InQacGTYNAI1P7XOHBfIg9ehUP8eQlRg4z3z02po
         fR06epRy2idDWNOdV18HE4Qutd+LTCR4YHcpId6CZ+WgNoJI3ZBqbeq+YbqVepZWiZui
         n0Yw==
X-Gm-Message-State: AOJu0YzCODjFHgE4b7oUH0oBndNLcvQvG6vVWFX88onf7JDY2NvyZpje
	gBcmAyh53UBVbGV7sgSQ+WW/ipD5G2qJ2L2exX54HkcgBwD2VzlIr8kQPDjfLw==
X-Gm-Gg: ASbGncuCw6HVrOvCI1nf50rpuMsn31ZWoiYXOhzrPeE1G7lJAa7crtUKrYHhDiDWuGj
	TunPhypEBfXUzVMhFU+IRUytPm3sEMYmlfPWkF8ha5duhEebLAYE6Mf4DmvZvMkGk8IoTlA9/P/
	U+ULzvofdPvSFB5DaHczSZyzAEJeaV4iujUmpOapYNWHDAc54uMvmF0AWJZZciZFxYkL4Jnx+bh
	Xcl5ifTcHlPR+rh/s3agOQZCo0IG6nZ33aCA4jAQXvyvx2Dd2KXCrTdTFqwX2haQhAoUdnicArN
	3RvACIkZX4RQRT/dKl8MBeRPiC1LlFVgYU2aNnTOG8JTsXuGnlQWWNR71xPFEltRSPV+oQ6/+Td
	TPkAXe4pXksjQ4bQnqL7dgtuukA==
X-Google-Smtp-Source: AGHT+IFan6OkyEZD6voGeJBUH5jrx9SCibMf1/89x4IprZCQ0mAzCiwNwU+596GFNIGQ8JZgke35hQ==
X-Received: by 2002:a05:6402:90d:b0:628:f23f:1cd7 with SMTP id 4fb4d7f45d1cf-628f23f2672mr6270243a12.23.1757438241258;
        Tue, 09 Sep 2025 10:17:21 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62bfe9a01a6sm1574176a12.11.2025.09.09.10.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:17:20 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [walnascar][PATCH 1/3] license.py: avoid deprecated ast.Str
Date: Tue,  9 Sep 2025 19:17:14 +0200
Message-ID: <20250909171716.1588271-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223124

From: Martin Jansa <martin.jansa@gmail.com>

* it's deprecated since python-3.12 and removed in 3.14 causing:

openembedded-core/meta/lib/oe/license.py', lineno: 176, function: visit
     0172:
     0173:        LicenseVisitor.__init__(self)
     0174:
     0175:    def visit(self, node):
 *** 0176:        if isinstance(node, ast.Str):
     0177:            lic = node.s
     0178:
     0179:            if license_ok(self._canonical_license(self._d, lic),
     0180:                    self._dont_want_licenses) == True:
Exception: AttributeError: module 'ast' has no attribute 'Str'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 6f882c3812..6ff7688d22 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -173,8 +173,8 @@ class ManifestVisitor(LicenseVisitor):
         LicenseVisitor.__init__(self)
 
     def visit(self, node):
-        if isinstance(node, ast.Str):
-            lic = node.s
+        if isinstance(node, ast.Constant):
+            lic = node.value
 
             if license_ok(self._canonical_license(self._d, lic),
                     self._dont_want_licenses) == True:

