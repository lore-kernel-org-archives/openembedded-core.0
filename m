Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA0B571182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:57:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7RFvKEW005048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:57:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 08:57:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 08:57:13 -0700
Message-ID: <c8e81a959f95d3537baa1e9c7e8c090a21d8f1b9.1409154816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409154816.git.liezhi.yang@windriver.com>
References: <cover.1409154816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] bootchart2: no bashism in bootchartd.in
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
X-List-Received-Date: Wed, 27 Aug 2014 15:57:23 -0000
Content-Type: text/plain

So use /bin/sh

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bootchart2/bootchartd-no-bashism.patch         |   27 ++++++++++++++++++++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb |    6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
new file mode 100644
index 0000000..b013995
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
@@ -0,0 +1,27 @@
+From ffb5bae5d588aaea6325623462a8070a04767196 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 14 Aug 2014 08:33:28 -0700
+Subject: [PATCH] bootchartd.in: no bashism
+
+No bashism in bootchartd.in, so use /bin/sh.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ bootchartd.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bootchartd.in b/bootchartd.in
+index a408bab..064f6a4 100755
+--- a/bootchartd.in
++++ b/bootchartd.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Bootchart logger script
+ # Ziga Mahkovec  <ziga.mahkovec@klika.si>
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
index 4116304..04fb901 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
@@ -91,8 +91,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 # one commit beyond 1.14.6 for a systemd-related bugfix
 PV = "0.14.6+git${SRCPV}"
 
-SRC_URI = "git://github.com/mmeeks/bootchart.git"
-SRC_URI += "file://bootchartd_stop.sh"
+SRC_URI = "git://github.com/mmeeks/bootchart.git \
+           file://bootchartd_stop.sh \
+           file://bootchartd-no-bashism.patch \
+          "
 
 SRCREV = "b65ed43b0ae832080fb728245de9ef1a4b48d8b5"
 
-- 
1.7.9.5


