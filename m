Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2X9S-0002J2-5e
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 00:07:42 +0100
Received: by bwz10 with SMTP id 10so6970414bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=xOaEjsE5o0uv9AXOPVUdIU9Ly3/fAZgsV5ke3tAB6OE=;
	b=oLoww5Vxb0Js3tryodhZ0CadF8a3HbYVx8jI8lSQPgZnreSl4Duuitv7D6EmWOGGb5
	CqvUXXjzZe2Y2cyAf+wKNsvh5/MWiN18U/3sCrlm63q2CNN9KlSwzETmcypqNInqGno0
	vLt9P9Xd8IlV96bS87BxIq6bhGzKNH67sk5zk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Aluz9ro9V8JECWUVXFbe61CWOCL7j8017PmBOPDjkgyY66DLlxJeEQSTJcigk38FEW
	254FS14RWNaF/HF6mZoeMux7PY9QeI58/G1AKgK7bAU52FOzUDcE+OCFYqAw2Di9cOOY
	pUp1PxZzu4UVUlgawarJktvFDuA2K2Vb24nsY=
Received: by 10.204.126.152 with SMTP id c24mr6933393bks.4.1300921548918;
	Wed, 23 Mar 2011 16:05:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm2523151bkl.1.2011.03.23.16.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 16:05:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2011 00:05:40 +0100
Message-Id: <1300921540-30288-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] sstate: use only unique set of SSTATETASK
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
X-List-Received-Date: Wed, 23 Mar 2011 23:07:42 -0000

* otherwise strange error like this:
  ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/armv7a-oe-linux-gnueabi/libtool-cross-2.4-r1/temp/log.do_package_write_ipk.25551
  Log data follows:
  | ERROR: Package already staged (/OE/shr-core/tmp/sstate-control/manifest-nokia900-libtool-cross.deploy-ipk)?!
  | ERROR: Function 'sstate_task_postfunc' failed
  NOTE: package libtool-cross-2.4-r1: task do_package_write_ipk: Failed
  ERROR: Task 11 (/OE/shr-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.bb, do_package_write_ipk) failed with exit code '1'

  is shown in this case with package_ipk twice in INHERIT

* Thanks to Richard for fix

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d57c183..00a709b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -40,7 +40,7 @@ python () {
         bb.data.setVar('SSTATE_SCAN_CMD', scan_cmd, d)
 
     namemap = []
-    for task in (bb.data.getVar('SSTATETASKS', d, True) or "").split():
+    for task in set((bb.data.getVar('SSTATETASKS', d, True) or "").split()):
         namemap.append(bb.data.getVarFlag(task, 'sstate-name', d))
         funcs = bb.data.getVarFlag(task, 'prefuncs', d) or ""
         funcs = "sstate_task_prefunc " + funcs
@@ -195,7 +195,7 @@ def sstate_clean_cachefile(ss, d):
     oe.path.remove(sstatepkgfile)
 
 def sstate_clean_cachefiles(d):
-    for task in (bb.data.getVar('SSTATETASKS', d, True) or "").split():
+    for task in set((bb.data.getVar('SSTATETASKS', d, True) or "").split()):
         ss = sstate_state_fromvars(d, task[3:])
         sstate_clean_cachefile(ss, d)
 
-- 
1.7.4.1



