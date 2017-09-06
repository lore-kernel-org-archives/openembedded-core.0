Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC8077D21
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 09:49:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Sep 2017 02:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,483,1498546800"; d="scan'208";a="1011463860"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Sep 2017 02:49:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6DD8858038F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 02:49:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 12:48:24 +0300
Message-Id: <21a91f0dec49836c7d22c5b38f18532ea3c2d6d6.1504691079.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504691079.git.ed.bartosh@linux.intel.com>
References: <cover.1504691079.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/3] bmap-tools: switch to Python 3
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
X-List-Received-Date: Wed, 06 Sep 2017 09:49:45 -0000

bmap-tools is the only recipe in oe-core that still uses
Python 2. Switching it to Python 3 should help to get rid of
building native Python 2 and its dependencies.

[YOCTO: #11891]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index 9735707f85b..f52fa53b4f3 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -16,10 +16,7 @@ S = "${WORKDIR}/git"
 
 RDEPENDS_${PN} = "python-core python-compression python-mmap"
 
-inherit setuptools
+inherit python3native
+inherit setuptools3
 
 BBCLASSEXTEND = "native"
-
-do_install_append_class-native() {
-    sed -i -e 's|^#!.*/usr/bin/python-native/python|#! /usr/bin/env nativepython|' ${D}${bindir}/bmaptool
-}
-- 
2.13.5


