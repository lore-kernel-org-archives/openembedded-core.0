Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id CEFF172596
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 14:13:51 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so17449227wgh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 06:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=epsd18PKDPbpRw2XOZ0vGQVBGa6+wlK3n0NEuyKniCQ=;
	b=DjT6dLZhLSsYOJ8nZ0xi8gYsWmhH1qyx5FRehLEwvZKEHnJirGn92uvWZk1TjCreR7
	OwCcDlXEz4FIGf3yc4sauD2e0QNfzgM0mOUZMViGYF2UtkhKboeqtUSKAN04MenN8wcR
	1XuxsrxVXaFUFzR5NIMEDE1vwqsJJSxygA0INMEPp2Mk9C531WkzvjLMBtd2lNlyfdxB
	yjSbGpYs6nKJXvaFN7avbtmE0UCHgJQy3k9XZxzWd+6/KKv0ohmrUMJ/FmikrxzWfhcu
	ODTDulsThXUqRF6Ugt7TD6JAZDcVdlTTJGtR4ZVApS2tNkMjvDwu60XTqr8dj4JQCvQ+
	RMgA==
X-Gm-Message-State: ALoCoQn9ScsTaPXIabcPTxnxx9yLzztgRtz9meVBseZ+mLWWQvGvhgLeunSTtmGm/W1JEdQJXwuS
X-Received: by 10.195.13.114 with SMTP id ex18mr60692277wjd.111.1418739231674; 
	Tue, 16 Dec 2014 06:13:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id wb9sm2278978wic.20.2014.12.16.06.13.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 06:13:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Dec 2014 14:13:04 +0000
Message-Id: <1418739184-5734-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ofono: use PACKAGECONFIG for systemd and bluetooth
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
X-List-Received-Date: Tue, 16 Dec 2014 14:13:59 -0000

For clarity use PACKAGECONFIG for the systemd and bluetooth optional features.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc |   16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 9f65f4f..bf44fca 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -7,16 +7,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 inherit autotools pkgconfig update-rc.d systemd
 
-DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
+DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
 
-EXTRA_OECONF += "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
-    --enable-test \
-"
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
+    "
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+
+EXTRA_OECONF += "--enable-test"
+
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 
 do_install_append() {
-- 
1.7.10.4


