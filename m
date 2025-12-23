Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D39FE6FE3D
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109353.1766524985201633559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pNX73DIv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a1388cdac3so50541225ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524984; x=1767129784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3VYeWCgSEDULDobV27JF6i+q8ZN9cqqBHpHKsoC1N4=;
        b=pNX73DIvzFtlOgDIeU8HC2mKvqGDQzSBjT3L3yuhN7SnUXPU9mikAiJY+Ch0OyPFZr
         LbxxoLqVw5s8Ggx44DoPN0PZAeVkL+pz7EPEE2o97z3+8Ie0cDmcqmOIyjGkNMI+uKX7
         UO0Q1C+KvMUdmn7xPWnaY2MDxZ9MrcFW1Xp0N0fEIii2pYaFEzwO8UXRUxMJlDhdLwLf
         LM+VcjIEIYPS64toVJx2u0F1m80j5eAh17OI4/lOs1Suqn461awz3aJzF4ZghNX6zJzx
         t9fS6UYO9gSh+SS39xPjktyGlH2LNar2AuLSUZOfS3oWkLPcTjubv3OVYWVeJUYUkX49
         iz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524984; x=1767129784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3VYeWCgSEDULDobV27JF6i+q8ZN9cqqBHpHKsoC1N4=;
        b=FOCh3w4PXwlNzXgKIBvRTFFTiKHcCv70VqGLR4Kalr1dgLRUNKRRhHXLCPefMQ9Wip
         AWqONeCIMlS0WWdTPoEGwDxgWRT2Jsj0j8Eq0z4J5T7e519fA5apeesMes6fx/Z/b4Zs
         MFo/bXiClZZ8utTYut3HGKkykJ4S9fZwxfrZ/rXGSIGyV6BkGkHI/YwPzMUxdzfC0RkT
         rN+fhPexSXG/cVcPiyj1XiUPcrflLGGJpaMBbKbG2yKQPraD8CmLfmvECyXU7vsf7EBQ
         6EdlgNL/+iir0mT/ZdzT0txZ9VHmtsRfny7FFQ5+TQ0bGhRShwV0H+3DXnIjE+6dOl1b
         sP7g==
X-Gm-Message-State: AOJu0YzWgdeiqiYnB2ZyChA0ktet8htVWzdbtG5vWXNk9wCqv6H+aZ00
	QWtrR5sdy3sImLVhurG3IRYW2G8JBQfRLV8sLfrc/OJ/tCnlDafTSIcbLAtA3AmLG2xAeL2cPgi
	TtNUn
X-Gm-Gg: AY/fxX6ijhu8W16eDoiIXpjOMPfeNLWrxPNZ6PMnlAswJv6GfBGn6QLwN0hrMn98G8a
	evOc0F0Xma4ME208vps3qFaB0VDgXSHxxXTDK2sB1KSBJPNszzfBetKwFi3FU2GblaDt5a3Zco2
	agV8akmtnuu9Fk8GUn+fvjUvxb5B3CfKFIhsPBhamznA0r89aEXvCFgVPKB9aVdQ72rL78//c3Z
	dc+DaPp78ux/yCeoB7W9Rnncp5KtXXn1b4vnzIE4ZLoYMiCnN0CcJQdWih8TZHLfla7q232E/aW
	sYXl9PybV3vQ8ZQOetcOsP0c9H+YRafmUPfWuROrmFGpw0Z4ccbUAwDHtRD25hYhhLyp4j4o68s
	XLRB3aKbJU+OgOJFG+kE2e/1u5wKI6+s8fBy41s/ioAoFYxzSVXbU2yQd+3YBRuchtw3HVa6Pq7
	3Ddw==
X-Google-Smtp-Source: AGHT+IH5DIBpI3rMrIAwKgS8LM4TMp8EOesE8iWiODHrYjHTfqQMI0A2gL2s3sPFJBaKKG7oYNowng==
X-Received: by 2002:a17:902:e846:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a2f2a3587emr125292975ad.28.1766524984344;
        Tue, 23 Dec 2025 13:23:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/18] spdx30_tasks: Add support for exporting PACKAGECONFIG to SPDX
Date: Tue, 23 Dec 2025 13:22:20 -0800
Message-ID: <5cfd0690f819379d9f97c86d2078c3e529efe385.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228488

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Introduce the SPDX_INCLUDE_PACKAGECONFIG variable, which when enabled causes
PACKAGECONFIG features to be recorded in the SPDX document as build parameters.

Each feature is recorded as a DictionaryEntry with key PACKAGECONFIG:<feature>
and value enabled or disabled, depending on whether the feature is active in
the current build.

This makes the build-time configuration more transparent in SPDX output and
improves reproducibility tracking.

This makes the build-time configuration more transparent in SPDX output and
improves reproducibility tracking. In particular, it allows consumers of the
SBOM to identify enabled/disabled features that may affect security posture
or feature set.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ec61ac40345a5c0ef1ce20513a4596989c91ef4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-3.0.bbclass |  5 +++++
 meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 15c31ba9a3..6125e8b547 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -56,6 +56,11 @@ and each CONFIG_* value will be included in the Build.build_parameter list as Di
 items. Set to '0' to disable exporting kernel configuration to improve performance or reduce \
 SPDX document size."
 
+SPDX_INCLUDE_PACKAGECONFIG ??= "0"
+SPDX_INCLUDE_PACKAGECONFIG[doc] = "If set to '1', each PACKAGECONFIG feature is recorded in the \
+build_Build object's build_parameter list as a DictionaryEntry with key \
+'PACKAGECONFIG:<feature>' and value 'enabled' or 'disabled'"
+
 SPDX_IMPORTS ??= ""
 SPDX_IMPORTS[doc] = "SPDX_IMPORTS is the base variable that describes how to \
     reference external SPDX ids. Each import is defined as a key in this \
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e425958991..a3d848ceb1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -809,6 +809,26 @@ def create_spdx(d):
             sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
         )
 
+    if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":
+        packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
+        all_features = (d.getVarFlags("PACKAGECONFIG") or {}).keys()
+
+        if all_features:
+            enabled = set(packageconfig)
+            all_features_set = set(all_features)
+            disabled = all_features_set - enabled
+
+            for feature in sorted(all_features):
+                status = "enabled" if feature in enabled else "disabled"
+                build.build_parameter.append(
+                    oe.spdx30.DictionaryEntry(
+                        key=f"PACKAGECONFIG:{feature}",
+                        value=status
+                    )
+                )
+
+            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled")
+
     oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
 
 
-- 
2.43.0


