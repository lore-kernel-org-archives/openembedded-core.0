Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJO1u-0007vM-2c
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:26:22 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 05:13:20 -0700
Received: by weyt44 with SMTP id t44so4246860wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 05:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=l9YWx6UEVu6E77ZoYuX2qorXinSoUZ5IeNrZGpLDl9U=;
	b=PY+Ciu4tYUouS1yKgghDP5ZeM1qKjqhnVc28AeySSnp8woJBlpwzVeA8kHbGneO3jX
	iqkM61jB9yMK1jHx+lVOgulx5Z1hzpn3MCAJII69vmd0GD7/BOHSjByh26byfGRGbfNK
	krjbOmm7zmqpYcTN5ok/0h07liv5kH59d5GH1LJUQbnNMmg49bftnO9Gdn4VxiDgS05f
	dMM1Swr4NOxdkcizL93PRh4to09Q6W+XcZ899I3LMqk8zP+2YX2cR/iziokW1hugYSi9
	YvxDuF89O8uiMpQKdC2Tsbl+6cefLRHhLTB1h7TXuyslkVB+45FwnXigoeeO9Mohi4yQ
	PJSg==
Received: by 10.180.99.99 with SMTP id ep3mr4555932wib.15.1349266399368;
	Wed, 03 Oct 2012 05:13:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cu1sm26623221wib.6.2012.10.03.05.13.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 05:13:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 13:12:18 +0100
Message-Id: <1349266338-15222-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkZTiYu/27JdVIxnlimFi4sJ+jGFK4anpG3zMQzqk+PQz65/QMNlPpdkjivbOGfdqzo6tGv
Subject: [PATCH] wpa-supplicant: don't break the DBus service file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 12:26:22 -0000

The recipe exports $BINDIR as ${sbindir} and the build system uses this when
writing the DBus service file, so sedding it and replacing $base_sbindir with
$sbindir (/sbin and /usr/sbin) isn't useful when it ends up as
/usr/usr/sbin/wpa_supplicant.

[YOCTO: #3202]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc |    1 -
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb  |    2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
index 873e923..485a2dd 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
@@ -61,7 +61,6 @@ do_install () {
 	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
-	sed -i -e s:${base_sbindir}:${sbindir}:g ${D}/${datadir}/dbus-1/system-services/*.service
 
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
index a60cd86..36ee25c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-1.0.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "8650f6aa23646ef634402552d0669640"
 SRC_URI[sha256sum] = "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31feaf7c04482b9c"
-- 
1.7.10



