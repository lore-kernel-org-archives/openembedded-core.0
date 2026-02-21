Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8FBC5DF8E
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14438.1771647873723624197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i7WYawgc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso20004825e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647872; x=1772252672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0i5SUA9+DdN+UBmjiT9Uh/B+IelUJomMGl6PbM+Yjc=;
        b=i7WYawgc5/wmVw242i8TLlOgiD26FqpPDyRkvZgEa3OIfyMAVvfdqvzHA+dDlqjwhL
         wKy0HdLFlLC9sbwLTXta/2dNJHtI8Ib0eEH/oPhYM1TcF6bj6UpkQ3Bxs1/DmgofxzK+
         tsrpN99Qe5MYO7BOT7JiPp4AnF1sLsMS908gMd/2i851E2+MzfszPP9wdSl9s4p3md7x
         9zelVp/t8u1coeMZqWxU2IYm+OlY1RqHrlZNlzb9NABDd+uaTxtDyQkVexjq/v6lZ1Qa
         6yciNpZcI1qLldRozn84/RrpPB9EfNE0qZdwSQYXZI3MAcHHKNB2LF4G3tL5Y6ixsjae
         krrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647872; x=1772252672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0i5SUA9+DdN+UBmjiT9Uh/B+IelUJomMGl6PbM+Yjc=;
        b=gi8hkpy7bcqHZzZcLr/CytJO9yEiHOF8+UKrqq7xanM1NnMOMujwflOLpogqx6NiCa
         iluW6MYIdmVZ/AOe8oCSUwTyNVHECdYw/wZQk60IKWklV5Z14u6mOTx29iT1LV+Gu+28
         tpqetmYs3FnexkFiOHntZAnLflB+Kt4c8bIjui8hjfh8JSNdChojN+KjqDQmewCkl6Vu
         QizTew7ST7OkC5GoCYY9f4jtc4oFFrFQOiek8Oewccp/ij8gQHYCrlSTxRcFHRFwDihH
         IDsRgTR75UTb0UejFSEVhF54YPQjldE6NJNutMnDW7yKHW65o5C+hDuz4sm4UBQ193TU
         +1wg==
X-Gm-Message-State: AOJu0YykB8+lQvidgM3jRsVa6rxFshrg8XTOkX+q2wPVJX4KJjMJFnmD
	mleYrDztVG8bvbF1mMzU1nXqyZK+PIRwoHClueCqMqEKqCDP58qDkF3x6r/bvA==
X-Gm-Gg: AZuq6aKvRPA/vdyTqO/t2J/ilvycujSzA+PfBqungzKJDs7HKnyXLrP62yL34dwNX88
	ULwWXousiFAXXWlP6pPDC9I41IQTm4im39ThC/r2Fxtemlzi4WbTnqV1stlrwn7J6dG3Yshtnjm
	O+Yt2MmztoUKgVsKcZ7hqRu0rKPe9X2wxhtZ2BlOdhsn1EqSF+Hdco3a6Gys+RZHIm7/DmFnbY6
	bENbBNkCWyjAcQ2qjNvBSDb61S71myYnnCNowpnlvsmR80x4ecGoQ8/vSBuQmcbEDwWf3ikx646
	r73Rx1ZZgQa04uhVLpGTPvAi0WiZU//xnJhAWP648nqWpU2Dweqq4pHzbxcVch6NAc6CDqpR6Mp
	lG1YYjHE7jF4mAGW8Ro1cbhwG/S9ZI3QUgYTtRMXwlJFJYd8sUOZFfIWjPGlgSmo3iGXkn+5eba
	WhxoEaBUuHTZVLC9wZJd+twpAjq1JFhD6GWBM=
X-Received: by 2002:a05:600c:8b31:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-483a95ee684mr30112925e9.34.1771647871404;
        Fri, 20 Feb 2026 20:24:31 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:30 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 08/14] spdx30: Include recipe base PURL in package external identifiers
Date: Sat, 21 Feb 2026 05:24:12 +0100
Message-ID: <20260221042418.317535-9-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231564

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Include the recipe's base PURL (from oe.purl.get_base_purl) in the
external identifiers for built packages alongside any PURLs from
SPDX_PACKAGE_URLS.

This ensures that every built package has a pkg:yocto PURL (e.g.,
pkg:yocto/core/zlib@1.3.1) in its external identifiers, improving
tool interoperability and supply chain tracking.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9f5a37b8bf..ef47bd4205 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -853,6 +853,7 @@ def create_spdx(d):
         [oe.sbom30.get_element_link_id(recipe_spdx_license)],
     )
 
+
     dep_sources = {}
     if oe.spdx_common.process_sources(d) and include_sources:
         bb.debug(1, "Adding source files to SPDX")
@@ -886,6 +887,8 @@ def create_spdx(d):
     debug_source_ids = set()
     source_hash_cache = {}
 
+    recipe_purl = oe.purl.get_base_purl(d)
+
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
     # will write out the final collection
@@ -953,7 +956,12 @@ def create_spdx(d):
             if purls:
                 spdx_package.software_packageUrl = purls[0]
 
-            for p in sorted(set(purls)):
+            # Combine SPDX_PACKAGE_URLS with recipe base PURL
+            all_purls = set(purls)
+            if recipe_purl:
+                all_purls.add(recipe_purl)
+
+            for p in sorted(all_purls):
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
                         externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-- 
2.53.0


