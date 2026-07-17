Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D9C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:06:27 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7700.1784268386426519182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XynsBuTC;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3161; q=dns/txt;
  s=iport01; t=1784268386; x=1785477986;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qoa0Yddvus9zC62V/OJF8E2Iw99yjaUPjWrU0UOTYZw=;
  b=XynsBuTCh/HFS5hJcjt6JVNi/c2ICJlvTLy8cVnFKNmCBBsjf+U4OqYV
   u3sZy9N5p3Onh7tRstZVwdtztAdD8oWCnr9f3+zu8rNaftb34CIgHeTy/
   1mFD6onIlm0REbZ4uNcqKY2S8dCIIMvXRrD3jkfK57ZHCF4+F2oVDiQk4
   qvV8OUUqzfcYwwIhHMO+ijSvofWpjp5byBEbL1RkvaENHvqBWAHOt/fTN
   xRCHkDGTol0vAAGkMLCxb/V0yhLTRYoUEZ7lLFCgd1BIIGPFBHmYiNxm2
   oc3zjjX6ZTWUzwKAsew4yJComrULCrekG3z4hBTMuVP5kZjKJdqDQeC22
   Q==;
X-CSE-ConnectionGUID: E5ydugeBR+2ulQVpwfgc8Q==
X-CSE-MsgGUID: qOj4BUPSQl6/zAk2Vu/lzg==
X-IPAS-Result: =?us-ascii?q?A0BJAgBIxVlq/5L/Ja1aglmCV3RfQkmUKYIhA4tkkjeBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjVICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLyALIwgRCIMCAYI6AzcDEbx6G?=
 =?us-ascii?q?jeBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOIU/gn2FI1wYAYR8JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBGkIBAYglBIINFYEMgVoegXyCd4I0iFpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQwbBwWBHYE6gQCEdiMfAzl/gS91SnctahIXgU6CFIE+AwsYD?=
 =?us-ascii?q?UgRLDcUGwQ+bgeNSCOCP4EOAStGfRFnpWSgIXEKKIN1jCGPPoV8GjOqbAuYf?=
 =?us-ascii?q?Y4KhAmSR4RpgWg8gSgfCwdwFTuCMwEzCUoZD44tCwuDYIF/zEE8NQIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiRHmABAQ?=
IronPort-Data: A9a23:tH02U6Dbmmnp4RVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD9w1jYDn
 WZOUDyGPvqNYDT3fYt+aIvk8xgC7ZSGydE1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD8hWYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7qh/AFw5MKciubxqBVhw7
 eMWJztdV0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoiOizaIOPI7RmQ+1MuUTEj
 F/+xF39XFYIHd/F9yfC9mCj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:3qXTAawDGUBe2UeOVnsxKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:l1pRUm2K8XJAMrbpa6EXi7xfN500fmDSwV3qYBWlDV9XUKKbRlTAwfYx
X-Talos-MUID: 9a23:FMvf/QaI0b7gGeBTrhju2BtfDPxR5/rpGmkOy6sb/M2WOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="510860121"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:06:25 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 16B5818000203
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:06:25 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 39890CC037D; Fri, 17 Jul 2026 11:36:23 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 08/10] expat: fix CVE-2026-56411
Date: Fri, 17 Jul 2026 11:34:35 +0530
Message-Id: <20260717060437.2910653-9-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241147

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56411

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56411.patch          | 50 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 0000000000..819638ca22
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,50 @@
+From 5e696e78f8c4a709c4f774973b142e57090c4364 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH 11/17] xmlwf: protect notation list allocation from integer
+ overflow
+
+CVE: CVE-2026-56411
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
+
+Backport Changes:
+- Use Scarthgap 2.6.4 freeNotations cleanup and return directly
+  because the newer shared cleanUp label is absent.
+
+(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index bd5f68a4..6a3d31b7 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -387,9 +387,9 @@ static void XMLCALL
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
+@@ -401,6 +401,14 @@ endDoctypeDecl(void *userData) {
+     return;
+   }
+ 
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    freeNotations(data);
++    return;
++  }
++
+   notations = malloc(notationCount * sizeof(NotationList *));
+   if (notations == NULL) {
+     fprintf(stderr, "Unable to sort notations");
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 8d7a19e79d..3a880882ae 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -61,6 +61,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
+           file://CVE-2026-56411.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

