Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4381472A6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:47 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id hz1so6134664pad.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zzVjbhDXr1FKynictN5Dfzk3oMMqbLTDplhNl2tb3Ts=;
	b=dcViqNp6D0AuYL4++amWs4GElF1t5WOBMFqZW9NJZbeq+jOIZbgpfmNxj570e+4PYV
	+RjoVpAv2OjwPHxVwQp1gBoayBQJvkj3RUDziEV+fLNuwQCJyWbleY/zb2GIOeEUHcnD
	Jpv6KDGaousnaPYgP4Fg9HIzTcszIeVP+Dk8upb1/JODz9ioriRB/4vaqsE39OTRaVrN
	g/GZYh2kxb58yJeQagtdIp+VLOCaA+Nr3no5h1SVompBWjvEXQXKY0Gn6HtcLXL+zU0j
	AW4s3EJsVIXaZNPzzIzDL191TkeLSuUt2xgMNsD8DRa4BotnLPjIYzXrTIDeMH6P4vKF
	R6PA==
X-Received: by 10.66.154.196 with SMTP id vq4mr6708249pab.146.1423152288880;
	Thu, 05 Feb 2015 08:04:48 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:26 -0800
Message-Id: <e2c46c02c918f9c619002ed9723197d79e70d25a.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Subject: [PATCH 18/61] icecc.bbclass: properly handle disabling of icecc
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:48 -0000

From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>

Always use use_icc to check if IceCC should be enabled. Move
ICECC_DISABLED variable checking to use_icc function. Also while we are
at it, fix condition in icc_is_allarch function.

(From OE-Core rev: 20b0168da47d6e30fcbaf6adab3bde0d398d0d00)

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


