Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9960F6B260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 11:52:46 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6JBqicB026969; 
	Fri, 19 Jul 2013 06:52:45 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 16:53:25 +0500
Message-Id: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] systemd: Remove systemd_unitdir if systemd is not in distro features
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
X-List-Received-Date: Fri, 19 Jul 2013 11:52:46 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

If systemd is not supported DISTRO_FEATURE than there is no need to
package related service files.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/classes/systemd.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 0447e53..9763faa 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -161,3 +161,12 @@ python systemd_populate_packages() {
 }
 
 PACKAGESPLITFUNCS_prepend = "systemd_populate_packages "
+
+python rm_systemd_unitdir (){
+    import shutil
+    if "systemd" not in d.getVar("DISTRO_FEATURES", True).split():
+        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True))
+        if os.path.exists(systemd_unitdir):
+            shutil.rmtree(systemd_unitdir)
+}
+do_install[postfuncs] += "rm_systemd_unitdir "
-- 
1.7.9.5


