Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 57AA66B994
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:20:09 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hr7so839309wib.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8JIXsSf/M58ZHaLdH5TpNdZgLDDOMM+ELiG40bAwPGw=;
	b=kMzmMt62anYZQAZ4sOVQsm31CNXIx8YnmuVPlTVKHKhCvcZ88psTAaR70LwO2BguAk
	kMl8JwkX8q9YFHMjb9zT/3x+VZgi6kHUkkoHCaVedMlzUIkMh2zME1paX6/qwjU7hdCl
	uZhZglOYSXg2Pbwdv/vcWe9Jlm3uVqBa/3EQfwyF4eX5qxGCKjUzwdIiCu97ejFHRndp
	z8SG53uzMdUffb69bhR5C2QInNCD8HrQMxLDOXpgcXJCyg9XX/vGRDAk6ZL47ewn4BwD
	WGNdGWXMSGRdKwlBlwdU0KJAR951nO5gLacxkFR42lhLBG6YCjmi/ycdGQ8iyaOSEX6S
	pgwQ==
X-Received: by 10.180.185.166 with SMTP id fd6mr3024203wic.5.1377278409681;
	Fri, 23 Aug 2013 10:20:09 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z2sm1224919wiv.11.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:20:08 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:20:09 -0700
Message-Id: <a4b663563dca248a121ce6942f7b442780e0a3af.1377278314.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1377278314.git.chris_larson@mentor.com>
References: <cover.1377278314.git.chris_larson@mentor.com>
In-Reply-To: <cover.1377278314.git.chris_larson@mentor.com>
References: <cover.1377278314.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] nativesdk-ca-certificates: prepopulate ca-certificates.crt
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
X-List-Received-Date: Fri, 23 Aug 2013 17:20:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

As postinsts aren't run for nativesdk packages when populating an SDK, we need
to prepopulate up-front.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
index 053fbbe..0ed238b 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
@@ -60,4 +60,10 @@ pkg_postinst_${PN} () {
 
 CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
 
+# Postinsts don't seem to be run for nativesdk packages when populating SDKs.
+CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
+do_install_append_class-nativesdk () {
+    SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
+}
+
 BBCLASSEXTEND += "native nativesdk"
-- 
1.8.3.4


