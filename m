Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbGCB-0006tU-2Q
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 19:38:19 +0100
Received: by eekb15 with SMTP id b15so2111561eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 10:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wcFCkvxB8vHqGmztwJpqIvsbCZ2MgTlN/FtBglyyO7Q=;
	b=pjdAJLlObKpi6KVaNAx/AQjpOndSKqADza7lHjh8mXudp4NA6nsmpYhRkJ4gpdrJyc
	yWqQq6u32ACxLLNaNNyb5cUiHfRDBxeBabJaswlD7aM8pT5G0aA38uVI3aWDKv6CC2r2
	XqYMjK4idqLPSCS5p+NRx1tL3AB9sHqMJbCes=
Received: by 10.213.22.140 with SMTP id n12mr708429ebb.53.1323973880896;
	Thu, 15 Dec 2011 10:31:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm27091220eeb.4.2011.12.15.10.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 10:31:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 19:31:09 +0100
Message-Id: <1323973869-25458-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH] sstate.bbclass: allow to disable sstate package creation
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
X-List-Received-Date: Thu, 15 Dec 2011 18:38:19 -0000

* building core-image-minimal-mtdutils with and without sstate packages enabled:
          with   without
  real     98m       95m
  user    212m      208m
  sys      26m       25m

* but this was tested on fast machine with TMPDIR on fast raid0 array
  so the impact is not so bad on simple image, but stuff like qt4 takes
  ages on our slow buildhost

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0f88a23..22ce653 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -13,6 +13,8 @@ SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_SCAN_FILES ?= "*.la *-config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
 
+SSTATE_CREATE_PKG ?= "1"
+
 BB_HASHFILENAME = "${SSTATE_PKGNAME}"
 
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
@@ -436,9 +438,11 @@ python sstate_task_prefunc () {
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
     sstate_install(shared_state, d)
-    for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d)
-    sstate_package(shared_state, d)
+    enabled = d.getVar('SSTATE_CREATE_PKG', True)
+    if enabled and enabled == "1":
+        for intercept in shared_state['interceptfuncs']:
+            bb.build.exec_func(intercept, d)
+        sstate_package(shared_state, d)
 }
   
 
-- 
1.7.8



