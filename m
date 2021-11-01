Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F526C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:34:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.45535.1635780864510944525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="218228614"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="218228614"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="488694321"
Received: from aaronhpe-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.232.69])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:46 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/18] bootchart2: Don't compile python modules
Date: Mon,  1 Nov 2021 23:34:12 +0800
Message-Id: 
 <b06105ec1a33bb37d42a10222e07b7f8eb69baff.1635780638.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635780638.git.anuj.mittal@intel.com>
References: <cover.1635780638.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 15:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157724

From: Richard Purdie <richard.purdie@linuxfoundation.org>

"make install" may attempt to compile the python modules but it uses the host python
and host paths which means the binaries are not reproducbile. Make things consistent.
If anyone needs compiling, it will beed to be fixed to be cross compile compatible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1189f95e05c80286e009e1ab46a603ee5b7ca239)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index f6a77b4606..d5beaecd0e 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -99,6 +99,10 @@ SRC_URI = "git://github.com/xrmx/bootchart.git \
 S = "${WORKDIR}/git"
 SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 inherit systemd update-rc.d python3native update-alternatives
 
 ALTERNATIVE_${PN} = "bootchartd"
@@ -131,7 +135,7 @@ do_install () {
     export PKGLIBDIR="${base_libdir}/bootchart"
     export SYSTEMD_UNIT_DIR="${systemd_unitdir}/system"
 
-    oe_runmake install
+    oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
 
-- 
2.31.1


