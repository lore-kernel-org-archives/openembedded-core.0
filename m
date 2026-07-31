Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6858C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:56:52 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.701.1785477409296444506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S2NJLV27;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2842; q=dns/txt;
  s=iport01; t=1785477409; x=1786687009;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZQ/egb9yfIPDnJpvnwrRkXl/MJYeY8f8e9n3c+ypiWU=;
  b=S2NJLV27hYfC/mMJSox3qCWHtOKl4ZVh8UrSpMFTbrj/IzNnLXsi1RBo
   J1ShgiKbrJ1aEPYzjMl42Xisxlh3V+KIDLs7ffjF4PqehPgRmWASBoOnl
   gJNW19Y9FnnlpE87frODKEaNPkzWtFESMCLahZ9YukyvKmHDmuquv8kJu
   CyOaBOdi4eJE9oGNq/Ily4VLZFQCsh088Da1YzNV8j/yCAiRYrZeGqZxW
   0c0D1dcHRXNv1IoF+/4HM650RO0S7RR69si+T2078OSQGmJ3I9LX3JWRH
   Aaf7ToP0Gcc47OKZQtwYkQ4dg6kImXFEQtURLhAGlNyWao9Vak/5qDoVX
   A==;
X-CSE-ConnectionGUID: 8LvcWF09S2CrS6FRymH5zg==
X-CSE-MsgGUID: UYSvGGYAS4ivo07DqUViLA==
X-IPAS-Result: =?us-ascii?q?A0BIAgD1N2xq/5T/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeGxSBag8BAQEPRA0EAQGEP0YCjWYCJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBPRwDAQIvKyMIEQiDAgGCdAMRu?=
 =?us-ascii?q?jAaN4IsgQGDKAE/AkNQ2y4BCxQBgTiFP4ggXBgBhHwnGxuBcoEVg2mBBYFcA?=
 =?us-ascii?q?QGBRmeFeASCIoEMgVoehCuMEkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsHBYEdgSsvhFMjGTZ8gS91SnUtahIXgRqDMQKCXwMLGA1IESw3FBkEP?=
 =?us-ascii?q?m4HjWkggj8xDC0kASuBQ6ZcoRIKKIN1jCGVOhozqmwLmH2OCpZQhGmBaDyBK?=
 =?us-ascii?q?AEaBAsHcBWCbgEzCUoZD444g2uBf8xDPDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:u3PVfq8AEGlxISoeCes1DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jQeW23SPaqMZzejLd8nPY63ox4Fv5KDnIA3QQM+qSBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTlMs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lmGZMTxcgvUFoU3
 uYjdh43fxWj2vC5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP00n1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOLJIbVGpkF9qqej
 l/3xHrWLSAzD4Ce1z3drV61u9HOuQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:ifdhmK/it/D5l3ZI7WNuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:mUscrWOiwPeNju5DCA15/3E6QpEeKFbH9yn+GV69KTt7R+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AehMtRA4rBfuLLvsMH0o4wM+TxoxV0p+wJ288uK5?=
 =?us-ascii?q?auteDbXNcIgqjjRCeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="516627748"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:56:48 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 2908418000140
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:48 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 414F3CC037D; Fri, 31 Jul 2026 11:26:46 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 02/10] expat: fix CVE-2026-56408
Date: Fri, 31 Jul 2026 11:26:17 +0530
Message-Id: <20260731055625.4187716-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242399

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].
The fix is adapted to the existing Scarthgap Expat 2.6.4 source.

[1] https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56408

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- Removed the stale Backport Changes section because the effective hunk
  lines match the referenced upstream commit.

 .../expat/expat/CVE-2026-56408.patch          | 29 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
new file mode 100644
index 0000000000..8e066565ba
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
@@ -0,0 +1,29 @@
+From c1ad5610cf060c6374d8f8d3b39163edd7053321 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 23 Apr 2026 10:31:45 +0200
+Subject: [PATCH 03/17] lib: Waterproof `copyString` from integer overflow
+
+CVE: CVE-2026-56408
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
+
+(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index df92a3ca..12bbe23e 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -8489,6 +8489,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
+   /* Include the terminator */
+   charsRequired++;
+ 
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   /* Now allocate space for the copy */
+   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index de03bab4ab..7fe8174909 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -63,6 +63,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-45186-07.patch \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
+           file://CVE-2026-56408.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


