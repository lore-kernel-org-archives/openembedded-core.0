Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1946C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:06:17 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7806.1784268376642356521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AGCRGeJG;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3300; q=dns/txt;
  s=iport01; t=1784268376; x=1785477976;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RGB2MBmDhumxVMg9dqFGxbsQuJkHx4UT3//dzMPR/n8=;
  b=AGCRGeJGahm6nkmwv4Ot8/5Pds/pevERkIo3Dlu+oG87BcT1eidjxFI6
   J5uCp/OAcljOQWR2Hs2EPYZ9IhDO9Y/9q1W7BwJQQVmJdun9dqBgY4qI6
   Av9vfASyNEF6R/WsrFlT2O86GthAC619fr6+2vWTBTaTfTz5tZlFLnYFo
   JHrGtOUtjbJ4/PkhjnpLfuc2FnuRNNdpGoZmDCuvu3MOlHwZeXSw3dehD
   wUpgZ5RPgukkCs+vzNEH2FkkEzYplEv/48NaDdh2OILuqB1TI+gdqk2NW
   5Zyq/8GuGDmKLtE8hg+GH/FBLmeeDh95ZTq1k9yVn1wAOwAMxTVeRARzb
   Q==;
X-CSE-ConnectionGUID: iAxKL3pxQMOaJoKpX9E88w==
X-CSE-MsgGUID: 0aQyfWytSaWdtS+d86HhuA==
X-IPAS-Result: =?us-ascii?q?A0BIAgBWw1lq/4r/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOLZJI3gX4PAQEBD0QNBAEBhD9GAo1SAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAT0cAwECLyALIwgRCIMCAYI6A?=
 =?us-ascii?q?zcDEbx6GjeCLIEBgygBPwJDUNhJDYJYAQsUAYE4hT+CfYUjXBgBhHwnGxuBc?=
 =?us-ascii?q?oR+gQWBGkIBAYglBIIigQyBWh6Ec4sOSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgR2BOoEAhHYjHwM5f4EvdUp3LWoSF4FOghSBPgMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HjUgjgj+BDgErgUMRpkugIXEKKIN1jCGPPoV8GjOqbAuYfY4Kh?=
 =?us-ascii?q?AmSR4RpgWg8gSgfCwdwFYJuATMJShkPjjiDa4F/zEE8NQIJMgEBBwIHDgMLg?=
 =?us-ascii?q?WiRfgEB?=
IronPort-Data: A9a23:5HTtUKLcHSwifuIFFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgjRUy
 GsYWW6GP63eZGCket9/PYS0pxgBu8CAzIUwGQQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcqajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1vJVEVGdYA6t9SJmhs8
 t8AGGEgPkCc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeC3YYCIIYPSLSlTth6Rn
 3PIwHXlORglOMCkijbVrFKsm8aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:YPCNtqmrjgDCgwlO2pvo84+UGW7pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:rE9J+G+B0le/1DHqr26Vv089CuMBKWXN9VL3Km2/Kn5ZGZDFGUDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+om7nA6O9+0v1hTXBwQRQ16Sxoww6p2/Bn8cja4?=
 =?us-ascii?q?PhMWYDm98a2m9jCmeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="502925370"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:06:15 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 6F51A180002B4
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:06:15 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 905E1CC037D; Fri, 17 Jul 2026 11:36:13 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 07/10] expat: fix CVE-2026-56409
Date: Fri, 17 Jul 2026 11:34:34 +0530
Message-Id: <20260717060437.2910653-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241146

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56409

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56409.patch          | 51 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
new file mode 100644
index 0000000000..3d55196d1e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
@@ -0,0 +1,51 @@
+From 174ce18f2a283be634d830a5259bd07142635fe8 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Mon, 1 Jun 2026 11:53:19 +0530
+Subject: [PATCH 10/17] xmlwf: protect output path join from integer overflow
+
+CVE: CVE-2026-56409
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit XML_Char cast used by
+  Scarthgap 2.6.4; overflow checks are unchanged.
+
+(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 7bbdb303..bd5f68a4 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -1240,8 +1240,26 @@ tmain(int argc, XML_Char **argv) {
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 5b3d9c64f2..8d7a19e79d 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -60,6 +60,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
+           file://CVE-2026-56409.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

