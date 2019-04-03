Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id C2B617D38D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z11so8335211wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WxaVUJcN59sQf3Mr01WMCI1sLkmpUwi2QFcPyHTKyHg=;
	b=zO187T94c/oGFCZuJIx37M9PVreEpfnC5vm+nUHeOLJa48dTnNoVaUJJSF1DTp+hew
	Ky8DRBc3i9NTRjQcUq1sMZczcN7N4GrT+GXDEjvAV+47U+lM0aoX/qYfjfvMnAXlXDC/
	/vRRDvY7xhHy5AQqRVrLR4h2nwqRyLIYfyCE05RoW9vFohMGoRqzRZ7+owXHcP315LsK
	zz3StjHUwvrneScXP5QCtXS+9EF0LGt2PejX8nL36x9AhKMYHBjI0CYDUpSi60Qz3Cno
	BrLHdfNQj5vJnMH+hWPTv3qSb+wrg++yjjCcY0mgucyuGc/ZlC2KtA0GOl7SjxvP4XOu
	S9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WxaVUJcN59sQf3Mr01WMCI1sLkmpUwi2QFcPyHTKyHg=;
	b=lej5DO6TrzIVIIUA1RLKa5DGmZFbmpgwSe5BS+Uwabsomns6DxdjTXcf8g/nDUvSkV
	86Q0xfQacN1ciao8ZiH9q5mzb/mCoAya+0mDzRE5bW4jLK/Ls7VPQHDk5Dh7Bxt57kD2
	Hljl3BX+xy0KxR/9lJ30hotJTg/S0jRQ7KfpEJwoqkopkd5jTzZLWMuScaIYDkSF2pYg
	cMhIIuHZfxe5AD5nT0UB8atLo4GwysC45vR95oyLmSxONwp7ix0ycF3oW/+AWOrd8CiD
	YUCcdaJ7Xnn8SrmoGkm6A/a39+9CkWlBSz6O1d8Ynv/fy3e2qtlSfTqg5owoZ33JM3HA
	YEAA==
X-Gm-Message-State: APjAAAWT4JYVcNMGxAuaUSlkn2QjmjoM8ZCV+TkOTtu9GKxvGytJJmNd
	wvxCQ1CQC3vNvOxtAaGeIo4XKaVUwkc=
X-Google-Smtp-Source: APXvYqx7UnCZBRItVQKODgxURo+mOQJv2LJ466UXDNw4u+Pcj71CsV+2oIOHyh6//R1/O3ZOCPtSRQ==
X-Received: by 2002:a1c:6783:: with SMTP id b125mr781652wmc.41.1554311056297; 
	Wed, 03 Apr 2019 10:04:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:04 +0100
Message-Id: <20190403170412.23568-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/9] xmlcatalog: new class to update the XML catalogue
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:16 -0000

This is a new class to handle recipes that need to add/remove entries in the XML
Catalog(ue)[1].  In the future it will handle updating the catalogue on the
target, but the immediate requirement is during the build so currently this only
works with native recipes.

Note that as this is a new class and target use hasn't been implemented yet, it
is possible that the behaviour of this class will change.

[1] https://en.wikipedia.org/wiki/XML_catalog

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/xmlcatalog.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/classes/xmlcatalog.bbclass

diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
new file mode 100644
index 00000000000..dc63a0beb4d
--- /dev/null
+++ b/meta/classes/xmlcatalog.bbclass
@@ -0,0 +1,22 @@
+XMLCATALOGS ?= ""
+
+DEPENDS_append_class-native = " libxml2-native"
+SYSROOT_PREPROCESS_FUNCS_append = " xmlcatalog_sstate_postinst"
+
+xmlcatalog_complete() {
+	ROOTCATALOG="${STAGING_ETCDIR_NATIVE}/xml/catalog"
+	if [ ! -f \$ROOTCATALOG ]; then
+		xmlcatalog --noout --create \$ROOTCATALOG
+	fi
+	for CATALOG in ${XMLCATALOGS}; do
+		xmlcatalog --noout --add nextCatalog unused file://\$CATALOG \$ROOTCATALOG
+	done
+}
+
+xmlcatalog_sstate_postinst() {
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}-xmlcatalog
+	echo '#!/bin/sh' > $dest
+	echo "${xmlcatalog_complete}" >> $dest
+	chmod 0755 $dest
+}
-- 
2.11.0


