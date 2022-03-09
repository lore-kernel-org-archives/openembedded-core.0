Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BC3C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 22:22:24 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.3026.1646864543761791607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 14:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZbLMVCD7;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id b24so4647533edu.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 14:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gW4EK2nRI8RNCt/3+JzbiLOv/3EFI0MQC3uufhIUaM8=;
        b=ZbLMVCD7G2dyjpueDagYNfbOAwDQGnh8kYFU6D4elGFPQvAbDl/RRSfQ8PSwpD6s8m
         JLzJ3h9O7pwcVq/WF3vI1A7M418tAfCk1gpL4JDpVE92iMcErHrUhKXZ26dlI+nw8MsE
         R1PkTHE8pqo0848BeFqBrwoxkOUlLoXFwUSs8PiR6aRDe/16LXw8Qitexqyhiptn5Lzw
         CYI7UX89h6cHfVUurSNE62uwBCg/AAi5NutxmGGwSwE0YCvw21U+ZQ+qhXcTV/l33tU9
         aNxMaGH24ghn0HnAEp0niA6o9TBQOh3v6petfPH36DQqVo2Ukt0lYCp+UusJNcmm87yV
         s3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gW4EK2nRI8RNCt/3+JzbiLOv/3EFI0MQC3uufhIUaM8=;
        b=m9LbFYD1Ny8z6fz/TIHxRweolYUct6ivLmu0HENmEVhM4ouQ54gcxlcgd8EblebUE4
         kMH6h6nO+K9Q2xiSFTpDhduwQn5KoB77oNRp1/B0K4i6sxVA94PZpKN9wPQIBUQDhh+a
         awMAKPbB96a0spkew2cVP1jZK4YpiqfhxKdrvT/lIXRGAcsMd3WrT5OF4OQx3rZHdP4v
         soFTGZ5kh4r6FiBX0dnPdt89ZQKl+0jds/mQj2+iz1Vb9KRTcK/ZA7U7CW5J+3qc1nJN
         KxaNuSfaOenc3kIa8T5at5/1thXwIMs0bdE2GoknWX7WhhpV5+7csVZknUQA7vNaNLqC
         rWbg==
X-Gm-Message-State: AOAM53108E4q7ITxWl7Qa9TZorEvyOT3/1/mKusT2p8lYj3G9GISZfrq
	WDu7BOjYPXPxLNGP9mluRkZmyUZgj7Q=
X-Google-Smtp-Source: 
 ABdhPJxWNMzgyJ0p5oBzohJDi7s2DfLzkC4F9i3LXsDnwgEA+bwVNERtyyCS8yix4Hii+HftepQGRw==
X-Received: by 2002:a05:6402:1e94:b0:416:44fa:ef49 with SMTP id
 f20-20020a0564021e9400b0041644faef49mr1648573edf.0.1646864541930;
        Wed, 09 Mar 2022 14:22:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 me17-20020a170906aed100b006db0dcf6746sm1173699ejb.216.2022.03.09.14.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:22:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] dbus-test: merge into main dbus recipe
Date: Wed,  9 Mar 2022 23:22:12 +0100
Message-Id: <20220309222214.4040432-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 22:22:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162993

The reason it was separate is that there is a peculiar circular
dependency: dbus tests require glib, while some of glib's gdbus tests
require dbus. So dbus was built with tests disabled and without glib
dependency, then glib was built with dbus dependency, then dbus was
built again with glib dependency and tests enabled, only for the purpose
of installing those tests. I find that brittle and hacky, so this
removes dbus dependecy from glib (the fallout is that some gdbus tests
are no longer being executed), and dbus and its tests are built once,
after glib. Conversely, dbus is now dependent on glib for the purpose
of building the tests.

