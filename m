Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T9hHx-00016W-Qo
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 20:58:54 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86IkQop018815;
	Thu, 6 Sep 2012 11:46:26 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Sep 2012 14:43:23 -0400
Message-Id: <fb717d4aa26b125680f620254cde9eb97ef0708a.1346956528.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1346956528.git.bruce.ashfield@windriver.com>
References: <cover.1346956528.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346956528.git.bruce.ashfield@windriver.com>
References: <cover.1346956528.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] conf/tune: add tune-ppce300c3
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
X-List-Received-Date: Thu, 06 Sep 2012 18:58:54 -0000

It has been pointed out several times that the yocto mpc8315e-rdb
reference was using the wrong tuning (603e), since it is actually
a e300c3 board.

This commit creates a e300c3 tune file based on the e300c2 variant
already in oe-core.

This commit also inhibits altivec in flac when this new tuning is
enabled. It was also noticed that the existing tune based overrides
in the flac package would not be triggered since DEFAULTTUNE is not
in the overrides list. To avoid doing per-board disabling of altivec
DEFAULTTUNE is added to the local package OVERRIDES and then used
to disable altivec.

[YOCTO #1192]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

asdfkljds
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/include/tune-ppce300c3.inc |   11 +++++++++++
 meta/recipes-multimedia/flac/flac_1.2.1.bb   |    5 +++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce300c3.inc

diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/tune-ppce300c3.inc
new file mode 100644
index 0000000..3f5ac26
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce300c3.inc
@@ -0,0 +1,11 @@
+DEFAULTTUNE ?= "ppce300c3"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "-mcpu=e300c3", "", d)}"
+
+AVAILTUNES += "ppce300c3"
+TUNE_FEATURES_tune-ppce300c3 = "m32 fpu-soft ppce300c3"
+TUNE_PKGARCH_tune-ppce300c3 = "ppce300c3"
+PACKAGE_EXTRA_ARCHS_tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3"
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 3c5b73c..25db1c4 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -36,9 +36,14 @@ EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
                 --without-xmms-exec-prefix \
                 --without-libiconv-prefix \
                 --without-id3lib"
+
+FLACOVERRIDE = ":${DEFAULTTUNE}"
+OVERRIDES .= "${FLACOVERRIDE}"
+
 EXTRA_OECONF_prepend_e500mc = "--disable-altivec "
 EXTRA_OECONF_prepend_e5500 = "--disable-altivec "
 EXTRA_OECONF_prepend_e5500-64b = "--disable-altivec "
+EXTRA_OECONF_prepend_ppce300c3 = "--disable-altivec "
 
 PACKAGES += "libflac libflac++ liboggflac liboggflac++"
 FILES_${PN} = "${bindir}/*"
-- 
1.7.7



