Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC1E71E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:12:09 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so4691080wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 10:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MbOwTgOJ+4/y1OC7BGVzR4Kl3hwQ5Gyq/k6elcHyHEo=;
	b=coq7pgoTcD9zxj71unLgpE0yMi6RF24ryViGV1ZPaX0D7d2Q8YXt5V1/CU8iE0Jfah
	50CRxUMMfi8rUvpgY4sEnuMD7UlMyN2xj02tP+j/pBIZHfL+UXhZAN6MeReBEAAymV1m
	LH90OgWYqh2ipImudT5SbHeqRxRdS8dPkzBU6FAvX+Dk1OZ78UZh7Njwu4Fy+3hRC0i9
	FMxhIAbCHYCfnFhG5U9kOL9cAArgUfY4wTAwrcFFP7IIUjGqyoZmIbAGJmHH1ues0Uem
	UhiO6w8/wjuyEC503WVfC+f4INbxeOScVsXrJGBdaX7Ie6NERWJxwYYuTyD7zQS1jLRC
	sKCA==
X-Gm-Message-State: ALoCoQkqGZiWHk3+irm9VU1lscGqRrU9WGzd7ci7neumX1bhGb9/SAbZq38dZb2IBNkL8/uq3PM4
X-Received: by 10.194.189.138 with SMTP id gi10mr21935595wjc.86.1424455929895; 
	Fri, 20 Feb 2015 10:12:09 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id h11sm3415062wic.14.2015.02.20.10.12.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 10:12:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 18:09:51 +0000
Message-Id: <1424455791-14144-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] opkg: fix systemd unit installation
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
X-List-Received-Date: Fri, 20 Feb 2015 18:12:09 -0000

SYSTEMD_SERVICE doesn't need to be set conditionally, and units should be
installed if the systemd DISTRO_FEATURE is enabled, not if sysvinit isn't
enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/opkg/opkg_0.2.4.bb |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 7b49d5e..4051b72 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -26,11 +26,7 @@ SRC_URI[sha256sum] = "0f40c7e457d81edf9aedc07c778f4697111ab163a38ef95999faece015
 
 inherit autotools pkgconfig systemd
 
-python () {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        d.setVar('SYSTEMD_SERVICE_%s' % (pn), 'opkg-configure.service')
-}
+SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
 
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
@@ -64,7 +60,7 @@ do_install_append () {
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
 
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
 		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-- 
1.7.10.4


