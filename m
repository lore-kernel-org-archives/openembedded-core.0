Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D182CC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 10:36:14 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4112.1787135768241608248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 03:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lVLnds+E;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5781; q=dns/txt;
  s=iport01; t=1787135768; x=1788345368;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4oe1bUY908iufvPLQ58B7ATeFBcvPGiJhKhS+dzubOo=;
  b=lVLnds+EJBlc6QFq5UQLEtfEo2y1OL1wnVskhIaQRCDqyef0X1tE+8sL
   qZMUy3eEXp3WZqnDvqK1u4K+K38DfAXYszJK6aTyuJgiHT8REEu9MIAtW
   QofmUlgjN51x+DIOSIEKAfSRIb0p+cO8IY7ydx2Kv7ZFuIkbnfkUX/eed
   xUMnYVWj320ir4zkFbjV9QiMlDi7p9U1ff9RtO7yLNT7/Pvsd4R0jZALa
   ZZ0MxK/STZMuJS4ILxtApw+x+2ikbv79hWn5/1nGsC9U8hopuCPZIziZv
   +1rjVtwcWHsN2NruGR6LFfO2zfEjzNR8MF8vW+1Q/Fw1yb2D61cqHLu/7
   g==;
X-CSE-ConnectionGUID: UqidMZGESceQhBpVQv5H5g==
X-CSE-MsgGUID: ViXNeYmNS8ez5u0B+4Q13Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgDVhYVq/4wQJK1aHgEBCxIMggULgld0XkNJA5ZHg?=
 =?us-ascii?q?RadCIF+DwEBAQ9EDQQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECATUBGAEtLAMBAlojIYMCAYJ0AxHDVYIsgQGDK?=
 =?us-ascii?q?AGBVNswAQsUAYE4hT+IIl0YAYR8JxsbgXKBFYJzdoEFgVwCgSeGfgSCIoEMg?=
 =?us-ascii?q?VoekUdIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjG?=
 =?us-ascii?q?TZ6gQlegSsqYQESF4EJggoCgnOCBgIBSUURCgsLGA1IESw3FBkEPm4Hjkkgg?=
 =?us-ascii?q?kdZNQEpAoIsEaVloQ8KKIN2jCGVOhozqmwLmH2OCpZQhGmBaDyBWXAVgyIJS?=
 =?us-ascii?q?hkPjjiDa8w5JzICCQMvAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:yuSRXKreyMoKyvmizBmA+wVlYQdeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnQO/neZmD0co13aorjp08D75XWn9FhTlY4ry4xRCMSouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8UI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ttuAG1rx
 9M1EzsAVxCpn9yP3u+bF+Y506zPLOGzVG8eknhkyTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtPYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUozTGpQOxBjD9
 goq+UzHAyE8Oe2a7wHV/2Dxm7fl3n/CAdkrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:FRak56wuyxBew1vddGk1KrPwGr1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: =?us-ascii?q?9a23=3AD+pR32vj++ltI4sbntSuHLzu6IsYa3zR6UX/DnS?=
 =?us-ascii?q?zBF9pYqWrcEHN2P5rxp8=3D?=
X-Talos-MUID: 9a23:90zrEQbZTAx8u+BTiT7cojxTMeFTs6m8VV1Vu9ZagpDfDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="817932638"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 10:36:07 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 2CC5118000418;
	Wed, 19 Aug 2026 10:36:07 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B6FACCCA79B; Wed, 19 Aug 2026 03:36:06 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-lxml: fix CVE-2026-41066
Date: Wed, 19 Aug 2026 03:36:04 -0700
Message-Id: <20260819103604.107840-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 10:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243722

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e9aaf358
[2] https://github.com/lxml/lxml/security/advisories/GHSA-vfmq-68hx-4jfw

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-lxml/CVE-2026-41066.patch  | 87 +++++++++++++++++++
 .../python/python3-lxml_6.0.2.bb              |  4 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch

diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
new file mode 100644
index 0000000000..c619b2b2b5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
@@ -0,0 +1,87 @@
+From 2851ff7d51681201c950554d52697429413835b5 Mon Sep 17 00:00:00 2001
+From: Stefan Behnel <stefan_ml@behnel.de>
+Date: Fri, 10 Apr 2026 10:13:03 +0200
+Subject: [PATCH] LP#2146291: Set "resolve_entities='internal'" as default for
+ all parser subclasses.
+
+CVE: CVE-2026-41066
+Upstream-Status: Backport [https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e9aaf358]
+
+(cherry picked from commit ab431ea0b9a7357d968f1d1c5c614649e9aaf358)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/lxml/iterparse.pxi | 10 ++++++----
+ src/lxml/parser.pxi    |  6 +++---
+ 2 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/src/lxml/iterparse.pxi b/src/lxml/iterparse.pxi
+index 42b75249..9b6ceb00 100644
+--- a/src/lxml/iterparse.pxi
++++ b/src/lxml/iterparse.pxi
+@@ -6,7 +6,8 @@ cdef class iterparse:
+     """iterparse(self, source, events=("end",), tag=None, \
+                   attribute_defaults=False, dtd_validation=False, \
+                   load_dtd=False, no_network=True, remove_blank_text=False, \
+-                  remove_comments=False, remove_pis=False, encoding=None, \
++                  compact=True, resolve_entities='internal', remove_comments=False, \
++                  remove_pis=False, strip_cdata=True, encoding=None, \
+                   html=False, recover=None, huge_tree=False, schema=None)
+ 
+     Incremental parser.
+@@ -42,10 +43,11 @@ cdef class iterparse:
+      - remove_blank_text: discard blank text nodes
+      - remove_comments: discard comments
+      - remove_pis: discard processing instructions
+-     - strip_cdata: replace CDATA sections by normal text content (default: 
++     - strip_cdata: replace CDATA sections by normal text content (default:
+        True for XML, ignored otherwise)
+      - compact: safe memory for short text content (default: True)
+-     - resolve_entities: replace entities by their text value (default: True)
++     - resolve_entities: replace entities by their text value
++       (default: 'internal' only)
+      - huge_tree: disable security restrictions and support very deep trees
+                   and very long text content (only affects libxml2 2.7+)
+      - html: parse input as HTML (default: XML)
+@@ -68,7 +70,7 @@ cdef class iterparse:
+     def __init__(self, source, events=("end",), *, tag=None,
+                  attribute_defaults=False, dtd_validation=False,
+                  load_dtd=False, no_network=True, remove_blank_text=False,
+-                 compact=True, resolve_entities=True, remove_comments=False,
++                 compact=True, resolve_entities='internal', remove_comments=False,
+                  remove_pis=False, strip_cdata=True, encoding=None,
+                  html=False, recover=None, huge_tree=False, collect_ids=True,
+                  XMLSchema schema=None):
+diff --git a/src/lxml/parser.pxi b/src/lxml/parser.pxi
+index 3106e610..ba9875c0 100644
+--- a/src/lxml/parser.pxi
++++ b/src/lxml/parser.pxi
+@@ -1584,7 +1584,7 @@ cdef class XMLParser(_FeedParser):
+     """XMLParser(self, encoding=None, attribute_defaults=False, dtd_validation=False, \
+                  load_dtd=False, no_network=True, decompress=False, ns_clean=False, \
+                  recover=False, schema: XMLSchema =None, huge_tree=False, \
+-                 remove_blank_text=False, resolve_entities=True, \
++                 remove_blank_text=False, resolve_entities='internal', \
+                  remove_comments=False, remove_pis=False, strip_cdata=True, \
+                  collect_ids=True, target=None, compact=True)
+ 
+@@ -1717,7 +1717,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     """ETCompatXMLParser(self, encoding=None, attribute_defaults=False, \
+                  dtd_validation=False, load_dtd=False, no_network=True, decompress=False, \
+                  ns_clean=False, recover=False, schema=None, \
+-                 huge_tree=False, remove_blank_text=False, resolve_entities=True, \
++                 huge_tree=False, remove_blank_text=False, resolve_entities='internal', \
+                  remove_comments=True, remove_pis=True, strip_cdata=True, \
+                  target=None, compact=True)
+ 
+@@ -1731,7 +1731,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     def __init__(self, *, encoding=None, attribute_defaults=False,
+                  dtd_validation=False, load_dtd=False, no_network=True, decompress=False,
+                  ns_clean=False, recover=False, schema=None,
+-                 huge_tree=False, remove_blank_text=False, resolve_entities=True,
++                 huge_tree=False, remove_blank_text=False, resolve_entities='internal',
+                  remove_comments=True, remove_pis=True, strip_cdata=True,
+                  target=None, compact=True):
+         XMLParser.__init__(self,
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
index 876fda93b6..75894460ec 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
@@ -20,7 +20,9 @@ DEPENDS += "libxml2 libxslt"
 
 SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
 
-SRC_URI += "${PYPI_SRC_URI}"
+SRC_URI += "${PYPI_SRC_URI} \
+            file://CVE-2026-41066.patch"
+
 inherit pkgconfig pypi setuptools3
 
 # {standard input}: Assembler messages:
-- 
2.35.6


