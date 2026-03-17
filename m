Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94984FB5EBC
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 04:35:57 +0000 (UTC)
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69066.1773722147857811246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 21:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Vlr+jSLr;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2602; q=dns/txt;
  s=iport01; t=1773722148; x=1774931748;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=reFIYfKqf/cFTxxB/LnFWVyWSS04PxUdDntIW9M8h+I=;
  b=Vlr+jSLr2NV6yTsXus//2eUSp/1On/knt7Oas9vUuqhLI9fi2WWYRSZw
   k++vaZs9OUUwRmXYipRh1qnDktQ4cUtIeeM0VPItSfBaMT2soYltXPx6C
   9smH/KyEee3tqs3eQllx/HBhdX9RLjndl3g5Y6sbbIvOA+oJwLqim/tom
   D71hmZvzo+2puPSFB4XjhHdUBXYQvsg1suYxzulKidWHlnccHyP1AqIQb
   QgmaNHdCSWEqOWjAB6xIyNhAg3+LVfPcMi7mFOHoPiRI2ExrAubwmQ/3E
   gkkniUrqAQUmJT3jnkVHY2p7qqfOn7oGI/bJ0nyB3j8T8qywokTb+T/FL
   w==;
X-CSE-ConnectionGUID: oWEMZLczREG3Ur2gOlDvjg==
X-CSE-MsgGUID: f0WEpXYcQuu5voTR5SB8jg==
X-IPAS-Result: =?us-ascii?q?A0BqCwDi2Lhp/8xK/pBaHgEBCxIMggULgkgPcV9CSZQqg?=
 =?us-ascii?q?iSLZJI2gX8PAQEBD0QNBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBVhwDAQIvIAsjCBEIgwIBg?=
 =?us-ascii?q?joDNgMRsmeBeTOBAYNoAkNP2EcNglIBBQYUAYE4hTyCeYUgWxgBhHonGxuBc?=
 =?us-ascii?q?oEVgTuCLYEFgRpCAQMYghOFdwSCIoEOgWGRI0iBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBCxsHBYQkD4htdG2BE4NcAwsYDUgRLDcUGwQ+bgeNTTyCN?=
 =?us-ascii?q?IEOLKgdoCBxCiiDdIwejz6FfBozqmsLmHuOCYQJkkeEaIFoPIFHCwdwFYMiU?=
 =?us-ascii?q?hkPjjiFaIMUwjg7NQIJMwEHAgcOAoFzkX0BAQ?=
IronPort-Data: A9a23:uradbq+LswdxMQkNCNk7DrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TNLCD+BOq7cY2akKN0kaoi09RwO6MTXzYNkG1NpqSBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsaTtLs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kxAqA9yMJ8E1tj2
 qclMmoCSRSvmeC5lefTpulE3qzPLeHiMZlavjRryivUSK59B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YP3WjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwbIOIJobTFa25mG6W/
 l3r51TICSgHKYGBzga/r0mG1u3AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:WAz+x6/+Xf3MTYmKuiNuk+DZI+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86U
 +lGJIObuEZyjNB/KHH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AIj3H/GvUPnmbAlKvs+O+efHA6IsiTVD4/lPbMXW?=
 =?us-ascii?q?VJj1UUueablu85qFrxp8=3D?=
X-Talos-MUID: 9a23:ztPUFAQODjJuVUUBRXTi3A5PLPdZ6J2zFR0Tlqk85vKuZS5/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,124,1770595200"; 
   d="scan'208";a="54154218"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Mar 2026 04:35:45 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 333CA180006F3
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:35:45 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id E2C01CC12B5; Tue, 17 Mar 2026 10:05:43 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v2 4/4] binutils: Fix CVE-2025-69652
Date: Tue, 17 Mar 2026 10:05:33 +0530
Message-Id: <20260317043533.2947871-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233295

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69652

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes from v1 -> v2: 
- CVE-2025-69648 is fixed first as per commit history timeline so the
  patch is rebased on top of CVE-2025-69648, CVE-2025-69644,
  CVE-2025-69647 and CVE-2025-69649 patch.

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 2f34037eed..3dc73c3ad0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -49,4 +49,5 @@ SRC_URI = "\
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..d345e33d04
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,39 @@
+From 69d20318286c467efc764585e6c4967793bfd198 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 3c53821149c..d9f514180de 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+	      break;
+	    }
+
+-	  debug_info *debug_info_p = ((debug_information
+-				       && unit < alloc_num_debug_info_entries)
+-				      ? debug_information + unit : NULL);
++	  debug_info *debug_info_p = NULL;
++	  if (debug_information
++	      && num_debug_info_entries != DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p = debug_information + unit;
+
+	  assert (!debug_info_p
+		  || (debug_info_p->num_loc_offsets
+--
+2.44.1
-- 
2.35.6


