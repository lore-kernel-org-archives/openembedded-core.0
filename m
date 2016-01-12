Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3738731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 18:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CI0GBM023666; Tue, 12 Jan 2016 18:00:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2ZsoXd610Q62; Tue, 12 Jan 2016 18:00:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CI0DhL023662
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Jan 2016 18:00:14 GMT
Message-ID: <1452621613.28375.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jan 2016 18:00:13 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Igor Stoppa <igor.stoppa@intel.com>
Subject: [PATCH] insane/package: Fix cases where QA errors aren't fatal
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
X-List-Received-Date: Tue, 12 Jan 2016 18:00:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When using package_qa_handle_error(), we need to check QA_SANE and
give a fatal error if issues were raised. The main insane checks do
this, the anonymous python in insane does not, nor does the code in
package.bbclass. This was likely missed when the function was
introduced to package.bbclass.

The impact is that errors can be shown but don't stop the build
(do_package succeeds), the initial build fails due to the errors
shown but subsequent builds succeed. This is clearly broken.

The solution is to check QA_SANE in places we use the handle_error
function.

[YOCTO #8907]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bf6a598..ba9c651 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1285,4 +1285,7 @@ python () {
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
         package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE", True), i), d)
+    qa_sane = d.getVar("QA_SANE", True)
+    if not qa_sane:
+        bb.fatal("Fatal QA errors found, failing task.")
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 54f7ae5..fdcf5ff 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2052,6 +2052,10 @@ python do_package () {
 
     for f in (d.getVar('PACKAGEFUNCS', True) or '').split():
         bb.build.exec_func(f, d)
+
+    qa_sane = d.getVar("QA_SANE", True)
+    if not qa_sane:
+        bb.fatal("Fatal QA errors found, failing task.")
 }
 
 do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"



