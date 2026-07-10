Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE38C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:11:10 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12335.1783689065849504214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gr3ZyBet;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2848; q=dns/txt;
  s=iport01; t=1783689065; x=1784898665;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kW2L57ST6aO1m2rcd50xLU4QjyT9i+Cf2wTEnEp54Lk=;
  b=Gr3ZyBet6rize0t/rBrW6KQQyJ6TDtfU/sdwQuu3KKLQbJ9VjkRqtVNU
   hL0fknKNBR7AsNdXcBoTREkvr8dhmHqzXNJ58u3rlpZaEiMEyMin4tFvy
   DBOHpq4u0BNhX/T0WPKIzoorU8jdNKkrcNWDjmHzKORE2hhwH21f5M8Ig
   +pDndpcpPHawIV7O5GuRvQlY4yRsu5UydgYuXkEaHS8tekXqnv3xEuuIV
   WAvphOBmHSOHIMzKMBMH0qFhufcjnaKQMUp9+QYdrCIITWCs4CIlpJKw8
   6xYBKVqaweiTuEF0d1WAes61Y+PvDAhiQ9rinCebmvluPeata6NgW02zv
   g==;
X-CSE-ConnectionGUID: NzNqJV5xSFWLv8rM8yYdPw==
X-CSE-MsgGUID: kw2OpUDtSpq09IKsvwxxlw==
X-IPAS-Result: =?us-ascii?q?A0BEAgBH7lBq/4z/Ja1aglmCV3RfQkmUKY4IkjeBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP44VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBLQsBGAFZAwECTwsjIYMCAYI6AzYCARG5Pxo3gXkzgQGDKAE/A?=
 =?us-ascii?q?kNQ2EkNglgBCxQBgTiFP4J8hSNbGAGEfCcbG4FyhH6BBYEaQgEBgi2FeASCI?=
 =?us-ascii?q?oEMgVoehQeKa0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdg?=
 =?us-ascii?q?VmBAoR5Ix8DOX+BMHVKeS1zEh4KgVKCFlQDCxgNSBEsNxQbBD5uB40+Fw+CP?=
 =?us-ascii?q?oEOLIFDpl+gHnEKKIN1jCGPPoV8GjOqbAuYfY4KhAmSR4RpgWg8gSgfCwdwF?=
 =?us-ascii?q?YJuATMJShkPjjiDa4F/zFskNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:Hq/hCaIhBqr8HTZ9FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0TJVm
 DFNDTyBb/+KNmXwKY11atm+p0oCuJeAzIAwTQAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGYkajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1IHmcvH7NF6t1ZPkVQp
 eY9eCE8Yiic0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeCyaISOIoLaLSlTtkWH/
 EXewkjlOQkDbI2+6iGb7WK8gvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:/HfcUatTwQsBuMe3U6NmR85s7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AFP8xgmqkhVMQQ4qg9R2/qQzmUeY3VGT/8irAGGG?=
 =?us-ascii?q?HLXg5UpjFWG6cwLwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATlFPEQ8AzlVHES/WVqKy9zeQf8R3uYO2NWwRqo0?=
 =?us-ascii?q?f45ilFjduJCeNiCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507063068"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:11:04 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id BE7FF180001D9
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:11:04 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 6BFA3CC2EC3; Fri, 10 Jul 2026 06:11:04 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 09/10] expat: fix CVE-2026-56407
Date: Fri, 10 Jul 2026 06:10:52 -0700
Message-ID: <20260710131052.2824071-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240649

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56407

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
new file mode 100644
index 0000000000..075d38ec7d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
@@ -0,0 +1,43 @@
+From 7216b3584bcfb2d415026d16b8902ee7eacad5ca Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 11:59:01 +0530
+Subject: [PATCH] cap entity textLen against signed integer overflow
+
+CVE: CVE-2026-56407
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13]
+
+(cherry picked from commit 30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 71fe2c79..8e90fea8 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5684,6 +5684,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
+             XML_ACCOUNT_NONE);
+         if (parser->m_declEntity) {
++          /* Detect and prevent signed integer overflow */
++          if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
++            return XML_ERROR_NO_MEMORY;
++          }
+           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
+           parser->m_declEntity->textLen
+               = (int)(poolLength(&dtd->entityValuePool));
+@@ -7099,6 +7103,11 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
++  /* Detect and prevent signed integer overflow */
++  if ((size_t)poolLength(pool) > (size_t)INT_MAX) {
++    poolDiscard(pool);
++    return XML_ERROR_NO_MEMORY;
++  }
+   entity->textPtr = poolStart(pool);
+   entity->textLen = (int)(poolLength(pool));
+   poolFinish(pool);
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index c093e99e2b..ef5c415a2d 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
+           file://CVE-2026-56407.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


