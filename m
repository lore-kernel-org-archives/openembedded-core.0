Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZLhl-00033I-6t for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 14:39:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4TCT1BH012801
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:29:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12185-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:28:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4TCSnev012795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:28:51 +0100
Message-ID: <1338294528.20169.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2012 13:28:48 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/cp-noerror: Add a special copy function to fix autotools issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 12:39:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently we copy the aclocal directory to the build so that autotools
doesn't see .m4 files disappear when its processing them. This can happen
if for example, package X is being rebuilt at the same time as Y and it
gets uninstalled from sstate (assuming there are no dependencies between
X and Y). This code making the copy was added to avoid races but introduces
a race of its own, namely that the files can disappear during the copy.

This patch adds a cp-noerror script which silently ignores such errors
and gives the behaviour we need in this case. It hence fixes issues which
crop up for users and the autobuilder occasionally.

[YOCTO #2485]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 941c06d..9b36f3c 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -124,10 +124,9 @@ autotools_do_configure() {
 			# uninstalling data from the sysroot. See Yocto #861 for details.
 			# We avoid this by taking a copy here and then files cannot disappear.
 			if [ -d ${STAGING_DATADIR}/aclocal ]; then
-				mkdir -p ${B}/aclocal-copy/
 				# for scratch build this directory can be empty
 				# so avoid cp's no files to copy error
-				cp -r ${STAGING_DATADIR}/aclocal/. ${B}/aclocal-copy/
+				cp-noerror ${STAGING_DATADIR}/aclocal ${B}/aclocal-copy/
 				acpaths="$acpaths -I ${B}/aclocal-copy/"
 			fi
 			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
new file mode 100755
index 0000000..fdb3d2d
--- a/dev/null
+++ b/scripts/cp-noerror
@@ -0,0 +1,15 @@
+#!/usr/bin/env python
+#
+# Allow copying of $1 to $2 but if files in $1 disappear during the copy operation,
+# don't error.
+#
+
+import sys
+import shutil
+
+try:
+    shutil.copytree(sys.argv[1], sys.argv[2])
+except shutil.Error:
+   pass
+
+




