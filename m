Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLtak-0006fV-D6
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 10:28:10 +0100
Received: by wwf27 with SMTP id 27so325117wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 02:21:59 -0700 (PDT)
Received: by 10.227.205.213 with SMTP id fr21mr10762023wbb.16.1320312119086;
	Thu, 03 Nov 2011 02:21:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fy21sm9032352wbb.5.2011.11.03.02.21.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 02:21:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 10:21:53 +0100
Message-Id: <1320312113-2492-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] rt-tests: update to 0.83
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
X-List-Received-Date: Thu, 03 Nov 2011 09:28:10 -0000

Fetch from github, kernel.org uri is gone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../{rt-tests_0.73.bb => rt-tests_0.83.bb}         |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.73.bb => rt-tests_0.83.bb} (68%)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
similarity index 68%
rename from meta/recipes-rt/rt-tests/rt-tests_0.73.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index a2cf6be..78d51b3 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.73.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -6,16 +6,20 @@ LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
                     file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
-# Version v0.73
-SRCREV = "81da016fb0f6ab0511fbec81fc8ba1a50398a20d"
-PV = "git${SRCPV}"
-PR = "r0"
+# Version v0.83
+SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git;protocol=git"
+# git -> 0.83 needs a PE bump
+PE = "1"
+
+SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
 
 S = "${WORKDIR}/git"
 
-CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnull"
+CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli ${LDFLAGS}"
+
+# calling 'uname -m' is broken on crossbuilds
+EXTRA_OEMAKE = "NUMA=0"
 
 do_install() {
         oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
-- 
1.7.2.5



