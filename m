Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 76BBA6BD75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:50:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s23Fo28V021639 for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 15:50:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lPK1W3B3htg5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:50:02 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s23FnwQN021633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 15:49:59 GMT
Message-ID: <1393861790.31845.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Mar 2014 15:49:50 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] alsa-tools/autotools: Ensure that aclocal files can be present with AUTOTOOLS_COPYACLOCAL variable
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
X-List-Received-Date: Mon, 03 Mar 2014 15:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Introduce a AUTOTOOLS_COPYACLOCAL variable which forces the copy of the aclocal
files even when a configure.ac/.in file isn't present.

Use this new feature in alsa-tools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 70a521d..15fcfc6 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -138,7 +138,8 @@ ACLOCALDIR = "${B}/aclocal-copy"
 python autotools_copy_aclocals () {
     s = d.getVar("S", True)
     if not os.path.exists(s + "/configure.in") and not os.path.exists(s + "/configure.ac"):
-        return
+        if not d.getVar("AUTOTOOLS_COPYACLOCAL"):
+            return
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     pn = d.getVar("PN", True)
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 6321b78..b154233 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -25,10 +25,8 @@ EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --targ
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+,"
 
-do_configure () {
-    autotools_do_configure
-    autotools_copy_aclocal
-}
+# configure.ac/.in doesn't exist so force copy
+AUTOTOOLS_COPYACLOCAL = "1"
 
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case



