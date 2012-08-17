Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T2Puu-0003DR-Im
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 19:01:00 +0200
Received: by yenm1 with SMTP id m1so4571652yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=O/MQP/WF10KMTv9awOyk9gqJKaNi2k3ujJwfqkqf6nA=;
	b=gTR1hca+IdZh576SyIHNPzYKw7rQBYkDfPIoZvQzqXIcl4SQ4+zKPGUthYDgVX1xYC
	q2euXQQc3YqkGD6h2oXDbt8oIxpzI/e9hJ+sAPUvT4k4cpMXTsDpEG2ZQTSyySggWYNg
	EFCJ3iRcUaMl/JwObdxGmbR0c8N6kHJ+19edb3qNOFYO9LV/pvHR7Fpsd5XkDAg+lKwU
	NxlH2H7MET9TtVzyb18wX9OAkE4YBMTwLmTC02vMGfdcwbgQ9DXdpMIJvAA5jMSTBDGv
	iFXSfL2+F+EpJX1E9MeaesZh/rgTezVlhTtKKNg6MYyCmD4L/L3XGfvJCThOdGkS7SfM
	X8Tw==
Received: by 10.66.75.74 with SMTP id a10mr10776320paw.46.1345222141087;
	Fri, 17 Aug 2012 09:49:01 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id vh7sm5248664pbc.22.2012.08.17.09.49.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 09:49:00 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:53 -0700
Message-Id: <1345222136-24839-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345222136-24839-1-git-send-email-trini@ti.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
Subject: [PATCH 2/5] u-boot-fw-utils: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 17 Aug 2012 17:01:00 -0000

- HOSTCFLAGS / HOSTLDFLAGS have been valid for a long time for tools/env
- HOSTSTRIP will be needed in the future, does no harm to be correct
  now.

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |    4 ++--
 .../u-boot/u-boot-fw-utils_2012.04.01.bb           |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
index 7c4df1a..99eef15 100644
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake env
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
index fe3422a..364f8a5 100644
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
   oe_runmake env
-- 
1.7.9.5



