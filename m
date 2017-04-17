Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A15636FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:29 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d131so19396363qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ahN0plfS332klbmBv2+IEwuIPrU4NN93fWVDIRM9HLM=;
	b=lmnzFNmWe8BCJWSK0Q+EV/uGGXv6TrawDc3gNLSk9ni4lYHz9HVUKtMnZXsWJ6QFUs
	OGOtHR6i8Kc9DqmPqXXY/1ltSlPVlMoKg9K231VcoigqEbJ9LskVTY4+sm9cO0sGt+N1
	wPrkPCcaFxJmfmSDx33EyNcFGqRNKzltrE/7c/ljHgRW9ZkoEVkjIL6QHKbzWD8Ilw9q
	4UUR2UZeJrk2LLk7QtS4gxjFUWnMPnfIVeqxTBiJYl5r47A6TAZcCSKm7hvifu6HZsT5
	mobxcl/xZbEuz8GW45AyHsA9drzKvMklx1WINJCNKVaWbuYYZSJCD9pZSmQ53+ucJfZ4
	3I4g==
X-Gm-Message-State: AN3rC/4bq5AIzYx3h2Y6Zsse1opkU/RSs8eXNuhzAAwt6Ph20g+bg0VQ
	k7FeqUOOa8BQhg==
X-Received: by 10.55.195.142 with SMTP id r14mr8118510qkl.260.1492436371146;
	Mon, 17 Apr 2017 06:39:31 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:30 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:55 -0400
Message-Id: <1492436338-32048-6-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 5/8] bluez5: add PACKAGECONFIG option for cups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Apr 2017 13:39:29 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 71a5016..c8a240f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
 PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,,cups"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -34,7 +35,6 @@ inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
 EXTRA_OECONF = "\
   --enable-tools \
   --enable-deprecated \
-  --disable-cups \
   --enable-test \
   --enable-datafiles \
   --enable-library \
@@ -82,7 +82,11 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN} += " \
+    ${libdir}/bluetooth/plugins/*.so \
+    ${systemd_unitdir}/ ${datadir}/dbus-1 \
+    ${libdir}/cups \
+"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
 "
-- 
2.7.4


