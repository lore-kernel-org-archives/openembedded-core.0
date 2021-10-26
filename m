Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6C4C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:52 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.14146.1635263986014269342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783597"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783597"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786738"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:47 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 37/37] bootchart2: Don't compile python modules
Date: Tue, 26 Oct 2021 23:58:08 +0800
Message-Id: 
 <6ca6c9c12c93c6df7b18f49ebdbfb69433ff5158.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157439

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
index 974faa3b3f..c24613b74e 100644
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
 
 ALTERNATIVE:${PN} = "bootchartd"
@@ -131,7 +135,7 @@ do_install () {
     export PKGLIBDIR="${base_libdir}/bootchart"
     export SYSTEMD_UNIT_DIR="${systemd_system_unitdir}"
 
-    oe_runmake install
+    oe_runmake install NO_PYTHON_COMPILE=1
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/bootchartd_stop.sh ${D}${sysconfdir}/init.d
 
-- 
2.31.1


