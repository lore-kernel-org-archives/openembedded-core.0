Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69AA571A37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489609056; x=1521145056;
	h=from:to:cc:subject:date:message-id;
	bh=sRIQ5JBojvMZVjYPHv0gUVSQX6s3wT5T1QTdcUWt9YY=;
	b=P9z+eKHwuXBDqml3EK2kku9sYg0L2wAd0NOrMGB5h9Bxa7aipHb6KUJg
	e5KlVKW9+6prOrQu2AZrq638REluYA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 13:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="60859861"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2017 13:17:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 13:17:26 -0700
Message-Id: <1489609046-7739-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pip: support native builds
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
X-List-Received-Date: Wed, 15 Mar 2017 20:17:34 -0000

Add native pip3 support.

[YOCTO#11049]
[YOCTO#11022]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/python/python3-pip_9.0.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
index b6dbb6e..4456b9b 100644
--- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
@@ -34,6 +34,11 @@ do_install_append() {
 
     # Installed eggs need to be passed directly to the interpreter via a pth file
     echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}.pth
+
+    # Make sure we use /usr/bin/env python3
+    for PYTHSCRIPT in `grep -rIl ${bindir} ${D}${bindir}/pip3*`; do
+        sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+    done
 }
 
 RDEPENDS_${PN} = "\
@@ -47,3 +52,5 @@ RDEPENDS_${PN} = "\
   python3-unixadmin \
   python3-xmlrpc \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


