Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B6ACA5FAE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:39 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.654.1790655517978245632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=X8KmYebq;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4680; q=dns/txt;
  s=iport01; t=1790655518; x=1791865118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XjT2RJ1hU5ecgJ0qcp8/aZeQammU2Hf+1ERjGek+iYs=;
  b=X8KmYebqBtcOypZZxVObqFfLKUoDfeq+b4uREPNHotnwVU+yRU9d/qe4
   tMuO7mfDAScLtMd3L6QIJmuwReUMZykbpCDTsQASl4PJuipZRSoKACzZ6
   Bx/+9l4Rk9Cw1SyiMskrbRWosCt1X9AYZtS9VURcirX5etHK9Chybr7wR
   ZY6aV3Pw+JpenZitoIpECbHPsWCqhHS1+V8sTNldK6zIOOX/jLoxyKFoU
   jXiK5kMiUMWmniIjwJXXDPbtkOJsxe0V3+XJataQVfwF9axAmOo/IGbv4
   zrObEFk6SlNrkBMY0sjfUTSAJSKVjJ0yI7UXzMeuZzGN4ziIHXcx3/8lF
   g==;
X-CSE-ConnectionGUID: si6LKPtIS2i0m6bQZUQddQ==
X-CSE-MsgGUID: xgIA0M6fSAG3hbklDYXtcA==
X-IPAS-Result: =?us-ascii?q?A0BNAgDTOrtq/43/Ja1aHgEBCxIMggULgld1YUJJlkoDm?=
 =?us-ascii?q?haEBIF+DwEBAQ9EDQQBAYQ/RgKOCAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCA?=
 =?us-ascii?q?RHACYF5M4EBgykBPwJDUNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?VwBAQKIIwSCIoEMgVoekzhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVFE?=
 =?us-ascii?q?kcmIggSCQETGjALgSE4QQkoPxgNSBEsNxUZBD5uB5A/HoIYTAEBPD4TASoBg?=
 =?us-ascii?q?QVQgSWjB4IhoQ8KKIN2jCKVOhozqm8LmH2KCymDVpZQhGmBaDyBRwsHcBWDI?=
 =?us-ascii?q?glKGQ+OOYNrgX+DFMcmJDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:lPX5eaDNpWFgqBVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApD1302YFy
 2ZMC2rSO/mOMWLxeo0nPNjl8htUupKDxt9jOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYA7/i2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2PQwKGIOIawjoOcvBD9Ez
 M4lETwBV0XW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVYhj+GzbIWLEjCMbdVav2/Ag
 zzIxE3WWREQN9iz+AqZ+Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvaS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:P+1HXKho0iO8sWZiqdEZG/ohdnBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:cMw5Sm/Smt9li7hY3i2Vv1UVROQGSmH89y3Re0rmA19bdYSZRWbFrQ==
X-Talos-MUID: 9a23:Bpf0pwuzdMg6tJblNc2nlD5DHZ9NvaqVIW9WkZ8Fv+W1BTB7EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528716476"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:37 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 11C9D1800018D;
	Tue, 29 Sep 2026 04:18:37 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 6353ECC127B; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 7/8] libxml2: Fix CVE-2026-86143
Date: Mon, 28 Sep 2026 21:18:35 -0700
Message-Id: <20260929041836.2217090-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246814

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707586f68ebf35
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86143

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86143.patch       | 91 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
new file mode 100644
index 0000000000..228b5136bb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
@@ -0,0 +1,91 @@
+From 83259eee08067b547d2aaedd436504939b2c343b Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:54:34 +0200
+Subject: [PATCH] xmlIO: Check for int overflow before calling writecallback
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1111
+
+CVE: CVE-2026-86143
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707586f68ebf35]
+
+Backport Changes:
+- Change nbchars to size_t in both Scarthgap write functions before assigning the size_t result of xmlBufUse(). Add the INT_MAX guard to both xmlOutputBufferWrite() callback paths. The upstream commit assumes earlier refactoring that changed nbchars to size_t and routed xmlOutputBufferWriteEscape() through the protected write path; the existing flush guards are retained.
+
+(cherry picked from commit 90f293ba74d28b1d570920382e707586f68ebf35)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlIO.c | 26 ++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/xmlIO.c b/xmlIO.c
+index 95d27157..de227d8c 100644
+--- a/xmlIO.c
++++ b/xmlIO.c
+@@ -3318,7 +3318,7 @@
+  */
+ int
+ xmlOutputBufferWrite(xmlOutputBufferPtr out, int len, const char *buf) {
+-    int nbchars = 0; /* number of chars to output to I/O */
++    size_t nbchars = 0; /* number of chars to output to I/O */
+     int ret;         /* return from function call */
+     int written = 0; /* number of char written to I/O so far */
+     int chunk;       /* number of byte current processed from buf */
+@@ -3378,6 +3378,10 @@
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3487,7 +3491,7 @@
+ int
+ xmlOutputBufferWriteEscape(xmlOutputBufferPtr out, const xmlChar *str,
+                            xmlCharEncodingOutputFunc escaping) {
+-    int nbchars = 0; /* number of chars to output to I/O */
++    size_t nbchars = 0; /* number of chars to output to I/O */
+     int ret;         /* return from function call */
+     int written = 0; /* number of char written to I/O so far */
+     int oldwritten=0;/* loop guard */
+@@ -3572,6 +3576,10 @@
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3667,15 +3675,25 @@
+      */
+     if ((out->conv != NULL) && (out->encoder != NULL) &&
+ 	(out->writecallback != NULL)) {
++        size_t bufsize = xmlBufUse(out->conv);
++        if (bufsize >= INT_MAX) {
++            out->error = XML_ERR_INTERNAL_ERROR;
++            return(-1);
++        }
+ 	ret = out->writecallback(out->context,
+                                  (const char *)xmlBufContent(out->conv),
+-                                 xmlBufUse(out->conv));
++                                 bufsize);
+ 	if (ret >= 0)
+ 	    xmlBufShrink(out->conv, ret);
+     } else if (out->writecallback != NULL) {
++        size_t bufsize = xmlBufUse(out->buffer);
++        if (bufsize >= INT_MAX) {
++            out->error = XML_ERR_INTERNAL_ERROR;
++            return(-1);
++        }
+ 	ret = out->writecallback(out->context,
+                                  (const char *)xmlBufContent(out->buffer),
+-                                 xmlBufUse(out->buffer));
++                                 bufsize);
+ 	if (ret >= 0)
+ 	    xmlBufShrink(out->buffer, ret);
+     }
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 881b60133d..1b0c3d50da 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -37,6 +37,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
            file://CVE-2026-86142.patch \
+           file://CVE-2026-86143.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


