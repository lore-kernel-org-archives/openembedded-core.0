Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D07C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 08:23:15 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.63507.1722500586585099789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 01:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=qvBY82vE;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=mf3kt2/StwQZZb/kAkt9cjwvi+vUziU0qf512+4JbXY=; b=qvBY82vEbGP/HUUi29/9Jq3Ahy
	cNJYfPiMsq6ACoznWX0FlTT4q6iAAgK7syPSoNzwJCproAh/8Ey+wve272D2/GOs9oDaYE52lpvqG
	TO5fcXr73cynPNYxPyAtOF9tgIIqRmofUtSdvYeIE2Kdk+IJHk6nMB+CaSAYs/r4mXeYBFR7lMg6y
	qZrJ5Wuj493qJ7AMbXYkgk+oOxielR143VjcAIhwV23DPINr2AH+zG/p4Qqa8coezwMpeGYhafbjm
	lj5g1kPHmEy12LsxwcWmirQ3BHdfxQnuDIDhLf1OXgPzXsr9e4+hhM/rQpAXEVxOVg+wcb+W7cHj7
	BS3UxT5A==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sZR5U-000I2E-DS; Thu, 01 Aug 2024 10:23:04 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sZR5U-0004OZ-2I;
	Thu, 01 Aug 2024 10:23:04 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v3 1/2] ell: add ptests
Date: Thu,  1 Aug 2024 10:22:50 +0200
Message-ID: <20240801082253.974486-1-martin@geanix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27353/Wed Jul 31 10:27:25 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202727

Depends on  openssl-native and xxd-native to allow generating
certificates used for testing.

Create the ${B}/unit dir as that seems to be missing with the automake
patches used for building tests separately from running them.

In order to build the test cases, both --enable-tests and
--enable-maintainer-mode must be passed to configure.

A few unit tests looks for files in ../ell-0.67/unit (i.e. $(top_srcdir)
in automake) when running. Instead of playing games with symlinks or
install paths, the "correct" path is just (re)defined in CFLAGS.

Skip a few tests that require additional kernel modules to be enabled.

Test execution time is about 10 seconds.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/ell/ell_0.67.bb             | 24 ++++++++++++++++---
 meta/recipes-core/ell/files/run-ptest         | 23 ++++++++++++++++++
 3 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/ell/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e3ab7e862925..a655439f5ebe 100644
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
diff --git a/meta/recipes-core/ell/ell_0.67.bb b/meta/recipes-core/ell/ell_0.67.bb
index 6b0ebbe62113..ee9aa73d2908 100644
--- a/meta/recipes-core/ell/ell_0.67.bb
+++ b/meta/recipes-core/ell/ell_0.67.bb
@@ -10,9 +10,27 @@ SECTION = "libs"
 LICENSE  = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-DEPENDS = "dbus"
+DEPENDS = "dbus openssl-native xxd-native"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
-SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI = " \
+    https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
+    file://run-ptest \
+"
 SRC_URI[sha256sum] = "97942e8cefb130b632496e5485242f3f374f3b8846800fb74fffd76dc2a0c726"
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


