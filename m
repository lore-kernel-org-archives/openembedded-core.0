Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EF2C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 08:23:15 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.63485.1722500586626942944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 01:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=HN/GZQko;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=p3r1MDB66i8bd/li6tl8oyW1xsJ9qTY8PNmrDpJFVSg=; b=HN/GZQkoHYI9cd06IAhnagI4LB
	ra+XEM3NOfVSflDCPI8B8NCDEQxkoLLXzi61FDlQ5200EYDYZ9L6WrO1r7B3KH94LH0KfoKwN+7oJ
	KLhIEtxFjxzdzjPELvM58wzktNqSRA21GiuZ7v5tntoHP4emZbdr98pw3RG8FJwuknlUn0ahbt2mK
	/VNBm7/UW6f+uMT9/k9no0UoGMcSa39WDLS8ZtvmLW81q2JXk+d+qgiGO8D6pTr+z07xkp8RoSq/q
	R8NCxfRmOKUXDV9IgSDDFbVImSsfk1IdBYA7ZdrtpFDL5xlaXOIS7AyL+fBKiNZ1xzVI/PsEZyPdW
	BldoJCaA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sZR5U-000I2F-Ii; Thu, 01 Aug 2024 10:23:04 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sZR5U-0004OZ-2f;
	Thu, 01 Aug 2024 10:23:04 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v3 2/2] ofono: add ptests
Date: Thu,  1 Aug 2024 10:22:51 +0200
Message-ID: <20240801082253.974486-2-martin@geanix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801082253.974486-1-martin@geanix.com>
References: <20240801082253.974486-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27353/Wed Jul 31 10:27:25 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202728

Install and run the unit tests already provided by ofono. Test execution
time is about a second.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

Change since v2:
 * disable basic mux test that requires phonesim service to connect to

Change since v1:
 * add missing run-ptest file

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../ofono/ofono/run-ptest                     | 25 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.9.bb  | 12 ++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index a655439f5ebe..ad117c1bcc76 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -54,6 +54,7 @@ PTESTS_FAST = "\
     lzo \
     m4 \
     nettle \
+    ofono \
     opkg \
     popt \
     python3-atomicwrites \
diff --git a/meta/recipes-connectivity/ofono/ofono/run-ptest b/meta/recipes-connectivity/ofono/ofono/run-ptest
new file mode 100644
index 000000000000..99a79376382a
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+ret_val=0
+
+for test in test-*; do
+    case "$test" in
+      test-mux)
+        # the basic mux test requires a phonesim server process
+        # to connect to
+        args="-s /testmux/basic"
+        ;;
+      *)
+        args=""
+        ;;
+    esac
+
+    if "./$test" $args >> ofono_test.log 2>&1; then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+        ret_val=1
+    fi
+done
+
+exit $ret_val
diff --git a/meta/recipes-connectivity/ofono/ofono_2.9.bb b/meta/recipes-connectivity/ofono/ofono_2.9.bb
index 26cb9bb7ffb7..6b641a6e854d 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.9.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.9.bb
@@ -10,10 +10,11 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
+    file://run-ptest \
 "
 SRC_URI[sha256sum] = "9d2612925a23a7fb668f297a044b5ea136215cc399ecc3f127135c8f2a9845f9"
 
-inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
+inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data ptest
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
@@ -28,11 +29,20 @@ PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
 
 EXTRA_OECONF += "--enable-test --enable-external-ell"
 
+do_compile_ptest() {
+    oe_runmake buildtest-TESTS
+}
+
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
 }
 
+do_install_ptest() {
+    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -executable -type f)
+    install -m644 -Dt ${D}${PTEST_PATH}/unit ${B}/unit/test-provision.db
+}
+
 PACKAGES =+ "${PN}-tests"
 
 FILES:${PN} += "${systemd_unitdir}"
-- 
2.45.2


