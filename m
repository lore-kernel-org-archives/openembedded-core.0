Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3022F7ECAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 19:45:05 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 89BB25C020C;
	Fri, 19 Jul 2019 21:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1563565505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=sS6onMGxHQph6n06Ubr+fSQ/3S+J1EWt2Pi8WiJYYpU=;
	b=O9N2Y0ws85Dq5+SSfjmhLpGpNOBWivgb94DAn6XvgiCAl6qE1HyhcetGQHZyRSeBko0VVC
	3zTOrxaOpQidDeoAcF0CEMW8M8sX/9ZrMiu7/j/0ra0Iy/m+a74STdSBRY/ubSYocDxlsN
	27f4g1NJe9InkU5FosHD8nQ2NB8Irtc=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 19 Jul 2019 21:44:56 +0200
Message-Id: <20190719194456.1344-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] psplash: create psplash tmpfs mount directory in psplash-init
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
X-List-Received-Date: Fri, 19 Jul 2019 19:45:05 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The psplash binary uses TMPDIR as directory to store the FIFO to
communicate with the psplash tools. This directory can be in any
location an init system determines to be suitable, psplash-init
uses /mnt/ for it. Rather than creating the mount directory in
the recipe, just create it in the init script itself. This allows
other init scripts to use a different location without having
an unnecessary .psplash directory in /mnt.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/psplash/files/psplash-init | 1 +
 meta/recipes-core/psplash/psplash_git.bb     | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index 0bce1de536..7a3902a7e0 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -24,6 +24,7 @@ for x in $CMDLINE; do
 done
 
 export TMPDIR=/mnt/.psplash
+mkdir -p $TMPDIR
 mount tmpfs -t tmpfs $TMPDIR -o,size=40k
 
 rotation=0
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 3161a5e3f1..56734c1582 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -97,7 +97,6 @@ python do_compile () {
 }
 
 do_install_append() {
-	install -d ${D}/mnt/.psplash/
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
 	install -d ${D}${bindir}
@@ -107,8 +106,6 @@ do_install_append() {
 	rm -f ${D}${bindir}/psplash
 }
 
-FILES_${PN} += "/mnt/.psplash"
-
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
 
-- 
2.13.6


