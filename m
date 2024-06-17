Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D16C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:37:06 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.56433.1718631417168927779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 06:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=vCyTVs+Y;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=RreWenAJckwHm+k7IzHGGov2FGquMsdQ81lqGW9BEx0=; b=vCyTVs+Y6xMw9llZqq9Kkud0hx
	y0hcgtZzoMecKl8zmeQibV7Vh2VriS6qyDE3K2kR+qWEppyRhSdIUXca0ujKaWU8hG6pYp+t7xVsE
	VXANbcIHJkmh2bWhrvLCedI0c0Ad69J1Oe8WnBtDA27mrHOzTcVyFLIZaLDV3gkSMEgeJT/HbzEwH
	Z8i49oGNJneNRQz0SZFGkhagZn1+TrEwc3vWsM18HxtpeO8Vh0JRoJH+X86YobiKhqrJqUURuW+30
	Q/bfCNSE5XNaAUPeKJy+NHKJOjmtuoAef1EyJH68ILJzexqf4XMjszA9vsV/tEDnPlPzEvxPoWRd6
	pTL1MEOg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1sJCXb-0009i8-34; Mon, 17 Jun 2024 15:36:55 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1sJCXW-0002IR-39;
	Mon, 17 Jun 2024 15:36:55 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 3/3] ofono: add ptests
Date: Mon, 17 Jun 2024 15:36:42 +0200
Message-ID: <20240617133643.1856546-3-martin@geanix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617133643.1856546-1-martin@geanix.com>
References: <20240617133643.1856546-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27309/Mon Jun 17 10:30:25 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 13:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200838

Install and run the unit tests already provided by ofono. Test execution
time is about a second.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-connectivity/ofono/ofono_2.8.bb    | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c60575a45cc2..60cbea0f19e9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -53,6 +53,7 @@ PTESTS_FAST = "\
     lzo \
     m4 \
     nettle \
+    ofono \
     opkg \
     pango \
     popt \
diff --git a/meta/recipes-connectivity/ofono/ofono_2.8.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
index 809485d42178..f54367848f05 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
@@ -10,10 +10,11 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
+    file://run-ptest \
 "
 SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
 
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


