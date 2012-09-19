Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TEEki-0008Cv-5z
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 09:31:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3311; q=dns/txt; s=iport;
	t=1348039121; x=1349248721;
	h=from:to:cc:subject:date:message-id;
	bh=Rnx1BTeC1sNt045E5icFchLc15/K+FgT1/Y+Rrf5Xyc=;
	b=JfBCk84q+ZVIOt1jgt7baUu4v5MdvCWqqgWB1/aF3mM6OTOLhrdy7WSf
	SO17v1sXEOxuXlCMHzyggx+XvXK/gckxESwp1Mb+gvAbUniWl/7URthJh
	hpNai2GcGB/f+bdHENHMJ6rAUAPrKG8mWGu6ULHxRUrlIM9vD8xEIl0WW g=;
X-IronPort-AV: E=Sophos;i="4.80,447,1344211200"; d="scan'208";a="144022254"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-1.cisco.com with ESMTP; 19 Sep 2012 07:18:39 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q8J7Ic6F023380;
	Wed, 19 Sep 2012 07:18:38 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 09:16:55 +0200
Message-Id: <1348039015-27100-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH v2] bash: Make it possible to run bash 3.2.48 instead of 4.2.
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
X-List-Received-Date: Wed, 19 Sep 2012 07:31:20 -0000

bash-3.2.48 did not provide the linking from sh to bash, making it unusable.
Moving the license part out of the bash.inc file, and into bash_4.2.bb file makes
us able to use that file also for bash_3.2.48.bb, which makes maintaining both
at the same time a lot easier.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta/recipes-extended/bash/bash.inc       |    3 --
 meta/recipes-extended/bash/bash_3.2.48.bb |   31 +---------------------------
 meta/recipes-extended/bash/bash_4.2.bb    |    6 ++++-
 3 files changed, 7 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 3684191..ae4b681 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -2,9 +2,6 @@ DESCRIPTION = "An sh-compatible command language interpreter."
 HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
 SECTION = "base/shell"
 
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext update-alternatives
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 509d7a0..828d629 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -1,12 +1,9 @@
-DESCRIPTION = "An sh-compatible command language interpreter."
-HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
-SECTION = "base/shell"
+require bash.inc
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
-DEPENDS = "ncurses"
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
@@ -24,27 +21,3 @@ SRC_URI[patch003.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede
 
 SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
 SRC_URI[sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
-
-inherit autotools gettext
-
-PARALLEL_MAKE = ""
-
-bindir = "/bin"
-sbindir = "/sbin"
-
-EXTRA_OECONF = "--with-ncurses"
-export CC_FOR_BUILD = "${BUILD_CC}"
-
-export AUTOHEADER = "true"
-
-do_configure_prepend () {
-	if [ ! -e acinclude.m4 ]; then
-		cat aclocal.m4 > acinclude.m4
-	fi
-}
-
-pkg_postinst_${PN} () {
-	touch $D${sysconfdir}/shells
-	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
-	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
-}
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 384eb62..5a0f015 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,10 @@
 require bash.inc
 
-PR = "r4"
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.8.6



