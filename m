Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D401CCD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 17:51:12 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76169.1781286667849480176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 10:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=czLk3f6F;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2203; q=dns/txt;
  s=iport01; t=1781286667; x=1782496267;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Eex39UP4BIwvBczf3o0KrLzWFSHtIBNGiZyt9pP93+U=;
  b=czLk3f6FHTGm0QRob/1oiedgmPVd3vz0pSQ5x6CIPcaZUBMhPQ7tbaqM
   ntdLQQZs3Ggg0487YOJtCFX7YCiU7EU+gARaoPhvg9httG7ykyGj6PcIV
   cxCZae+v+Rx8lDAD59X6rjsC1IOoE2ki4RUCowObC5YPjZMdiQZw1ui/y
   pOCxOy2Cee6KbA0ooTedCk6+y9wIkvwrxa7r6jhRYFFKkAVHNqxB1psHA
   VCY5h829IEn2G3JqhsDU/PH7uEx/LfJmzmDNtDPJJ/2Thc8bE87Wza6eM
   vhZL2gciBlOk94+omIw6lDl/VdeO/+nddtn9tzX+mSs3zeStLvVSIXhWg
   A==;
X-CSE-ConnectionGUID: 5QLcpRIBS8GD3MrlDKAhNw==
X-CSE-MsgGUID: 6MzawWGzTAG6f/6hJnnnvA==
X-IPAS-Result: =?us-ascii?q?A0A/AgCTRixq/5D/Ja1aglmCV3RfQkmUKqA/gX4PAQEBD?=
 =?us-ascii?q?0QNBAEBkksCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2HEwF2XESDAgGCcwIBEbUrgiyBAYNoAkNQ2ywBBQYUAYE4hT+IH3MBhHwnG?=
 =?us-ascii?q?xuBcoR+gQWBXAEDGIEedYV4BIIiehKBe454SIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EMGwcFgUqBK2qBA4UNIx8DOX+BdIEoZ2kVMDWBAhEZAwsYD?=
 =?us-ascii?q?UgRLDcUGwQ+bgeMRRcPgj6BDiyBbaY1oQ8KKIN1jCGVOhozhASUF5JRC5h9j?=
 =?us-ascii?q?gqWUIRogWg8gUcLB3AVgyJTGQ+OOIVqgxTDHyQ1AgkyAQEHAgcOAwuBaJABg?=
 =?us-ascii?q?XwBAQ?=
IronPort-Data: A9a23:Jn3vb602s3BDG7Jkg/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzYOm
 mpJWmqHbPaOa2qnLd1wPomxoUwG6J/cz4QxHFBu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtaDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUXgSNpUi28xMUU5ir
 tkCLBwuRxClmLfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OS8bIGJK4LaFK25mG7Gg
 3DP4FvWEC0zG4KRjmSF0HSqgPHmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:RYRnfKxAN7XTpbcd9xdcKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:PM7eEGEQMJvGo57rqmI6zWofAvoEWEaN41uLBlW8JUVASJuKHAo=
X-Talos-MUID: 9a23:F/qK0AuZTlW8WQQGxc2n2hRwPdhXzLaSIW9Tn9JYu+uCMypuEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,201,1774310400"; 
   d="scan'208";a="494349689"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 17:51:05 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 1737618000231
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 17:51:05 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id B26DDCC2EC3; Fri, 12 Jun 2026 10:51:04 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] binutils: Fix CVE-2025-69644
Date: Fri, 12 Jun 2026 10:50:49 -0700
Message-Id: <20260612175049.3291582-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 17:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238646

From: Deepak Rathore <deeratho@cisco.com>

This patch updates the existing CVE-2025-69647 backport metadata for
CVE-2025-69644. NVD records for CVE-2025-69644 and CVE-2025-69647
reference the same upstream binutils fix commit [1], and the public
CVE advisories are referenced in [2] and [3].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a865c45f4..7e83f72632 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -72,7 +72,7 @@ SRC_URI = "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
-     file://CVE-2025-69647.patch \
+     file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
similarity index 96%
rename from meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
rename to meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
index 8e3c1c79e7..c6b3cefed2 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
@@ -12,11 +12,12 @@ length too.
 	length too small to read header.  Limit length to section
 	size.  Limit offset count similarly.
 
-CVE: CVE-2025-69647
+CVE: CVE-2025-69644 CVE-2025-69647
 
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7]
 
 Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
 ---
  binutils/dwarf.c | 20 ++++++++++++++------
  1 file changed, 14 insertions(+), 6 deletions(-)
-- 
2.35.6


