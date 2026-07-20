Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A59C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:28 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7667.1784550023415874809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gtB62pUp;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3369; q=dns/txt;
  s=iport01; t=1784550023; x=1785759623;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=csxPvRNIzzfFAPjMLDJwVj8YDRgyyvKm9FPK7I7gOmE=;
  b=gtB62pUp824hhD9coZNJUrhRUrevME6uYPB+WVG8xeKiv7mihhazbhex
   pXEeP16+oiaR1K7St4f/vY4aVeOsVBGPqe37UTsyrMh+qMLbYx9OzNEqr
   2BeW3RtQxmJ3eUJq++xxRRw6d95T0z0Wkhf6OMyPRu0NTMyiHJRS7l4RM
   jPYK2+ddQuMBo93IA0L3eVfKAGC3f0Y/5+l6G0wl0HpsJb0vsrZqhb2nJ
   hre2MkMJ/bl4akVujIeoTlo9GxIf/H8fEg5cy7t4+MFihervH9fKkYtwO
   zL2pokrZdfI3oqaTUwrZNGUxTZBYpVS0xiLrisGp2SBtTxBtytSIL2ZA7
   w==;
X-CSE-ConnectionGUID: 3HFIw5EfT5C9KErOKNixYA==
X-CSE-MsgGUID: aSENDSThRQmJuKdrmMXnrQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCWEV5q/4v/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbxDGjeCLIEBgygBPwJDUNhJDYJYAQsUAYE4hT+CfYUjXBgBhHwnGxuBc?=
 =?us-ascii?q?oR+gQWBGkIBAYglBIIigQyBWh6PbkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgTqBAoR0Ix8DOX+BL3VKdy1qEheBJoISAoE7AgcDCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB408I4I/gQ4BK4FDEaZLoCFxCiiDdYwhjz6FfBozqmwLmH2OC?=
 =?us-ascii?q?oQJkkeEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8ZGPDUCCTIBAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:jJ2EkqCuMAaDbBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGxx0WEDy
 jQfUG6Oa6rfNmryL4x+YY209kNSuJSEzINrOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/g2YpWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEmNVALV5rEIMkp80mIkxU0
 t8+KSA8R0XW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoiem0boSEI7RmQ+1cpWu+i
 ln6/17ABzMHF9CFzB+19GiV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Bmk67qM7KFIZpsBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:66hJeGFH4xHBRbAEqmI81GA1BZ0IfEGA5ybzDlWfKkBoWIy8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AMROSTQ8TsfGMzORvf7kKqZ2Qf85TzoKCM3wNq6w?=
 =?us-ascii?q?DmdSnOTZ1Hgeblg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="511916691"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:22 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 4D6F818000368
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:22 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 712DDCC037D; Mon, 20 Jul 2026 17:50:20 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 07/10] expat: fix CVE-2026-56409
Date: Mon, 20 Jul 2026 17:46:12 +0530
Message-Id: <20260720121615.2520859-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241384

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56409

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/expat/CVE-2026-56409.patch          | 53 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
new file mode 100644
index 0000000000..ff0e650a2a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
@@ -0,0 +1,53 @@
+From 10938bc2cef7573087566b5b1c948061baa68b98 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Mon, 1 Jun 2026 11:53:19 +0530
+Subject: [PATCH] xmlwf: protect output path join from integer overflow
+
+CVE: CVE-2026-56409
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit cast used by Expat 2.7.5.
+
+(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 06416454..6a0a707a 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -1236,8 +1236,26 @@ tmain(int argc, XML_Char **argv) {
+         }
+ #endif
+       }
+-      outName = (XML_Char *)malloc((tcslen(outputDir) + tcslen(file) + 2)
+-                                   * sizeof(XML_Char));
++      const size_t outputDirLen = tcslen(outputDir);
++      const size_t fileLen = tcslen(file);
++
++      /* Detect and prevent integer overflow in the addition (without
++         risking underflow) and the multiplication, mirroring the guards
++         in xcsdup() and resolveSystemId() */
++      if (outputDirLen > SIZE_MAX - fileLen
++          || outputDirLen > SIZE_MAX - fileLen - 2) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      const size_t charsRequired = outputDirLen + fileLen + 2;
++
++      if (charsRequired > SIZE_MAX / sizeof(XML_Char)) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      outName = malloc(charsRequired * sizeof(XML_Char));
+       if (! outName) {
+         tperror(T("Could not allocate memory"));
+         exit(XMLWF_EXIT_INTERNAL_ERROR);
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index f14e39c00b..cb8f9dd1ac 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
+           file://CVE-2026-56409.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


