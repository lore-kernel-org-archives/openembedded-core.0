Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.17669.1590940471341515355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a05M5pAd;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id e12so177765eds.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FlZ2YSBBT2e2T3/aoGqvZ/LN7w9ElQf4RgNcEoJmwTY=;
        b=a05M5pAdKSD2pnLlJ6cCCaH8b1dIatwceuKgqGWlIv9bick9glvE1N7zO2A56c4i9p
         Tvrje8f8ytH5AMsbsFHI0YjZwKDCRyLKboilq7bWSdqz/Usyr3PoDjLAtyA3SCDncgNY
         +qwSPT1BawHbB2BMw/kvJ7XOOZxwyCyMCxJqkTyrDQ1NJ0PDzgKTGp+q0gs4VL0N7PsF
         hd54RuLHkTXgn+n98RSbrtO4MemB/GR/xHw/7roKEy/eI1Yzj6wzdPmiWbjtE8NPJFjw
         +ZyWWByIbXIZsw/i/IMOnv4f1A1qNFxl1mAcQbiCbJXwDy0Kq3uYigJI3aVUd1eGEpgf
         9tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FlZ2YSBBT2e2T3/aoGqvZ/LN7w9ElQf4RgNcEoJmwTY=;
        b=YUn4Frr6/qOhYelmEW1YTb7wAI5AEpCfSwuqo2aDY/QDXCkcotiM5snF02DR4GqD5I
         NpzCdQEmN3/a9adKyfg2iLryg52iHyuQY6oSvtbVVoGJZH8X5ixu4tWReKvt5lIMR9/w
         LmZBrk8/0CQzhiO7sjLJrZBT3nd0tSQHB3L2QcOqanJmz6y/XcIXc49MrfjigDMxgOuR
         LpwGGDOf/BVgjoyMl9w5uULSKCUUGTyfn8cjBBXfzrLIlFMvgCKHqZCseE7z5YFgoDwR
         ZDooZaoqp2CsiTSVgKZD92cMrF2g4aYQy1N0jfHSeSw/+HYqPW6DfEkVFGZlRykT95SQ
         fvUg==
X-Gm-Message-State: AOAM532m1H1uuCG7Jfd6WmW5+RjC2ZKgqIngUT+6BqAURpVlvp6syYGa
	VhI8yEq5VzLJYgDabpmP89GvTCkY
X-Google-Smtp-Source: ABdhPJzRyG5+o77Aswf5ekUoemFDbfzm/SmFqVXSpXAVYnquaABhwx9aHev01Qcn36T0wHYdWcWi6g==
X-Received: by 2002:aa7:c617:: with SMTP id h23mr18224997edq.305.1590940467525;
        Sun, 31 May 2020 08:54:27 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 67/70] apt: update to 1.8.2.1
Date: Sun, 31 May 2020 17:52:51 +0200
Message-Id: <20200531155254.10283-67-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I took the opportunity to rewrite the recipe from scratch; there was just too much baggage in it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/lib/oe/package_manager.py                |   2 +-
 meta/lib/oeqa/runtime/cases/apt.py            |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 meta/recipes-devtools/apt/apt-native.inc      |  74 --
 .../recipes-devtools/apt/apt-native_1.2.31.bb |   5 -
 meta/recipes-devtools/apt/apt-package.inc     |  94 ---
 meta/recipes-devtools/apt/apt.inc             |  40 -
 ...void-changing-install-paths-based-on.patch |  29 +
 ...e-documentation-directory-altogether.patch |  27 +
 ...t-configure-packages-on-installation.patch |  48 ++
 ...-init-tables-from-dpkg-configuration.patch |  29 +
 ...-build.patch => 0001-Fix-musl-build.patch} |  43 +-
 .../0001-Include-array.h-for-std-array.patch  |  35 -
 ...n-dpkg-configure-a-at-the-end-of-our.patch | 120 +--
 ...le-is-not-portable-use-std-locale-cl.patch |  27 -
 ...musl-based-systems-can-generate-shar.patch |  29 -
 .../apt/disable-configure-in-makefile.patch   |  18 -
 .../apt/apt/disable-test.patch                |  72 --
 .../apt/fix-gcc-4.6-null-not-defined.patch    |  14 -
 meta/recipes-devtools/apt/apt/makerace.patch  |  23 -
 .../apt/apt/no-nls-dpkg.patch                 |  28 -
 .../apt/apt/noconfigure.patch                 |  37 -
 meta/recipes-devtools/apt/apt/nodoc.patch     |  18 -
 meta/recipes-devtools/apt/apt/triehash        | 728 ++++++++++++++++++
 .../apt/apt/truncate-filename.patch           |  35 -
 meta/recipes-devtools/apt/apt/use-host.patch  |  15 -
 meta/recipes-devtools/apt/apt_1.2.31.bb       |  20 -
 meta/recipes-devtools/apt/apt_1.8.2.1.bb      | 106 +++
 meta/recipes-devtools/apt/files/apt.conf      |  42 -
 .../apt/files/db_linking_hack.patch           |  29 -
 .../apt/files/environment.patch               |  15 -
 meta/recipes-devtools/apt/files/no-curl.patch |  54 --
 33 files changed, 1010 insertions(+), 851 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-native.inc
 delete mode 100644 meta/recipes-devtools/apt/apt-native_1.2.31.bb
 delete mode 100644 meta/recipes-devtools/apt/apt-package.inc
 delete mode 100644 meta/recipes-devtools/apt/apt.inc
 create mode 100644 meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
 rename meta/recipes-devtools/apt/apt/{0001-apt-1.2.12-Fix-musl-build.patch => 0001-Fix-musl-build.patch} (55%)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/disable-configure-in-makefile.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/disable-test.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/makerace.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/noconfigure.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/nodoc.patch
 create mode 100755 meta/recipes-devtools/apt/apt/triehash
 delete mode 100644 meta/recipes-devtools/apt/apt/truncate-filename.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/use-host.patch
 delete mode 100644 meta/recipes-devtools/apt/apt_1.2.31.bb
 create mode 100644 meta/recipes-devtools/apt/apt_1.8.2.1.bb
 delete mode 100644 meta/recipes-devtools/apt/files/apt.conf
 delete mode 100644 meta/recipes-devtools/apt/files/db_linking_hack.patch
 delete mode 100644 meta/recipes-devtools/apt/files/environment.patch
 delete mode 100644 meta/recipes-devtools/apt/files/no-curl.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 51e6da669c..1ca1dcf775 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -43,7 +43,6 @@ RECIPE_MAINTAINER_pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
