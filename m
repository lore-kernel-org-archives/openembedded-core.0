Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D282177DCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 15:07:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1EF7tCL021377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Feb 2018 15:07:56 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1elyf5-0006Dx-FA; Wed, 14 Feb 2018 15:07:55 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2018 15:07:53 +0000
Message-Id: <1518620874-23886-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] package: Add INHIBIT_PACKAGE_STRIP_FILES to allow files to remain unstripped
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
X-List-Received-Date: Wed, 14 Feb 2018 15:07:58 -0000

There are cases where its useful to allow only a select few files
to be excluded from the package stripping mechanism. Currently
this isn't possible so add a variable to allow this.

This is to be used sparingly as in general the core code should be
doing the right thing. This is better than the alternative of leaving the whole
package unstripped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a7f35a..90e5236 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -946,6 +946,7 @@ python split_and_strip_files () {
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir"))
+    skipfiles = (d.getVar("INHIBIT_PACKAGE_STRIP_FILES") or "").split()
     if (d.getVar('INHIBIT_PACKAGE_STRIP') != '1' or \
             d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
         for root, dirs, files in cpath.walk(dvar):
@@ -961,6 +962,9 @@ python split_and_strip_files () {
                 if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
                     continue
 
+                if file in skipfiles:
+                    continue
+
                 try:
                     ltarget = cpath.realpath(file, dvar, False)
                     s = cpath.lstat(ltarget)
-- 
2.7.4


