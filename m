Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id A60DC6D89A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 15:54:26 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id t59so8589535yho.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 07:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=jFznJW1Tl0MO76jRHDxyW0hZYnxWGcwBO+PNFaU9Igc=;
	b=eR+xLVnVtSvg/oHawdRiGZ3y87+lM/PxFczFGMakXQIorj2Q63NsXN+oF3BNHcS6pg
	BG7rZ+62wmBwMGcexJhAZ/kx2Rqfjawkti14OH58ApcZM01JlOEQEcYYyRckz/H5kXfT
	MmfCaA1XCknQS4MAu3V6MsuOXk5N5fnXOknk8UIbNolwbDjwqFqH9E+TavY1TyndX4j3
	MwnGMHvKSyU/kzvOYzdl75PusG2BDh+lpV5xhO71TTFFzF2U1JBqQQ1srQu7ydyJ+Pzu
	LYeS5GMg9Nyt41kAx1I7AM3wNhDW2l2ZRB5t6lbQsqYP3w/qgsez7/G1g+gIDEy9/NN+
	YZqw==
X-Received: by 10.236.170.3 with SMTP id o3mr1038827yhl.143.1392220467063;
	Wed, 12 Feb 2014 07:54:27 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id g26sm72775022yhk.3.2014.02.12.07.54.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Feb 2014 07:54:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 41024183C112B; Wed, 12 Feb 2014 13:54:22 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Feb 2014 13:54:17 -0200
Message-Id: <1392220457-23287-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.rc1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] kernel.bbclass, base.bbclass: Fix support for old kernel configuration
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
X-List-Received-Date: Wed, 12 Feb 2014 15:54:28 -0000

This solves a regression introduced by OE-Core:9b75f6a (kernel:
use oldnoconfig before yes '' | make oldconfig).

The original oe_runmake explicitly calls 'die' command in case of
failure so the fallback code never runs. The fallback code needs
to handle the oe_runmake return code to call the backward
compatible callback so we introduced a new command called
oe_runmake_call which is used by oe_runmake.

This does not change the functional behaviour of oe_runmake so it
avoids any change except for the code which does need to handle
the oe_runmake exit code.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/base.bbclass   | 8 ++++++--
 meta/classes/kernel.bbclass | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 81fc305..7837c89 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -53,9 +53,13 @@ die() {
 	bbfatal "$*"
 }
 
-oe_runmake() {
+oe_runmake_call() {
 	bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
-	${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"
+	${MAKE} ${EXTRA_OEMAKE} "$@"
+}
+
+oe_runmake() {
+	oe_runmake_call "$@" || die "oe_runmake failed"
 }
 
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3003fb1..6953109 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -313,7 +313,7 @@ python sysroot_stage_all () {
     oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call oldnoconfig || yes '' | oe_runmake oldconfig"
 
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
-- 
1.8.5.3


