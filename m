Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68D1C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:59:45 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.964.1787205578549817650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VmH9fCbm;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2688; q=dns/txt;
  s=iport01; t=1787205578; x=1788415178;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ROhbzzEbieIF/jB0TRqlrLcqixkq2vQrn+OAkmcMul0=;
  b=VmH9fCbm6J+llApbGtduZ5xzxDASIxracCEtKhXRBuTs/lNZM93KzsNR
   VW/Pd6/2lTQSfWftl+gGxFes6XCU2Fq6ntaZVGOkF+8ra6Fvh8c5IGtMx
   T0VTN1eWNXK24XZtpNj/Y7k6fQhFZih+yKS3huvZUmqrEA3x+/qSXA/5h
   BQ5W32HfIqq85m3uQGwa4IjmLmDoW4P43HTe57V73w3E9KxPcv1xP1JSD
   wUFfz2KtKfgnpgAKUeLe7jklV1ESSFb1wxEc6nGskIrbsQuNdosC4cjFd
   4LJ/ABhkV2zAOrRXlwrHwj8oNpqgOEEX/D284fXNFakO5+aliwgakjhQn
   g==;
X-CSE-ConnectionGUID: Qf6+WGUfQiKCTOPIXCqpQw==
X-CSE-MsgGUID: tpdEVRdbTVSzqJ17CcYQ3Q==
X-IPAS-Result: =?us-ascii?q?A0BFAgBWl4Zq/44QJK1aglmCV3ReQ0mWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgECASoLARgBLSwDAQJaIyGDAgGCdAMRwWIaN4F5M4EBgygBPwJDU?=
 =?us-ascii?q?NswAQsUAQWBM4U/iCJdGAGEfCcbG4FyhH6BBYFcAQGCLYV4BIIigQyBWh6BD?=
 =?us-ascii?q?4JrjVhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjG?=
 =?us-ascii?q?TZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOCRcLGA1IESw3FBkEPm4HjlEgg?=
 =?us-ascii?q?kuBDgEHDBcBIF+BPg2TGpI+oQ8KKIN2jCGVOhozqmwLmH2JHIRullCEaYFoP?=
 =?us-ascii?q?IFHCwdwFTuCZwlKGQ+OOINrgX+DFMcmJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:ldw0q6DFJEG5+xVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDkm1jAOn
 WsYDT2POPnfMWbxctxzPdm3/BwHsJDTzIViOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+vswT34ZAIMh+8VcPUZ21
 MwzMSg0cUXW7w626OrTpuhEj8AnKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWAHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCDlVcvgeewaIC9ltqiWd1Zs3iiq
 mj6wV/rGzNDa/eU+APeyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTVl+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQz2FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:rpEP+qj5DuA0ySb5v5+sPG58OHBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AqBDnwmhhjXL4NAAC4JiFwmSfHDJuS3ODj0j/HkG?=
 =?us-ascii?q?BCEVCdJqtaG+74btdjJ87?=
X-Talos-MUID: 9a23:xQaH5Qrk0wGwerJAYpQezy16OOpW2aikNH42g4wk4pavPh1JYA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813697502"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:59:37 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 7465D1800017F;
	Thu, 20 Aug 2026 05:59:37 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 0BA27CC12A6; Wed, 19 Aug 2026 22:59:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] libssh2: Fix CVE-2026-58051
Date: Wed, 19 Aug 2026 22:59:32 -0700
Message-Id: <20260820055932.40619-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243807

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream fix for CVE-2026-58051 using the
commit in [1].
The CVE advisory [2] describes an uninitialized
publickey-list entry cleanup issue affecting libssh2
through 1.11.1.

[1] https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58051

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
new file mode 100644
index 0000000000..6be1e81d63
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
@@ -0,0 +1,34 @@
+From 39ea6e1783afcbd72838eaf649999baa2c41ab12 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <vszakats@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 19:12:21 +0200
+Subject: [PATCH] publickey: fix potential arbitrary free in
+ `libssh2_publickey_list_fetch()` (#2127)
+
+Due to uninitialized list entry.
+
+Reported-and-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+CVE: CVE-2026-58051
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a]
+
+(cherry picked from commit a9758da45a52bc8c630ec9493804d0c6ea30b24a)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/publickey.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9ff2e5cf..5af3b50a 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -972,6 +972,7 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+                 list = newlist;
++                memset(&list[keys], 0, sizeof(list[keys]));
+             }
+             if(pkey->version == 1) {
+                 unsigned long comment_len;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 960ff71df2..f29454cd84 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+           file://CVE-2026-58051.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.35.6