Also, dbus ptest installation is no longer using custom code, and dbus
run-ptest simply uses standard installed tests execution mechanism from
gnome.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/dbus/dbus-test_1.12.22.bb   | 64 -------------------
 meta/recipes-core/dbus/dbus.inc               |  7 +-
 meta/recipes-core/dbus/dbus/run-ptest         | 34 +---------
 meta/recipes-core/dbus/dbus_1.12.22.bb        | 11 +---
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 7 files changed, 12 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-test_1.12.22.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3fceb6701b..a8eceaadf4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -134,7 +134,6 @@ RECIPE_MAINTAINER:pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-dbus-test = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c503a6a594..402fb87a3c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -76,7 +76,7 @@ PTESTS_SLOW = "\
     babeltrace2-ptest \
     busybox-ptest \
     coreutils-ptest \
-    dbus-test-ptest \
+    dbus-ptest \
     e2fsprogs-ptest \
     findutils-ptest \
     glib-2.0-ptest \
diff --git a/meta/recipes-core/dbus/dbus-test_1.12.22.bb b/meta/recipes-core/dbus/dbus-test_1.12.22.bb
deleted file mode 100644
index ae70301431..0000000000
--- a/meta/recipes-core/dbus/dbus-test_1.12.22.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
-HOMEPAGE = "http://dbus.freedesktop.org"
-SECTION = "base"
-
-require dbus.inc
-
-SRC_URI += "file://run-ptest \
-            file://python-config.patch \
-	    "
-
-DEPENDS = "dbus glib-2.0"
-
-RDEPENDS:${PN}-dev = ""
-
-S="${WORKDIR}/dbus-${PV}"
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-
-inherit ptest
-
-EXTRA_OECONF += "--enable-tests \
-                --enable-modular-tests \
-                --enable-installed-tests \
-                --enable-checks \
-                --enable-asserts \
-                --with-dbus-test-dir=${PTEST_PATH} \
-                --enable-embedded-tests \
-             "
-
-do_install() {
-    :
-}
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/test
-	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
-	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass service shell-service"
-	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
-
-	l="bus bus-system bus-launch-helper"
-	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
-
-	install -d ${D}${PTEST_PATH}/bus
-	install ${B}/bus/.libs/dbus-daemon-launch-helper-test ${D}${PTEST_PATH}/bus
-
-	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
-
-	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
-	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
-
-	install -d ${D}${PTEST_PATH}/test/.libs
-	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
-
-	# Remove build host references...
-	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
-		sed -i \
-		 -e 's:${B}:${PTEST_PATH}:g' \
-		 {} +
-        sed -i -e 's;@PTEST_PATH@;${PTEST_PATH};g'  ${D}${PTEST_PATH}/run-ptest
-}
-
-RDEPENDS:${PN}-ptest += "bash make dbus"
-RDEPENDS:${PN}-ptest:remove = "${PN}"
-
-PRIVATE_LIBS:${PN}-ptest = "libdbus-1.so.3"
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index cb4c56db92..8e6f597c0a 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -1,10 +1,12 @@
-inherit autotools pkgconfig gettext upstream-version-is-even
+inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://run-ptest \
+           file://python-config.patch \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
@@ -17,6 +19,9 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
                 --enable-largefile \
                 --with-system-socket=/run/dbus/system_bus_socket \
+                --enable-tests \
+                --enable-checks \
+                --enable-asserts \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index d3eec08235..54f43e1f68 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -1,35 +1,3 @@
 #!/bin/sh
-
-output() {
-  retcode=$?
-  if [ $retcode -eq 0 ]
-    then echo "PASS: $i"
-  elif [ $retcode -eq 77 ]
-    then echo "SKIP: $i"
-  else echo "FAIL: $i"
-  fi
-}
-
-export DBUS_TEST_HOMEDIR=./test
-export XDG_RUNTIME_DIR=./test
-export LD_LIBRARY_PATH=@PTEST_PATH@/test/.libs
-
-files=`ls test/test-*`
-
-for i in $files
-do
-     #these programs are used by testcase test-bus, don't run here
-     #additionally, test-names needs to be run under X
-     if [ $i = "test/test-service" ] \
-        || [ $i = "test/test-shell-service" ] \
-        || [ $i = "test/test-segfault" ] \
-        || [ $i = "test/test-bus" ] \
-        || [ $i = "test/test-names" ]
-     then
-         continue
-     fi
-
-     ./$i ./test/data >/dev/null 2>&1
-     output
-done 
+gnome-desktop-testing-runner dbus
 
diff --git a/meta/recipes-core/dbus/dbus_1.12.22.bb b/meta/recipes-core/dbus/dbus_1.12.22.bb
index 48947209d9..e611e7d98a 100644
--- a/meta/recipes-core/dbus/dbus_1.12.22.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.22.bb
@@ -5,10 +5,7 @@ SECTION = "base"
 
 require dbus.inc
 
-DEPENDS = "expat virtual/libintl autoconf-archive"
-PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
-ALLOW_EMPTY:dbus-ptest = "1"
-RDEPENDS:dbus-ptest:class-target = "dbus-test-ptest"
+DEPENDS = "expat virtual/libintl autoconf-archive glib-2.0"
 RDEPENDS:${PN} += "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native = ""
 
@@ -73,6 +70,8 @@ FILES:${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS:${PN}-lib = "${PN}"
 FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"
 
+RDEPENDS:${PN}-ptest += "bash make dbus"
+
 PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
 pkg_postinst:dbus() {
 	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
@@ -89,8 +88,6 @@ pkg_postinst:dbus() {
 }
 
 
-EXTRA_OECONF += "--disable-tests"
-
 do_install() {
 	autotools_do_install
 
@@ -149,5 +146,3 @@ do_install:class-nativesdk() {
 	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
-
-INSANE_SKIP:${PN}-ptest += "build-deps"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 268e48a088..6e20d40dac 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -43,7 +43,7 @@ PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 # libelf is auto-detected without a configuration option
 PACKAGECONFIG[libelf] = ",,elfutils"
-PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
+PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
 
 EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false"
-- 
2.30.2


