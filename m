Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB7B70C47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 08BF5180E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MMF3IkYOP-UO
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 8414B180A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6C9C41465
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 60FE51463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 5F79F3E049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHf605031910
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:06 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHf60b031909
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:41:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:41:04 +0200
Message-Id: <fc4ed4b3bf631eb449f3673f6caf05a9dc80daf8.1407951634.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951634.git.pkj@axis.com>
References: <cover.1407951634.git.pkj@axis.com>
In-Reply-To: <cover.1407951634.git.pkj@axis.com>
References: <cover.1407951634.git.pkj@axis.com>
Subject: [PATCH 1/1] python-scons-native: Make it useable if old host install exists
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:14 -0000

This was recently fixed to work on Fedora 17 if no scons is installed
on the host by setting the PYTHONPATH to where BitBake has installed
scons. However, if an older version of scons than 2.3.0 is installed,
then it still breaks. This is due to how scons tries to determine its
installation by searching through standard paths. If it finds an old
installation it prepends that path to sys.path thereby causing it to
ignore the PYTHONPATH. The solution is to instead set SCONS_LIB_PATH
which works both if scons is not installed and if an older version is
installed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/python/python-scons-native_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.3.2.bb b/meta/recipes-devtools/python/python-scons-native_2.3.2.bb
index 067ed61..dae89ab 100644
--- a/meta/recipes-devtools/python/python-scons-native_2.3.2.bb
+++ b/meta/recipes-devtools/python/python-scons-native_2.3.2.bb
@@ -4,5 +4,5 @@ DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
 
 do_install_append() {
-    create_wrapper ${D}${bindir}/scons  PYTHONPATH='$PYTHONPATH:${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}'
+    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}'
 }
-- 
1.9.0


