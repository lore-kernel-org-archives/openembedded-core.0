Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id B4530702CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 11:19:07 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id w61so2059643wes.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 04:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bgmUS4VrxqXUsgx87pPa6cZNMDofOY5h4eRJ3MiRdV4=;
	b=erabEmNHIy0igQr5vn+PGIydjGtXSfX07xgBYmDSnHReIij/3JTxFtpHnoFqsHwqIR
	+wrWmemRvwQaw5Aq7ZrVN+OKx8zhIlZ73kMc7V9jh3wsMuyeffN/q7gt47XI+RfHOhAA
	uoKRRhCMqz6hs40I9WzudEgna61oF1FomLcQBUonUfDce4eiSoZ7X5NdajETrysaq0qv
	d7epTBA7BkaXsAXXVIH4687/+8JZmVoK8REN4FQmMF+vR0C71OGNL9IEAF2EF/R5eyT7
	2TYB1Hp2BwXOPRkCrf/eZEV5D54uyto99FKA/qnrKdel0ty13jwTVnmiOL2JUrRPlaUr
	6WfA==
X-Gm-Message-State: ALoCoQlcJUhjrSrul3YvcXazuwcZ8EXOU7NyoOX+GyprG5ZLM77CT4bREbugGG63fGAvwmPCbwIH
X-Received: by 10.194.78.4 with SMTP id x4mr42053585wjw.44.1410261547438;
	Tue, 09 Sep 2014 04:19:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id xm4sm15091777wib.9.2014.09.09.04.19.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Sep 2014 04:19:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 12:18:59 +0100
Message-Id: <1410261539-6182-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bluez4: optionally install systemd unit files
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
X-List-Received-Date: Tue, 09 Sep 2014 11:19:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index d7d3796..3f91166 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -13,9 +13,11 @@ RDEPENDS_${PN}-dev = "bluez-hcidump"
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
     ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}\
 "
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--without-systemdunitdir,systemd"
 
 ASNEEDED = ""
 
@@ -24,7 +26,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
@@ -43,4 +45,6 @@ EXTRA_OECONF = "\
   --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
 "
 
+SYSTEMD_SERVICE_${PN} = "bluetooth.service"
+
 EXCLUDE_FROM_WORLD = "1"
-- 
1.7.10.4


