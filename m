Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 95C9877A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:58 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id o36so25356446qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ahN0plfS332klbmBv2+IEwuIPrU4NN93fWVDIRM9HLM=;
	b=Upu6sN15AdtGCShdfalr3vWHpz1GDi1dwmDB8+8yFRTs11mOjIlxCj7zqwYqy9XQFw
	vKHIJdc4xXVxs/jd36bj/o0Hqme2LKSwQt+A3HRpCtihGNe49zzlOXKB35sWD+Oz0UB4
	WKh70/gmi6RL4StNHvg1JDcOGpHmLKSt49+9JUAQ6vaoqGWcNmOfqariKAZAYy7UWYVr
	/GuZaskT0uzgf1ZykMHTTwwxtQlPXdpl+59nXR6UKE6o6EH1WObTsPkdS1GQpzK+4nL2
	7vcAO5mlhAncf2MCc7Tpp0rjYn8rGf6GBofQ4DITwgEC0E3B3cU3fNca/tYgemNgMLou
	RC+w==
X-Gm-Message-State: AN3rC/5s+6xG2gDz47hlU2N1TD1coqBaTJZZasMVYQO51NGVfKyxYmU9
	m7/ToIAhOmeqAA==
X-Received: by 10.237.57.170 with SMTP id m39mr30148453qte.163.1493131740067; 
	Tue, 25 Apr 2017 07:49:00 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.48.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:48:59 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:38 -0400
Message-Id: <1493131720-19456-6-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 5/7] bluez5: add PACKAGECONFIG option for cups
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
X-List-Received-Date: Tue, 25 Apr 2017 14:48:58 -0000

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


