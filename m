Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlGHr-0006vW-Ra
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 10:13:15 +0200
Received: by wyg30 with SMTP id 30so2874746wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 01:09:03 -0700 (PDT)
Received: by 10.227.13.77 with SMTP id b13mr3657370wba.54.1311581343696;
	Mon, 25 Jul 2011 01:09:03 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fo2sm4103710wbb.31.2011.07.25.01.09.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 01:09:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 10:08:59 +0200
Message-Id: <1311581339-6009-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dropbear: don't override DISTRO_TYPE if it is already set
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
X-List-Received-Date: Mon, 25 Jul 2011 08:13:15 -0000

The long term solution is to remove the IMAGE_FEATURE check since images are not allowed to influence recipe compile options.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dropbear/dropbear.inc     |    2 +-
 meta/recipes-core/dropbear/dropbear_0.52.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1b51e1a..526a5a0 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -29,7 +29,7 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-DISTRO_TYPE = "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
+DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
 do_debug_patch() {
 	if [ "${DISTRO_TYPE}" = "debug" ]; then
diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb b/meta/recipes-core/dropbear/dropbear_0.52.bb
index 78d6cf1..4013c65 100644
--- a/meta/recipes-core/dropbear/dropbear_0.52.bb
+++ b/meta/recipes-core/dropbear/dropbear_0.52.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "1c69ec674481d7745452f68f2ea5597e"
 SRC_URI[sha256sum] = "e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
 
-PR = "r2"
+PR = "r3"
-- 
1.6.6.1



