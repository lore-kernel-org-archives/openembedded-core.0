Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37038FF4925
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38743.1774824392969133131
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3OJ0aV8p;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so29222485e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824391; x=1775429191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9l50duf5zEDAhHdXAmfFwGnkBPanJVJv49TAJEdyPQ=;
        b=3OJ0aV8p3PZyo1FBpX7kb+3dS9hFKFZhwBABEp65cfbbAzo1rphCyXCc0SRwSxvpVA
         8q5a12nHGaJKzytfhJYLQ95GhAIdom++RgqeNj/Md7F/xwCOEKacuxKRAHQgzS63GgfL
         NldMGDnbO4aaerHxM1aPjeBfup6m7eUfNSTzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824391; x=1775429191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9l50duf5zEDAhHdXAmfFwGnkBPanJVJv49TAJEdyPQ=;
        b=rUAGKS9r6QcLbHN180jXxTr2UDTrzqpREN3IMotcghyytvRsbR4Xkh19jAZUVbuEki
         mpZu4WI+9w5KMDN8i7UzjGbfVmp7rsXIwb8N4Lfvs+eDwMa6qGzXI/vx4P/tlTA+eqKn
         S2PDwhZjxw10iP0NkmQo0BmSagwLINGSTlOn31KYpC9tWAMDAdw5xSv31JzN7qB9Fc6C
         2BRpE9OgJMUSF+0eovhU+t0RV6bbd3NE4ezUSunLOGyPVnMktgSXu5pWnS3l+EmMjBD+
         hGVrQs2zg9j7whk8FQeIBjGn9tycruVEv1DF1BX1PjAUzUL+sAIv5jBBpqe23ag92Zvn
         zNzg==
X-Gm-Message-State: AOJu0YzJoSBqTB5Lbbx+NTjUjyDsrxwe82zBJLwOvt7oWQm3FxMiJMuF
	wsThh02bpPGilgV0b9gzd5ro++gSJr/zysWyv3JqQYFqHrsuDABUAzZ4s+Jd/JMB3MpiRzDufGk
	ThCE/esc=
X-Gm-Gg: ATEYQzzUrMfIyeXpC+73YCGV66/pUmDlnGcvBrjiK3S3HEw+jMxpfnkO41BQCpFUlnI
	sLrprOByCDOLefyqTwunIuUuWrCC4YlRvYAtYbfOCdQpBQs8Mm+shfbKbDKdTY0Wz2sKM05ZsoU
	5GLKsvWldffKLP26IWyBEGhF7U/Thl7qlO8GpjI1q444i1X4Jk9KVeJo4DrF4XVB02vhXRk+RIp
	SIOhpDPrcNTMYu7LS7fcCTKbym/JXI8aEvq/Z8HS/F6MJoIg2wwlJuKDtPOkz96WmgkGPaT8MVt
	fkNmr6SHBBJii+BQSmJcdjK7jFKGL5wARPDLAlSJs7FyOe2BKW57YN39JbEvKaLHr/kB7uP3YD6
	2rkxZ+CyZD4W3WgtbjiadYLhimXqTlt63fwxRTytqQ3l9Iqi1cg374kA01rVBgwdnEjixphBi0C
	Jo6oi0X9KRu45e8wm5mZL0BNCURuqmWVZTMuQ6fmRmHLe4d7kR/YHpjyDMB8fMuAeka0dAepTsI
	8OWwebqxSxWVivAOGTHfjMxrH8=
X-Received: by 2002:a05:600c:3d87:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-48727d59da0mr175629875e9.1.1774824391034;
        Sun, 29 Mar 2026 15:46:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] spdx: add option to include only compiled sources
Date: Mon, 30 Mar 2026 00:46:10 +0200
Message-ID: <50390bb45db8560bc9d2ee3ad37979924e0046c7.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234184

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx size is
reduced from 156MB to 61MB.

(From OE-Core rev: c6a2f1fca76fae4c3ea471a0c63d0b453beea968)
Adapted to existing files for SPDX3.0

Tested with:
- bitbake world on oe-core
- oe-selftest --run-tests spdx.SPDX30Check

Regarding SPDX2.2, the respective backport was already performed in
OE-Core rev: a2866934e58fb377a73e87576c8594988a63ad1b

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/spdx-common.bbclass |  3 +++
 meta/lib/oe/spdx30_tasks.py      | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 713a7fc651e..ca0416d1c7f 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
@@ -40,6 +41,8 @@ SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
 
 def create_spdx_source_deps(d):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8970dcca0f..9c422d17573 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -145,6 +145,8 @@ def add_package_files(
     ignore_dirs=[],
     ignore_top_level_dirs=[],
 ):
+    import oe.spdx
+
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
     if source_date_epoch:
         source_date_epoch = int(source_date_epoch)
@@ -156,6 +158,11 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
 
+    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
+    if check_compiled_sources:
+        compiled_sources, types = oe.spdx.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -171,6 +178,11 @@ def add_package_files(
             filename = str(filepath.relative_to(topdir))
             file_purposes = get_purposes(filepath)
 
+            # Check if file is compiled
+            if check_compiled_sources:
+                if not oe.spdx.is_compiled_source(filename, compiled_sources, types):
+                    continue
+
             spdx_file = objset.new_file(
                 get_spdxid(file_counter),
                 filename,

