Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF117D45D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z11so4775590wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KSwQ6K0Wcg6HL8nscHk7krNotqZVfg2u/jBnfSWcbUI=;
	b=YCEJSSugYHGDL7gZ7ePk97MPkGqa7f8Lw7WtHGVaBwPTSBTAAekwjOrW4J+HqIkf4/
	lHY3mAT9jxMrCdSjP8eXohg9p6+RaHM2UUpRTTznUA8w+2E7UXyxAq/IxukDgNnHIAf7
	RUKYGM87oBixQwzbkuTo2RnA5WXrRCiYaGko7+GMCty1XCa1neqXxRHP0kicE9FQeIG0
	W68yhNhhWY8WQ+5Owe7rO8tBtsyuD6wrW9hQCki3K5QU6iaQRLc2W2sYHln6rzxpyeD1
	2+lp/yTIzRX5XS61NcCa76nSz/KQ/kI+0Ek+/NIg9f26B1P64TgI73K2VEMo+23OLi1X
	xxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KSwQ6K0Wcg6HL8nscHk7krNotqZVfg2u/jBnfSWcbUI=;
	b=fhtCTHI6eIztxZbK/FSUm0qu1hppfZGXE1xmqvtZUZEY9h9cox5UwpjXrrdHkGiqcs
	ZLoDyLvnl7QSXK4OKpeBVFX15IxhHzdOaYxfgg1RMYyg9Ae+lSChbgqTCHjv3i0tawa+
	vbYD/sInbTU9v5bb7LC/NBbwtoMeNcuxeFq6m+H/2+sHjKq+1NjUrUc9WSuRDr1Vl+dN
	1sI3ZzfIVpLI3WS0U+JMTF87dHWb+GpGX/KvAgZ5eAI3TtbW3N7U3uKpcklNXochmsur
	vNUNk75yaQ/SdXQi6C8dJExBPtEOMlLA3tILNxXswxEtVJhDA84SemgONMVhLAZTgmFV
	hIlQ==
X-Gm-Message-State: APjAAAV/IYUXWaDc07ETUOHIwzsn3uWgRfK+kepdv+u9NDATTGfHoGVh
	LWcLj9/avtWqH5//B+WFuL+YpIDnfQ4=
X-Google-Smtp-Source: APXvYqxlsA6N362QUQ4bXXjGAqyAIvypcZHPvkwk/HRK4XlZaMgzbSQLDP7qXtjIR3oKaE5h6gl+Wg==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr5312230wmb.47.1554416219696; 
	Thu, 04 Apr 2019 15:16:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:42 +0100
Message-Id: <20190404221644.20496-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 7/9] xmlto: remove XML catalog
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:59 -0000

Now that docbook-xml and docbook-xsl use the xmlcatalog class, xmlto can stop
shipping a hand-coded catalogue.

It still needs to keep the wrapper so that the sysroot catalog is used instead
of /etc/xml/catalog.  The wrapper is native-specific so mark it as such.

Note that this does effectively break xmlto on the target as the xmlcatalog
class doesn't write a catalog for the target yet, but I'm hoping that nobody
actually uses it on target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/xmlto/files/catalog.xml | 19 -------------------
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  7 ++-----
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-devtools/xmlto/files/catalog.xml

diff --git a/meta/recipes-devtools/xmlto/files/catalog.xml b/meta/recipes-devtools/xmlto/files/catalog.xml
deleted file mode 100644
index 6b8833d871b..00000000000
--- a/meta/recipes-devtools/xmlto/files/catalog.xml
+++ /dev/null
@@ -1,19 +0,0 @@
-<?xml version="1.0"?>
-<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-<delegateSystem systemIdStartString="http://docbook.org/xml/" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//OASIS//DTD XML Exchange Table Model 19990315" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//Norman Walsh//DTD CALS Table Model XML" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//Norman Walsh//ELEMENTS DocBk XML" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBook XML" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBk XML" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBk XML" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//Normal Walsh//Exchange Table Model 19960430" catalog="./docbook-xml.xml"/>
-<delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/" catalog="./docbook-xml.xml"/>
-<delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model" catalog="./docbook-xml.xml"/>
-<delegateURI uriStartString="http://docbook.sourceforge.net/release/xsl/" catalog="./docbook-xsl.xml"/>
-<delegateSystem systemIdStartString="http://docbook.sourceforge.net/release/xsl/" catalog="./docbook-xsl.xml"/>
-</catalog>
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 6216d7782be..06dc002083d 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
            file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
-           file://catalog.xml \
 "
 SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
@@ -32,10 +31,8 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF_append = " BASH=/bin/bash GCP=/bin/cp XMLLINT=xmllint XSLTPROC=xsltproc"
 
-do_install_append() {
-    install -d ${D}${sysconfdir}/xml/
-    install -m 755  ${WORKDIR}/catalog.xml ${D}${sysconfdir}/xml/catalog.xml
-    create_wrapper ${D}/${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog.xml
+do_install_append_class-native() {
+    create_wrapper ${D}${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
 
 do_populate_sysroot[rdeptask] = "do_populate_sysroot"
-- 
2.11.0


