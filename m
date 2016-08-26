Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 609547016E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 10:31:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so10788654wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9UCFZ7I34U4EWjugr7OBVEyy8NBIJe/ZWNs8Ro+F26o=;
	b=kVQSVfbqi33R0WYR2bvcUfgxQe2jwQkls/dKUjHvYjfJlrgMr7Ibp1XJDfmy/LCBSy
	4dksw2PKN1mBV3Nymq44B7J7mL5ui2vOduPt9Bbqou/GdqkXlHgGfo3rkkRpgTIDevWU
	7WbQDG4Ohr9fFY6RRZjuNYG6Kzi6jPe1eY+0I8fKihJImC05boMq4eVpnl2KlNrgxwv5
	VfUIq5Vz94MQOLk8qiMXXoDIT9XHt02jrhv8YXtU3tkebEA3HsDUanOuk8sEblJMBg8h
	kqMBMZwwYAbvnMsWKSxw5K7fPM0f7zWiFXuYBPo5Fh5pSiyzT/CoP5IAtpCcqFiaD3pl
	fCNQ==
X-Gm-Message-State: AE9vXwN34f3478RRWyB1nWnyDA84uk1TRkcIW7dIlYQA0krBOf8HNDGDBnweSONHoZo/UA==
X-Received: by 10.28.44.85 with SMTP id s82mr2952649wms.73.1472207514654;
	Fri, 26 Aug 2016 03:31:54 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id i1sm19328827wjl.9.2016.08.26.03.31.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 03:31:53 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 11:31:50 +0100
Message-Id: <20160826103152.6211-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/3] libnl: fix packaging mistakes
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
X-List-Received-Date: Fri, 26 Aug 2016 10:31:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- *.la files belong into -dev packages
- the genl-ctrl-list command line utility should go to into the CLI
  package, so as to prevent the libnl-genl library package from
  pulling in all of the command line utilities (as genl-ctrl-list
  is linked against libnl-cli-3.so.200)

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-support/libnl/libnl_3.2.25.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
index cabe841..2624915 100644
--- a/meta/recipes-support/libnl/libnl_3.2.25.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
@@ -25,18 +25,18 @@ FILES_${PN} = "${libdir}/libnl-3.so.* \
                ${sysconfdir}"
 RREPLACES_${PN} = "libnl2"
 RCONFLICTS_${PN} = "libnl2"
+FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
 
-PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl ${PN}-idiag"
+PACKAGES += "${PN}-cli ${PN}-genl ${PN}-idiag ${PN}-nf ${PN}-route"
 FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
                      ${libdir}/libnl/cli/*/*.so \
-                     ${libdir}/libnl/cli/*/*.la \
+                     ${sbindir}/genl-ctrl-list \
                      ${sbindir}/nl-*"
-FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
+                     ${libdir}/libnl-genl.so.*"
 FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
-                     ${libdir}/libnl-genl.so.* \
-                     ${sbindir}/genl-ctrl-list"
+FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
 RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
 RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
2.9.3


