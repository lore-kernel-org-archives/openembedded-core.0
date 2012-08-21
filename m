Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T3yEZ-0008E7-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 01:51:43 +0200
Received: by obc16 with SMTP id 16so482102obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=dcQN66c7Io+CPCyswe32A6wPRmKrY+EavkyYWLcHb10=;
	b=r+a9piD6ZSQp5c2A8lUXn1EgcraURvt1ftaJXfqxg+OlYVcABqrYwBw0ivOcBUQkBp
	AbLMBI27lQfc6JYmFTDRAHsEsDRpykXASDFKusBC7ncD9Iompr0lEktDyLd/pFBlGwc6
	uwDcnWfJFHCq1TJ8i6giEbbuzP75uIHKKi3CjsqmeOXFl/gOah7mbJlJWWg9wUje6TmM
	eCnn2Fy/nHORneGhl68XBww6PVsoT2K1zSDZK4CjvRhWbFNbVermgyrcNC2ZfFx0S8AH
	+ENY9xBbyObjWYB35Z/Uado+hXfdF51bOeg5mrBvheHx90VsBSghyvC0m62UACwAUy/G
	sm9A==
Received: by 10.60.7.133 with SMTP id j5mr14687517oea.8.1345592379101;
	Tue, 21 Aug 2012 16:39:39 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id k3sm2490932obw.4.2012.08.21.16.39.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 16:39:38 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 16:39:36 -0700
Message-Id: <1345592379-8704-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345592379-8704-1-git-send-email-trini@ti.com>
References: <1345592379-8704-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 2/5] u-boot-fw-utils: Correct EXTRA_OEMAKE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 23:51:43 -0000

- HOSTCFLAGS / HOSTLDFLAGS have been valid for a long time for tools/env
- HOSTSTRIP will be needed in the future, does no harm to be correct
  now.

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |    4 ++--
 .../u-boot/u-boot-fw-utils_2012.04.01.bb           |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
index 7c4df1a..ae20042 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
@@ -6,7 +6,7 @@ SECTION = "bootloader"
 
 DEPENDS = "mtd-utils"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
 
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af3
 
 S = "${WORKDIR}/u-boot-${PV}"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}"'
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake env
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
index fe3422a..d217320 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
@@ -5,6 +5,8 @@ SECTION = "bootloader"
 
 DEPENDS = "mtd-utils"
 
+PR = "r1"
+
 # This is needs to be validated among supported BSP's before we can
 # make it default
 DEFAULT_PREFERENCE = "-1"
@@ -20,7 +22,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = 'HOSTCC="${CC}"'
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake env
-- 
1.7.9.5



