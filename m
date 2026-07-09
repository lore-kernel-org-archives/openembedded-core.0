Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456BDC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:09:49 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2495.1783573788826716365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Npkj8bIp;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1967; q=dns/txt;
  s=iport01; t=1783573788; x=1784783388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nGgo9y5M6BUL6Opzn+bvhZFcZCtvoTsypJ2Yr7K+BvA=;
  b=Npkj8bIp8HKiiaMTztgXk2KaCsMwVsItKxCe0csv8hN+6YOkgZtldQVs
   KjbwKivXEEOwx5Khun+hZ3tcSRowLVig4kSgO/gMMXcNJpTGCN9qlvvvl
   OquQMXNtU1E6D2D3Uw8BIG4DCquFrM/FdGawinzxpNMg6PtJe9nYTGfMd
   0MjMFNo3kJTKMjloZuX/swL9Z2V6GEKf1MRwhgbgAHiff9EdBx1pHmEPy
   0JVbvVf8CrfPhwEAvMZ+Vbk/7CRFBFCMbn0r4qFiXMTvCtiZ8H27/cJHY
   xs8Kh07x/18HWieNVE1MPjdP6f1lbU+70eoySL5M1fnpR+xt2Wsj+tMYq
   Q==;
X-CSE-ConnectionGUID: Hrq0RBRgRQWsRl9w6sQK3g==
X-CSE-MsgGUID: eJxndO3yQ3+AAB3Zfa7xng==
X-IPAS-Result: =?us-ascii?q?A0D4AgDnK09q/5D/Ja1aglmCV3RfQkmTWQGCcJ4egX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhQWNTwImNgcOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdKwsBGAEtMFxEgwIBgnMCAREGt02BeTOBAYMoAUNBUNsuAQsUA?=
 =?us-ascii?q?QWBM4U/iB9zAYR8JxsbgXKECHaCQx4BAgEBgSSBBoV4BIIigQyBeFCPGEiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgV+BAoR5Ix8DOX+BL?=
 =?us-ascii?q?3VKeS2BAAESHgqBUoIWOgMLGA1IESw3FBsEPm4HjTwXD4I9AYEECggiAoEbg?=
 =?us-ascii?q?S2SdWmRfKEPCiiDdYwhlToaM6psmQiOCpZQhGmBbw0ogVlwFYMiCUoZD5c2y?=
 =?us-ascii?q?UckNQIBATkCBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:FsCdFahIrZ1ktUMbtCJ+BgS4X161MREKZh0ujC45NGQN5FlHY01je
 htvCDuEaanZNGSjLdF3a4y+/R4D6MTSz4M3TQE++S9gEiJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU44P8vO0t0+
 sYhFys3akGc2fmP4+m0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9Jo3QG5gMxxjBz
 o7A12nbEhcWE4eO8GHG21uG3d3BlHzrXo1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:uIAxUK+CaSo/mIrtO21uk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:vRD2VG/jU0JnZdZkQtmVv24OA5gfWEfS9k7vOHW8WHk3U4S2ElDFrQ==
X-Talos-MUID: 9a23:sdGYIgVBs9uPd97q/DLOlDduE5x52v/tIWknyqcIspaUMyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="492651161"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:09:48 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id D0EE518000210;
	Thu,  9 Jul 2026 05:09:47 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7AF2BCC124B; Wed,  8 Jul 2026 22:09:47 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v3] bind: Upgrade 9.18.44 -> 9.18.49
Date: Wed,  8 Jul 2026 22:09:43 -0700
Message-Id: <20260709050943.673109-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240517

From: Ashishkumar Parmar <asparmar@cisco.com>

This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026-5946 and CVE-2026-5950.

Changelog
=========
https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

The 9.18.45 changelog includes a Python 3.10 requirement change for ISC's
upstream system test suite, but OE-Core's bind recipe does not enable or package
that test suite and does not inherit ptest. This change is therefore not part of
the target build, installed packages, runtime dependencies, or runtime behavior.

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
Changes in v3:
- Add commit message note explaining that the Python 3.10 requirement in the
  9.18.45 changelog applies only to ISC's upstream system test suite.
- Clarify that OE-Core's bind recipe does not enable or package that test suite
  and does not inherit ptest, so the change is not target-visible.

 .../bind/{bind_9.18.44.bb => bind_9.18.49.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.44.bb => bind_9.18.49.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
index d424edcb4e..723a09e739 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
+SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.35.6


