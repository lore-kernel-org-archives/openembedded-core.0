Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1957670410
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 10:17:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s69AHHat024534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jul 2014 03:17:17 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 9 Jul 2014 03:17:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jul 2014 18:16:56 +0800
Message-ID: <bc3d46d83bf41a4600171e631deb0412d8f18089.1404885647.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404885647.git.hongxu.jia@windriver.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/8] docbook-xml: add docbook-xml-dtd4
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
X-List-Received-Date: Wed, 09 Jul 2014 10:17:18 -0000
Content-Type: text/plain

Refer debian, it shipped the latest DocBook 4.5 XML DTD, as well as
a selected set of legacy DTDs for use with older documents, including
4.0, 4.1.2, 4.2, 4.3 and 4.4.

About the config files (docbook-xml.xml and the update patch), we
refered what Ubuntu 13.04 did, so the xmlto could correctly search
among multible DTDs.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../docbook-xml/docbook-xml-dtd4/LICENSE-OASIS     |  16 +
 .../docbook-xml-update-catalog.xml.patch           | 515 +++++++++++++++++++++
 .../docbook-xml/docbook-xml-dtd4/docbook-xml.xml   |  68 +++
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |  64 +++
 4 files changed, 663 insertions(+)
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
new file mode 100644
index 0000000..6da7f5b
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
@@ -0,0 +1,16 @@
+Permission to use, copy, modify and distribute the DocBook XML DTD
+and its accompanying documentation for any purpose and without fee
+is hereby granted in perpetuity, provided that the above copyright
+notice and this paragraph appear in all copies.  The copyright
+holders make no representation about the suitability of the DTD for
+any purpose.  It is provided "as is" without expressed or implied
+warranty.
+
+If you modify the DocBook DTD in any way, except for declaring and
+referencing additional sets of general entities and declaring
+additional notations, label your DTD as a variant of DocBook.  See
+the maintenance documentation for more information.
+
+Please direct all questions, bug reports, or suggestions for 
+changes to the docbook@lists.oasis-open.org mailing list. For more
+information, see http://www.oasis-open.org/docbook/.
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
new file mode 100644
index 0000000..5970360
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
@@ -0,0 +1,515 @@
+docbook-xml: update catalog.xml
+
+Refer Ubuntu 13.04 to update catalog.xml
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ docbook-4.0/catalog.xml   | 72 +++++++++++++++++++++++++++++++++++++++++++++++
+ docbook-4.1.2/catalog.xml | 66 +++++++++++++++++++++++++++++++++++++++++++
+ docbook-4.2/catalog.xml   | 69 ++++++---------------------------------------
+ docbook-4.3/catalog.xml   | 72 ++++++++---------------------------------------
+ docbook-4.4/catalog.xml   | 63 ++---------------------------------------
+ docbook-4.5/catalog.xml   | 63 ++---------------------------------------
+ 6 files changed, 165 insertions(+), 240 deletions(-)
+ create mode 100644 docbook-4.0/catalog.xml
+ create mode 100644 docbook-4.1.2/catalog.xml
+
+diff --git a/docbook-4.0/catalog.xml b/docbook-4.0/catalog.xml
+new file mode 100644
+--- /dev/null
++++ b/docbook-4.0/catalog.xml
+@@ -0,0 +1,72 @@
++<?xml version='1.0'?>
++<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" 
++    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
++
++<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
++
++<!-- ...................................................................... -->
++<!-- XML Catalog data for DocBook XML V4.0............................... -->
++<!-- File catalog.xml ..................................................... -->
++
++<!-- Please direct all questions, bug reports, or suggestions for
++     changes to the docbook@lists.oasis-open.org mailing list. For more
++     information, see http://www.oasis-open.org/.
++  -->
++
++<!-- This is the catalog data file for DocBook V4.0. It is provided as
++     a convenience in building your own catalog files. You need not use
++     the filenames listed here, and need not use the filename method of
++     identifying storage objects at all.  See the documentation for
++     detailed information on the files associated with the DocBook DTD.
++     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
++     detailed information on supplying and using catalog data.
++  -->
++
++<!-- ...................................................................... -->
++<!-- DocBook driver file .................................................. -->
++
++<public publicId="-//Norman Walsh//DTD DocBk XML V4.0//EN"
++        uri="docbookx.dtd"/>
++
++<!-- Other ways to refer to DocBook XML v4.0............................... -->
++<public publicId="-//Norman Walsh//DTD DocBook XML V4.0//EN"
++        uri="docbookx.dtd"/>
++
++<system systemId="http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
++<!-- ...................................................................... -->
++<!-- DocBook modules ...................................................... -->
++
++<public publicId="-//Norman Walsh//ENTITIES DocBook XML Notations V4.0//EN"
++        uri="dbnotnx.mod"/>
++
++<public publicId="-//Norman Walsh//ENTITIES DocBook XML Character Entities V4.0//EN"
++        uri="dbcentx.mod"/>
++
++<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Information Pool V4.0//EN"
++        uri="dbpoolx.mod"/>
++
++<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Document Hierarchy V4.0//EN"
++        uri="dbhierx.mod"/>
++
++<public publicId="-//Norman Walsh//ENTITIES DocBook XML Additional General Entities V4.0//EN"
++        uri="dbgenent.mod"/>
++
++<public publicId="-//Norman Walsh//DTD CALS Table Model XML V4.0//EN"
++        uri="calstblx.dtd"/>
++
++<!-- UNOFFICIAL conversion of the exchange table model to XML, based on the OASIS Exchange -->
++<!--    Table Model PUBLIC "-//SGML Open//DTD Exchange Table Model 19960430//EN"           -->
++<public publicId="-//Normal Walsh//Exchange Table Model 19960430 XML V4.0//EN"
++        uri="soextblx.dtd"/>
++
++<!-- the following FPI is declared for the DTD inside the DTD, but we'll -->
++<!-- use the version from the latest DocBook
++<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
++        uri="soextblx.dtd"/> -->
++
++<!-- End of catalog data for DocBook XML V4.0 ............................. -->
++<!-- ...................................................................... -->
++
++</catalog>
+diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.xml
+new file mode 100644
+--- /dev/null
++++ b/docbook-4.1.2/catalog.xml
+@@ -0,0 +1,66 @@
++<?xml version='1.0'?>
++<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" 
++    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
++
++<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
++
++<!-- ...................................................................... -->
++<!-- XML Catalog data for DocBook XML V4.1.2............................... -->
++<!-- File catalog.xml ..................................................... -->
++
++<!-- Please direct all questions, bug reports, or suggestions for
++     changes to the docbook@lists.oasis-open.org mailing list. For more
++     information, see http://www.oasis-open.org/.
++  -->
++
++<!-- This is the catalog data file for DocBook V4.1.2. It is provided as
++     a convenience in building your own catalog files. You need not use
++     the filenames listed here, and need not use the filename method of
++     identifying storage objects at all.  See the documentation for
++     detailed information on the files associated with the DocBook DTD.
++     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
++     detailed information on supplying and using catalog data.
++  -->
++
++<!-- ...................................................................... -->
++<!-- DocBook driver file .................................................. -->
++
++<public publicId="-//OASIS//DTD DocBook XML V4.1.2//EN"
++        uri="docbookx.dtd"/>
++
++<system systemId="http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
++<system systemId="http://docbook.org/xml/4.1.2/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
++<!-- ...................................................................... -->
++<!-- DocBook modules ...................................................... -->
++
++<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN"
++        uri="calstblx.dtd"/>
++
++  <!-- already included in docbook 4.2
++<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
++        uri="soextblx.dtd"/> -->
++
++<public publicId="-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN"
++        uri="dbpoolx.mod"/>
++
++<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.1.2//EN"
++        uri="dbhierx.mod"/>
++
++<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.1.2//EN"
++        uri="dbgenent.mod"/>
++
++<public publicId="-//OASIS//ENTITIES DocBook Notations V4.1.2//EN"
++        uri="dbnotnx.mod"/>
++
++<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.1.2//EN"
++        uri="dbcentx.mod"/>
++
++
++<!-- End of catalog data for DocBook XML V4.1.2 ............................. -->
++<!-- ...................................................................... -->
++
++</catalog>
+diff --git a/docbook-4.2/catalog.xml b/docbook-4.2/catalog.xml
+--- a/docbook-4.2/catalog.xml
++++ b/docbook-4.2/catalog.xml
+@@ -1,4 +1,7 @@
+ <?xml version='1.0'?>
++<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
++    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
++
+ <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+ 
+ <!-- ...................................................................... -->
+@@ -25,6 +28,12 @@
+ <public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
+         uri="docbookx.dtd"/>
+ 
++<system systemId="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
++<system systemId="http://docbook.org/xml/4.2/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
+ <!-- ...................................................................... -->
+ <!-- DocBook modules ...................................................... -->
+ 
+@@ -49,66 +58,6 @@
+ <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN"
+         uri="dbcentx.mod"/>
+ 
+-<!-- ...................................................................... -->
+-<!-- ISO entity sets ...................................................... -->
+-
+-<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+-        uri="ent/iso-dia.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+-        uri="ent/iso-num.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+-        uri="ent/iso-pub.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+-        uri="ent/iso-tech.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+-        uri="ent/iso-lat1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+-        uri="ent/iso-lat2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+-        uri="ent/iso-grk1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+-        uri="ent/iso-grk2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+-        uri="ent/iso-grk3.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+-        uri="ent/iso-grk4.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+-        uri="ent/iso-amsa.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+-        uri="ent/iso-amsb.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+-        uri="ent/iso-amsc.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+-        uri="ent/iso-amsn.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+-        uri="ent/iso-amso.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+-        uri="ent/iso-amsr.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+-        uri="ent/iso-box.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+-        uri="ent/iso-cyr1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+-        uri="ent/iso-cyr2.ent"/>
+-
+ <!-- End of catalog data for DocBook XML V4.2 ............................. -->
+ <!-- ...................................................................... -->
+ 
+diff --git a/docbook-4.3/catalog.xml b/docbook-4.3/catalog.xml
+--- a/docbook-4.3/catalog.xml
++++ b/docbook-4.3/catalog.xml
+@@ -1,4 +1,7 @@
+ <?xml version='1.0'?>
++<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
++    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
++
+ <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+ 
+ <!-- ...................................................................... -->
+@@ -25,12 +28,21 @@
+ <public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
+         uri="docbookx.dtd"/>
+ 
++<system systemId="http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
++<system systemId="http://docbook.org/xml/4.3/docbookx.dtd"
++        uri="docbookx.dtd"/>
++
+ <!-- ...................................................................... -->
+ <!-- DocBook modules ...................................................... -->
+ 
+ <public publicId="-//OASIS//DTD DocBook CALS Table Model V4.3//EN"
+         uri="calstblx.dtd"/>
+ 
++<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN"
++        uri="htmltblx.mod"/>
++
+ <public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+         uri="soextblx.dtd"/>
+ 
+@@ -49,66 +61,6 @@
+ <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN"
+         uri="dbcentx.mod"/>
+ 
+-<!-- ...................................................................... -->
+-<!-- ISO entity sets ...................................................... -->
+-
+-<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+-        uri="ent/iso-dia.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+-        uri="ent/iso-num.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+-        uri="ent/iso-pub.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+-        uri="ent/iso-tech.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+-        uri="ent/iso-lat1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+-        uri="ent/iso-lat2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+-        uri="ent/iso-grk1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+-        uri="ent/iso-grk2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+-        uri="ent/iso-grk3.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+-        uri="ent/iso-grk4.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+-        uri="ent/iso-amsa.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+-        uri="ent/iso-amsb.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+-        uri="ent/iso-amsc.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+-        uri="ent/iso-amsn.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+-        uri="ent/iso-amso.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+-        uri="ent/iso-amsr.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+-        uri="ent/iso-box.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+-        uri="ent/iso-cyr1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+-        uri="ent/iso-cyr2.ent"/>
+-
+ <!-- End of catalog data for DocBook XML V4.3 ............................. -->
+ <!-- ...................................................................... -->
+ 
+diff --git a/docbook-4.4/catalog.xml b/docbook-4.4/catalog.xml
+--- a/docbook-4.4/catalog.xml
++++ b/docbook-4.4/catalog.xml
+@@ -1,4 +1,7 @@
+ <?xml version='1.0'?>
++<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
++    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
++
+ <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public">
+ 
+ <!-- ...................................................................... -->
+@@ -58,66 +61,6 @@
+ <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN"
+         uri="dbcentx.mod"/>
+ 
+-<!-- ...................................................................... -->
+-<!-- ISO entity sets ...................................................... -->
+-
+-<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+-        uri="ent/isodia.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+-        uri="ent/isonum.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+-        uri="ent/isopub.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+-        uri="ent/isotech.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+-        uri="ent/isolat1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+-        uri="ent/isolat2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+-        uri="ent/isogrk1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+-        uri="ent/isogrk2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+-        uri="ent/isogrk3.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+-        uri="ent/isogrk4.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+-        uri="ent/isoamsa.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+-        uri="ent/isoamsb.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+-        uri="ent/isoamsc.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+-        uri="ent/isoamsn.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+-        uri="ent/isoamso.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+-        uri="ent/isoamsr.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+-        uri="ent/isobox.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+-        uri="ent/isocyr1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+-        uri="ent/isocyr2.ent"/>
+-
+ <!-- End of catalog data for DocBook XML V4.4 ............................. -->
+ <!-- ...................................................................... -->
+ 
+diff --git a/docbook-4.5/catalog.xml b/docbook-4.5/catalog.xml
+--- a/docbook-4.5/catalog.xml
++++ b/docbook-4.5/catalog.xml
+@@ -1,4 +1,7 @@
+ <?xml version='1.0'?>
++<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
++    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
++
+ <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public">
+ 
+ <!-- ...................................................................... -->
+@@ -58,66 +61,6 @@
+ <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN"
+         uri="dbcentx.mod"/>
+ 
+-<!-- ...................................................................... -->
+-<!-- ISO entity sets ...................................................... -->
+-
+-<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+-        uri="ent/isodia.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+-        uri="ent/isonum.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+-        uri="ent/isopub.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+-        uri="ent/isotech.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+-        uri="ent/isolat1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+-        uri="ent/isolat2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+-        uri="ent/isogrk1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+-        uri="ent/isogrk2.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+-        uri="ent/isogrk3.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+-        uri="ent/isogrk4.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+-        uri="ent/isoamsa.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+-        uri="ent/isoamsb.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+-        uri="ent/isoamsc.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+-        uri="ent/isoamsn.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+-        uri="ent/isoamso.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+-        uri="ent/isoamsr.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+-        uri="ent/isobox.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+-        uri="ent/isocyr1.ent"/>
+-
+-<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+-        uri="ent/isocyr2.ent"/>
+-
+ <!-- End of catalog data for DocBook XML V4.5 ............................. -->
+ <!-- ...................................................................... -->
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
new file mode 100644
index 0000000..b71f559
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
@@ -0,0 +1,68 @@
+<?xml version="1.0"?>
+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//ELEMENTS DocBook XML Information Pool V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.1//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBook XML Notations V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//DTD CALS Table Model XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBook XML Character Entities V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//ELEMENTS DocBook XML Document Hierarchy V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Normal Walsh//Exchange Table Model 19960430 XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://docbook.org/xml/4.4/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://docbook.org/xml/4.1/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBk XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBook XML V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://docbook.org/xml/4.1.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://docbook.org/xml/4.5/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Notations V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBook XML Additional General Entities V4.0//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.0/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://docbook.org/xml/4.2/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD XML Exchange Table Model 19990315//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.4/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.4/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Additional General Entities V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML V4.3//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://docbook.org/xml/4.3/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/4.3/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Information Pool V4.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model V4.5//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.5/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook Character Entities V4.1.2//EN" catalog="file:///usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml"/>
+  <delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/4.1/docbookx.dtd" catalog="file:///usr/share/xml/docbook/schema/dtd/catalog.xml"/>
+</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
new file mode 100644
index 0000000..de1bc39
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -0,0 +1,64 @@
+SUMMARY = "Document type definitions for verification of XML data files"
+DESCRIPTION = "Document type definitions for verification of XML data \
+files against the DocBook rule set, it ships with the latest DocBook 4.5 \
+XML DTD, as well as a selected set of legacy DTDs for use with older \
+documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
+HOMEPAGE = "http://www.docbook.org/xml/"
+
+LICENSE = "OASIS"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
+
+# Note: the upstream sources are not distributed with a license file.
+# LICENSE-OASIS is included as a "patch" to workaround this. When
+# upgrading this recipe, please verify whether this is still needed.
+SRC_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
+           file://LICENSE-OASIS \
+           file://docbook-xml-update-catalog.xml.patch \
+           file://docbook-xml.xml \
+"
+
+SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
+SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
+
+S="${WORKDIR}/docbook-xml-4.5.c31424"
+
+inherit allarch
+BBCLASSEXTEND = "native"
+
+SSTATEPOSTINSTFUNCS_append_class-native = " docbook_xml_dtd_sstate_postinst"
+SYSROOT_PREPROCESS_FUNCS_append_class-native = " docbook_xml_dtd_sysroot_preprocess"
+
+do_configre (){
+    :
+}
+
+do_compile (){
+    :
+}
+
+do_install () {
+    # Refer debian https://packages.debian.org/sid/all/docbook-xml/filelist
+    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
+        install -d -m 755 ${D}${datadir}/xml/docbook/schema/dtd/${DTDVERSION}
+        cp -v -R docbook-${DTDVERSION}/* ${D}${datadir}/xml/docbook/schema/dtd/${DTDVERSION}
+    done
+
+    install -d ${D}${sysconfdir}/xml/
+    install -m 755  ${WORKDIR}/docbook-xml.xml ${D}${sysconfdir}/xml/docbook-xml.xml
+}
+
+docbook_xml_dtd_sstate_postinst () {
+    if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+    then
+        # Ensure that the catalog file sgml-docbook.cat is properly
+        # updated when the package is installed from sstate cache.
+        sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xml.xml
+    fi
+}
+
+docbook_xml_dtd_sysroot_preprocess () {
+    # Update the hardcode dir in docbook-xml.xml
+    sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xml.xml
+}
+
+FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
-- 
1.8.1.2


