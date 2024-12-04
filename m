Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0857E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.8194.1733295001692575846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k6Nra2h3;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a742481aso52672765e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733295000; x=1733899800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Kzb8oCG1M+zS6+uSNs7QbWlm6iwP5JdpBdlEiA3w0g=;
        b=k6Nra2h3QHd6l/IHHSPC7dOmo8aQP189M/xLvzaEwIipmaHBp72NTiaV2rYJSF1OxS
         DghA5o2sUuCSF79RdMp/UfgP3vvxFWCrYO22LaGK7e7v4pQU1Jv3SPCE/4F3LK36u7bS
         WcPXnXmNZRPqsMprz8cq4gsNh0L5en7Q13UpyvMZBEJ49GK5tuDKiYvyoY3DbJeh6tC9
         hcrGasIpR7N1/5skVv81unAWKm+a4zXWRsguxaFbGv3YuFZQ2sxSwWJ0eQ4De4+7Orar
         zbBv9mkKlckreEsZf+06OIDshgeuxbc1K5CC5an3agNcZ7vEgyDcBKQ77uy8GCG0/Cox
         sgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733295000; x=1733899800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Kzb8oCG1M+zS6+uSNs7QbWlm6iwP5JdpBdlEiA3w0g=;
        b=n+0oCAFNDU5ymVYLpD5ms07+ezVMW8MiZZBs8PTwS9DDCyrx0viKbhHOBI1GC+0FT8
         ZtPPI5utZxw79xESaOiXB9nxzKq9J4Z7K+k88f1kTYhdDPkCSbm6YG6G887+bSjpGLfY
         SHUjnwOerog5MV2jSBGLFiYXprQJ+CSpj5FKl0rN0+5QWsWv+rzGR3TNEueHRRghku0d
         fn0M4vdQ4NSz+uxDYmOF93o0Uw9pE43tP8tpguxq+u2di2PB+WwNwfrTr4xHKVG5uhum
         oz7r0lXniG/C/X7n3cYTkXCUQpoNIrnnGhkmmNLh97m25+cGNSldtS4Go8TQxWauJ6/j
         q7vw==
X-Gm-Message-State: AOJu0Yw43uhQcDTLDrcZACr5EimgW4l6OlriZNVi2Eg+R/czdUMerTSM
	mCCOJgPJXtjn0/syEszopQ0RyFObI9tNLt8MNYBA2FiSmxlxOZfh1d45dQ==
X-Gm-Gg: ASbGncsY9UfSsYqtngBEYRCSmdjoc3RS1Ey4VRduA7wNYB1j/CM8eKKpM3VjJHKEBMK
	ltXljRJMm6QEBURmwymR8/VJsVzgebsToINfOxS9Jg3IZJzqSY3DdlGLkCg0v4nopXXxs0cJeWR
	cslrsUj2WHzk3QymNzvvB7hPj80+PMTv2w1NJi/O9mYedgZg9HytV+1vKYESVIi+z/HlXjVLGMT
	1HJ22wIu9eJByGUxDK7OjYGhO2Eg42bqUYW6tnzVsFh/+zDEYvo0Pcld/4Q5XoYMc/Wr4D6ZBY0
	jbvSTJ0Vgas=
X-Google-Smtp-Source: AGHT+IHXUb/Fp93ngqgUKXsEF2AGTlKU+hK2imaquqX0SZ7vH+xEAxps1WF6OEl9OtE4jK68E8U6yw==
X-Received: by 2002:a05:6000:1867:b0:385:e411:c894 with SMTP id ffacd0b85a97d-385fd53edc0mr4423530f8f.43.1733294999967;
        Tue, 03 Dec 2024 22:49:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/37] libpam: update 1.6.1 -> 1.7.0
Date: Wed,  4 Dec 2024 07:49:14 +0100
Message-Id: <20241204064920.817016-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208260

From: Alexander Kanavin <alex@linutronix.de>

