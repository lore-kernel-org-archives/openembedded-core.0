Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E11C41513
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 07:35:01 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.81038.1718696093208817873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 00:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=1hLAxWns;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=por+5fz87inSBYE3hDQds5IYcH/lDkJekCPGWxwqXxk=; b=1hLAxWns1pft6KePwfbfNxEjLd
	P/bgm8cU9McY7qtXjN7vY9mcZryGJqIcXudPCnr3Gg+T/Bw6ddQlnNstjjHYMXoxGhEGAuR8JiKuC
	BbsvctkIcQdTAcCsOdzpSJkMeK8ZX6e8eNefWZcZyCvnGz0SgWkfqAdgUhNRi5zPBICZ/U9c9LrGp
	IoVFz3ftOSuJFfSBoVcY9Z6TUS1H23SkZK8vx04s2EkkhqmfQqcqJIuylS0BV1x15rWx6pGtcQTQK
	c8uEU+tdVxahUgR56N2h1w3NOiEFDU/aWNJHNXrcdqOaTjXe+o2TGm2dg/ea0dhJLkJ7ZYIWffxf7
	Cu4U2GzA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sJTMe-000J3n-Rr; Tue, 18 Jun 2024 09:34:45 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sJTMb-000PJG-1I;
	Tue, 18 Jun 2024 09:34:45 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 2/3] ell: add ptests
Date: Tue, 18 Jun 2024 09:34:36 +0200
Message-ID: <20240618073439.2068944-2-martin@geanix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618073439.2068944-1-martin@geanix.com>
References: <20240618073439.2068944-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27309/Mon Jun 17 10:30:25 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 07:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200859

Depends on  openssl-native and xxd-native to allow generating
certificates used for testing.

Create the ${B}/unit dir as that seems to be missing with the automake
patches used for building tests separately from running them.

In order to build the test cases, both --enable-tests and
--enable-maintainer-mode must be passed to configure.

A few unit tests looks for files in ../ell-0.66/unit (i.e. $(top_srcdir)
in automake) when running. Instead of playing games with symlinks or
install paths, the "correct" path is just (re)defined in CFLAGS.

A (submitted) patch is added to make dbus-server run correctly when
testing with "nonetwork" passed to runqemu.

Skip a few tests that require additional kernel modules to be enabled.

Test execution time is about 10 seconds.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/ell/ell_0.66.bb             | 25 ++++++++++--
 ...-specify-tcp-hostname-in-dbus-config.patch | 38 +++++++++++++++++++
 meta/recipes-core/ell/files/run-ptest         | 23 +++++++++++
 4 files changed, 84 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch
 create mode 100644 meta/recipes-core/ell/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da6fa6ee9723..c60575a45cc2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -15,6 +15,7 @@ PTESTS_FAST = "\
     cpio \
     diffstat \
     diffutils \
+    ell \
     ethtool \
     expat \
     expect \
diff --git a/meta/recipes-core/ell/ell_0.66.bb b/meta/recipes-core/ell/ell_0.66.bb
index 899e2f684936..d53db2edc189 100644
--- a/meta/recipes-core/ell/ell_0.66.bb
+++ b/meta/recipes-core/ell/ell_0.66.bb
@@ -10,9 +10,28 @@ SECTION = "libs"
 LICENSE  = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-DEPENDS = "dbus"
+DEPENDS = "dbus openssl-native xxd-native"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
-SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI = " \
+    https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
+    file://0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch \
+    file://run-ptest \
+"
 SRC_URI[sha256sum] = "7a78b757080ed6518c1c4fa26ad6a7a3d6e4e385386a20b6fb52379e7d1ffa36"
+
+EXTRA_OECONF += "--enable-tests --enable-maintainer-mode"
+CFLAGS += "-UUNITDIR -DUNITDIR="\\"./unit/\\"""
+
+do_compile:prepend() {
+    mkdir -p ${B}/unit
+}
+
+do_install_ptest() {
+    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -executable -type f)
+    install -Dt ${D}${PTEST_PATH}/unit \
+        ${S}/unit/dbus.conf \
+        ${S}/unit/settings.test \
+        $(find ${B}/unit -name \*.pem -type f)
+}
diff --git a/meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch b/meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch
new file mode 100644
index 000000000000..328e51683215
--- /dev/null
+++ b/meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch
@@ -0,0 +1,38 @@
+From d5ebbb5ea68848c5fad5517adf2f885de142a66e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Mon, 17 Jun 2024 14:14:03 +0200
+Subject: [PATCH] unit: don't specify tcp hostname in dbus config
+To: ell@lists.linux.dev
+
+Testing dbus with no network interfaces available on the host fails
+with:
+  dbus-daemon[291]: Failed to start message bus: Failed to lookup host/port: "*:14046": Name or service not known (-2)
+
+Seems like "*" isn't a valid hostname in such cases:
+  https://bugs.freedesktop.org/show_bug.cgi?id=28979
+
+According to the linked issue, the fix is to simply omit the host= and
+bind= parameters in the config.
+
+Signed-off-by: Martin Hundebøll <martin@geanix.com>
+Upstream-Status: Submitted [https://lore.kernel.org/ell/20240617122939.1249697-1-martin@geanix.com/]
+---
+ unit/dbus.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unit/dbus.conf b/unit/dbus.conf
+index 5fe41a9ad6a6..3651e44538b1 100644
+--- a/unit/dbus.conf
++++ b/unit/dbus.conf
+@@ -7,7 +7,7 @@
+   <allow_anonymous />
+ 
+   <listen>unix:path=/tmp/ell-test-bus</listen>
+-  <listen>tcp:host=localhost,bind=*,port=14046,family=ipv4</listen>
++  <listen>tcp:port=14046</listen>
+   <apparmor mode="disabled" />
+ 
+   <policy context="default">
+-- 
+2.45.2
+
diff --git a/meta/recipes-core/ell/files/run-ptest b/meta/recipes-core/ell/files/run-ptest
new file mode 100644
index 000000000000..5b3acdd98b8a
--- /dev/null
+++ b/meta/recipes-core/ell/files/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+ret_val=0
+
+for test in test-*; do
+    case "$test" in
+        test-pem | test-key)
+            if ! [ -d /sys/module/pkcs8_key_parser ]; then
+                echo "SKIP: $test"
+                continue
+            fi
+            ;;
+    esac
+
+    if "./$test" >> ell_test.log 2>&1; then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+        ret_val=1
+    fi
+done
+
+exit $ret_val
-- 
2.45.2


