Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbXLY-00044R-5z
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 14:24:52 +0200
Received: by wwi14 with SMTP id 14so2879798wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 05:21:11 -0700 (PDT)
Received: by 10.216.60.4 with SMTP id t4mr6129670wec.101.1309263670117;
	Tue, 28 Jun 2011 05:21:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d7sm89187wek.21.2011.06.28.05.21.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 05:21:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 14:21:06 +0200
Message-Id: <1309263666-27781-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] eglibc-locale: add missing 2.12 version
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
X-List-Received-Date: Tue, 28 Jun 2011 12:24:52 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/eglibc/eglibc-locale_2.12.bb |   58 ++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.12.bb

diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.12.bb b/meta/recipes-core/eglibc/eglibc-locale_2.12.bb
new file mode 100644
index 0000000..ed6c099
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-locale_2.12.bb
@@ -0,0 +1,58 @@
+INHIBIT_DEFAULT_DEPS = "1"
+LICENSE = "LGPL"
+
+BPN = "eglibc"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
+# is set. The idea is to avoid running localedef on the target (at first boot)
+# to decrease initial boot time and avoid localedef being killed by the OOM
+# killer which used to effectively break i18n on machines with < 128MB RAM.
+
+# default to disabled 
+ENABLE_BINARY_LOCALE_GENERATION ?= "0"
+ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-locale-nativesdk = "0"
+
+#enable locale generation on these arches
+# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
+
+# set "1" to use cross-localedef for locale generation
+# set "0" for qemu emulation of native localedef for locale generation
+LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
+
+PR = "r0"
+
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
+PACKAGES = "eglibc-locale localedef${PKGSUFFIX}"
+
+PACKAGES_DYNAMIC = "locale-base-* \
+                    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
+                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
+
+PROVIDES = "virtual/libc-locale${PKGSUFFIX}"
+
+RPROVIDES_eglibc-locale = "glibc-locale"
+
+FILES_eglibc-gconv = "${libdir}/gconv/*"
+FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
+
+do_install () {
+	cp -fpPR ${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}/* ${D}
+	cp -fpPR ${D}/SUPPORTED ${WORKDIR}
+}
+
+DESCRIPTION_localedef = "eglibc: compile locale definition files"
+
+inherit libc-package
+
+do_install[depends] += "virtual/libc${PKGSUFFIX}:do_populate_sysroot"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.6.6.1



