Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fE-0002bW-Du
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FqC020478; Mon, 4 Feb 2013 00:01:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mZw1Jcv4Mg-l; Mon,  4 Feb 2013 00:01:15 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14019Ag020447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:10 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Ph-0000XC-HI; Sun, 03 Feb 2013 23:55:57 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:34 +0000
Message-Id: <48fd96e9008bdef94e1f13e9a4f8de685a859e72.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/22] insane.bbclass: Add pkgvarcheck to check for suboptimal usages of variables
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

Check through the variables:
'RDEPENDS', 'RRECOMMENDS', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'
and if there is a variable set which isn't package specific, inform the user
of this.

Using these variables without a package suffix is bad practise and complicates
dependencies of packages unnecessarily as well as complicates the code. Lets
convert the remaining issues and then we can take the small performance gain.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5dfa5aa..57104ac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -114,7 +114,7 @@ def package_qa_get_machine_dict():
 
 # Currently not being used by default "desktop"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi textrel"
-ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
+ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp pkgvarcheck"
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
@@ -885,4 +885,12 @@ python () {
     tests = d.getVar('ALL_QA', True).split()
     if "desktop" in tests:
         d.appendVar("PACKAGE_DEPENDS", "desktop-file-utils-native")
+
+    issues = []
+    if d.getVar('PACKAGES', True):
+        for var in 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
+            if d.getVar(var):
+                issues.append(var)
+    for i in issues:
+        package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE", True), i), d)
 }
-- 
1.7.10.4