-RECIPE_MAINTAINER_pn-apt-native = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c055d2b0f7..35e5cff073 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1800,7 +1800,7 @@ class DpkgPM(OpkgDpkgPM):
     def fix_broken_dependencies(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        cmd = "%s %s -f install" % (self.apt_get_cmd, self.apt_args)
+        cmd = "%s %s --allow-unauthenticated -f install" % (self.apt_get_cmd, self.apt_args)
 
         try:
             subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index c5378d90c3..53745df93f 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -34,7 +34,7 @@ class AptRepoTest(AptTest):
     def setup_source_config_for_package_install(self):
         apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
         apt_get_sourceslist_dir = '/etc/apt/'
-        self.target.run('cd %s; echo deb %s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
 
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir = '/etc/apt/'
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5886862d6c..b9414714f2 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -676,7 +676,7 @@ class DevtoolModifyTests(DevtoolBase):
 
         bbclassextended = False
         inheritnative = False
-        testrecipes = 'mtools-native apt-native desktop-file-utils-native'.split()
+        testrecipes = 'cdrtools-native mtools-native apt-native desktop-file-utils-native'.split()
         for testrecipe in testrecipes:
             checkextend = 'native' in (get_bb_var('BBCLASSEXTEND', testrecipe) or '').split()
             if not bbclassextended:
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
deleted file mode 100644
index d826786329..0000000000
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ /dev/null
@@ -1,74 +0,0 @@
-require apt.inc
-inherit native
-
-DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
-PACKAGES = ""
-USE_NLS = "yes"
-
-SRC_URI += "file://db_linking_hack.patch \
-            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-"
-
-python do_install () {
-    bb.build.exec_func('do_install_base', d)
-    bb.build.exec_func('do_install_config', d)
-}
-
-python do_install_config () {
-    indir = os.path.dirname(d.getVar('FILE'))
-    infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
-    data = infile.read()
-    infile.close()
-
-    data = d.expand(data)
-
-    outdir = oe.path.join(d.getVar('D'), d.getVar('sysconfdir'), 'apt')
-    if not os.path.exists(outdir):
-        os.makedirs(outdir)
-
-    outpath = oe.path.join(outdir, 'apt.conf.sample')
-    if not os.path.exists(outpath):
-        outfile = open(outpath, 'w')
-        outfile.write(data)
-        outfile.close()
-}
-
-do_install_base () {
-	install -d ${D}${bindir}
-	install -m 0755 bin/apt-cdrom ${D}${bindir}/
-	install -m 0755 bin/apt-get ${D}${bindir}/
-	install -m 0755 bin/apt-config ${D}${bindir}/
-	install -m 0755 bin/apt-cache ${D}${bindir}/
-	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
-	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
-	install -m 0755 bin/apt-ftparchive ${D}${bindir}/
-
-	oe_libinstall -so -C bin libapt-private ${D}${libdir}/
-
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-
-	install -d ${D}${libdir}/apt/methods
-	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
-
-	install -d ${D}${libdir}/dpkg/methods/apt
-	install -m 0644 ${S}/dselect/desc.apt ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0644 ${S}/dselect/names ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/install ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/ 
-
-	install -d ${D}${sysconfdir}/apt
-	install -d ${D}${sysconfdir}/apt/apt.conf.d
-	install -d ${D}${sysconfdir}/apt/preferences.d
-	install -d ${D}${localstatedir}/lib/apt/lists/partial
-	install -d ${D}${localstatedir}/cache/apt/archives/partial
-
-	install -d ${D}${localstatedir}/log/apt/
-
-	install -d ${D}${includedir}/apt-pkg
-	for h in `find ${S}/apt-pkg ${S}/apt-inst -name '*.h'`
-	do
-		install -m 0644 $h ${D}${includedir}/apt-pkg
-	done
-}
diff --git a/meta/recipes-devtools/apt/apt-native_1.2.31.bb b/meta/recipes-devtools/apt/apt-native_1.2.31.bb
deleted file mode 100644
index 2952c21017..0000000000
--- a/meta/recipes-devtools/apt/apt-native_1.2.31.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require apt-native.inc
-
-SRC_URI += "file://noconfigure.patch \
-            file://no-curl.patch \
-"
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
deleted file mode 100644
index 922f739d0d..0000000000
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ /dev/null
@@ -1,94 +0,0 @@
-apt-manpages="doc/apt-cache.8 \
-	      doc/apt-cdrom.8 \
-	      doc/apt-config.8 \
-	      doc/apt-get.8 \
-	      doc/apt.8 \
-	      doc/apt.conf.5 \
-	      doc/apt_preferences.5 \
-	      doc/sources.list.5"
-apt-utils-manpages="doc/apt-extracttemplates.1 \
-		    doc/apt-sortpkgs.1"
-
-def get_files_apt_doc(d, bb, manpages):
-    import re
-    manpages = re.sub(r'\bdoc/(\S+)/(\S+)\.\1\.(.)\b', r'${mandir}/\1/man\3/\2.\3', manpages)
-    manpages = re.sub(r'\bdoc/(\S+)\.(.)\b', r'${mandir}/man\2/\1.\2', manpages)
-    return manpages
-
-def get_commands_apt_doc(d, bb, manpages):
-    s = list()
-    __dir_cache__ = list()
-    for m in manpages.split():
-        dest = get_files_apt_doc(d, bb, m)
-        dir = os.path.dirname(dest)
-        if not dir in __dir_cache__:
-            s.append("install -d ${D}/%s" % dir)
-            __dir_cache__.append(dir)
-        s.append("install -m 0644 %s ${D}/%s" % (m, dest))
-    return "\n".join(s)
-
-PACKAGES += "${PN}-utils ${PN}-utils-doc"
-FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
-	       ${bindir}/apt-config ${bindir}/apt-cache \
-	       ${libdir}/apt ${libdir}/libapt*.so.* \
-	       ${localstatedir} ${sysconfdir} \
-	       ${libdir}/dpkg \
-	       ${systemd_unitdir}/system \
-           "
-RDEPENDS_${PN} += "perl"
-FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
-FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages'))} \
-		   ${docdir}/apt"
-FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages'))}"
-FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
-
-inherit systemd
-
-SYSTEMD_SERVICE_${PN} = "apt-daily.timer"
-
-do_install () {
-	set -x
-	install -d ${D}${bindir}
-	install -m 0755 bin/apt-key ${D}${bindir}/
-	install -m 0755 bin/apt-cdrom ${D}${bindir}/
-	install -m 0755 bin/apt-get ${D}${bindir}/
-	install -m 0755 bin/apt-config ${D}${bindir}/
-	install -m 0755 bin/apt-cache ${D}${bindir}/
-
-	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
-	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
-
-	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}
-	oe_libinstall -so -C bin libapt-inst ${D}${libdir}
-
-	install -d ${D}${libdir}/apt/methods
-	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
-
-	install -d ${D}${libdir}/dpkg/methods/apt
-	install -m 0644 ${S}/dselect/desc.apt ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0644 ${S}/dselect/names ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/install ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/ 
-
-	install -d ${D}${sysconfdir}/apt
-	install -d ${D}${sysconfdir}/apt/apt.conf.d
-	install -d ${D}${sysconfdir}/apt/sources.list.d
-	install -d ${D}${sysconfdir}/apt/preferences.d
-	install -d ${D}${localstatedir}/lib/apt/lists/partial
-	install -d ${D}${localstatedir}/cache/apt/archives/partial
-	install -d ${D}${docdir}/apt/examples
-	install -m 0644 ${S}/doc/examples/* ${D}${docdir}/apt/examples/
-
-	install -d ${D}${includedir}/apt-pkg/
-	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
-
-	install -d ${D}${systemd_unitdir}/system/
-	install -m 0755 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
-	install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/system/
-	sed -i 's#/usr/lib/apt/#${libdir}/apt/#g' ${D}${systemd_unitdir}/system/apt-daily.service
-	install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/system/
-	install -d ${D}${sysconfdir}/cron.daily/
-	install -m 0755 ${S}/debian/apt.apt-compat.cron.daily ${D}${sysconfdir}/cron.daily/
-	sed -i 's#/usr/lib/apt/#${libdir}/apt/#g' ${D}${sysconfdir}/cron.daily/apt.apt-compat.cron.daily
-}
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
deleted file mode 100644
index 87d533782f..0000000000
--- a/meta/recipes-devtools/apt/apt.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Advanced front-end for dpkg"
-DESCRIPTION = "Provides command-line tools for searching and managing as well \
-as querying information about packages as a low-level access to all features \
-of the libapt-pkg library."
-LICENSE = "GPLv2.0+"
-SECTION = "base"
-
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${BPN}/${PV}/${BPN}_${PV}.tar.xz \
-           file://use-host.patch \
-           file://makerace.patch \
-           file://no-nls-dpkg.patch \
-           file://fix-gcc-4.6-null-not-defined.patch \
-           file://truncate-filename.patch \
-           file://nodoc.patch \
-           file://disable-configure-in-makefile.patch \
-           file://disable-test.patch \
-           file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
-           file://0001-apt-1.2.12-Fix-musl-build.patch \
-           file://0001-Include-array.h-for-std-array.patch \
-           file://0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch \
-           "
-SRC_URI[md5sum] = "d30eed9304e82ea8238c854b5c5a34d9"
-SRC_URI[sha256sum] = "03ded4f5e9b8d43ecec083704b2dcabf20c182ed382db9ac7251da0b0b038059"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-# the package is taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
-
-inherit autotools gettext useradd upstream-version-is-even
-
-EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
-
-do_configure_prepend() {
-    rm -rf ${S}/buildlib/config.sub
-    rm -rf ${S}/buildlib/config.guess
-}
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /nonexistent --shell /bin/false --user-group _apt"
diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
new file mode 100644
index 0000000000..199f11bf20
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -0,0 +1,29 @@
+From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 28 May 2020 15:34:05 +0000
+Subject: [PATCH] CMakeLists.txt: avoid changing install paths based on host
+ distro
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2cd4f8e..4759812 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -21,9 +21,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
+ set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "-lgcov")
+ 
+ # Work around bug in GNUInstallDirs
+-if (EXISTS "/etc/debian_version")
+-  set(CMAKE_INSTALL_LIBEXECDIR "lib")
+-endif()
++#if (EXISTS "/etc/debian_version")
++set(CMAKE_INSTALL_LIBEXECDIR "lib")
++#endif()
+ 
+ # Include stuff
+ include(Misc)
diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
new file mode 100644
index 0000000000..cc422b74dc
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -0,0 +1,27 @@
+From cd164b353ba7958d51b2f33f4079fb9787c983e2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 10 May 2019 14:16:47 +0200
+Subject: [PATCH] Disable documentation directory altogether
+
+Even when WITH_DOC=False, the build requires po4a to generate manpages.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 83334ba..2cd4f8e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -232,7 +232,7 @@ add_subdirectory(apt-private)
+ add_subdirectory(apt-inst)
+ add_subdirectory(cmdline)
+ add_subdirectory(completions)
+-add_subdirectory(doc)
++#add_subdirectory(doc)
+ add_subdirectory(dselect)
+ add_subdirectory(ftparchive)
+ add_subdirectory(methods)
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
new file mode 100644
index 0000000000..41831abe42
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
@@ -0,0 +1,48 @@
+From 1ad21140787a6b8b0f774f75b50444d2c30a56f6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 21 May 2020 20:28:12 +0000
+Subject: [PATCH] Do not configure packages on installation
+
+This is done separately in do_rootfs().
+
+Upstream-Status: Inappropirate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ apt-pkg/packagemanager.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/apt-pkg/packagemanager.cc b/apt-pkg/packagemanager.cc
+index 156f7ad..0f6a87c 100644
+--- a/apt-pkg/packagemanager.cc
++++ b/apt-pkg/packagemanager.cc
+@@ -1013,10 +1013,12 @@ bool pkgPackageManager::SmartUnPack(PkgIterator Pkg, bool const Immediate, int c
+       return false;
+ 
+    if (Immediate == true) {
++#if 0
+       // Perform immediate configuration of the package. 
+          if (SmartConfigure(Pkg, Depth + 1) == false)
+             _error->Error(_("Could not perform immediate configuration on '%s'. "
+                "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
++#endif
+    }
+    
+    return true;
+@@ -1111,6 +1113,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
+       }
+    }
+ 
++#if 0
+    // Final run through the configure phase
+    if (ConfigureAll() == false)
+       return Failed;
+@@ -1125,7 +1128,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
+ 	 return Failed;
+       }
+    }
+-	 
++#endif	 
+    return Completed;
+ }
+ // PM::DoInstallPostFork - compat /*{{{*/
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
new file mode 100644
index 0000000000..d3d3ab026d
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -0,0 +1,29 @@
+From b18d7aa7d71b53b86bac21cd1d8c3accabb28f2b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 10 May 2019 16:47:38 +0200
+Subject: [PATCH] Do not init tables from dpkg configuration
+
+This would require sysroot relocation logic, and it's easier to just disable them.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ apt-pkg/init.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
+index a619368..6e5a6cf 100644
+--- a/apt-pkg/init.cc
++++ b/apt-pkg/init.cc
+@@ -281,8 +281,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *&Sys)
+ 	 return _error->Error(_("Unable to determine a suitable packaging system type"));
+    }
+ 
+-   if (pkgInitArchTupleMap() == false)
+-      return false;
++//   if (pkgInitArchTupleMap() == false)
++//      return false;
+    
+    return Sys->Initialize(Cnf);
+ }
diff --git a/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
similarity index 55%
rename from meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
rename to meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
index f7ac19bfd0..a6e8ef1e51 100644
--- a/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,10 +1,7 @@
-From 33b97e089d4a98d3acd20bd78337dd915b989bc2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Fri, 5 Aug 2016 15:24:27 -0500
-Subject: [PATCH] apt 1.2.12: Fix musl build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
+From 081c6be2f2f1cd77f399ea414f8d89c107826624 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 22 May 2020 15:29:23 +0000
+Subject: [PATCH] Fix musl build
 
 methods/connect.cc: Musl doesn't support AI_IDN flag in netdb.h
 header so define it manually.
