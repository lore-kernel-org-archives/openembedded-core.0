Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2432A77225
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 14:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LEZqKo001021; Sat, 21 Jan 2017 14:35:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bssK8FjkpoWj; Sat, 21 Jan 2017 14:35:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LEZlUc001008
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Jan 2017 14:35:48 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUwlf-0000yP-JH; Sat, 21 Jan 2017 14:35:47 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jan 2017 14:35:44 +0000
Message-Id: <1485009344-3664-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] package_rpm: Clean up pointless exception handling
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
X-List-Received-Date: Sat, 21 Jan 2017 14:35:55 -0000

The exception handling in this function seemed mildly crazy. Python will
given perfectly good or in several cases better information if we let its
standard traceback/exception handling happen. Remove the pointless code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c978ec5..bde0453 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -55,10 +55,7 @@ def write_rpm_perfiledata(srcname, d):
     # OE-core dependencies a.k.a. RPM requires
     outdepends = workdir + "/" + srcname + ".requires"
 
-    try:
-        dependsfile = open(outdepends, 'w')
-    except OSError:
-        bb.fatal("unable to open spec file for writing")
+    dependsfile = open(outdepends, 'w')
 
     dump_filerdeps('RDEPENDS', dependsfile, d)
 
@@ -68,10 +65,7 @@ def write_rpm_perfiledata(srcname, d):
     # OE-core / RPM Provides
     outprovides = workdir + "/" + srcname + ".provides"
 
-    try:
-        providesfile = open(outprovides, 'w')
-    except OSError:
-        bb.fatal("unable to open spec file for writing")
+    providesfile = open(outprovides, 'w')
 
     dump_filerdeps('RPROVIDES', providesfile, d)
 
@@ -620,10 +614,7 @@ python write_specfile () {
         spec_scriptlets_top.append('')
 
     # Write the SPEC file
-    try:
-        specfile = open(outspecfile, 'w')
-    except OSError:
-        bb.fatal("unable to open spec file for writing")
+    specfile = open(outspecfile, 'w')
 
     # RPMSPEC_PREAMBLE is a way to add arbitrary text to the top
     # of the generated spec file
-- 
2.7.4


