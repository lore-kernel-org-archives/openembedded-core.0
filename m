Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsbIN-0002jm-1L
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:40:59 +0100
Received: from mail-ee0-f70.google.com ([74.125.83.70])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 07:25:42 -0800
Received: by mail-ee0-f70.google.com with SMTP id b47so549901eek.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 07:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=FODr4Ze+w6mHV+gROroG5LIiSo+5gv0kazRnLYIWfpk=;
	b=G/PRg76vc3qevZraKNMMmHimihHQV0YLJ1+eEVGQZJiZO53XGDxNcBrQOYdmt16gZt
	qvIzy2u1gCwjIVvqifh9HdnoiwIUpCg0D9icbNCnkfKf/kYHuCMEw1A7rvf8B1n8Tk0y
	1PBY/k+tKlrU2+XlG6mqpXkWxuwJC0icdCLGRM6Vz1voPW31U3OooquzStKBzRGJG9sH
	vMhGrZ9YbUEm8OGSJHVPtR0v1pgImDa19cDkDC44XButt0iTyJd3avJ43+GLZGfyK4hS
	Nst7rGHTy1CGm5H98kLFqbljVr8dJJ3SDumOyMsMN6mTQFQvGucZRI7Nq+cWBPJ53aYQ
	U8UA==
X-Received: by 10.180.96.225 with SMTP id dv1mr5948333wib.0.1357658740687;
	Tue, 08 Jan 2013 07:25:40 -0800 (PST)
X-Received: by 10.180.96.225 with SMTP id dv1mr5948322wib.0.1357658740456;
	Tue, 08 Jan 2013 07:25:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s16sm17506974wii.0.2013.01.08.07.25.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Jan 2013 07:25:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 15:23:47 +0000
Message-Id: <1357658627-31689-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmOtjFR/o5Hbl8UzQp/5IacDRZ7rdbm2kqR0a4b8dF0Zp2Ek+6m3zOdJDV2R2eDHfzK5NNbifSwEbfoNFfgLsyy1hHnPA+1XhQVqgxdJQeR97fyAP+MSBhyQGkDBddPQOohBZ5c7U5swQWUSvGtdgylkKmtX//okqTvlKByW+pR2d9hTDYTK5WRmIeLmLMIyQKA/hke
Subject: [PATCH] pkgconfig: add -native script that uses the native sysroot instead of target
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
X-List-Received-Date: Tue, 08 Jan 2013 15:41:00 -0000

pkg-config-native is useful when building a package for the target that needs to
compile a build-time tool, to avoid having to hard-code many paths.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc                |   10 ++++++++++
 .../pkgconfig/pkgconfig/pkg-config-native.in                 |    7 +++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index c54e325..c4fa456 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -15,6 +15,7 @@ DEPENDS_class-nativesdk = ""
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
            file://autofoo.patch \
            file://glibconfig-sysdefs.h \
+           file://pkg-config-native.in \
            file://disable-legacy.patch"
 
 S = "${WORKDIR}/pkg-config-${PV}/"
@@ -43,3 +44,12 @@ FILES_${PN} += "${datadir}/aclocal/pkg.m4"
 # will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
 # specifying an appropriate provide.
 RPROVIDES_${PN} += "pkgconfig(pkg-config) (= ${PV})"
+
+# Install a pkg-config-native wrapper that will use the native sysroot instead
+# of the MACHINE sysroot, for using pkg-config when building native tools.
+do_install_append_class-native () {
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
new file mode 100644
index 0000000..5e44bb4
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -0,0 +1,7 @@
+#! /bin/sh
+
+PKG_CONFIG_PATH="@PATH_NATIVE@"
+PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+unset PKG_CONFIG_SYSROOT_DIR
+
+pkg-config "$@"
-- 
1.7.10.4



