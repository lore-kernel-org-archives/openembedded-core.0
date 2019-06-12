Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7167D38A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 23:59:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2019 16:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,367,1557212400"; d="scan'208";a="184415369"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.152.144])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2019 16:59:02 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 07:59:00 +0800
Message-Id: <20190612235900.5591-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python3-scons: fix regex replacing python by python3
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
X-List-Received-Date: Wed, 12 Jun 2019 23:59:03 -0000
Content-Transfer-Encoding: 8bit

Match only the first line and match even if the line says python3.
Otherwise we end up with multiple 3s at the end after multiple
invocations of do_install on same source.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3-scons_3.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
index 91e4a945e3..cfae37929c 100644
--- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 inherit setuptools3
 
 do_install_prepend() {
-    sed -i -e "s:/usr/bin/env python:/usr/bin/env python3:g" ${S}/script/*
+    sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/python3," ${S}/script/*
 }
 
 RDEPENDS_${PN} = "\
-- 
2.20.1


