Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BE8C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 16:36:49 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19.1787416599567827442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 09:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZZxt5dKD;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: iwanicki92@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso3578131a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787416597; x=1788021397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbT+FCtzRJcOqUbtPahJ2zw5XEIjKhdoKYowTW07roo=;
        b=ZZxt5dKDEjfrLCxNBDCmnGC00Lfrqwy4gC56r3ONaVAczYzm0UPjeaTrvK3nIgIqB3
         2yKfziv3dKAwPNGRFh/Fll7Z0sX+OrZ8wHpEOZBDXJyKQSPszDXxbK01O3XVRbZMOz/y
         1QnulkqUfsduuV6WFf7GQD7V31vGGMPv+J36X+KKwfa7aEMsm4n0zVdBAH7f3Se0Lwb6
         JMSoAlCFUOkrSh5WXFCZP/x8VLnzRS2BKz1ROtykMaJHisXmBeUQ6dJP6OvcIMOkdsMI
         Q18zqoQvxaALzLK04MBPmUp3jXVA/vIS/7vESBl/6RdxYIt1BpB5lO+1honsOEd3Yz65
         l8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787416597; x=1788021397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JbT+FCtzRJcOqUbtPahJ2zw5XEIjKhdoKYowTW07roo=;
        b=lN1FV2H6I5RHmdPZHZqBV87VmF71RHWgku8jt2WOicir2rIGwnGqUga8wW+FE/Di9b
         JYWyP188tSI0PWpQL308vYiQWxRUFLZZH1ERGvX6rWA8lu1rgYvU1aM/UMgPPArVw0RJ
         uodQXdIiIKebgPre0uph+0V1koUqqow5JvJDcKA09XQLS7OnGghK57jphMJ0Z7V0NYcS
         7O45IUW7EgxIRXJCIDftaxc8dxCkOG5nQRN56ugPuKS6j3qb72t8NK2K3sa453pimbRE
         5VX5JqXFKHaYmig2V81ug1ngEzHjZQHhReFmgs9BdpfdMP+e9rVqpnDf8TiRH81jRblT
         UvUA==
X-Gm-Message-State: AFuF++mBJC2NA0xGRJkohTZXRm24VHxtykKGpN7yiQ8L53p4oasZlKYI
	BJYvihKGzuzYSWKElDXTxCBKyGcKQHfg8LcCj4wnLNPWo5oyJB1z9oodILKK4zlo
X-Gm-Gg: AR+sD11eUwzHkXUfKNk0jJV5nZ3nktDa8Worktoydh7tcBBTac0ODhW4bSrThhFORdt
	qvIIqXMB/Wc3eDId5fI3tDk3VKOGf4k2yvHAVk1w5eryYxhHRsqawFW3h9criGgYRMjXEtz0IQD
	m2bQl73/A0AczucSYnb7qB5121ejUgq8yBnVVk4FpSMhZcb4tQEmx0GseFWJoQatCDeBzgJvw/o
	OFBqo/0zcOWbYy1aLxSpSP5l/BZEmp2OeGTz7dqLwTmw/CZPgg3Z1I768hIndMjViL97srcMNip
	tZw1OU//VIP6DT9RRBUfJrnZIVOG/sRbIZuy1rtGCa+Rhg8MklTHe78RUtQuNGKgsekyEpVs2Fl
	3PeP9UwWluUcPzeqNA3OarbpcZHZrfsQZw9wKh/1jUlCPMZ5VAhrHrEy9QvcZkIqs6NPwyqlx9Y
	fvVfvgbyGJqDYBnaKEkuxt/+VVLZCma3pDWYzcKxHDJQOg3MLee+v4V7Qi6oiJ//DMI/w=
X-Received: by 2002:a05:6402:1f0d:b0:69f:b1d3:3903 with SMTP id 4fb4d7f45d1cf-6a582b2667cmr7618316a12.8.1787416597277;
        Sat, 22 Aug 2026 09:36:37 -0700 (PDT)
Received: from iwans-fedora ([2a02:a312:c8bf:9d80:69ba:755e:25b5:838e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9f4asm12896298a12.3.2026.08.22.09.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 09:36:36 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: spdx-3.0: add missing vardeps
Date: Sat, 22 Aug 2026 18:36:22 +0200
Message-ID: <20260822163622.285515-1-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 16:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243990

Add "${SPDX_IMAGE_SUPPLIER}_name", "${SPDX_IMAGE_SUPPLIER}_type",
"${SPDX_PACKAGE_SUPPLIER}_name", and "${SPDX_PACKAGE_SUPPLIER}_type" to
respective task vardeps to make sure SPDX is regenerated if those
change.

Signed-off-by: iwanicki92 <iwanicki92@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 4 +++-
 meta/classes/create-spdx-3.0.bbclass              | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index cf79ef5b013a..faf4eef8a9a3 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -57,7 +57,9 @@ do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_image_spdx[vardeps] += "\
     SPDX_IMAGE_PURPOSE \
-    "
+    ${@'${SPDX_IMAGE_SUPPLIER}_name' if d.getVar('SPDX_IMAGE_SUPPLIER') else ''} \
+    ${@'${SPDX_IMAGE_SUPPLIER}_type' if d.getVar('SPDX_IMAGE_SUPPLIER') else ''} \
+"
 
 python do_create_image_spdx_setscene() {
     sstate_setscene(d)
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 56fd01fd533b..6c5f84db1ef3 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -253,7 +253,11 @@ do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[deptask] = "do_create_spdx"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
-do_create_package_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
+do_create_package_spdx[vardeps] += " \
+    ${SPDX3_VAR_DEPS} \
+    ${@'${SPDX_PACKAGE_SUPPLIER}_name' if d.getVar('SPDX_PACKAGE_SUPPLIER') else ''} \
+    ${@'${SPDX_PACKAGE_SUPPLIER}_type' if d.getVar('SPDX_PACKAGE_SUPPLIER') else ''} \
+"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
@@ -290,4 +294,3 @@ python spdx30_build_started_handler () {
 
 addhandler spdx30_build_started_handler
 spdx30_build_started_handler[eventmask] = "bb.event.BuildStarted"
-
-- 
2.55.0


