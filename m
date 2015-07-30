Return-Path: <pau.espin@aweurope.be>
Received: from barracuda.aweurope.be (barracuda.aweurope.be [212.166.56.147])
	by mail.openembedded.org (Postfix) with ESMTP id 7692E763BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:33:32 +0000 (UTC)
X-ASG-Debug-ID: 1438256004-041f750f7c88150002-7zcVdP
Received: from localhost.localdomain ([172.23.1.67]) by barracuda.aweurope.be
	with ESMTP id Y0opmb4mvPOCkWJL;
	Thu, 30 Jul 2015 13:33:29 +0200 (CEST)
X-Barracuda-Envelope-From: pau.espin@aweurope.be
X-Barracuda-RBL-Trusted-Forwarder: 172.23.1.67
X-ASG-Whitelist: Client
From: Pau Espin Pedrol <pau.espin@aweurope.be>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:33:12 +0200
X-ASG-Orig-Subj: [oe-core][PATCH v4 2/3] systemd.bbclass: Use
	systemd_system_unitdir
Message-Id: <1438255993-9124-2-git-send-email-pau.espin@aweurope.be>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438255993-9124-1-git-send-email-pau.espin@aweurope.be>
References: <1438255993-9124-1-git-send-email-pau.espin@aweurope.be>
X-Barracuda-Connect: UNKNOWN[172.23.1.67]
X-Barracuda-Start-Time: 1438256009
X-Barracuda-URL: http://172.23.0.12:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at aweurope.be
X-Barracuda-BRTS-Status: 1
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: [PATCH v4 2/3] systemd.bbclass: Use systemd_system_unitdir
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
X-List-Received-Date: Thu, 30 Jul 2015 11:33:36 -0000

Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
---
 meta/classes/systemd.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index cfe1eb5..46e72c7 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -136,8 +136,7 @@ python systemd_populate_packages() {
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
         searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
-        searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir", True), "systemd", "system"))
-        searchpaths.append(oe.path.join(d.getVar("exec_prefix", True), d.getVar("nonarch_base_libdir", True), "systemd", "system"))
+        searchpaths.append(d.getVar("systemd_system_unitdir", True))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
 
         keys = 'Also'
@@ -185,10 +184,10 @@ python rm_sysvinit_initddir (){
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
         not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
         os.path.exists(sysv_initddir):
-        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True), "system")
+        systemd_system_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_system_unitdir', True))
 
-        # If systemd_unitdir contains anything, delete sysv_initddir
-        if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitdir)):
+        # If systemd_system_unitdir contains anything, delete sysv_initddir
+        if (os.path.exists(systemd_system_unitdir) and os.listdir(systemd_system_unitdir)):
             shutil.rmtree(sysv_initddir)
 }
 do_install[postfuncs] += "rm_sysvinit_initddir "
-- 
1.9.1


