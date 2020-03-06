Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id ECEFF6108C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 15:47:55 +0000 (UTC)
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 026FWsRI004016
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 16:32:54 +0100
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 026FWqbu023246
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 16:32:52 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.56.79])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 026FWpWF021858;
	Fri, 6 Mar 2020 16:32:51 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 63C85950A88;
	Fri,  6 Mar 2020 16:32:51 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 16:32:33 +0100
Message-Id: <20200306153234.23875-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200306153234.23875-1-andrej.valek@siemens.com>
References: <20200306153234.23875-1-andrej.valek@siemens.com>
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
	further information)
X-purgate-size: 1373
X-purgate-ID: 149902::1583508774-000010EA-2BD5CAA7/0/0
Subject: [PATCH 1/2] populate_sdk_ext: enable custom templateconf.cfg
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
X-List-Received-Date: Fri, 06 Mar 2020 15:47:56 -0000

Do not always override templateconf.cfg content. Add option to use
already existing file.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/populate_sdk_ext.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 57fd29b1bb..9f26cfc131 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -388,9 +388,13 @@ python copy_buildsystem () {
         bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
         shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
 
-    # Write a templateconf.cfg
-    with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
-        f.write('meta/conf\n')
+    # Use templateconf.cfg file from builddir if exists
+    if os.path.exists(builddir + '/conf/templateconf.cfg'):
+        shutil.copyfile(builddir + '/conf/templateconf.cfg', baseoutpath + '/conf/templateconf.cfg')
+    else:
+        # Write a templateconf.cfg
+        with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
+            f.write('meta/conf\n')
 
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
-- 
2.11.0


