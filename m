Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id DE579615AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 23:23:44 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 1701DA003A7; Fri, 18 Oct 2013 18:24:34 -0500 (CDT)
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 18:24:34 -0500
Message-Id: <cca0efd65c02144b21f0eae8f39e4ae2888e752d.1382138424.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <525EC341.9080407@linux.intel.com>
References: <525EC341.9080407@linux.intel.com>
In-Reply-To: <cover.1382138424.git.peter.seebach@windriver.com>
References: <cover.1382138424.git.peter.seebach@windriver.com>
Subject: [PATCH 2/2] Drop binutils-symlinks
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
X-List-Received-Date: Fri, 18 Oct 2013 23:23:45 -0000

The -symlinks package doesn't really add any value if we're
using update-alternatives. Drop it, leaving a spare RPROVIDES
in case anyone thought they needed it.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index eaf20bf..d38c3fe 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -15,17 +15,12 @@ DEPENDS = "flex-native bison-native zlib-native"
 
 inherit autotools gettext multilib_header
 
-PACKAGES += "${PN}-symlinks"
-
 FILES_${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*-*.so \
 	${prefix}/${TARGET_SYS}/bin/*"
 
-# Use alternatives rather than actual symlinks.
-FILES_${PN}-symlinks = ""
-
-ALLOW_EMPTY_${PN}-symlinks = "1"
+RPROVIDES_${PN} += "${PN}-symlinks"
 
 FILES_${PN}-dev = " \
 	${includedir} \
@@ -149,5 +144,4 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN}-symlinks_class-target = "${USE_ALTERNATIVES_FOR}"
-
+ALTERNATIVE_${PN}_class-target = "${USE_ALTERNATIVES_FOR}"
-- 
1.7.1


