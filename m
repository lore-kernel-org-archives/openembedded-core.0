Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fE-0002bX-E0
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUI020480; Mon, 4 Feb 2013 00:01:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ewJlyNwCXj59; Mon,  4 Feb 2013 00:01:16 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14019Q2020448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:10 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Ph-0000XH-RK; Sun, 03 Feb 2013 23:55:57 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:35 +0000
Message-Id: <a1f593ae350ca192d9ba95237f06cb4658ec80b3.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/22] insane.bbclass: Add documentation headers for logical code blocks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 57104ac..7e5634d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -836,6 +836,10 @@ python do_qa_staging() {
 python do_qa_configure() {
     import subprocess
 
+    ###########################################################################
+    # Check config.log for cross compile issues
+    ###########################################################################
+
     configs = []
     workdir = d.getVar('WORKDIR', True)
     bb.note("Checking autotools environment for common misconfiguration")
@@ -852,6 +856,10 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
         if "configure.in" in files:
             configs.append(os.path.join(root, "configure.in"))
 
+    ###########################################################################
+    # Check gettext configuration and dependencies are correct
+    ###########################################################################
+
     cnf = d.getVar('EXTRA_OECONF', True) or ""
     if "gettext" not in d.getVar('P', True) and "gcc-runtime" not in d.getVar('P', True) and "--disable-nls" not in cnf:
         ml = d.getVar("MLPREFIX", True) or ""
@@ -869,8 +877,13 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
                     bb.fatal("""%s required but not in DEPENDS for file %s.
 Missing inherit gettext?""" % (gt, config))
 
+    ###########################################################################
+    # Check license variables
+    ###########################################################################
+
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
+
 }
 # The Staging Func, to check all staging
 #addtask qa_staging after do_populate_sysroot before do_build
@@ -886,6 +899,10 @@ python () {
     if "desktop" in tests:
         d.appendVar("PACKAGE_DEPENDS", "desktop-file-utils-native")
 
+    ###########################################################################
+    # Check various variables
+    ###########################################################################
+
     issues = []
     if d.getVar('PACKAGES', True):
         for var in 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
-- 
1.7.10.4



