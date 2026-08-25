Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3852CC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 11:02:04 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19325.1787655715205186759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 04:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U9WcP4ET;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1543; q=dns/txt;
  s=iport01; t=1787655715; x=1788865315;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5+o1PhNKRkVqbpGV/XhSDs1uayXlsNo11URqwcUQemw=;
  b=U9WcP4ETf3slJ9Epm28PCPF+xHE9PcBkqrrdm/ubVAybCL3Nj57bXCOm
   zsdrz5YFrL9FFD1q94uI2r3UnPzzrRwlIunLq6oYHnc9kYtL2oHYpvAyP
   RKV7uWBfAtRJwjyqiYIDi6YxcHDqoOv7n28dBvuEVskYS0WNNmHUKJvYH
   TAWeOs5eqcu/Oh6M/zCS7biQBfWJgPGbWJmSkbjeLK/y5fl8xnmKiNuBV
   tScPPZwQOLH7CWLFrr+Aay1tb2bAX7+tnH/Z1J4iBIA943aQK2BbCjjn5
   Tk9mCep0mdpzwGZ0Ytl7rkAgTwhgF6Qi2U540j8pqclkNiAKcJ92nNCL+
   g==;
X-CSE-ConnectionGUID: CapIkX2ERFKs15rOeyXatQ==
X-CSE-MsgGUID: bJPCcKDYSoiO2gtF67GcZA==
X-IPAS-Result: =?us-ascii?q?A0BDAgCzdY1q/4wQJK1aglmCV3ReQ0kDlkeeHhSBag8BA?=
 =?us-ascii?q?QEPPRQEAQGBcQGDE41uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJ0AxG+Y4IsgQGDKAExBdxOAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ2hHwnGxuBcoR+gQWDJGeFeASCIoEMgXiRXUiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCW?=
 =?us-ascii?q?oIFAgFJQw4HRyILGA1IESw3FBkEPm4Hjl0fgkyBAgwsgiwck1uRf6EPCiiDd?=
 =?us-ascii?q?owilToaM4QEpmiZCIJZizGWUIRpgWg8gVlwFYMiCUoZD444iH7HJicyAgwvA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:Uyx1uq3H011Q6m80G/bD5c9wkn2cJEfYwER7XKvMYLTBsI5bpzEDy
 2dJW23QOPyMa2unc9hxat61/EwDvJfWx4NmQVZr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJ0guHI4ooMtNL0JVr
 KECDz0cXhmfvrfjqF67YrEEasULJc3vOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEyojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiei9YYWNIYPiqcN9lGSgj
 Wnl01XCBRA9btOD52Ta3Xmer7qa9c/8cMdIfFGizdZviUGTx2EOThELX1y6uryzkE+3Xd53I
 UsT5i4vq+4580nDZsP8VB2xunLCpgMGV9tdO+k77hydxK3J5QqQGmkDSHhGctNOnMguSDon0
 1WEk9/kCXlkt6eYYXac7auP6zSqNC4YKGUPaSMJQU0C+daLnW0ophvLStAmFOu+icf4XGmrh
 TuLtyM5wb4UiKbnypmGwLwOuBr0zrChc+L/zli/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:pGyK1KozUaM8kck9fbQz7toaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AVEoEN2pG/lJ8Bz666QVZGbHmUessalze/C39GWG?=
 =?us-ascii?q?bEj80UpqYWG+Z5Joxxg=3D=3D?=
X-Talos-MUID: 9a23:15LJOwmHULJag5VLWX1gdnpoFv9D6IeCOXsKkLJctNWqa3NfMAW02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,242,1779148800"; 
   d="scan'208";a="818897037"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Aug 2026 11:01:54 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 2E171180001EF;
	Tue, 25 Aug 2026 11:01:54 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id C2E6FCCA79B; Tue, 25 Aug 2026 04:01:53 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Devansh Patel <devanshp@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH v2] apt: mark CVE-2011-3374 as fixed-version
Date: Tue, 25 Aug 2026 04:01:48 -0700
Message-Id: <20260825110148.2163688-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244227

From: Devansh Patel <devanshp@cisco.com>

CVE-2011-3374 affects the legacy apt-key net-update command [1].

Upstream removed apt-key in apt 2.9.19 [2]. OE-Core uses apt 3.0.3,
so the vulnerable code is no longer present and cannot be restored by
configuration.

Mark the CVE as fixed-version.

[1] https://security-tracker.debian.org/tracker/CVE-2011-3374
[2] https://salsa.debian.org/apt-team/apt/-/commit/a00fbbdb2

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4..7c72f489a3 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# apt-key, including the vulnerable net-update path, was removed in 2.9.19.
+CVE_STATUS[CVE-2011-3374] = "fixed-version: apt-key was removed in 2.9.19"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.35.6


