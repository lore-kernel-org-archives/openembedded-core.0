Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6B9C531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:11 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23711.1784814066144327302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PNZIbF36;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3494; q=dns/txt;
  s=iport01; t=1784814066; x=1786023666;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PcHOoSnVlrYDH4AQ3gWdQlhc9JhbJ0/wxbFOHBzyq7c=;
  b=PNZIbF36lNSit1pEOr7iCU3KhAo4QZbdulq4OQbCAigVK7IX+KiD9xwG
   dD99zSbILqJNQpT7IpEPV2+pKCKVhiOMT9pXtu9spyUBJIT71VKl1pqAG
   Zf/LrrGD/02uLEkoypfhAvxmuUIRKLmBU7sERWI7yeIH90Ab0SE6Hl8F0
   6u3Uu7Lk6Aa8lRwa1PINS2B/rctCZ+yD32XapsMQL8VG6L0obiixiOHsu
   SHQPIAyo3SgJie18NIpUA7pvcYF6XEMVJGsJllVY7UsldvYVv0O3uM34h
   R2Hu5i0EGGbW+r5ck8MW2BnPCm1U6Vtff/nJBpn9WPFJ2ZVmYrYU95H2t
   A==;
X-CSE-ConnectionGUID: QMhbZuOpSMOnTUr3DVuhfQ==
X-CSE-MsgGUID: OBA7O6RlRD+u/uPUx2hjlw==
X-IPAS-Result: =?us-ascii?q?A0BEAgA1GWJq/4//Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?Z4egX4PAQEBD0QNBAEBhD+OIgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAS0LARgBWQMBAlojGQgJgnkBgnQDEcJMgXkzgQGCZ?=
 =?us-ascii?q?kIBPwJDUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKEfoEFgVwBAYEnhn4EgiKBD?=
 =?us-ascii?q?IFaHpAkSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BLHmEW?=
 =?us-ascii?q?yMfAzl/gTB1SnctahIXgSaDSQKBHQMLGA1IESw3FBkEPm4HjWQjgkABWDUBK?=
 =?us-ascii?q?gGBbRcoEaNEgh6hEgoog3WMIZU6GjOFW6URC5h9jgqWUIRpgWg8gUcLB3AVg?=
 =?us-ascii?q?yIJShkPji0BCguDYIF/gxTFQjw1AgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:OOqWvqJVp854xyTcFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS02YCx
 2EdCGrQafzYNzSnKYhwboS3oBtQ7ZOBzdVjSAMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQvajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1XKUE8D5A/4t1SJmdyy
 OZDBA4Qbh660rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeGxbYSPJo3bLSlTtmGyj
 z3hoV79OD1ZKZuC8QeVqHKugvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:VUNavqMHuYFsrcBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:9HWT72FKF/my0OS5qmJe0U4eKN0Cakb463HsHlXjJVh0SLOsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AudRPWg8+hX31i/EF2Bhvw2mQf+BCyvuJVnoJq7l?=
 =?us-ascii?q?Fpo6ZDRFgYTefiCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514562499"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 13:41:05 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id CF0FE1800026C
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:41:03 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id EAB42CC037D; Thu, 23 Jul 2026 19:11:01 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] sqlite3: fix CVE-2026-11822 and CVE-2026-11824
Date: Thu, 23 Jul 2026 19:10:50 +0530
Message-Id: <20260723134050.2502109-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241841

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix [1], which addresses memory
corruption vulnerabilities in the SQLite FTS5 full-text search extension.
The GitHub mirror commit [1] corresponds to the SQLite Fossil check-in
shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f
[2] https://sqlite.org/src/info/061febcf41ca

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-11822
https://nvd.nist.gov/vuln/detail/CVE-2026-11824

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../CVE-2026-11822_CVE-2026-11824.patch       | 41 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  5 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
new file mode 100644
index 0000000000..0bac4412b1
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
@@ -0,0 +1,41 @@
+From d38b8fb5636c6d77f76dbeb5291f49ab594dcad4 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 11 May 2026 12:00:19 +0000
+Subject: [PATCH] Fix potential buffer overwrite that could occur in fts5 when
+ processing corrupt records.
+
+FossilOrigin-Name: 061febcf41ca4872a0f407951e1507209daca7895122b909a7806c60b6e200c4
+
+CVE: CVE-2026-11822 CVE-2026-11824
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e0b995b2a62b78979eb65bb8dadfa912eaa8e62f]
+
+Backport Changes:
+- Applied the upstream fts5LeafRead() fix from ext/fts5/fts5_index.c
+  to sqlite3.c because the Yocto sqlite-autoconf source uses the
+  amalgamated SQLite layout.
+- Omitted ext/fts5/test/fts5corruptA.test because this extracted
+  recipe source contains the SQLite autoconf/amalgamation layout and
+  does not carry the upstream Tcl test tree.
+- Omitted Git mirror metadata files manifest and manifest.uuid because
+  they are not required for the security fix in this source layout.
+
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 851a2504c..2f4b77429 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -248157,7 +248157,7 @@ static void fts5DataRelease(Fts5Data *pData){
+ static Fts5Data *fts5LeafRead(Fts5Index *p, i64 iRowid){
+   Fts5Data *pRet = fts5DataRead(p, iRowid);
+   if( pRet ){
+-    if( pRet->nn<4 || pRet->szLeaf>pRet->nn ){
++    if( pRet->szLeaf<4 || pRet->szLeaf>pRet->nn ){
+       FTS5_CORRUPT_ROWID(p, iRowid);
+       fts5DataRelease(pRet);
+       pRet = 0;
+--
+2.51.0
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 0a8727e4f2..2b0a9c0e4d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -6,4 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a"
 
-SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
+SRC_URI += "\
+	file://0001-Add-option-to-disable-zlib.patch \
+	file://CVE-2026-11822_CVE-2026-11824.patch \
+"
-- 
2.35.6