@@ -12,15 +9,14 @@ apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
 to avoid errors in types u_int_SIZE.
 
 Upstream-Status: Pending
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  apt-pkg/contrib/srvrec.h | 1 +
- methods/connect.cc       | 3 +++
- 2 files changed, 4 insertions(+)
+ methods/connect.cc       | 5 +++++
+ 2 files changed, 6 insertions(+)
 
 diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
-index 01b8102..15b6875 100644
+index e22b7a1..b1115f5 100644
 --- a/apt-pkg/contrib/srvrec.h
 +++ b/apt-pkg/contrib/srvrec.h
 @@ -9,6 +9,7 @@
@@ -28,23 +24,22 @@ index 01b8102..15b6875 100644
  #define SRVREC_H
  
 +#include <sys/types.h>
- #include <arpa/nameser.h>
- #include <vector>
  #include <string>
+ #include <vector>
+ #include <arpa/nameser.h>
 diff --git a/methods/connect.cc b/methods/connect.cc
-index 07a730b..bb0ab5a 100644
+index 1d6f891..122df35 100644
 --- a/methods/connect.cc
 +++ b/methods/connect.cc
-@@ -33,6 +33,9 @@
- #include <sys/socket.h>
- #include <arpa/inet.h>
- #include <netdb.h>
+@@ -42,6 +42,11 @@
+ #include "connect.h"
+ #include "rfc2553emu.h"
+ #include <apti18n.h>
++
 +#ifndef AI_IDN
 +#define AI_IDN 0x0040
 +#endif
++
+ 									/*}}}*/
  
- #include "connect.h"
- #include "rfc2553emu.h"
--- 
-2.1.4
-
+ static std::string LastHost;
diff --git a/meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch b/meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch
deleted file mode 100644
index e4a8faa2b4..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-Include-array.h-for-std-array.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4d64ec843185bf6fd1b85c3a6a4c4e3c968c8ab1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 Jan 2019 18:56:58 -0800
-Subject: [PATCH] Include <array.h> for std::array
-
-When compiling using clang/libc++ it fails to build because this header
-is not included, with libstdc++ this seems to be pulled in
-automatically.
-
-Fixes below error
-
-apt-pkg/contrib/strutl.cc:949:38: error: implicit instantiation of undefined template 'std::__1::array<const char *const, 7>'
-   std::array<char const * const, 7> c_weekdays = {{ "sun", "mon", "tue", "wed", "thu", "fri", "sat" }};
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/Debian/apt/commit/24a59c62efafbdb8387b2d3c5616b04b9fd21306]
----
- apt-pkg/contrib/strutl.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
-index 60d0ca8..c2bfcbc 100644
---- a/apt-pkg/contrib/strutl.cc
-+++ b/apt-pkg/contrib/strutl.cc
-@@ -21,6 +21,7 @@
- #include <apt-pkg/fileutl.h>
- #include <apt-pkg/error.h>
- 
-+#include <array>
- #include <algorithm>
- #include <iomanip>
- #include <locale>
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 734ba00d4f..8c4cc04503 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,11 +1,9 @@
-From dfc1370d50322e2e9d225a7a63b44993fc01a727 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Fri, 22 May 2015 08:05:15 +0800
+From 742fbb243f99e940c3e6b31296f7f416f550a57a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
  dpkg callings"
 
-Upstream-Status: Inappropriate [embedded specific]
-
 This reverts commit a2a75ff4516f7609f4c55b42270abb8d08943c60, which
 always run 'dpkg --configure -a' at the end of our dpkg callings,
 but it does not work for cross-compile, since the rootfs dir can not
@@ -14,19 +12,19 @@ be passed into dpkg, and lead to the below similar error:
    |mkdir: cannot create directory '/usr/lib/opkg': Permission denied
    -------
 
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- apt-pkg/deb/dpkgpm.cc                                     |  9 ++-------
- test/integration/test-apt-progress-fd-deb822              | 14 +++++++-------
- test/integration/test-no-fds-leaked-to-maintainer-scripts |  6 ++----
- 3 files changed, 11 insertions(+), 18 deletions(-)
+ apt-pkg/deb/dpkgpm.cc | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 533d9b367..6ce81bbd9 100644
+index ffa880d..5875e86 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1041,12 +1041,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
- 	 PackagesTotal++;
+@@ -1215,12 +1215,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+ 	 }
        }
     }
 -   /* one extra: We don't want the progress bar to reach 100%, especially not
@@ -37,90 +35,14 @@ index 533d9b367..6ce81bbd9 100644
 -   ++PackagesTotal;
  }
                                                                          /*}}}*/
- bool pkgDPkgPM::Go(int StatusFd)
-@@ -1268,8 +1262,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
- 
-    // support subpressing of triggers processing for special
-    // cases like d-i that runs the triggers handling manually
-+   bool const SmartConf = (_config->Find("PackageManager::Configure", "all") != "all");
+ bool pkgDPkgPM::Go(int StatusFd)					/*{{{*/
+@@ -1716,7 +1710,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+ 
+       // support subpressing of triggers processing for special
+       // cases like d-i that runs the triggers handling manually
+-      if (_config->FindB("DPkg::ConfigurePending", true))
++      bool const SmartConf = (_config->Find("PackageManager::Configure", "all") != "all");
++      if (0)
+ 	 List.emplace_back(Item::ConfigurePending, pkgCache::PkgIterator());
+    }
     bool const TriggersPending = _config->FindB("DPkg::TriggersPending", false);
