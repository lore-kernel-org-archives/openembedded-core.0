Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D499C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:10:50 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12239.1783689045090750577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RdI6zQF9;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2797; q=dns/txt;
  s=iport01; t=1783689045; x=1784898645;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=foK+iJbwW/MX8RFNwp3bXUh2kLlDbYKYQAADl/Pz3EI=;
  b=RdI6zQF9mn21+spgM3l44t/xHCCQgsxNNrrafCq+tSKrtZ+mSR8U1jIM
   EcSZCGkLNhgwyo7PO5j8vth6DJZ/UhXaeVzDd6VnL9XLtwZR+oR8YZOeA
   BYaCtWigocZGqrH4xh1eLKHe4nQh8u7KsQepxaVq8NefEFHQUOkSjzPLH
   p1zL9Whu/lTgY6giYSu93rnQ/Pk0yRbnwW5uH/Gvh2oZED/84KhXPQH68
   W1phA76bj2qu8sPyvcYpffl9WXcg06wHhx+MctqJK2mIjH056t+VBor/S
   N2TbFpKmpOBxsMqgyxuhGB89ay8cXQZwQ/AL7UTAfyPzpIZTHhQVd0dlT
   A==;
X-CSE-ConnectionGUID: xcv3UPWoTmiX8r8nXl0W0w==
X-CSE-MsgGUID: seJYOqZMQ++2fmuTVMzhHw==
X-IPAS-Result: =?us-ascii?q?A0BFAgBH7lBq/5X/Ja1aglmCV3RfQkmUKYIhi2eSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgEtCwEYAVkDAQJPCyMhgwIBgjoDNgIBEbk/GjeBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DYSQ2CWAELFAGBOIU/gnyFI1sYAYR8JxsbgXKBFYNpgQWBGkIBAYIth?=
 =?us-ascii?q?XgEgiKBDIFaHoIOgnmKa0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgVmBAoR5Ix8DOX+BMHVKeS1zEh4KgVKCFlQDCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?40+Fw+CPoEOLIFDEaZOoB5xCiiDdYwhjz6FfBozqmwLmH2OCoQJkkeEaYFoP?=
 =?us-ascii?q?IEoHwsHcBU7gjMBMwlKGQ+OLQsLg2CBf8xbJDUCCTIBAQcCBw4DC4FokR5gA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:CMfAV6DlAwFCUxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDorgzIOn
 GVODWCGbKrYYzH8Ltp0YI63pEoPu5KHy9M2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD9i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE0/5wV3wOAook/+dHUXse8
 8wccA9VcUXW7w626OrTpuhEnM8vKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEpj+exaoaKILRmQ+1Ok2Spg
 Xv02l26QUsUMcGj9x+X8lKz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:pTrhiqzOFADNaAv6oo7CKrPwR71zdoMgy1knxilNoHNuHr36qy
 nDpp906faLsllhOk3I8OroUJVoKkmwlaKdj7N6XIufYA==
X-Talos-CUID: =?us-ascii?q?9a23=3A3b3lR2qXRr90749trfXRW3vmUdAubCbg9EjXH0q?=
 =?us-ascii?q?5OTZzGLulTQevoLwxxg=3D=3D?=
X-Talos-MUID: 9a23:OoJcLwWMJlVqEwXq/CThpgBFLfVN2uftUk4IjKk4ntuEFTMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507742472"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:10:44 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 16AAD180001C9
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:10:44 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id B8EF6CC2EC3; Fri, 10 Jul 2026 06:10:43 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 08/10] expat: fix CVE-2026-56411
Date: Fri, 10 Jul 2026 06:10:36 -0700
Message-ID: <20260710131036.2823247-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240648

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56411

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 0000000000..e1d7faab33
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,46 @@
+From e447d5d72884a1246894f111a5b72de4e479152e Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH] xmlwf: protect notation list allocation from integer overflow
+
+CVE: CVE-2026-56411
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
+
+(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 6a0a707a..a9640190 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -383,9 +383,9 @@ static void XMLCALL
+ endDoctypeDecl(void *userData) {
+   XmlwfUserData *data = (XmlwfUserData *)userData;
+   NotationList **notations;
+-  int notationCount = 0;
++  size_t notationCount = 0;
+   NotationList *p;
+-  int i;
++  size_t i;
+ 
+   /* How many notations do we have? */
+   for (p = data->notationListHead; p != NULL; p = p->next)
+@@ -395,6 +395,13 @@ endDoctypeDecl(void *userData) {
+     goto cleanUp;
+   }
+ 
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    goto cleanUp;
++  }
++
+   notations = malloc(notationCount * sizeof(NotationList *));
+   if (notations == NULL) {
+     fprintf(stderr, "Unable to sort notations");
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index a71e2f8cba..c093e99e2b 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
+           file://CVE-2026-56411.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


