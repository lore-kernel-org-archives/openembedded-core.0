Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id A81F865E2F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 15:07:32 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so4330413eek.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g6x9dNwsqp0sp43HNS0Rrp1ahST27tcNL6uldZI1GLM=;
	b=nAhR+MzZs9UBktmt3GnRdM6xrNoIOoZ5fFC1awc+o9wVbyhM0RaUnq4zuAJWjc05Jd
	tF3NqSZvHNkp+MMfCKtBuIiYse7ZaiZPo4/3ItzfDbSiIlvTpp6shGCdretDjRrqJcAy
	VPN8fz7aYC8YWgATnjz7qF8aBy0b5cAlAAmOqXWZa9ayRdSlSkEzMsLXL+z2GSrj4+l+
	6xI0ZkwnqprikbWT9RLHqs7oe+MoTQaVpdsIfhGAwhFJZ+/MJ7YRNFFLQDfAUqdDdLJz
	T14gZsgLhdKNxtU9RYtauRyCKyBb4TtmRTh09tKLf5YAtBNovsVeY/67zXPYZAkINXy2
	Fl8g==
X-Received: by 10.15.73.134 with SMTP id h6mr29514055eey.3.1397228852875;
	Fri, 11 Apr 2014 08:07:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm18248189eei.24.2014.04.11.08.07.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Apr 2014 08:07:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 17:07:39 +0200
Message-Id: <1397228859-29176-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] icecc: don't create unnecessary 'ice' dirs in sysroots when disabled
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
X-List-Received-Date: Fri, 11 Apr 2014 15:07:35 -0000

* parsing ICE_PATH="${@icc_path(bb, d)}" causes "ice" directories
  to be created in every sysroot, that could be a bit confusing for
  people who inherit icecc.bbclass, but disabled it
* shorten ICECC_VERSION="${@icc_version(bb, d)}" path a bit
  by returning sooner when disabled
* remove ICECC_PATH and ICECC_ENV_EXEC from signatures, we assume that
  using icecc doesn't influence the output, so it shouldn't matter when
  user supplies own version of icecc or env script
* always compare ICECC_DISABLED with "1", boolean typed_value isn't used
  because documentation already mentions using empty value to keep icecc
  enabled and that's not valid boolean value when oe.data.typed_value is
  used:
  ERROR: ICECC_DISABLED: Invalid boolean value ''

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 5c9e66c..3ec8c06 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -28,7 +28,7 @@
 #Error checking is kept to minimum so double check any parameters you pass to the class
 ###########################################################################################
 
-BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL ICECC_USER_CLASS_BL ICECC_USER_PACKAGE_WL"
+BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL ICECC_USER_CLASS_BL ICECC_USER_PACKAGE_WL ICECC_PATH ICECC_ENV_EXEC"
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
@@ -148,6 +148,10 @@ def icc_is_native(bb, d):
 # Don't pollute allarch signatures with TARGET_FPU
 icc_version[vardepsexclude] += "TARGET_FPU"
 def icc_version(bb, d):
+    if d.getVar('ICECC_DISABLED') == "1":
+        # don't even try it, when explicitly disabled
+        return ""
+
     if use_icc(bb, d) == "no":
         return ""
 
@@ -175,6 +179,10 @@ def icc_version(bb, d):
     return tar_file
 
 def icc_path(bb,d):
+    if d.getVar('ICECC_DISABLED') == "1":
+        # don't create unnecessary directories when icecc is disabled
+        return
+
     if icc_is_kernel(bb, d):
         return create_path( [get_cross_kernel_cc(bb,d), ], bb, d)
 
@@ -238,7 +246,7 @@ def set_icecc_env():
     return
 
 set_icecc_env() {
-    if [ "x${ICECC_DISABLED}" != "x" ]
+    if [ "${ICECC_DISABLED}" = "1" ]
     then
         return
     fi
-- 
1.9.1


