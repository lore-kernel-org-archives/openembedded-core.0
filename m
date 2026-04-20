Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9B1F36C5C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:41:00 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24400.1776703188828676149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iGc8yLO3;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b2503753efso31988675ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703188; x=1777307988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk0qKtqQpBNFCl2n1XH/HW29hDYIDRhwJN3jJT1on9Q=;
        b=iGc8yLO3hgUuBKXZvNJOpZsi+DMGK0/Zf9H2zFn9tRP+/wY0BFWamZYNeM+OkQKXlp
         RmkkpVH2TTRzZZKPR5DB32heJ5xGQ7LSpMxRGaNUyAjoAnMSbtK3q0FXi4tzWo/0RZOe
         jEn0XT0y6ydN/xtq1PfzCBYyVbn1P4/7o5BPFnAAX5ER4/SBusxZKWYZq9ljC3X1UPjG
         VefQp1q22HkydH8TYslPJhkOtjz7oIJedLcifgskgUeGzZ8zJv+2yErLGNKP/cKgeNWd
         +c8Qh68zpoPOHKyakaD8hJYlMLgS4qo1vTSK30qds98M0fdb8bwAomRdZ5Wiincn1yOq
         e05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703188; x=1777307988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vk0qKtqQpBNFCl2n1XH/HW29hDYIDRhwJN3jJT1on9Q=;
        b=D6FiI5KcUwNKoTXTcAiWb2xiCMFfxFBr+UE6Hw/IdommfDt0D2K2tvTuANmAjvYh47
         Z3RnxPebm0ixuyeOmT9rSg2FPu50/NRhpXV+cv69beqyUVyIp7KNtEk/BagBIE/FJXjZ
         Ozt56JyEcsUgD5T1KRNkVeTUQFR/0t2YJSs20K52YOdh7KfdeSyDEYpwawiA0wBjKCHK
         ukT89Q5FkWwEwwdIJrX3Hw9aMRBaPGjztpdPoPtK2zwKvXuBs9hbh837zYcOSmqfOrRT
         zEqjjXs6nZpO7xIAVHjlRH+BkNRAO8bHDcu3TBbU2HHC8sEbd01xQUywbipNF5CREm7W
         9g4A==
X-Gm-Message-State: AOJu0Yxm/J77dOIK/JHeQ4NrtzsWYr2PGJnd9TuW1NuGD/9gdff0BByV
	Q/Alxc0oeKi50B3PdS7BjMbySLH+3C9Xc49qXbO2Vw4LGoXCOQvsjHIfkgJpzA==
X-Gm-Gg: AeBDiesaSi0tJKYRiDj2yoXz4n7Bad+iPnY6EIFvXFplbCc1jXnyG19Su26l+ttdoFU
	vVXV4jOiBTcn7tx2JnuigzF8VPqx9069ozPzILrAbnd/s4WFJHPtFe8+HENpZn7wDvadA35voGv
	w3vG7ryt7+sUlLiXBY05PJbTdiYCidqZr/HxRkX+ltDtrhMFDe+bzil+FkhuNn0RfE5UbSIntTw
	nDJSK5ZAXNu34SQnXt+bbUdPkjABqtfXzKEQHUTOFj1t6qogus8tFjuKoxiJPryb7Yo454I/qOH
	o2+pRmjLzGt7eIHwwo5N0JFOD207xMxta06M8Z0lMrM/rCuWviw9yuKQrfQ1ITzLCDYVecvlaYr
	o/mmprZmw09ZZ0It5N0zwASHTkacPscWfkDZNQ7gnd4vTqJdcbkhwNL0Vk8Xsd5O4p9XB6ODiXm
	qBCJ+kBfdBuTRg4oYTA4Rl0YPXaiRee3eWSSUWL6frjoQClg==
X-Received: by 2002:a17:902:aa47:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2b5f9fd69d0mr116081865ad.39.1776703187984;
        Mon, 20 Apr 2026 09:39:47 -0700 (PDT)
Received: from localhost.localdomain ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm129221105ad.6.2026.04.20.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:39:47 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [PATCH v2 3/3] oe-selftest: add test for useradd with only USERADD_DEPENDS
Date: Mon, 20 Apr 2026 23:39:40 +0700
Message-Id: <20260420163940.182918-4-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420163940.182918-1-zizuzacker@gmail.com>
References: <20260420163940.182918-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235579

Add a test case to verify that a recipe inheriting useradd with only
USERADD_DEPENDS set (and no USERADD_PACKAGES) parses and builds
successfully. This validates the fix in useradd.bbclass for
[YOCTO #15863].

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/usergrouptests.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index 3c59b0f290..69025a59aa 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -55,3 +55,9 @@ class UserGroupTests(OESelftestTestCase):
         self.write_config("USERADD_GID_TABLES += \"files/static-group\"")
         self.logger.info("Rebuild with other staticids")
         self.assertTrue(bitbake(' core-image-minimal'))
+
+    def test_useradd_depends_only(self):
+        # Test that a recipe inheriting useradd with only USERADD_DEPENDS
+        # (and no USERADD_PACKAGES) parses and builds successfully. [YOCTO #15863]
+        self.logger.info("Building usegroup-deponly to test USERADD_DEPENDS only")
+        self.assertTrue(bitbake(' usegroup-deponly'))
-- 
2.34.1


