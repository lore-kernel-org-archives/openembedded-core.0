Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D21827807C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:31:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e64so9205787wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Eph4G715c81cmC/mNuOuJgccjqglhqWwoSLlOlu0TzQ=;
	b=ALyj+nn6l3nUEKlTnTyiU3ovqhrz7F+oU7KspeIdHsC9idUHJ7McK4NFOIz0h04UXi
	KDoU/T2QTx4XNV0MTevH+3PE+2GHTsh+V+gwv+7Br2clB5l0cYIl3uuAhQj8l24JxU2n
	zLUiiTdLjyUmF0kv/nVyhjMLsfz12KJF7cw1/sEwGvXDIP7PZTzfmHDk7MK1fmePGL06
	J3eq/SWFkh3ArM4S8eQr/QbD9KMFryWjseMQnMdKrlfm/N5g5MzZZ5WMbqLAdmRgZBgx
	dobioMu15Ouuq/8IY8a7grL9h68Ul90X8fiWxPt/kE6Y+vgpY17CIDQDtshFKN3ot4x3
	EY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Eph4G715c81cmC/mNuOuJgccjqglhqWwoSLlOlu0TzQ=;
	b=WzvtIPmBPgAZXhLV+pafuUg+dEWb/pbvDHfytIwBYP+lJC/nfJfhwuA5lfhQLcPVeT
	SdYUz4V+NxmApLjX1iqmGprNBTPtqynkGPrsCSp1EknJBWCzZsXHZYSZBQU2p7BWJJpU
	UnIWo+RgJ7Rq1Gohx2hARnYgtJekEOHzV4lfnx59LpqJfcWwWSWujHxpPlaNacy3gSWh
	3T3/yGQZIZ+qx6S6KyYtfiO0UCHrAONvQKumpKjZ/JSrWNivxxT+0aIGGynyCKOyMVnI
	8jWHMQ1rI0k84XKgHCvAjMGM3zdrZw9B4NCsXG8rkhLAJKfZOzuXvpVnFFILs2ZVNH0M
	otxQ==
X-Gm-Message-State: AHPjjUilPh8xnz6v92bq2BL5JfdKqPUdfJHzJkwcHRgR+a+8RJGQZb7o
	592V5vWA5GxG6urHkDI4t5Puiw==
X-Google-Smtp-Source: AOwi7QBMHhtLSn9Q7CuYr5FjFZoWyk0SSJMM2BrsgiOxv6mKsew6AbjRqxcPr8DGGksbB+/6Z5UyTw==
X-Received: by 10.80.137.173 with SMTP id g42mr17305764edg.80.1506429089327;
	Tue, 26 Sep 2017 05:31:29 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id d21sm5716453edb.4.2017.09.26.05.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Sep 2017 05:31:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 14:31:16 +0200
Message-Id: <1506429076-9750-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] image.bbclass: let do_image depend on do_populate_lic of EXTRA_IMAGEDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2017 12:31:29 -0000

From: Ming Liu <liu.ming50@gmail.com>

The licenses of EXTRA_IMAGEDEPENDS recipes are being referenced in
image postcommand write_deploy_manifest, but a dependency is missing
between do_image and do_populate_lic of EXTRA_IMAGEDEPENDS recipes,
this leads some license files not present when write_deploy_manifest
runs, hence will cause build errors.

Fixed by letting do_image depend on do_populate_lic of
EXTRA_IMAGEDEPENDS recipes.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0d14250..6bc4f04 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -145,14 +145,18 @@ IMAGE_TYPE_wic = "image_types_wic"
 inherit ${IMAGE_TYPE_wic}
 
 python () {
+    def extraimage_getdepends(task):
+        deps = ""
+        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
+            deps += " %s:%s" % (dep, task)
+        return deps
+
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_lic'))
+    d.appendVarFlag('do_image_complete', 'depends', extraimage_getdepends('do_populate_sysroot'))
+
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
 
-    deps = ""
-    for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
-        deps += " %s:do_populate_sysroot" % dep
-    d.appendVarFlag('do_image_complete', 'depends', deps)
-
     #process IMAGE_FEATURES, we must do this before runtime_mapping_rename
     #Check for replaces image features
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
-- 
2.7.4


