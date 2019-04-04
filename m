Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 804D67D4D7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p10so5700600wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FbFPAX3eyAw5RY0LRET3sg05QG8np52IS8v6mfofu1U=;
	b=ZKCBD5PS2oUGqDuzKQzCd48TJV2bsbaXOcHsxg2P9mIgZQvV4tVnAYVB0l7KDvgst+
	3twI+fpU+vj49Vre+54Zq4F9eHa8w/kxi/IzQE5YTA9QAtVDN2rGVuJNFoIAwN4uO8u9
	Nk9Q/2MciMix3piygJRThzfwzRkgmzFXdUMcBdim5AIR746vJF9JSP8/HVc76l7+c2m/
	lJYAV8tcFLlhd9x5LzwKnWQj5dJw8/3LwrpTpWFJQSWYuIRZ6OlnTxtlYLkpyWUmFFmi
	rGLaxBgEDeEq81tNoXCm84ir5N6ICkWUHbfGYcEw4NHgmHjZQNEkgPDQW3SunpZichcD
	F88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FbFPAX3eyAw5RY0LRET3sg05QG8np52IS8v6mfofu1U=;
	b=X9maZqeCAF618/ldYXyzWvYQQoq+dLrtaH5zEaqCsnxzg0uRuFFWcY5wJVY3movaUM
	oT4VGwMZ3L9noqmzxP/yQlMVpAF79bUiDbLAyaWS7/f7d4Gkm5k7UMvPcWew3/qpRCEC
	MpAhJN0i80G8nzjYWP28I0gbJ8t+16OveqayGcXlYeYM7s+WuqjC1Af8kceutpqf5/3h
	XMBmxEaErhCN0wtfOdltKr6FBMXTZeCnMFbWjyNupZDNrovW/pbajoC/ArN84co05dXv
	7u1bap/0uPvBU1k+5fATaDnROR7NVZWgtt9DBpZWuB/TdAjPIBLDoqQDz+z/kNJUZVhP
	YsDA==
X-Gm-Message-State: APjAAAWoUiuYNzqxiTq15yPmLArYqKffoauATYsiIVzs7K7/bO3wi2IY
	wUaBClk8D+vjKuYQ/Cj3LktSYQ/059s=
X-Google-Smtp-Source: APXvYqzo5G2PkT0URUP/hpTRdAvo9tdzE/xMwnbPiHO6FPidp6P6rvX+d+4dGsLQPlVAWzLvrCIwzA==
X-Received: by 2002:a5d:4f11:: with SMTP id c17mr6009585wru.34.1554416213967; 
	Thu, 04 Apr 2019 15:16:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:37 +0100
Message-Id: <20190404221644.20496-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 2/9] docbook-xml: use xmlcatalog class
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:53 -0000

Instead of shipping a static catalog and patching it for native builds, use
libxml2-native to generate a catalog with the correct paths.

Use the xmlcatalog class to register this catalog automatically.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../docbook-xml/docbook-xml-dtd4/docbook-xml.xml   | 68 ----------------------
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            | 25 ++++----
 2 files changed, 12 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
deleted file mode 100644
index b71f559ef53..00000000000
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
+++ /dev/null
@@ -1,68 +0,0 @@
-<?xml version="1.0"?>
-<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//ELEMENTS DocBook XML Information Pool V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.1//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBook XML Notations V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//DTD CALS Table Model XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBook XML Character Entities V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//ELEMENTS DocBook XML Document Hierarchy V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Normal Walsh//Exchange Table Model 19960430 XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://docbook.org/xml/4.4/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://docbook.org/xml/4.1/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBk XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBook XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://docbook.org/xml/4.1.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://docbook.org/xml/4.5/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBook XML Additional General Entities V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://docbook.org/xml/4.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD XML Exchange Table Model 19990315//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.4/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://docbook.org/xml/4.3/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
-  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.1/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
-</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index da62b77a602..4b6a28e34c3 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -8,13 +8,14 @@ HOMEPAGE = "http://www.docbook.org/xml/"
 LICENSE = "OASIS"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 
+DEPENDS = "libxml2-native"
+
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
 # upgrading this recipe, please verify whether this is still needed.
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
            file://LICENSE-OASIS \
            file://docbook-xml-update-catalog.xml.patch \
-           file://docbook-xml.xml \
 "
 
 SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
@@ -22,7 +23,7 @@ SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
 
-S="${WORKDIR}/docbook-xml-4.5.c31424"
+S = "${WORKDIR}/docbook-xml-4.5.c31424"
 
 inherit allarch
 BBCLASSEXTEND = "native"
@@ -36,20 +37,18 @@ do_compile (){
 }
 
 do_install () {
-    # Refer debian https://packages.debian.org/sid/all/docbook-xml/filelist
+    install -d ${D}${sysconfdir}/xml/
+    xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
+
     for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
-        install -d -m 755 ${D}${datadir}/xml/docbook/schema/dtd/${DTDVERSION}
-        cp -v -R docbook-${DTDVERSION}/* ${D}${datadir}/xml/docbook/schema/dtd/${DTDVERSION}
+        DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
+        install -d -m 755 ${D}$DEST
+        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
+        xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
     done
-
-    install -d ${D}${sysconfdir}/xml/
-    install -m 755  ${WORKDIR}/docbook-xml.xml ${D}${sysconfdir}/xml/docbook-xml.xml
 }
 
-do_install_append_class-native () {
-	# Ensure that the catalog file sgml-docbook.cat is properly
-	# updated when the package is installed from sstate cache.
-	sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${D}${sysconfdir}/xml/docbook-xml.xml
-}
+XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
+inherit xmlcatalog
 
 FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
-- 
2.11.0


