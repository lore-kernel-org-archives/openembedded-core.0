Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id DDFBE60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:09:07 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6T895YP026266; 
	Mon, 29 Jul 2013 03:09:06 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 13:09:51 +0500
Message-Id: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] [V2] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Mon, 29 Jul 2013 08:09:09 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
systemd_unitdir contains anything then no need to keep init.d scripts
for sysvinit compatibility.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/classes/systemd.bbclass |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9763faa..76f0e7d 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -170,3 +170,18 @@ python rm_systemd_unitdir (){
             shutil.rmtree(systemd_unitdir)
 }
 do_install[postfuncs] += "rm_systemd_unitdir "
+
+python rm_sysvinit_initddir (){
+    import shutil
+    sysv_initddir = oe.path.join(d.getVar("D", True), (d.getVar('INIT_D_DIR', True) or "/etc/init.d"))
+
+    if ("systemd" in d.getVar("DISTRO_FEATURES", True).split() and
+        "sysvinit" not in d.getVar("DISTRO_FEATURES", True).split() and
+        os.path.exists(sysv_initddir)):
+        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True), "system")
+
+        # If systemd_unitdir contains anything, delete sysv_initddir
+        if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitdir)):
+            shutil.rmtree(sysv_initddir)
+}
+do_install[postfuncs] += "rm_sysvinit_initddir "
-- 
1.7.9.5


