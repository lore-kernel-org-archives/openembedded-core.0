Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB254C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.505.1635871635257964071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509753"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509753"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575211"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:43 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/24] stress-ng: convert to git, website is down
Date: Wed,  3 Nov 2021 00:44:04 +0800
Message-Id: 
 <464fba5a4ee320fb964fcaa378c899aa04ade558.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157800

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0bc00868993d7093a70f29de9047f9ae0be33836)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...write-the-timestamp-into-compressed-.patch | 26 +++++++++++++++++++
 .../stress-ng/stress-ng_0.13.00.bb            |  8 +++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
new file mode 100644
index 0000000000..21a410f605
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
@@ -0,0 +1,26 @@
+From 2386cd8f907b379ae5cc1ce2888abef7d30e709a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 23 Oct 2021 20:20:59 +0200
+Subject: [PATCH] Makefile: do not write the timestamp into compressed manpage.
+
+This helps reproducibility.
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/156]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 886018f9..f4290f9c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -468,7 +468,7 @@ git-commit-id.h:
+ $(OBJS): stress-ng.h Makefile
+ 
+ stress-ng.1.gz: stress-ng.1
+-	$(V)gzip -c $< > $@
++	$(V)gzip -n -c $< > $@
+ 
+ .PHONY: dist
+ dist:
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
index 198f7e87c7..5889569e50 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
@@ -1,14 +1,16 @@
 SUMMARY = "System load testing utility"
 DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
 imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
-HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
+HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           file://0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch \
            "
-SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
+SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
+S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
 
-- 
2.31.1


