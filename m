Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id B7FB37D48E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:46 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k17so5633108wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aEZhCNHqa6dNeNskT1gxqE9D2qhmhannGPNzbFGD0FY=;
	b=pwIJQW2J6DkNzTKQFIzgicSJR4emAvrBQoa992mx02dvfiJZUk7nFuhA/VGBDYSh2n
	ihrMGIO6NIkg3wJRPLFmpZhOpSGdCFMobUwlycy26ewZM/CJ1UENrdSOiPSukAN1iyZO
	8IX79MpH4FJOulne+VOL2hAg/CW3kcyw7Hkj9tZq9YrzH89JDdg32BQCf8mqcZQ7AxYp
	Ok7RI4LFa/iFryloBuaJiuBYpWLRp/KJLRxLeTDc5tjFWwqa8iCd+1HTLPSL7TOfNDzD
	UckYSvCLjRUfVQEPCSjg2FC8P2l42gaNZwwtubs6lH1tDSE+CeRLs8BSZiV9OteW6N1S
	S37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aEZhCNHqa6dNeNskT1gxqE9D2qhmhannGPNzbFGD0FY=;
	b=kJcKSDrDnRr9q9n+loaAF4iVxsEBJGNO4VV4f2feteM1Tml3uP6pl1GXYBTy3iSEGf
	X4jS2cT83NZ+Oct8zc9bm8Lijw5Ne0/FZxZX07mpnuy1T8xk1IhAMpQYK1SpF0G4kfue
	ayFe2dhWh22ABAl+kOewAzQDsRwPiMCdKoX3LbuBiY/t+2RPz1P91oMjfQrU9lBYrl0T
	mVQv0k+Y9SP3vKRv4AByf54gqYezzm0P8OvJQoLk6ujn/Vbbk3EPIoTPdtqhacUOGr3k
	n3OXy+YIao1YF2TMiCwr062YGtSy7vXc3sEK2b6nnib65mpN+oPYrAmB845tYtXW2lb2
	r9pA==
X-Gm-Message-State: APjAAAWj9hx5D6OAAKmgJQfjA+znysHReCqNdPtV35szPmD8n0lIdXAS
	plMV9i4r6D7PLMN1v7WvPWObR3X8cQ8=
X-Google-Smtp-Source: APXvYqyfcmuMKQQ2d8bC1L0wpPIFDzhPJY32frzdL68nGVTSsxJ3rgIpwycVwQHwt7ao8/uTjndkSw==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr5962870wrs.139.1554416207033; 
	Thu, 04 Apr 2019 15:16:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:36 +0100
Message-Id: <20190404221644.20496-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 1/9] xmlcatalog: new class to update the XML catalogue
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:47 -0000

This is a new class to handle recipes that need to add/remove entries in the XML
Catalog(ue)[1].  In the future it will handle updating the catalogue on the
target, but the immediate requirement is during the build so currently this only
works with native recipes.

Note that as this is a new class and target use hasn't been implemented yet, it
is possible that the behaviour of this class will change.

[1] https://en.wikipedia.org/wiki/XML_catalog

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/xmlcatalog.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/classes/xmlcatalog.bbclass

diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
new file mode 100644
index 00000000000..075aef8c0c4
--- /dev/null
+++ b/meta/classes/xmlcatalog.bbclass
@@ -0,0 +1,24 @@
+# A whitespace-separated list of XML catalogs to be registered, for example
+# "${sysconfdir}/xml/docbook-xml.xml".
+XMLCATALOGS ?= ""
+
+SYSROOT_PREPROCESS_FUNCS_append = " xmlcatalog_sstate_postinst"
+
+xmlcatalog_complete() {
+	ROOTCATALOG="${STAGING_ETCDIR_NATIVE}/xml/catalog"
+	if [ ! -f $ROOTCATALOG ]; then
+		mkdir --parents $(dirname $ROOTCATALOG)
+		xmlcatalog --noout --create $ROOTCATALOG
+	fi
+	for CATALOG in ${XMLCATALOGS}; do
+		xmlcatalog --noout --add nextCatalog unused file://$CATALOG $ROOTCATALOG
+	done
+}
+
+xmlcatalog_sstate_postinst() {
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}-xmlcatalog
+	echo '#!/bin/sh' > $dest
+	echo '${xmlcatalog_complete}' >> $dest
+	chmod 0755 $dest
+}
-- 
2.11.0


