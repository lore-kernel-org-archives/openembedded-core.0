Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 5261D7E6DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 00:28:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2019 17:28:55 -0700
X-ExtLoop1: 1
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.152.144])
	by orsmga007.jf.intel.com with ESMTP; 12 Jun 2019 17:28:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 08:28:48 +0800
Message-Id: <20190613002848.15030-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612235900.5591-1-anuj.mittal@intel.com>
References: <20190612235900.5591-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH v2] python3-scons: fix regex replacing python by python3
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
X-List-Received-Date: Thu, 13 Jun 2019 00:28:54 -0000
Content-Transfer-Encoding: 8bit

Match only the first line and match even if the line says python3.
Otherwise we end up with multiple 3s at the end after multiple
invocations of do_install on same source.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3-scons_3.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
index 91e4a945e3..7fb75a627e 100644
--- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 inherit setuptools3
 
 do_install_prepend() {
-    sed -i -e "s:/usr/bin/env python:/usr/bin/env python3:g" ${S}/script/*
+    sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
 }
 
 RDEPENDS_${PN} = "\
-- 
2.20.1


