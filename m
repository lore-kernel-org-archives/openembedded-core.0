Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 128166B212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 19:26:15 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so1042780pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=luLVn5w+aERmcXCoGUhP7yQNOKZidR89G0oCkE8Z39M=;
	b=jp9ZFl0pWIAhv3bJr78VGnLKSPM+fsO2qIc8SY/5I/z9bQtgvhYYqgdvzAIBxEGMfV
	XY3CaymvtZJkAfsFS96XBDNOUqEQiKmNVfa4ja+O0fVxEtfVdzfvI3gAFqh8WqsLxzOo
	+5SOlTDUWwEQCGFk+WClM4iWabmm2TQl3a+j7nbMRz8U5IvvORdD9CNgLmMC5dxirZvy
	CNPanRjqMTJvKQ4iHo9pIX2fBZb17//y6RrFTUu0LcAopdo9x3M3OJ1YofUjfNmWTW8i
	GseKYy1ojHGdoyrNutCsJ2IbrssZDQp/mudGeAGvrmtxobdQZBuCOE549wn5/3cNF4cB
	3XLQ==
X-Received: by 10.68.1.9 with SMTP id 9mr1281033pbi.128.1377285976007;
	Fri, 23 Aug 2013 12:26:16 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sx7sm1399287pbc.41.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 12:26:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 12:26:15 -0700
Message-Id: <33a267514a3c6582ac417ddeccf91baae938f25d.1377285913.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1377285913.git.chris_larson@mentor.com>
References: <cover.1377285913.git.chris_larson@mentor.com>
In-Reply-To: <cover.1377285913.git.chris_larson@mentor.com>
References: <cover.1377285913.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 2/2] nativesdk-ca-certificates: prepopulate ca-certificates.crt
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
X-List-Received-Date: Fri, 23 Aug 2013 19:26:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

As postinsts aren't run for nativesdk packages when populating an SDK, we need
to prepopulate up-front.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20130610.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb b/meta/recipes-support/ca-certificates/ca-certificates_20130610.bb
index 0692ca2..29d6ebd 100644
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


