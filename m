Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7645CC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 11:25:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.7869.1643887537652454750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RA1xBYbO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so6894948wms.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aisA4YagptynWmHX+LU2NfEmHtQFXOGgvTy2sT5SOCo=;
        b=RA1xBYbOqd/c4wM6KWRzs4osawEfctg3B3uji79pTLYl+qsXZHyn/bE3G3Tg6tRpYS
         NBwofYbLvle4MQ+u56COTiBN4CPsn21MEt2siKMh5kqBnzQ1dngBXnKi8ann4N4Clag8
         SAYSjiYchF7w/J8nbf2l/l86oUFSNOjh22CTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aisA4YagptynWmHX+LU2NfEmHtQFXOGgvTy2sT5SOCo=;
        b=WVOnnFOM5nmntJgXrVdx/WoJLRIp4uVn61E84FRsCwye9i3BCIBm3Z8EkDA2TiJqy/
         s72jYofjPMp+hBzUxYr8XiF1SPXB2py0fOMaHtTukoU/rBn13DFhhZ+JyEQnWce1VMon
         tZB3mYZoUPxJOK6P3MHZIGigdZR1X4PrOjcsvImIU7gG+ihUtqaZ9ws0tPr9huMax+pf
         g5c9lkuYdQoOopMt8RbhCK5EaWETRvO9HZ7+FQKtqxw5D2Anm/Sj2t/uTiDrzMOjcjSg
         efD5uCggmLApAcHTDyK576+bROasgcW5NtQs09BT7ECNjgYDARkDpl3hyRX6bIBtcTAx
         AVcw==
X-Gm-Message-State: AOAM5304o/+L0QEEvP5yL+ak/KoEEC9BpxbQiGBVwVw01qsHCsxfkMIw
	PYiz+L19ch4QqV8z3kJjhdaqNuaUJ3vLEg==
X-Google-Smtp-Source: 
 ABdhPJyuWLpX01P4HqRAYqXzgOImbmKS52+7XuCO/PQsSgUB/S5DkZzax00Aamwdq4D4Q4mI/QuudA==
X-Received: by 2002:a05:600c:20a:: with SMTP id
 10mr10306047wmi.19.1643887535570;
        Thu, 03 Feb 2022 03:25:35 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 o3sm19467994wrq.70.2022.02.03.03.25.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 03:25:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] staging: Add extra hash handling code
Date: Thu,  3 Feb 2022 11:25:33 +0000
Message-Id: <20220203112534.2389621-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 11:25:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161273

Target build output, stored in do_populate_sysroot or do_package can depend
not only upon direct dependencies but also indirect ones. A good example is
linux-libc-headers. The toolchain depends on this but most target recipes do
not. There are some headers which are not used by the toolchain build and do
not change the toolchain task output, hence the task hashes can change without
changing the sysroot output of that recipe yet they can influence others.

A specific example is rtc.h which can change rtcwake.c in util-linux but is not
used in the glibc or gcc build. To account for this, we need to account for the
populate_sysroot hashes in the task output hashes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass  |  2 +-
 meta/classes/staging.bbclass | 35 ++++++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 17dcf4cc175..fd9acbab9b4 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -94,7 +94,7 @@ SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
-SSTATECREATEFUNCS = "sstate_hardcode_path"
+SSTATECREATEFUNCS += "sstate_hardcode_path"
 SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 25f77c77350..3ea9c974eb5 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -21,7 +21,7 @@ SYSROOT_DIRS_NATIVE = " \
 "
 SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
 SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
-SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
+SYSROOT_DIRS:app:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
 
 # These directories will not be staged in the sysroot
 SYSROOT_DIRS_BLACKLIST = " \
@@ -624,3 +624,36 @@ python staging_taskhandler() {
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
+
+
+#
+# Target build output, stored in do_populate_sysroot or do_package can depend
+# not only upon direct dependencies but also indirect ones. A good example is
+# linux-libc-headers. The toolchain depends on this but most target recipes do
+# not. There are some headers which are not used by the toolchain build and do
+# not change the toolchain task output, hence the task hashes can change without
+# changing the sysroot output of that recipe yet they can influence others.
+#
+# A specific example is rtc.h which can change rtcwake.c in util-linux but is not
+# used in the glibc or gcc build. To account for this, we need to account for the
+# populate_sysroot hashes in the task output hashes.
+#
+python target_add_sysroot_deps () {
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+    if current_task not in ["do_populate_sysroot", "do_package"]:
+        return
+
+    pn = d.getVar("PN")
+    if pn.endswith("-native"):
+        return
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    deps = {}
+    for dep in taskdepdata.values():
+        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]:
+            deps[dep[0]] = dep[6]
+
+    d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
+}
+SSTATECREATEFUNCS += "target_add_sysroot_deps"
+
-- 
2.32.0


