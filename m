Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D37F96E6B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:58:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g17so4865935wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HQx2vbf1sDSmhdGaN2hzncJg5VcPDH5gwVg3BfI5X8Q=;
	b=RumFjEfSKtZay83ldXcOfCx6fj1uBMHH0h44aRH4GCz9nGVK5jcQzmNCvTn+ZRAzv6
	z9mME9/hyO5JTKcyVmcIirkz5wYmoR77SOwNgXoSYKlvM9XGSPPBbJeXDSQe2H/9LtWc
	29o7vnRfw/AGaTNjeqYsaTYhfSTyPeM7sYAGDVJfDccIWO8JgpHnCJBvSXnARkr++6aM
	DWMPGxZYESjaxqRaX2XIIMwhsqkXOCPBXQqq/Nh4lGX/id+JBD0g2i+S+BJkRq57V7do
	xuVXSyyGSTZorLBwtv2SvQtYimCVLItqeLE2vEuUB5DFus0TxksuXmK3BRNE0Vl6Uq+y
	q37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HQx2vbf1sDSmhdGaN2hzncJg5VcPDH5gwVg3BfI5X8Q=;
	b=M9WsKgY5xHeDqf9ILVjIoTGeaEMriM6JrTftTfwnQxmkso+4V1+hRR/EPbVPCTtcjU
	5//kjD8I66c8LLLO6w204RnGIc8n1NDtxT6xnr3HAdzoWv4yHRLz5/u+PEFOsxQrvHgS
	NsUiZdqOIgHj+U4Xk94HOCttz+r6xQ+qNnq/cFtGKGIhYXw6uexoyXdlGNgFsQSMTKXa
	uU3mbetaGcsvbhJ8OJ6kKtiDRFhhA++u/S5he2Kl7krg4ICgtK3IhynhmFYJ4fDZIfgw
	RgY6eWvFt9KW0B++NKN2aqc4jmMqnBWQRPktk6y91UGSU1j/91fPtUrMvbzdC9U2L+4r
	3gJw==
X-Gm-Message-State: AOPr4FWp6V9ejK8/oIO2HexKcfCLA1xjpJBT5daTfDrB9ztv2mcMN7eWgjWDGJzD44eLaw==
X-Received: by 10.194.242.167 with SMTP id wr7mr6245583wjc.145.1463565508014; 
	Wed, 18 May 2016 02:58:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cz3sm7762432wjb.14.2016.05.18.02.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 02:58:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 11:57:33 +0200
Message-Id: <1463565453-12827-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH] useradd: use bindir_native for pseudo PATH
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
X-List-Received-Date: Wed, 18 May 2016 09:58:29 -0000

* useradd/userdel functions will fail for recipes which override their target prefix
  (e.g. to /opt/foo), because it will try to use pseudo from native-sysroot/opt/foo/bin/pseudo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/useradd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ee402ac..8283bf3 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -103,7 +103,7 @@ useradd_sysroot () {
 	# Pseudo may (do_install) or may not (do_populate_sysroot_setscene) be running 
 	# at this point so we're explicit about the environment so pseudo can load if 
 	# not already present.
-	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir}/pseudo"
+	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir_native}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
 	# before do_install
@@ -130,7 +130,7 @@ useradd_sysroot_sstate () {
 userdel_sysroot_sstate () {
 if test "x${STAGING_DIR_TARGET}" != "x"; then
     if [ "${BB_CURRENTTASK}" = "configure" -o "${BB_CURRENTTASK}" = "clean" ]; then
-        export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir}/pseudo"
+        export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir_native}/pseudo"
         OPT="--root ${STAGING_DIR_TARGET}"
 
         # Remove groups and users defined for package
-- 
2.8.2