Change from autotools to meson.

ptest support is removed for now, as pam-ptest isn't executed
on the autobuilder.

Adjust packaging as pam now installs everything into /usr rather than /.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ect-check-for-existence-of-two-prepr.patch | 40 +++++++++++++++
 .../pam/libpam/libpam-xtests.patch            | 45 ----------------
 .../pam/{libpam_1.6.1.bb => libpam_1.7.0.bb}  | 51 +++++--------------
 3 files changed, 52 insertions(+), 84 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
 rename meta/recipes-extended/pam/{libpam_1.6.1.bb => libpam_1.7.0.bb} (79%)

diff --git a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch b/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
new file mode 100644
index 00000000000..ef087ffc06b
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
@@ -0,0 +1,40 @@
+From 9b5182d4781bcd6fb37a4030faf325965fde3e93 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 28 Nov 2024 20:32:17 +0100
+Subject: [PATCH] meson: correct check for existence of two preprocessor
+ defines
+
+sizeof is meant for *types*, and in case of cross compiling
+the test program produced by it has incorrect syntax
+  __NR_keyctl something;
+and will always fail to compile.
+
+* meson.build: Use cc.get_define() instead of cc.sizeof() to check for
+preprocessor symbols.
+
+Co-authored-by: Dmitry V. Levin <ldv@strace.io>
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/pull/861]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index f6a7dafe9..307fed0aa 100644
+--- a/meson.build
++++ b/meson.build
+@@ -198,12 +198,12 @@ foreach ident: check_functions
+   endif
+ endforeach
+ 
+-enable_pam_keyinit = cc.sizeof('__NR_keyctl', prefix: '#include <sys/syscall.h>') > 0
++enable_pam_keyinit = cc.get_define('__NR_keyctl', prefix: '#include <sys/syscall.h>') != ''
+ 
+ if get_option('mailspool') != ''
+   cdata.set_quoted('PAM_PATH_MAILDIR', get_option('mailspool'))
+ else
+-  have = cc.sizeof('_PATH_MAILDIR', prefix: '#include <paths.h>') > 0
++  have = cc.get_define('_PATH_MAILDIR', prefix: '#include <paths.h>') != ''
+   cdata.set('PAM_PATH_MAILDIR', have ? '_PATH_MAILDIR' : '"/var/spool/mail"')
+ endif
+ 
diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
deleted file mode 100644
index f2dafa72a5b..00000000000
--- a/meta/recipes-extended/pam/libpam/libpam-xtests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 060726f7e60c8ecb5bf50fd776910b290d9a0a69 Mon Sep 17 00:00:00 2001
-From: Kang Kai <kai.kang@windriver.com>
-Date: Tue, 19 Jul 2011 17:08:31 +0800
-Subject: [PATCH] This patch is used to create a new sub package libpam-xtests
- to do more checks.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
----
- xtests/Makefile.am | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/xtests/Makefile.am b/xtests/Makefile.am
-index acf9746..9826c9f 100644
---- a/xtests/Makefile.am
-+++ b/xtests/Makefile.am
-@@ -8,7 +8,7 @@ AM_CFLAGS = -DLIBPAM_COMPILE -I$(top_srcdir)/libpam/include \
- LDADD = $(top_builddir)/libpam/libpam.la \
- 	$(top_builddir)/libpam_misc/libpam_misc.la
- 
--CLEANFILES = *~ $(XTESTS)
-+CLEANFILES = *~
- 
- EXTRA_DIST = run-xtests.sh tst-pam_dispatch1.pamd tst-pam_dispatch2.pamd \
- 	tst-pam_dispatch3.pamd tst-pam_dispatch4.pamd \
-@@ -55,3 +55,18 @@ EXTRA_PROGRAMS = $(XTESTS)
- 
- xtests: $(XTESTS) run-xtests.sh
- 	"$(srcdir)"/run-xtests.sh "$(srcdir)" ${XTESTS} ${NOSRCTESTS}
-+
-+all: $(XTESTS)
-+
-+install: install_xtests
-+
-+install_xtests:
-+	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/xtests
-+	for file in $(EXTRA_DIST) ; do \
-+		$(INSTALL) $(srcdir)/$$file $(DESTDIR)$(pkgdatadir)/xtests ; \
-+	done
-+	for file in $(XTESTS); do \
-+		$(INSTALL) .libs/$$file $(DESTDIR)$(pkgdatadir)/xtests ; \
-+	done
-+
-+.PHONY: all install_xtests
diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
similarity index 79%
rename from meta/recipes-extended/pam/libpam_1.6.1.bb
rename to meta/recipes-extended/pam/libpam_1.7.0.bb
index a48f78187b2..ec1c868d219 100644
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -20,40 +20,32 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam.d/common-session \
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
-           file://libpam-xtests.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
+           file://0001-meson.build-correct-check-for-existence-of-two-prepr.patch \
            "
 
