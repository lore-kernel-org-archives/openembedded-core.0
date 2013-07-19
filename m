Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id AC6F56B260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 11:53:00 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6JBqicC026969; 
	Fri, 19 Jul 2013 06:53:00 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 16:53:26 +0500
Message-Id: <1374234806-31680-2-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 2/2] update-rc.d: Remove init.d dir if sysvinit is not in distro features
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
X-List-Received-Date: Fri, 19 Jul 2013 11:53:00 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

If sysvinit is not supported DISTRO_FEATURE than there is no need to
package related initialization scripts.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/classes/update-rc.d.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 5588569..946c077 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -99,3 +99,12 @@ python populate_packages_updatercd () {
         for pkg in pkgs.split():
             update_rcd_package(pkg)
 }
+
+python rm_sysvinit_initddir (){
+    import shutil
+    if "sysvinit" not in d.getVar("DISTRO_FEATURES", True).split():
+        sysv_initddir = oe.path.join(d.getVar("D", True), d.getVar('INIT_D_DIR', True))
+        if os.path.exists(sysv_initddir):
+            shutil.rmtree(sysv_initddir)
+}
+do_install[postfuncs] += "rm_sysvinit_initddir "
-- 
1.7.9.5


