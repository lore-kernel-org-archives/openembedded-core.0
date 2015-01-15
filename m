Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 06E8A71144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 10:12:00 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id rp18so13970289iec.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=LEvRW59wXCVfnrQZcs9r68yAVXG72amlRTb/97eJvuQ=;
	b=XpkMaFe5wjvGXJ+3X9dVqZvGjD0lAnOBDxEqe1qLYe9densjV3W7MWdzdJ3CxMK0H6
	0JPeaq7pM1pSC5uNP+hK23CsYHxjjsWoqXo/njTMhz9syjF+yftAIdxQf0E/VKIlqQtw
	MT/bVSZ1Rv6o36GX0uVH4NNWvaFuj5rNUeiyKm+xlAvEoWBSYL3tzw9oXQxb9zloKnbU
	los624T4PeJMsztf3h+3Il++J4tjemUH1yTblUx/VTzpmPneARPEHqQyBSID1VH0abZd
	Co2To1Ye8lH/x+07DdOqKd53jbSP7gJUWr+E5M9m6DP72InIWlWbtY4BBXd61XCGgZEi
	In3A==
X-Received: by 10.50.66.131 with SMTP id f3mr9473040igt.7.1421316721433;
	Thu, 15 Jan 2015 02:12:01 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	e63sm727872ioe.15.2015.01.15.02.12.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jan 2015 02:12:00 -0800 (PST)
Sender: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 13:11:51 +0300
Message-Id: <1421316711-10179-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] icecc.bbclass: properly handle disabling of icecc
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
X-List-Received-Date: Thu, 15 Jan 2015 10:12:08 -0000

Always use use_icc to check if IceCC should be enabled. Move
ICECC_DISABLED variable checking to use_icc function. Also while we are
at it, fix condition in icc_is_allarch function.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/classes/icecc.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 3ec8c06..2f9e3cf 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -91,6 +91,10 @@ def create_path(compilers, bb, d):
     return staging
 
 def use_icc(bb,d):
+    if d.getVar('ICECC_DISABLED') == "1":
+        # don't even try it, when explicitly disabled
+        return "no"
+
     # allarch recipes don't use compiler
     if icc_is_allarch(bb, d):
         return "no"
@@ -133,8 +137,7 @@ def use_icc(bb,d):
     return "yes"
 
 def icc_is_allarch(bb, d):
-    return \
-        bb.data.inherits_class("allarch", d);
+    return d.getVar("PACKAGE_ARCH") == "all"
 
 def icc_is_kernel(bb, d):
     return \
@@ -148,10 +151,6 @@ def icc_is_native(bb, d):
 # Don't pollute allarch signatures with TARGET_FPU
 icc_version[vardepsexclude] += "TARGET_FPU"
 def icc_version(bb, d):
-    if d.getVar('ICECC_DISABLED') == "1":
-        # don't even try it, when explicitly disabled
-        return ""
-
     if use_icc(bb, d) == "no":
         return ""
 
@@ -179,7 +178,7 @@ def icc_version(bb, d):
     return tar_file
 
 def icc_path(bb,d):
-    if d.getVar('ICECC_DISABLED') == "1":
+    if use_icc(bb, d) == "no":
         # don't create unnecessary directories when icecc is disabled
         return
 
@@ -246,7 +245,7 @@ def set_icecc_env():
     return
 
 set_icecc_env() {
-    if [ "${ICECC_DISABLED}" = "1" ]
+    if [ "${@use_icc(bb, d)}" = "no" ]
     then
         return
     fi
-- 
2.1.4


