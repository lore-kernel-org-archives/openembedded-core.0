Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7E7C5DF8B
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3038.1787216871405847851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e93v7Cyy;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1518; q=dns/txt;
  s=iport01; t=1787216872; x=1788426472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cXF7pMt0M1ODcc2ZzSVXsHANFycbcTT7RF3SYlLTGPg=;
  b=e93v7CyyXtAy0FYdlBp73scSIKchZ0D6vuoVN/gMtbuBWiNrZHTtBDP8
   Gn1lYBY01DrQMYpvwhC0ZaqzI939eaZY3G7PxoPHw3E75Vt+PCeNyz8fV
   qb6W9VN1tpmZo3fumyRk4Nbyk9QqJzGxyBlb1heL85AttDpZ1y2YjBriU
   gXxNjZk4XQiI20XlG58951FQ8GzkrZ3xbvaXIBzJY/EO70l54CeyhauU+
   BIWlG/SxOubczebigHn79YDbKnrKKVT4TzpLPI2Q5kXHmusOtsk1oN0iw
   qLRRGClGca7gT3zi05SE1m0RrfqvapH0Wzwh7+KpWlu2Wc2Jidxe+Hgqi
   g==;
X-CSE-ConnectionGUID: 8s7jSCz4T3eD8RTDxXGFgA==
X-CSE-MsgGUID: 2fGczVNyRBayKTx4BAoIYA==
X-IPAS-Result: =?us-ascii?q?A0BEAgAdw4Zq/4wQJK1aglmCV3ReQ0mEV48CAaEOgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl0nBAsBGAEtMAUCJgItRIMCAYJ0A8JDen8zgQGDKAGBVNswAQsUA?=
 =?us-ascii?q?QWBBS6FP4MfAYUCdoR8JxsbgXKEfoUQgw6CagSCIoEMgXiRUkiBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XNVgbBgWBHYEohDcjGTZ8gQlegSsqYQESF?=
 =?us-ascii?q?4EJggoCgnCCBgIBSUUOCRcLGA1IESw3FBkEPQFuB45RIIJLgQ4BgUNtph2hD?=
 =?us-ascii?q?woog3aMIZU6GjOqbC6YWqRahGmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC?=
 =?us-ascii?q?5NmAQE?=
IronPort-Data: A9a23:u+9kQ6hLINamiQ3qp49IkMBlX161NhEKZh0ujC45NGQN5FlHY01je
 htvW2/VPKuOZTb1Lo0lbo+zpEsP6JDRzYAwGgtrqylkESNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/vS8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVI4bl1Okpcq
 cBDJRxdVCyvl9KZ7r2SH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFI4XTGZQExh3wS
 mTupWrWCQMkEs2l4zOU0U682sXmmgLKcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Ixd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:/WvSQaxXUVvlZjpsEVhmKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+MjztCWE7Qr5N0tApTntAsS9qBDnhPxICPcqXYtKNTOO0ADDEGgI1+XfKlPbdxEW39Qtsp
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:a2JW1W8TQmPnai+9Dh6Vvx4PRcIeWW+B8CzdDx+CNUp5eJK7RnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AhQxc6g0KCMx1LHFn32C9A+1SnTUjuaqBA1Izt4Q?=
 =?us-ascii?q?8kcCVFhBgZx20ixWGa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="811149903"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:50 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id CD22118000435;
	Thu, 20 Aug 2026 09:07:50 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 73597CC12A6; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-wheel: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.62021-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243838

From: Tim Orling <tim.orling@konsulko.com>

The proper CVE_PRODUCT is "wheel_project:wheel".

BEFORE: python:wheel -> 0 CVEs
AFTER: wheel_project:wheel -> 2 CVEs

* Already patched at 0.46.3.
  - CVE-2022-40898 — DoS in wheel CLI via malicious input. Affects <0.38.1.
  - CVE-2026-24049 — malicious wheel file can modify permissions of arbitrary
    files. Affects 0.40.0–<0.46.2.

Note: The original commit targeted python3-wheel_0.47.0.bb. This is
adjusted for Wrynose, where the recipe version is 0.46.3.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe55278e01bbe434452191109278b436bf008ebc)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-wheel_0.46.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
index 2545e5496e..7338e8edcd 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.46.3.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a8308351
 
 inherit python_flit_core pypi ptest-python-pytest
 
+CVE_PRODUCT = "wheel_project:wheel"
+
 RDEPENDS:${PN} += "python3-packaging"
 
 # One test is skipped but requires the "full" python3-flit, not just python3-flit-core
-- 
2.35.6

