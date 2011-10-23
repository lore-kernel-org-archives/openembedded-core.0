Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHzAp-00006b-NX
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 16:37:16 +0200
Received: by pzk33 with SMTP id 33so14356011pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=O5gc6vTSwj+s/QN2iCZd5rtRgIIWlQCATFe/xwRGsRc=;
	b=MIecpPaFiDXHPRMsZXyCVEJVb5fDGVFj7qHCj6doeIcIYej/nTrcSWsYGnKooIbFpj
	OsBwoMX7MtdYtInj6iK3LBWEgcZ97Dfd7NOmuEaSGunJD99xO9KreScTUJnHwhOLXN0w
	4etT0llZd41cjorSKkYPOSwynnAp3++mq6vOo=
Received: by 10.68.58.7 with SMTP id m7mr23912137pbq.106.1319380278644;
	Sun, 23 Oct 2011 07:31:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x7sm55741835pbf.5.2011.10.23.07.31.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Oct 2011 07:31:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 07:31:06 -0700
Message-Id: <1319380267-29794-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 1/2] matchbox-stroke: Fix linking error with gold
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
X-List-Received-Date: Sun, 23 Oct 2011 14:37:17 -0000

Gold defaults to no-add-needed thetefore
it does not link with librtaries that are not on cmdline
it needs libXrender but is not on the linker cmdline
so add it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../matchbox-stroke/files/ldadd_libXrender.patch   |   25 ++++++++++++++++++++
 .../matchbox-stroke/matchbox-stroke_git.bb         |    6 +++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch

diff --git a/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch b/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
new file mode 100644
index 0000000..90d2057
--- /dev/null
+++ b/meta/recipes-sato/matchbox-stroke/files/ldadd_libXrender.patch
@@ -0,0 +1,25 @@
+with GNU binutils-gold the
+important difference is that --no-add-needed is the default behavior of GNU
+binutils-gold. Please provide all needed libraries to the linker when building
+your executables.
+
+Otherwise we get link errors like
+
+/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.2/ld: matchbox-stroke-ui.o: in function mb_stroke_ui_resources_create:matchbox-stroke-ui.c:223: error: undefined reference to 'XRenderCreatePicture'collect2: ld returned 1 exit statusmake[2]: *** [matchbox-stroke] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: git/src/Makefile.am
+===================================================================
+--- git.orig/src/Makefile.am	2011-10-22 19:25:52.000000000 -0700
++++ git/src/Makefile.am	2011-10-22 19:27:07.746428946 -0700
+@@ -6,7 +6,7 @@
+ 
+ bin_PROGRAMS = matchbox-stroke
+ 
+-matchbox_stroke_LDADD = $(MBSTROKE_LIBS) $(EXPAT_LIBS) -lm
++matchbox_stroke_LDADD = $(MBSTROKE_LIBS) $(EXPAT_LIBS) -lm -lXrender
+ 
+ matchbox_stroke_SOURCES =                                          \
+        matchbox-stroke.h                                           \
diff --git a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
index 44b316d..2c2e940 100644
--- a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
+++ b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
@@ -9,11 +9,13 @@ DEPENDS = "libfakekey expat libxft"
 SECTION = "x11/wm"
 SRCREV = "8edfd9a2bf1f0d6b28d4afee4bda9d3635f26a0b"
 PV = "0.0+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://single-instance.patch \
-           file://configure_fix.patch;maxrev=1819"
+           file://configure_fix.patch;maxrev=1819 \
+           file://ldadd_libXrender.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
1.7.5.4