--   if (_config->FindB("DPkg::ConfigurePending", true) == true)
-+   if (_config->FindB("DPkg::ConfigurePending", SmartConf) == true)
-       List.push_back(Item(Item::ConfigurePending, PkgIterator()));
- 
-    // for the progress
-diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/integration/test-apt-progress-fd-deb822
-index a8d59608d..0c6a9bbbf 100755
---- a/test/integration/test-apt-progress-fd-deb822
-+++ b/test/integration/test-apt-progress-fd-deb822
-@@ -27,36 +27,36 @@ Message: Installing testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 16.6667
-+Percent: 20
- Message: Preparing testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 33.3333
-+Percent: 40
- Message: Unpacking testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 50.0000
-+Percent: 60.0000
- Message: Preparing to configure testing (amd64)
- 
- Status: progress
--Percent: 50.0000
-+Percent: 60.0000
- Message: Running dpkg
- 
- Status: progress
- Package: testing:amd64
--Percent: 50.0000
-+Percent: 60.0000
- Message: Configuring testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 66.6667
-+Percent: 80
- Message: Configuring testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 83.3333
-+Percent: 100
- Message: Installed testing (amd64)
- 
- Status: progress
-diff --git a/test/integration/test-no-fds-leaked-to-maintainer-scripts b/test/integration/test-no-fds-leaked-to-maintainer-scripts
-index d86e638cd..ef6d23be2 100755
---- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
-+++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
-@@ -59,8 +59,7 @@ startup packages configure
- configure $PKGNAME 1.0 <none>
- status unpacked $PKGNAME 1.0
- status half-configured $PKGNAME 1.0
--status installed $PKGNAME 1.0
--startup packages configure" cut -f 3- -d' ' rootdir/var/log/dpkg.log
-+status installed $PKGNAME 1.0" cut -f 3- -d' ' rootdir/var/log/dpkg.log
- }
- checkinstall
- 
-@@ -85,8 +84,7 @@ status config-files $PKGNAME 1.0
- status config-files $PKGNAME 1.0
- status config-files $PKGNAME 1.0
- status config-files $PKGNAME 1.0
--status not-installed $PKGNAME <none>
--startup packages configure" cut -f 3- -d' ' rootdir/var/log/dpkg.log
-+status not-installed $PKGNAME <none>" cut -f 3- -d' ' rootdir/var/log/dpkg.log
- }
- checkpurge
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch b/meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch
deleted file mode 100644
index ce5c005086..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7e8839731ae3fdf7502b91643aa6b252f6c5eaa6 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Thu, 14 May 2020 00:08:21 +0300
-Subject: The C.UTF-8 locale is not portable, use std::locale::classic()
-
-Upstream-Status: Inappropriate [Similar fix already in apt >= 1.3]
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- ftparchive/writer.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ftparchive/writer.cc b/ftparchive/writer.cc
-index 25963820a..6ad571d2a 100644
---- a/ftparchive/writer.cc
-+++ b/ftparchive/writer.cc
-@@ -984,7 +984,7 @@ ReleaseWriter::ReleaseWriter(FileFd * const GivenOutput, string const &/*DB*/) :
-    AddPatterns(_config->FindVector("APT::FTPArchive::Release::Patterns"));
- 
-    time_t const now = time(NULL);
--   auto const posix = std::locale("C.UTF-8");
-+   auto const posix = std::locale::classic();
- 
-    // FIXME: use TimeRFC1123 here? But that uses GMT to satisfy HTTP/1.1
-    std::ostringstream datestr;
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch b/meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch
deleted file mode 100644
index 042372b515..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2f8aa21ace375c18977ed908b291c80a210a93c6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 08:06:12 +0000
-Subject: [PATCH] environment.mak: musl based systems can generate shared
- objects too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- buildlib/environment.mak.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/buildlib/environment.mak.in b/buildlib/environment.mak.in
-index b0a8d9d..3a52344 100644
---- a/buildlib/environment.mak.in
-+++ b/buildlib/environment.mak.in
-@@ -68,7 +68,7 @@ NEED_SOCKLEN_T_DEFINE = @NEED_SOCKLEN_T_DEFINE@
- 
- # Shared library things
- HOST_OS = @host_os@
--ifneq ($(words $(filter gnu% linux-gnu% kfreebsd-gnu% %-gnu,$(HOST_OS))),0)
-+ifneq ($(words $(filter gnu% linux-gnu% kfreebsd-gnu% %-gnu linux-musl%,$(HOST_OS))),0)
-    SONAME_MAGIC=-Wl,-soname -Wl,
-    LFLAGS_SO=
- else
--- 
-2.6.4
-
diff --git a/meta/recipes-devtools/apt/apt/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt/disable-configure-in-makefile.patch
deleted file mode 100644
index 7c2f64e3e6..0000000000
--- a/meta/recipes-devtools/apt/apt/disable-configure-in-makefile.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Disable configure at compilation stage
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: apt-0.9.7.7/Makefile
-===================================================================
---- apt-0.9.7.7.orig/Makefile
-+++ apt-0.9.7.7/Makefile
-@@ -33,7 +33,7 @@ veryclean: clean
- # The startup target builds the necessary configure scripts. It should
- # be used after a CVS checkout.
- CONVERTED=environment.mak include/config.h include/apti18n.h build/doc/Doxyfile makefile
--include buildlib/configure.mak
-+#include buildlib/configure.mak
- $(BUILDDIR)/include/config.h: buildlib/config.h.in
- $(BUILDDIR)/include/apti18n.h: buildlib/apti18n.h.in
- $(BUILDDIR)/environment.mak: buildlib/environment.mak.in
diff --git a/meta/recipes-devtools/apt/apt/disable-test.patch b/meta/recipes-devtools/apt/apt/disable-test.patch
deleted file mode 100644
index d16b5c771b..0000000000
--- a/meta/recipes-devtools/apt/apt/disable-test.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 67bc7948e0a721c75d636931abc105da5dcb0763 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 26 May 2016 15:32:11 -0500
-Subject: [PATCH] [PATCH] disable test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [configuration]
-
-test needs gtest package, so not build the test dir
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- Makefile     | 9 +++------
- configure.ac | 7 -------
- 2 files changed, 3 insertions(+), 13 deletions(-)
-
-Index: apt-1.2.24/Makefile
-===================================================================
---- apt-1.2.24.orig/Makefile
-+++ apt-1.2.24/Makefile
-@@ -9,8 +9,8 @@ endif
- .PHONY: default
- default: startup all
- 
--.PHONY: fast headers library clean veryclean all binary program doc test update-po
--all headers library clean veryclean binary program doc manpages docbook test update-po startup dirs:
-+.PHONY: fast headers library clean veryclean all binary program doc update-po
-+all headers library clean veryclean binary program doc manpages docbook update-po startup dirs:
- 	$(MAKE) -C vendor $@
- 	$(MAKE) -C apt-pkg $@
- 	$(MAKE) -C apt-inst $@
-@@ -21,8 +21,6 @@ all headers library clean veryclean bina
- 	$(MAKE) -C dselect $@
- #	$(MAKE) -C doc $@
- 	$(MAKE) -C po $@
--	# FIXME: -C test has issue swith parallel builds, investigate!
--	-$(MAKE) -C test $@
- 
- fast:
- 	$(MAKE) -C vendor all
-@@ -32,9 +30,8 @@ fast:
- 	$(MAKE) -C methods all
- 	$(MAKE) -C cmdline all
- 	$(MAKE) -C ftparchive all
--	$(MAKE) -C test all
- 
--all headers library clean veryclean binary program doc manpages docbook test update-po: startup dirs
-+all headers library clean veryclean binary program doc manpages docbook update-po: startup dirs
- 
- dirs: startup
- 
-Index: apt-1.2.24/configure.ac
-===================================================================
---- apt-1.2.24.orig/configure.ac
-+++ apt-1.2.24/configure.ac
-@@ -90,13 +90,6 @@ AC_CHECK_LIB(curl, curl_easy_init,
-      AC_MSG_ERROR([failed: I need CURL due https support]),
- )
- 
--AC_LANG_PUSH([C++])
--AC_CHECK_HEADER(gtest/gtest.h,,
--     AC_MSG_WARN([failed: I need gtest (packaged as libgtest-dev) for unit testing]),
--)
--AC_LANG_POP([C++])
--
--
- AC_SUBST(BDBLIB)
- 
- HAVE_ZLIB=no
diff --git a/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
deleted file mode 100644
index 899c6ef2fc..0000000000
--- a/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
-Index: apt-1.2.24/apt-pkg/contrib/weakptr.h
-===================================================================
---- apt-1.2.24.orig/apt-pkg/contrib/weakptr.h
-+++ apt-1.2.24/apt-pkg/contrib/weakptr.h
-@@ -21,6 +21,7 @@
- #ifndef WEAK_POINTER_H
- #define WEAK_POINTER_H
- 
-+#include <cstdlib>
- #include <set>
- #include <stddef.h>
- 
diff --git a/meta/recipes-devtools/apt/apt/makerace.patch b/meta/recipes-devtools/apt/apt/makerace.patch
deleted file mode 100644
index 0c686d6e27..0000000000
--- a/meta/recipes-devtools/apt/apt/makerace.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-I was seeing various issues with parallel make, mainly due to to what was likely 
-partially installed headers. If you change into the source directory and
-"NOISY=1 make  ../obj/apt-pkg/sourcelist.opic" in apt-pkg, you'll see it 
-doesn't have any dependencies on the headers being installed. This patch
-fixes that so things build correctly.
-
-RP 2012/3/19
-
-Upstream-Status: Pending
-
-Index: apt-1.2.24/buildlib/library.mak
-===================================================================
---- apt-1.2.24.orig/buildlib/library.mak
-+++ apt-1.2.24/buildlib/library.mak
-@@ -65,7 +65,7 @@ $(LIB)/lib$(LIBRARY).so.$(MAJOR).$(MINOR
- 
- # Compilation rules
- vpath %.cc $(SUBDIRS)
--$(OBJ)/%.opic: %.cc $(LIBRARYDEPENDS)
-+$(OBJ)/%.opic: %.cc $(LIBRARYDEPENDS) $($(LOCAL)-HEADERS)
- 	echo Compiling $< to $@
- 	$(CXX) -c $(INLINEDEPFLAG) $(CPPFLAGS) $(CXXSTD) $(CXXFLAGS) $(PICFLAGS) -o $@ '$(abspath $<)'
- 	$(DoDep)
diff --git a/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
deleted file mode 100644
index 98b6c96caa..0000000000
--- a/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Index: apt-1.2.24/apt-pkg/deb/dpkgpm.cc
-===================================================================
---- apt-1.2.24.orig/apt-pkg/deb/dpkgpm.cc
-+++ apt-1.2.24/apt-pkg/deb/dpkgpm.cc
-@@ -54,6 +54,12 @@
- #include <apti18n.h>
- 									/*}}}*/
- 
-+#ifdef USE_NLS
-+#define _dpkg(x) dgettext("dpkg", x)
-+#else
-+#define _dpkg(x) x
-+#endif
-+
- using namespace std;
- 
- APT_PURE static string
-@@ -1703,7 +1709,7 @@ void pkgDPkgPM::WriteApportReport(const
-    }
- 
-    // check if its not a follow up error 
--   const char *needle = dgettext("dpkg", "dependency problems - leaving unconfigured");
-+   const char *needle = _dpkg("dependency problems - leaving unconfigured");
-    if(strstr(errormsg, needle) != NULL) {
-       std::clog << _("No apport report written because the error message indicates its a followup error from a previous failure.") << std::endl;
-       return;
diff --git a/meta/recipes-devtools/apt/apt/noconfigure.patch b/meta/recipes-devtools/apt/apt/noconfigure.patch
deleted file mode 100644
index ebc67203b4..0000000000
--- a/meta/recipes-devtools/apt/apt/noconfigure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-
-diff --git a/apt-pkg/packagemanager.cc b/apt-pkg/packagemanager.cc
-index 249542c..0a1911f 100644
---- a/apt-pkg/packagemanager.cc
-+++ b/apt-pkg/packagemanager.cc
-@@ -952,10 +952,12 @@ bool pkgPackageManager::SmartUnPack(PkgIterator Pkg, bool const Immediate, int c
-       return false;
- 
-    if (Immediate == true) {
-+#if 0
-       // Perform immedate configuration of the package. 
-          if (SmartConfigure(Pkg, Depth + 1) == false)
-             _error->Error(_("Could not perform immediate configuration on '%s'. "
-                "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
-+#endif
-    }
-    
-    return true;
-@@ -1038,6 +1040,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
-       }
-    }
- 
-+#if 0
-    // Final run through the configure phase
-    if (ConfigureAll() == false)
-       return Failed;
-@@ -1052,6 +1055,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
- 	 return Failed;
-       }
-    }
-+#endif
- 	 
-    return Completed;
- }
diff --git a/meta/recipes-devtools/apt/apt/nodoc.patch b/meta/recipes-devtools/apt/apt/nodoc.patch
deleted file mode 100644
index 78cf53884a..0000000000
--- a/meta/recipes-devtools/apt/apt/nodoc.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Disable documentation
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: apt-1.2.24/Makefile
-===================================================================
---- apt-1.2.24.orig/Makefile
-+++ apt-1.2.24/Makefile
-@@ -19,7 +19,7 @@ all headers library clean veryclean bina
- 	$(MAKE) -C cmdline $@
- 	$(MAKE) -C ftparchive $@
- 	$(MAKE) -C dselect $@
--	$(MAKE) -C doc $@
-+#	$(MAKE) -C doc $@
- 	$(MAKE) -C po $@
- 	# FIXME: -C test has issue swith parallel builds, investigate!
- 	-$(MAKE) -C test $@
diff --git a/meta/recipes-devtools/apt/apt/triehash b/meta/recipes-devtools/apt/apt/triehash
new file mode 100755
index 0000000000..b08bc6ec30
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/triehash
@@ -0,0 +1,728 @@
+#!/usr/bin/perl -w
+#
+# Copyright (C) 2016 Julian Andres Klode <jak@jak-linux.org>
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the "Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# THE SOFTWARE.
+
+=encoding utf8
+
+=head1 NAME
+
+triehash - Generate a perfect hash function derived from a trie.
+
+=cut
+
+use strict;
+use warnings;
+use utf8;
+use Getopt::Long;
+
+=head1 SYNOPSIS
+
+B<triehash> [S<I<option>>] [S<I<input file>>]
+
+=head1 DESCRIPTION
+
+triehash takes a list of words in input file and generates a function and
+an enumeration to describe the word
+
+=head1 INPUT FILE FORMAT
+
+The file consists of multiple lines of the form:
+
+    [label ~ ] word [= value]
+
+This maps word to value, and generates an enumeration with entries of the form:
+
+    label = value
+
+If I<label> is undefined, the word will be used, the minus character will be
+replaced by an underscore. If value is undefined it is counted upwards from
+the last value.
+
+There may also be one line of the format
+
+    [ label ~] = value
+
+Which defines the value to be used for non-existing keys. Note that this also
+changes default value for other keys, as for normal entries. So if you place
+
+    = 0
+
+at the beginning of the file, unknown strings map to 0, and the other strings
+map to values starting with 1. If label is not specified, the default is
+I<Unknown>.
+
+=head1 OPTIONS
+
+=over 4
+
+=item B<-C>I<.c file> B<--code>=I<.c file>
+
+Generate code in the given file.
+
+=item B<-H>I<header file> B<--header>=I<header file>
+
+Generate a header in the given file, containing a declaration of the hash
+function and an enumeration.
+
+=item B<--enum-name=>I<word>
+
+The name of the enumeration.
+
+=item B<--function-name=>I<word>
+
+The name of the function.
+
+=item B<--label-prefix=>I<word>
+
+The prefix to use for labels.
+
+=item B<--label-uppercase>
+
+Uppercase label names when normalizing them.
+
+=item B<--namespace=>I<name>
+
+Put the function and enum into a namespace (C++)
+
+=item B<--class=>I<name>
+
+Put the function and enum into a class (C++)
+
+=item B<--enum-class>
+
+Generate an enum class instead of an enum (C++)
+
+=item B<--counter-name=>I<name>
+
+Use I<name> for a counter that is set to the latest entry in the enumeration
++ 1. This can be useful for defining array sizes.
+
+=item B<--ignore-case>
+
+Ignore case for words.
+
+=item B<--multi-byte>=I<value>
+
+Generate code reading multiple bytes at once. The value is a string of power
+of twos to enable. The default value is 320 meaning that 8, 4, and single byte
+reads are enabled. Specify 0 to disable multi-byte completely, or add 2 if you
+also want to allow 2-byte reads. 2-byte reads are disabled by default because
+they negatively affect performance on older Intel architectures.
+
+This generates code for both multiple bytes and single byte reads, but only
+enables the multiple byte reads of GNU C compatible compilers, as the following
+extensions are used:
+
+=over 8
+
+=item Byte-aligned integers
+
+We must be able to generate integers that are aligned to a single byte using:
+
+    typedef uint64_t __attribute__((aligned (1))) triehash_uu64;
+
+=item Byte-order
+
+The macros __BYTE_ORDER__ and __ORDER_LITTLE_ENDIAN__ must be defined.
+
+=back
+
+We forcefully disable multi-byte reads on platforms where the variable
+I<__ARM_ARCH> is defined and I<__ARM_FEATURE_UNALIGNED> is not defined,
+as there is a measurable overhead from emulating the unaligned reads on
+ARM.
+
+=item B<--language=>I<language>
+
+Generate a file in the specified language. Currently known are 'C' and 'tree',
+the latter generating a tree.
+
+=item B<--include=>I<header>
+
+Add the header to the include statements of the header file. The value must
+be surrounded by quotes or angle brackets for C code. May be specified multiple
+times.
+
+=back
+
+=cut
+
+my $unknown = -1;
+my $unknown_label = undef;
+my $counter_start = 0;
+my $enum_name = 'PerfectKey';
+my $function_name = 'PerfectHash';
+my $enum_class = 0;
+
+my $code_name = '-';
+my $header_name = '-';
+my $code;
+my $header;
+my $label_prefix = undef;
+my $label_uppercase = 0;
+my $ignore_case = 0;
+my $multi_byte = '320';
+my $language = 'C';
+my $counter_name = undef;
+my @includes = ();
+
+
+Getopt::Long::config('default',
+                     'bundling',
+                     'no_getopt_compat',
+                     'no_auto_abbrev',
+                     'permute',
+                     'auto_help');
+
+GetOptions ('code|C=s' => \$code_name,
+            'header|H=s'   => \$header_name,
+            'function-name=s' => \$function_name,
+            'label-prefix=s' => \$label_prefix,
+            'label-uppercase' => \$label_uppercase,
+            'ignore-case' => \$ignore_case,
+            'enum-name=s' => \$enum_name,
+            'language|l=s' => \$language,
+            'multi-byte=s' => \$multi_byte,
+            'enum-class' => \$enum_class,
+            'include=s' => \@includes,
+            'counter-name=s' => \$counter_name)
+    or die('Could not parse options!');
+
+
+# This implements a simple trie. Each node has three attributes:
+#
+# children - A hash of keys to other nodes
+# value    - The value to be stored here
+# label    - A named representation of the value.
+#
+# The key at each level of the trie can consist of one or more bytes, and the
+# trie can be normalized to a form where all keys at a level have the same
+# length using rebuild_tree().
+package Trie {
+
+    sub new {
+        my $class = shift;
+        my $self = {};
+        bless $self, $class;
+
+        $self->{children} = {};
+        $self->{value} = undef;
+        $self->{label} = undef;
+
+        return $self;
+    }
+
+    # Return the largest power of 2 smaller or equal to the argument
+    sub alignpower2 {
+        my ($self, $length) = @_;
+
+        return 8 if ($length >= 8 && $multi_byte =~ /3/);
+        return 4 if ($length >= 4 && $multi_byte =~ /2/);
+        return 2 if ($length >= 2 && $multi_byte =~ /1/);
+
+        return 1;
+    }
+
+    # Split the key into a head block and a tail
+    sub split_key {
+        my ($self, $key) = @_;
+        my $length = length $key;
+        my $split = $self->alignpower2($length);
+
+        return (substr($key, 0, $split), substr($key, $split));
+    }
+
+    # Given a key, a label, and a value, insert that into the tree, possibly
+    # replacing an existing node.
+    sub insert {
+        my ($self, $key, $label, $value) = @_;
+
+        if (length($key) == 0) {
+            $self->{label} = $label;
+            $self->{value} = $value;
+            return;
+        }
+
+        my ($child, $tail) = $self->split_key($key);
+
+        $self->{children}{$child} = Trie->new if (!defined($self->{children}{$child}));
+
+        $self->{children}{$child}->insert($tail, $label, $value);
+    }
+
+    # Construct a new trie that only contains words of a given length. This
+    # is used to split up the common trie after knowing all words, so we can
+    # switch on the expected word length first, and have the per-trie function
+    # implement simple longest prefix matching.
+    sub filter_depth {
+        my ($self, $togo) = @_;
+
+        my $new = Trie->new;
+
+        if ($togo != 0) {
+            my $found = 0;
+            foreach my $key (sort keys %{$self->{children}}) {
+                if ($togo > length($key) || defined $self->{children}{$key}->{value}) {
+                    my $child = $self->{children}{$key}->filter_depth($togo - length($key));
+
+                    $new->{children}{$key}= $child if defined $child;
+                    $found = 1 if defined $child;
+                }
+            }
+            return if (!$found);
+        } else {
+            $new->{value} = $self->{value};
+            $new->{label} = $self->{label};
+        }
+
+        return $new;
+    }
+
+    # (helper for rebuild_tree)
+    # Reinsert all value nodes into the specified $trie, prepending $prefix
+    # to their $paths.
+    sub reinsert_value_nodes_into {
+        my ($self, $trie, $prefix) = @_;
+
+        $trie->insert($prefix, $self->{label}, $self->{value}) if (defined $self->{value});
+
+        foreach my $key (sort keys %{$self->{children}}) {
+            $self->{children}{$key}->reinsert_value_nodes_into($trie, $prefix . $key);
+        }
+    }
+
+    # (helper for rebuild_tree)
+    # Find the earliest point to split a key. Normally, we split at the maximum
+    # power of 2 that is greater or equal than the length of the key. When we
+    # are building an ASCII-optimised case-insensitive trie that simply ORs
+    # each byte with 0x20, we need to split at the first ambiguous character:
+    #
+    # For example, the words a-bc and a\rbc are identical in such a situation:
+    #       '-' | 0x20 == '-' == '\r' | 0x20
+    # We cannot simply switch on all 4 bytes at once, but need to split before
+    # the ambiguous character so we can process the ambiguous character on its
+    # own.
+    sub find_earlier_split {
+        my ($self, $key) = @_;
+
+        if ($ignore_case) {
+            for my $i (0..length($key)-1) {
+                # If the key starts with an ambiguous character, we need to
+                # take only it. Otherwise, we need to take everything
+                # before the character.
+                return $self->alignpower2($i || 1) if (main::ambiguous(substr($key, $i, 1)));
+            }
+        }
+        return $self->alignpower2(length $key);
+    }
+
+    # This rebuilds the trie, splitting each key before ambiguous characters
+    # as explained in find_earlier_split(), and then chooses the smallest
+    # such split at each level, so that all keys at all levels have the same
+    # length (so we can use a multi-byte switch).
+    sub rebuild_tree {
+        my $self = shift;
+        # Determine if/where we need to split before an ambiguous character
+        my $new_split = 99999999999999999;
+        foreach my $key (sort keys %{$self->{children}}) {
+            my $special_length = $self->find_earlier_split($key);
+            $new_split = $special_length if ($special_length < $new_split);
+        }
+
+        # Start building a new uniform trie
+        my $newself = Trie->new;
+        $newself->{label} = $self->{label};
+        $newself->{value} = $self->{value};
+        $newself->{children} = {};
+
+        foreach my $key (sort keys %{$self->{children}}) {
+            my $head = substr($key, 0, $new_split);
+            my $tail = substr($key, $new_split);
+            # Rebuild the child node at $head, pushing $tail downwards
+            $newself->{children}{$head} //= Trie->new;
+            $self->{children}{$key}->reinsert_value_nodes_into($newself->{children}{$head}, $tail);
+            # We took up to one special character of each key label. There might
+            # be more, so we need to rebuild recursively.
+            $newself->{children}{$head} = $newself->{children}{$head}->rebuild_tree();
+        }
+
+        return $newself;
+    }
+}
+
+# Code generator for C and C++
+package CCodeGen {
+    my $static = ($code_name eq $header_name) ? "static " : "";
+    my $enum_specifier = $enum_class ? "enum class" : "enum";
+
+    sub new {
+        my $class = shift;
+        my $self = {};
+        bless $self, $class;
+
+        return $self;
+    }
+
+    sub open_output {
+        my $self = shift;
+        if ($code_name ne '-') {
+            open($code, '>', $code_name) or die "Cannot open $code_name: $!" ;
+        } else {
+            $code = *STDOUT;
+        }
+        if($code_name eq $header_name) {
+            $header = $code;
+        } elsif ($header_name ne '-') {
+            open($header, '>', $header_name) or die "Cannot open $header_name: $!" ;
+        } else {
+            $header = *STDOUT;
+        }
+    }
+
+    sub mangle_label {
+        my ($self, $label) = @_;
+
+        $label = $label_prefix . $label if defined($label_prefix);
+        $label = uc $label if $label_uppercase;
+
+        return $label;
+    }
+
+    sub word_to_label {
+        my ($self, $word) = @_;
+
+        $word =~ s/_/__/g;
+        $word =~ s/-/_/g;
+
+        return $self->mangle_label($word);
+    }
+
+    # Return a case label, by shifting and or-ing bytes in the word
+    sub case_label {
+        my ($self, $key) = @_;
+
+        return sprintf("'%s'", substr($key, 0, 1)) if not $multi_byte;
+
+        my $output = '0';
+
+        for my $i (0..length($key)-1) {
+            $output .= sprintf("| onechar('%s', %d, %d)", substr($key, $i, 1), 8 * $i, 8*length($key));
+        }
+
+        return $output;
+    }
+
+    # Return an appropriate read instruction for $length bytes from $offset
+    sub switch_key {
+        my ($self, $offset, $length) = @_;
+
+        return "string[$offset]" if $length == 1;
+        return sprintf("*((triehash_uu%s*) &string[$offset])", $length * 8);
+    }
+
+    # Render the trie so that it matches the longest prefix.
+    sub print_table {
+        my ($self, $trie, $fh, $indent, $index) = @_;
+        $indent //= 0;
+        $index //= 0;
+
+        # If we have children, try to match them.
+        if (%{$trie->{children}}) {
+            # The difference between lowercase and uppercase alphabetical characters
+            # is that they have one bit flipped. If we have alphabetical characters
+            # in the search space, and the entire search space works fine if we
+            # always turn on the flip, just OR the character we are switching over
+            # with the bit.
+            my $want_use_bit = 0;
+            my $can_use_bit = 1;
+            my $key_length = 0;
+            foreach my $key (sort keys %{$trie->{children}}) {
+                $can_use_bit &= not main::ambiguous($key);
+                $want_use_bit |= ($key =~ /^[a-zA-Z]+$/);
+                $key_length = length($key);
+            }
+
+            if ($ignore_case && $can_use_bit && $want_use_bit) {
+                printf { $fh } (('    ' x $indent) . "switch(%s | 0x%s) {\n", $self->switch_key($index, $key_length), '20' x $key_length);
+            } else {
+                printf { $fh } (('    ' x $indent) . "switch(%s) {\n", $self->switch_key($index, $key_length));
+            }
+
+            my $notfirst = 0;
+            foreach my $key (sort keys %{$trie->{children}}) {
+                if ($notfirst) {
+                    printf { $fh } ('    ' x $indent . "    break;\n");
+                }
+                if ($ignore_case) {
+                    printf { $fh } ('    ' x $indent . "case %s:\n", $self->case_label(lc($key)));
+                    printf { $fh } ('    ' x $indent . "case %s:\n", $self->case_label(uc($key))) if lc($key) ne uc($key) && !($can_use_bit && $want_use_bit);
+                } else {
+                    printf { $fh } ('    ' x $indent . "case %s:\n", $self->case_label($key));
+                }
+
+                $self->print_table($trie->{children}{$key}, $fh, $indent + 1, $index + length($key));
+
+                $notfirst=1;
+            }
+
+            printf { $fh } ('    ' x $indent . "}\n");
+        }
+
+
+        # This node has a value, so it is a possible end point. If no children
+        # matched, we have found our longest prefix.
+        if (defined $trie->{value}) {
+            printf { $fh } ('    ' x $indent . "return %s;\n", ($enum_class ? "${enum_name}::" : '').$trie->{label});
+        }
+
+    }
+
+    sub print_words {
+        my ($self, $trie, $fh, $indent, $sofar) = @_;
+
+        $indent //= 0;
+        $sofar //= '';
+
+
+        printf { $fh } ('    ' x $indent."%s = %s,\n", $trie->{label}, $trie->{value}) if defined $trie->{value};
+
+        foreach my $key (sort keys %{$trie->{children}}) {
+            $self->print_words($trie->{children}{$key}, $fh, $indent, $sofar . $key);
+        }
+    }
+
+    sub print_functions {
+        my ($self, $trie, %lengths) = @_;
+        foreach my $local_length (sort { $a <=> $b } (keys %lengths)) {
+            print { $code } ("static enum ${enum_name} ${function_name}${local_length}(const char *string)\n");
+            print { $code } ("{\n");
+            $self->print_table($trie->filter_depth($local_length)->rebuild_tree(), $code, 1);
+            printf { $code } ("    return %s$unknown_label;\n", ($enum_class ? "${enum_name}::" : ''));
+            print { $code } ("}\n");
+        }
+    }
+
+    sub main {
+        my ($self, $trie, $num_values, %lengths) = @_;
+        print { $header } ("#ifndef TRIE_HASH_${function_name}\n");
+        print { $header } ("#define TRIE_HASH_${function_name}\n");
+        print { $header } ("#include <stddef.h>\n");
+        print { $header } ("#include <stdint.h>\n");
+        foreach my $include (@includes) {
+            print { $header } ("#include $include\n");
+        }
+        printf { $header } ("enum { $counter_name = $num_values };\n") if (defined($counter_name));
+        print { $header } ("${enum_specifier} ${enum_name} {\n");
+        $self->print_words($trie, $header, 1);
+        printf { $header } ("    $unknown_label = $unknown,\n");
+        print { $header } ("};\n");
+        print { $header } ("${static}enum ${enum_name} ${function_name}(const char *string, size_t length);\n");
+
+        print { $code } ("#include \"$header_name\"\n") if ($header_name ne $code_name);
+
+        if ($multi_byte) {
+            print { $code } ("#ifdef __GNUC__\n");
+            foreach my $i ((16, 32, 64)) {
+                print { $code } ("typedef uint${i}_t __attribute__((aligned (1))) triehash_uu${i};\n");
+                print { $code } ("typedef char static_assert${i}[__alignof__(triehash_uu${i}) == 1 ? 1 : -1];\n");
+            }
+
+            print { $code } ("#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__\n");
+            print { $code } ("#define onechar(c, s, l) (((uint64_t)(c)) << (s))\n");
+            print { $code } ("#else\n");
+            print { $code } ("#define onechar(c, s, l) (((uint64_t)(c)) << (l-8-s))\n");
+            print { $code } ("#endif\n");
+            print { $code } ("#if (!defined(__ARM_ARCH) || defined(__ARM_FEATURE_UNALIGNED)) && !defined(TRIE_HASH_NO_MULTI_BYTE)\n");
+            print { $code } ("#define TRIE_HASH_MULTI_BYTE\n");
+            print { $code } ("#endif\n");
+            print { $code } ("#endif /*GNUC */\n");
+
+            print { $code } ("#ifdef TRIE_HASH_MULTI_BYTE\n");
+            $self->print_functions($trie, %lengths);
+            $multi_byte = 0;
+            print { $code } ("#else\n");
+            $self->print_functions($trie, %lengths);
+            print { $code } ("#endif /* TRIE_HASH_MULTI_BYTE */\n");
+        } else {
+            $self->print_functions($trie, %lengths);
+        }
+
+        print { $code } ("${static}enum ${enum_name} ${function_name}(const char *string, size_t length)\n");
+        print { $code } ("{\n");
+        print { $code } ("    switch (length) {\n");
+        foreach my $local_length (sort { $a <=> $b } (keys %lengths)) {
+            print { $code } ("    case $local_length:\n");
+            print { $code } ("        return ${function_name}${local_length}(string);\n");
+        }
+        print { $code } ("    default:\n");
+        printf { $code } ("        return %s$unknown_label;\n", ($enum_class ? "${enum_name}::" : ''));
+        print { $code } ("    }\n");
+        print { $code } ("}\n");
+
+        # Print end of header here, in case header and code point to the same file
+        print { $header } ("#endif                       /* TRIE_HASH_${function_name} */\n");
+    }
+}
+
+# A character is ambiguous if the 1<<5 (0x20) bit does not correspond to the
+# lower case bit. A word is ambiguous if any character is. This definition is
+# used to check if we can perform the |0x20 optimization when building a case-
+# insensitive trie.
+sub ambiguous {
+    my $word = shift;
+
+    foreach my $char (split //, $word) {
+        # If 0x20 does not solely indicate lowercase, it is ambiguous
+        return 1 if ord(lc($char)) != (ord($char) | 0x20);
+        return 1 if ord(uc($char)) != (ord($char) & ~0x20);
+    }
+
+    return 0;
+}
+
+sub build_trie {
+    my $codegen = shift;
+    my $trie = Trie->new;
+
+    my $counter = $counter_start;
+    my $prev_value;
+    my %lengths;
+
+    open(my $input, '<', $ARGV[0]) or die "Cannot open $ARGV[0]: $!";
+    while (my $line = <$input>) {
+        my ($label, $word, $value) = $line =~ m{
+            (?:\s*([^~\s]+)\s*~)?      # Label ~
+            (?:\s*([^~=\s]+))?         # Word
+            (?:\s*=\s*([^\s]+)\s+)?    # = Value
+            \s*
+        }x;
+
+        if (defined $word) {
+            $label //= $codegen->word_to_label($word);
+            $value //= defined $prev_value ? $prev_value + 1 : 0;
+
+            $trie->insert($word, $label, $value);
+            $lengths{length($word)} = 1;
+        } elsif (defined $value) {
+            $unknown = $value;
+            $unknown_label = $codegen->mangle_label($label) if defined $label;
+        } else {
+            die "Invalid line: $line";
+        }
+
+        $prev_value = $value;
+        $counter = $value + 1 if $value >= $counter;
+    }
+
+    $unknown_label //= $codegen->mangle_label('Unknown');
+
+    return ($trie, $counter, %lengths);
+}
+
+# Generates an ASCII art tree
+package TreeCodeGen {
+
+    sub new {
+        my $class = shift;
+        my $self = {};
+        bless $self, $class;
+
+        return $self;
+    }
+
+    sub mangle_label {
+        my ($self, $label) = @_;
+        return $label;
+    }
+
+    sub word_to_label {
+        my ($self, $word) = @_;
+        return $word;
+    }
+
+    sub main {
+        my ($self, $trie, $counter, %lengths) = @_;
+        printf { $code } ("┌────────────────────────────────────────────────────┐\n");
+        printf { $code } ("│                   Initial trie                     │\n");
+        printf { $code } ("└────────────────────────────────────────────────────┘\n");
+        $self->print($trie);
+        printf { $code } ("┌────────────────────────────────────────────────────┐\n");
+        printf { $code } ("│                   Rebuilt trie                     │\n");
+        printf { $code } ("└────────────────────────────────────────────────────┘\n");
+        $self->print($trie->rebuild_tree());
+
+        foreach my $local_length (sort { $a <=> $b } (keys %lengths)) {
+            printf { $code } ("┌────────────────────────────────────────────────────┐\n");
+            printf { $code } ("│              Trie for words of length %-4d         │\n", $local_length);
+            printf { $code } ("└────────────────────────────────────────────────────┘\n");
+            $self->print($trie->filter_depth($local_length)->rebuild_tree());
+        }
+    }
+
+    sub open_output {
+        my $self = shift;
+        if ($code_name ne '-') {
+            open($code, '>:encoding(utf8)', $code_name) or die "Cannot open $ARGV[0]: $!" ;
+        } else {
+            $code = *STDOUT;
+            binmode($code, ':encoding(utf8)');
+        }
+    }
+
+    # Print a trie
+    sub print {
+        my ($self, $trie, $depth) = @_;
+        $depth //= 0;
+
+        print { $code } (' → ') if defined($trie->{label});
+        print { $code } ($trie->{label} // '', "\n");
+        foreach my $key (sort keys %{$trie->{children}}) {
+            print { $code } ('│   ' x ($depth), "├── $key");
+            $self->print($trie->{children}{$key}, $depth + 1);
+        }
+    }
+}
+
+my %codegens = (
+    C => 'CCodeGen',
+    tree => 'TreeCodeGen',
+);
+
+
+defined($codegens{$language}) or die "Unknown language $language. Valid choices: ", join(', ', keys %codegens);
+my $codegen = $codegens{$language}->new();
+my ($trie, $counter, %lengths) = build_trie($codegen);
+
+$codegen->open_output();
+$codegen->main($trie, $counter, %lengths);
+
+
+=head1 LICENSE
+
+triehash is available under the MIT/Expat license, see the source code
+for more information.
+
+=head1 AUTHOR
+
+Julian Andres Klode <jak@jak-linux.org>
+
+=cut
+
diff --git a/meta/recipes-devtools/apt/apt/truncate-filename.patch b/meta/recipes-devtools/apt/apt/truncate-filename.patch
deleted file mode 100644
index db1c42b66c..0000000000
--- a/meta/recipes-devtools/apt/apt/truncate-filename.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-strutl.cc: the filename can't be longer than 255
-
-The URItoFileName translates the path into the filename, but the
-filename can't be longer than 255 according to
-/usr/include/linux/limits.h.
-
-Truncate it when it is longer than 240 (leave some spaces for
-".Packages" and "._Release" suffix)
-
-Upstream-Status: Pending
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- apt-pkg/contrib/strutl.cc |    7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
---- a/apt-pkg/contrib/strutl.cc
-+++ b/apt-pkg/contrib/strutl.cc
-@@ -399,7 +399,12 @@ string URItoFileName(const string &URI)
-    // "\x00-\x20{}|\\\\^\\[\\]<>\"\x7F-\xFF";
-    string NewURI = QuoteString(U,"\\|{}[]<>\"^~_=!@#$%^&*");
-    replace(NewURI.begin(),NewURI.end(),'/','_');
--   return NewURI;
-+
-+   // Truncate from the head when it is longer than 240
-+   if(NewURI.length() > 240)
-+       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
-+   else
-+       return NewURI;
- }
- 									/*}}}*/
- // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/apt/apt/use-host.patch b/meta/recipes-devtools/apt/apt/use-host.patch
deleted file mode 100644
index b30fcff0d6..0000000000
--- a/meta/recipes-devtools/apt/apt/use-host.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: apt-0.9.7.7/configure.ac
-===================================================================
---- apt-0.9.7.7.orig/configure.ac
-+++ apt-0.9.7.7/configure.ac
-@@ -112,7 +112,7 @@ dnl This is often the dpkg architecture
- dnl First check against the full canonical canoncial-system-type in $target
- dnl and if that fails, just look for the cpu
- AC_MSG_CHECKING(debian architecture)
--archset="`dpkg-architecture -qDEB_HOST_ARCH`"
-+archset="`echo $host_alias|cut -d'-' -f1`"
- if test "x$archset" = "x"; then
-    AC_MSG_ERROR([failed: use --host= or output from dpkg-architecture])
- fi
diff --git a/meta/recipes-devtools/apt/apt_1.2.31.bb b/meta/recipes-devtools/apt/apt_1.2.31.bb
deleted file mode 100644
index ae0bce933d..0000000000
--- a/meta/recipes-devtools/apt/apt_1.2.31.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DEPENDS = "curl db zlib"
-RDEPENDS_${PN} = "dpkg bash debianutils"
-require apt.inc
-
-require apt-package.inc
-
-PACKAGECONFIG ??= "lzma"
-PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
-PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
-PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
-
-FILES_${PN} += "${bindir}/apt-key"
-apt-manpages += "doc/apt-key.8"
-
-do_install_append() {
-    #Write the correct apt-architecture to apt.conf
-    APT_CONF=${D}/etc/apt/apt.conf
-    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
-    oe_libinstall -so -C bin libapt-private ${D}${libdir}/
-}
diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
new file mode 100644
index 0000000000..bd1f4f39c3
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
@@ -0,0 +1,106 @@
+SUMMARY = "Advanced front-end for dpkg"
+LICENSE = "GPLv2.0+"
+SECTION = "base"
+
+# Triehash script taken from https://github.com/julian-klode/triehash
+SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
+           file://triehash \
+           file://0001-Disable-documentation-directory-altogether.patch \
+           file://0001-Fix-musl-build.patch \
+           file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
+           "
+     
+SRC_URI_append_class-native = " \
+           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
+           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
+           file://0001-Do-not-configure-packages-on-installation.patch \
+           "
+
+SRC_URI[sha256sum] = "6d447f2e9437ec24e78350b63bb0592bee1f050811d51990b0c783183b0983f8"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# the package is taken from snapshots.debian.org; that source is static and goes stale
+# so we check the latest upstream from a directory that does get updated
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
+
+inherit cmake perlnative bash-completion upstream-version-is-even
+
+BBCLASSEXTEND = "native"
+
+DEPENDS += "virtual/libiconv virtual/libintl db gnutls lz4 zlib bzip2 xz"
+
+EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash"
+
+do_configure_prepend () {
+    echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
+
+}
+
+# Unfortunately apt hardcodes this all over the place
+FILES_${PN} += "${prefix}/lib/dpkg ${prefix}/lib/apt"
+RDEPENDS_${PN} += "bash perl dpkg"
+
+do_install_append_class-native() {
+    cat > ${D}${sysconfdir}/apt/apt.conf.sample << EOF
+Dir "${STAGING_DIR_NATIVE}/"
+{
+   State "var/lib/apt/"
+   {
+      Lists "#APTCONF#/lists/";
+      status "#ROOTFS#/var/lib/dpkg/status";
+   };
+   Cache "var/cache/apt/"
+   {
+      Archives "archives/";
+      pkgcache "";
+      srcpkgcache "";
+   };
+   Bin "${STAGING_BINDIR_NATIVE}/"
+   {
+      methods "${STAGING_LIBDIR}/apt/methods/";
+      gzip "/bin/gzip";
+      dpkg "dpkg";
+      dpkg-source "dpkg-source";
+      dpkg-buildpackage "dpkg-buildpackage";
+      apt-get "apt-get";
+      apt-cache "apt-cache";
+   };
+   Etc "#APTCONF#"
+   {
+      Preferences "preferences";
+   };
+   Log "var/log/apt";
+};
+
+APT
+{
+  Install-Recommends "true";
+  Immediate-Configure "false";
+  Architecture "i586";
+  Get
+  {
+     Assume-Yes "true";
+  };
+};
+
+Acquire
+{
+  AllowInsecureRepositories "true";
+};
+
+DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
+DPkg::Path "";
+EOF
+}
+
+do_install_append_class-target() {
+    #Write the correct apt-architecture to apt.conf
+    APT_CONF=${D}/etc/apt/apt.conf
+    echo 'APT::Architecture "${DPKG_ARCH}";' > ${APT_CONF}
+}
+
+# Avoid non-reproducible -src package
+do_install_append () {
+        sed -i -e "s,${B},,g" \
+            ${B}/apt-pkg/tagfile-keys.cc
+}
diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
deleted file mode 100644
index c95a5b07af..0000000000
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ /dev/null
@@ -1,42 +0,0 @@
-Dir "${STAGING_DIR_NATIVE}/"
-{
-   State "var/lib/apt/"
-   {
-      Lists "#APTCONF#/lists/";
-      status "#ROOTFS#/var/lib/dpkg/status";
-   };
-   Cache "var/cache/apt/"
-   {
-      Archives "archives/";
-      pkgcache "";
-      srcpkgcache "";
-   };
-   Bin "${STAGING_BINDIR_NATIVE}/"
-   {
-      methods "${STAGING_LIBDIR}/apt/methods/";
-      gzip "/bin/gzip";
-      dpkg "dpkg";
-      dpkg-source "dpkg-source";
-      dpkg-buildpackage "dpkg-buildpackage";
-      apt-get "apt-get";
-      apt-cache "apt-cache";
-   };
-   Etc "#APTCONF#"
-   {
-      Preferences "preferences";
-   };
-};
-
-APT
-{
-  Install-Recommends "true";
-  Immediate-Configure "false";
-  Architecture "i586";
-  Get
-  {
-     Assume-Yes "true";
-     Force-Yes "true"
-  };
-};
-
-DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-force-overwrite";"--no-debsig"};
diff --git a/meta/recipes-devtools/apt/files/db_linking_hack.patch b/meta/recipes-devtools/apt/files/db_linking_hack.patch
deleted file mode 100644
index a61d4b07c2..0000000000
--- a/meta/recipes-devtools/apt/files/db_linking_hack.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-
-Index: apt-0.7.3/configure.ac
-===================================================================
---- apt-0.7.3.orig/configure.ac	2007-07-01 10:38:45.000000000 +0000
-+++ apt-0.7.3/configure.ac	2007-08-21 13:39:26.000000000 +0000
-@@ -67,8 +67,20 @@
-       [AC_DEFINE(HAVE_BDB)
-        BDBLIB="-ldb"
-        AC_MSG_RESULT(yes)],
--      [BDBLIB=""
--       AC_MSG_RESULT(no)]
-+
-+       LIBS="$LIBS -lpthread"
-+       [AC_MSG_CHECKING(if we can link against BerkeleyDB with pthread)
-+        AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM(
-+         [#include <db.h>],
-+         [int r, s, t; db_version(&r, &s, &t);]
-+        )],
-+        [AC_DEFINE(HAVE_BDB)
-+         BDBLIB="-ldb -lpthread"
-+         AC_MSG_RESULT(yes)],
-+        [BDBLIB=""
-+         AC_MSG_RESULT(no)]
-+      )]       
-     )]
- )
- 
diff --git a/meta/recipes-devtools/apt/files/environment.patch b/meta/recipes-devtools/apt/files/environment.patch
deleted file mode 100644
index 9a0303803e..0000000000
--- a/meta/recipes-devtools/apt/files/environment.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport
-
-Index: apt-0.6.46.2/buildlib/environment.mak.in
-===================================================================
---- apt-0.6.46.2.orig/buildlib/environment.mak.in	2007-03-29 11:38:58.000000000 +0100
-+++ apt-0.6.46.2/buildlib/environment.mak.in	2007-03-29 11:39:12.000000000 +0100
-@@ -62,7 +62,7 @@
- 
- # Shared library things
- HOST_OS = @host_os@
--ifneq ($(words $(filter linux-gnu gnu% %gnu,$(HOST_OS))),0)
-+ifneq ($(words $(filter linux-gnu linux-gnueabi gnu% %gnu,$(HOST_OS))),0)
-    SONAME_MAGIC=-Wl,-soname -Wl,
-    LFLAGS_SO=
- else
diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/recipes-devtools/apt/files/no-curl.patch
deleted file mode 100644
index 0838552b26..0000000000
--- a/meta/recipes-devtools/apt/files/no-curl.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-From 5d61ac822fd9a3871cd5089389c210606232ecdc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 26 May 2016 15:34:45 -0500
-Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- configure.ac     | 7 -------
- methods/makefile | 7 -------
- 2 files changed, 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e47f459..cd24264 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -83,13 +83,6 @@ AC_CHECK_HEADER(db.h,
- 
- LIBS="$saveLIBS"
- 
--AC_CHECK_LIB(curl, curl_easy_init,
--     [AC_CHECK_HEADER(curl/curl.h,
--        curl_ok=yes,
--        curl_ok=no)],
--     AC_MSG_ERROR([failed: I need CURL due https support]),
--)
--
- AC_SUBST(BDBLIB)
- 
- HAVE_ZLIB=no
-diff --git a/methods/makefile b/methods/makefile
-index 3274e92..255086b 100644
---- a/methods/makefile
-+++ b/methods/makefile
-@@ -51,13 +51,6 @@ LIB_MAKES = apt-pkg/makefile
- SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc server.cc
- include $(PROGRAM_H)
- 
--# The https method
--PROGRAM=https
--SLIBS = -lapt-pkg -lcurl $(INTLLIBS) -lresolv
--LIB_MAKES = apt-pkg/makefile
--SOURCE = https.cc server.cc
--include $(PROGRAM_H)
--
- # The ftp method
- PROGRAM=ftp
- SLIBS = -lapt-pkg $(SOCKETLIBS) $(INTLLIBS) -lresolv
--- 
-2.1.4
-
-- 
2.26.2