-SRC_URI[sha256sum] = "f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e"
+SRC_URI[sha256sum] = "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59661cdae9b13b1697"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-EXTRA_OECONF = "--includedir=${includedir}/security \
-                --libdir=${base_libdir} \
-                --with-systemdunitdir=${systemd_system_unitdir} \
-                --disable-nis \
-                --disable-regenerate-docu \
-                --disable-doc \
-		--disable-prelude"
-
-CFLAGS += "-fPIC "
+EXTRA_OEMESON = "-Ddocs=disabled"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-inherit autotools gettext pkgconfig systemd ptest github-releases
+inherit meson gettext pkgconfig systemd ptest github-releases
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
-PACKAGECONFIG[userdb] = "--enable-db=db,--enable-db=no,db,"
+PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit,"
+PACKAGECONFIG[userdb] = "-Dpam_userdb=enabled -Ddb=gdbm,-Dpam_userdb=disabled,gdbm,"
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES:${PN} = " \
-    ${base_libdir}/lib*${SOLIBS} \
+    ${libdir}/lib*${SOLIBS} \
     ${nonarch_libdir}/tmpfiles.d/*.conf \
 "
-FILES:${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${systemd_system_unitdir}"
+FILES:${PN}-dev += "${libdir}/security/*.la ${libdir}/*.la ${libdir}/lib*${SOLIBSDEV}"
+FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${nonarch_libdir}/systemd/system"
 FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 # libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
@@ -111,9 +103,9 @@ python populate_packages:prepend () {
 
     mlprefix = d.getVar('MLPREFIX') or ''
     dvar = d.expand('${WORKDIR}/package')
-    pam_libdir = d.expand('${base_libdir}/security')
+    pam_libdir = d.expand('${libdir}/security')
     pam_sbindir = d.expand('${sbindir}')
-    pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
+    pam_filterdir = d.expand('${libdir}/security/pam_filter')
     pam_pkgname = mlprefix + 'pam-plugin%s'
 
     do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
@@ -121,16 +113,7 @@ python populate_packages:prepend () {
     do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
 }
 
-do_compile_ptest() {
-        cd tests
-        sed -i -e 's/$(MAKE) $(AM_MAKEFLAGS) check-TESTS//' Makefile
-        oe_runmake check-am
-        cd -
-}
-
-do_install() {
-	autotools_do_install
-
+do_install:append() {
 	# don't install /var/run when populating rootfs. Do it through volatile
 	rm -rf ${D}${localstatedir}
 
@@ -155,16 +138,6 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
 	fi
-	if [ "${base_libdir}" != "${libdir}" ]; then
-		install -d ${D}/${libdir}/
-		mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
-	fi
-}
-
-do_install_ptest() {
-    mkdir -p ${D}${PTEST_PATH}/tests
-    install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
-    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
 }
 
 pkg_postinst:${PN}() {
-- 
2.39.5


