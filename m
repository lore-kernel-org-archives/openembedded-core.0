Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 86A2F7D3C3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o25so8230110wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KSwQ6K0Wcg6HL8nscHk7krNotqZVfg2u/jBnfSWcbUI=;
	b=WYggJtXBy7Av2TcKRKo3VQSUbCxG9X/TNjNbz74eIwYynI9oh7msWYlVjJW/kFp/Wt
	PCGLOe3sHV3aMkKtTnEL3Bn8c0wfYCI7dat29RHdzt2Ui3mArqMJFgV9jDQweeHVP+RR
	Mwe2PzICtgha0lpG1rksaXF52jX5nhVeJawE0Y1GMHCMm5hvH45hjMxFhqKAhlYnXZsS
	CvIDJbDFnYU0zS77+R9O87psIFMqATl9yUThusZ/pauC3ehXWYQ3o2YrK/Ni5LZG/2Cm
	IUNDXl/Kr9Zo33JgW+gCGbpNFpjVkD0xn8WXh+GQDQEYX/rMT92lehNsgQdmKsKtt+l/
	IqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KSwQ6K0Wcg6HL8nscHk7krNotqZVfg2u/jBnfSWcbUI=;
	b=BWoToX2/767OkDSuXzUxf779v+ErI1w3uPtRDXv5NHNn6Te2huNUnq2ROcJMi/it1W
	Wk+dU7pKE80dRtxk/PVFpfURzeRDLTbK5j04q14EpldJ+KbLPBgI83ESblHzMBj+Te4g
	Tc85p1tGvY0JDsH0AJGxlFxLy2msB1akWSTG5eD5gLFBJVXyqPWtACpYKc/rasaTu0D9
	4O1DHAy3D9jP8jiDNnZy7YVAM/66RkfMLAW8BKqcNkhpV8GlQhkXwnp/wyM2JwJ2PNDk
	bm7c7l03EChoCVRHxckBw2KVIROPoqSca7hJQfeWKxRCr/R3+w3DFXU9CbPfjfzJSfk3
	YhpQ==
X-Gm-Message-State: APjAAAVYrYerXjTKos7Xn8nnkitV9tDEOsR1FaKSzc+9Z4Imh6mkpTHy
	2/J0Cm9vBnJj1Br4KJquwQVPbslFkZg=
X-Google-Smtp-Source: APXvYqziJGODeW31kJLj2By794r47gwRHEs49X082hgJ9nWQPl6Ug7tZhYsf4byzRhlTRE529dCPWA==
X-Received: by 2002:a1c:1a4d:: with SMTP id a74mr825934wma.50.1554311062978;
	Wed, 03 Apr 2019 10:04:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:10 +0100
Message-Id: <20190403170412.23568-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 7/9] xmlto: remove XML catalog
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:22 -0000

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


