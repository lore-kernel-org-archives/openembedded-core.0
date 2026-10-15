Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0583FCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:27:59 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38886.1792067270417353052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dOPT/E7Y;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1050; q=dns/txt;
  s=iport01; t=1792067270; x=1793276870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i6you6xmsYvDCmeF7IixSBZITT5jL9lesMJv3/Q6Xyo=;
  b=dOPT/E7YGjNffQ5+fU3eOnbarLHGOEA2UzaJ0DEC/o72f1AW+MPNWnUy
   hsFGPxwx8pV27VdHXbIohDvCIc6TK/uBW42J9C/I2JlLD2sh1HVyw0fI8
   sVyjUlRSiRfvaWGjKL4uCLHuq6AoLmq18NoomNHghIQnVNlUQK+Kis+py
   0g3X4zyFR5PQ4BFsHAktZlQNmAcbHJ129+Lp3vHaRUTBDALqXbZeb95xs
   z8lYGb6ZYm+CpdstJcdUxd/eYaCZTZvTJUn1M0UllQ/RhA1iGC2FtIPMJ
   L3w9JForJofJZSpUR5u3xZuPJ39va0ez5d7mE74sEgHABv6lrl9Dcv9lO
   g==;
X-CSE-ConnectionGUID: GenWiuM6QlefUO+sqB5y1A==
X-CSE-MsgGUID: byEi1QzERdefDkv0MOT6CQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgBfxtBq/4v/Ja1aglmCV3VhQkmWTZ4cgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjhQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBMCAQMyARgBLRAgMSsrGYMCAYJ0AgERBrtggiyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?gELFAEFgTOFQIgjdoR8JxsbgXKEfoEFgVwBAYIthXgEgiKBDJcKSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABE?=
 =?us-ascii?q?BeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMH?=
 =?us-ascii?q?QVyCAINCQ0YDUgRLDcVGQQ+bgeRfB6CZYEOLII9o0OCIaEPCiiDdowilToaM?=
 =?us-ascii?q?6pvmQiOCpZPhGmBaDyBKB8LB3AVSAGCWQlKGQ+OOYNrgX/MWyQ1AgE6AQEHA?=
 =?us-ascii?q?gcOAwuBaJF+AQE?=
IronPort-Data: A9a23:iNDg26oFdETIbwfp+WzixhoJEJleBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnUP/uKMTGjL9ojPNiy8x9XvMTXzIcxHFBs/yxnQi8a9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sl6B15P6
 NlGETQAYC2kxPmv6u+qE8A506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHRGJUPwBrG+
 Qoq+UzzEzwbbeWN5ACJ/3yAhfGXuATHBqkrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:fp/wu6H6Lov/UJ1BpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:W0X9Q2BubbktMbP6EwZq8nEVB+V7S3nQwkr3YFShIzt4EZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AzJeiMA8mie9y6mKtE+9KHOSQf815zqX3MVIgq5k?=
 =?us-ascii?q?LteWHK3RVHAvDpw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535826467"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 12:27:28 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C33BE18000375;
	Thu, 15 Oct 2026 12:27:28 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 70493CC1292; Thu, 15 Oct 2026 05:27:28 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v3 3/5] apr-util: Mark CVE-2026-34191 not applicable
Date: Thu, 15 Oct 2026 05:27:19 -0700
Message-Id: <20261015122721.2278428-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015122721.2278428-1-hthakar@cisco.com>
References: <20261015122721.2278428-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247881

From: Hetvi Thakar <hthakar@cisco.com>

CVE-2026-34191 affects only the apr_dbd_oracle provider [1].
The apr-util recipe does not enable --with-oracle, so configure keeps
apu_have_oracle=0 [2]. Hence mark the CVE not applicable to this build.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-34191
[2] https://github.com/apache/apr-util/blob/1.6.3/build/dbd.m4

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-support/apr/apr-util_1.6.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index c721d35f61..4d5d4b8fe0 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -104,3 +104,5 @@ do_install_ptest() {
 
 # Add CVE_PRODUCT to match the NVD CPE product name
 CVE_PRODUCT = "apache:apr-util apache:portable_runtime_utility"
+
+CVE_STATUS[CVE-2026-34191] = "not-applicable-config: apr_dbd_oracle is not built because --with-oracle is not enabled"
-- 
2.35.6


