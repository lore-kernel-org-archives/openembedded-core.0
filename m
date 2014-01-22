Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id CEFAA6E71F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:09:04 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id y1so424897lam.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3nsK/WOgXZlBNyX8w7rEXR+261pQoBVXeurckZVumEQ=;
	b=uumLU5qoO7KAZJM0ydsh7worBlAedfjFwkteojO4lvwcy24LkxOlqyo+sU+gywMQOH
	d+wgTfh5nyvcr22MVgLObNXc2/0zwFaqwQ8pmFbk0ih42zhv8xrxlgZuek0AwfFEQOf3
	w3876pIswxVwRn2ETTBwaQky8fpoV703JKCoBy7pUWXShGcVOw8WMsbCM4Gi9a0i5iuF
	PJePil82GJu3E2tg6KYyqYM7Gqe2PfhsOuw7P5MeAD9tQfUI93k6ACreM27rZ32g5GUD
	ro+ZULM59q30pDyw3zdy5BGCX1ks3YXXH9e3mG7g0OSO+40W0cBSogmLcepXz6MDVRqc
	tUEw==
X-Received: by 10.112.155.106 with SMTP id vv10mr1284006lbb.53.1390403345231; 
	Wed, 22 Jan 2014 07:09:05 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id ox6sm7876522lbb.6.2014.01.22.07.09.03
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 07:09:03 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 68A0E1C61BD; Wed, 22 Jan 2014 16:08:56 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 16:08:54 +0100
Message-Id: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCHv2 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 15:09:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding ability to use postinstalls intercepts in the nativesdk env, and
making sure the correlate between repo + SDK.

This to enable rootfs generation from a package repository using only a
package repository and the toolchain tarball.

See https://github.com/nysan/rootfs-sandbox for examples.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../postinst-intercept/postinst-intercept_1.0.bb      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb

diff --git a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb b/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
new file mode 100644
index 0000000..41b9a6e
--- /dev/null
+++ b/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Postinstall scriptlets"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+FILES_${PN}_append_class-nativesdk = " ${datadir}/postinst-intercepts/*"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install_append_class-nativesdk() {
+	install -d ${D}${datadir}/postinst-intercepts
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/postinst_intercept ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_font_cache ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_icon_cache ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_pixbuf_cache ${D}${datadir}/postinst-intercepts/
+}
+
+BBCLASSEXTEND = "nativesdk"
+INHIBIT_DEFAULT_DEPS = "1"
-- 
1.8.3.2


