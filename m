Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 686B46011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 19:32:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3GJWqGv020158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 12:32:52 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Apr 2018 12:32:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2018 15:32:51 -0400
Message-ID: <20180416193251.17223-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [pyro][PATCH] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Mon, 16 Apr 2018 19:32:51 -0000
Content-Type: text/plain

The isELF function works by running:

   result = file <pathname>
   if 'ELF' in result

By default 'file' will prepend the result with the path name of the file
that is being checked.  This usually works fine, such as:

$ file /home/foo/openembedded-core/meta/classes/package.bbclass
/home/foo/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines

However, if the path includes 'ELF', ELF will end up in the result, and then
the check will return positive.

$ file /home/ELF/openembedded-core/meta/classes/package.bbclass
/home/ELF/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines

This will then result in the isELF coming back true, and possibly causing the
checks that use isELF, such as the 'is it already stripped' check, to do the
incorrect thing.

Adding the '-b' option to file will result in the path being omitted in the
result:

$ file /home/ELF/openembedded-core/meta/classes/package.bbclass
Python script, ASCII text executable, with very long lines

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/classes/staging.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a03c05b9f7..0844fd5065 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -898,7 +898,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path.replace("\"", "\\\""))
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 984051d6aa..bff04373dc 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -84,7 +84,7 @@ python sysroot_strip () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
2.16.0.rc2


