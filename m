Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C68536CBAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 13:07:53 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id ey11so984038wid.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ohe5kkoqxxvLpZrjF9G544vxliLhUypfPpsx59dZock=;
	b=YmQ3uojlqMFv7ZjiBl5LAbSweFTLvU3+gWXHtJTOqaAMBhJTgBXRs9H/kmWVhOOOAZ
	I3YKZjcG8nHAnxLXw6xdc55ZN3G70zdwkUWd6/uTP59usqyki6/cLVvOeEukXOMXVq3N
	b9Pk1MuBnDu4sopEbCK8WtGb7Q6BUHQQoNAcgSHu4HE3iG8HGRkVcnDlMvJW6f2akhtC
	3Ull5SgqFeMu8TLIoI6+TCM7GjekYM6wh/Y0aAV8EOePNlPWHvAm5tr6j8N/iw4qBpMv
	XYwbY8eewW2UhndyW3G8dLkj/tVtO61hWAiR6MMdEAtvUfeHIaJSCacPf8diwAt6sfru
	qLZA==
X-Gm-Message-State: ALoCoQkPevImf7PHhVtghnOGZOZHa2nUW9rkuU0OAsTH2GTlZ76dyd8pegygy5Tc2wk5UjIYDg/l
X-Received: by 10.180.39.212 with SMTP id r20mr24471107wik.13.1381928874836;
	Wed, 16 Oct 2013 06:07:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d11sm5780575wic.4.2013.10.16.06.07.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Oct 2013 06:07:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 14:07:51 +0100
Message-Id: <1381928871-16782-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] update-rcd.bbclass: fix host/target test
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
X-List-Received-Date: Wed, 16 Oct 2013 13:07:55 -0000

"update-rc: Stop and remove service if updating package" (oe-core d91b08) had a
bug in it's implementation of a "host or target" test which always resulted in
"target", so the rootfs scripts were attempting to restart daemons on the host.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index d44d36c..e14659d 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -13,15 +13,13 @@ INITSCRIPT_PARAMS ?= "defaults"
 INIT_D_DIR = "${sysconfdir}/init.d"
 
 updatercd_postinst() {
-IN_TARGET=`test "x$D" = "x"`
-
 # test if there is a previous init script there, ie, we are updating the package
 # if so, we stop the service and remove it before we install from the new package
 if type update-rc.d >/dev/null 2>/dev/null; then
-	if [ $IN_TARGET -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
+	if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
 		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
 	fi
-	if [ ! $IN_TARGET ]; then
+	if [ -n "$D" ]; then
 		OPT="-f -r $D"
 	else
 		OPT="-f"
@@ -29,7 +27,7 @@ if type update-rc.d >/dev/null 2>/dev/null; then
 	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 
-if [ ! $IN_TARGET ]; then
+if [ -n "$D" ]; then
 	OPT="-r $D"
 else
 	OPT="-s"
-- 
1.7.10.4


