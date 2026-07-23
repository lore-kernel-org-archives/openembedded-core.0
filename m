Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754D8C531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:44:11 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23829.1784814241773454263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MWR80HJx;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3354; q=dns/txt;
  s=iport01; t=1784814241; x=1786023841;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zcq7yQAfQ1lmEfyHIqbmlZRQUmj97HKr83KbaUFGKf8=;
  b=MWR80HJxeERE5FdBF0VOCGfJhhuAjv2OiFSlcq3/O5qIx/m2fSOx97rE
   CxKe3X39zNqdt2gaCu3LiMCQx0X9jnE0gr3XrdrEPXnmOpJHj/cCjtYbj
   qc5btqmEUhtQRJFWn8gauGHaJ0wDOh8YTnsZ3y/jx74o49cwHu/NxiE6k
   eaZ2YsOz9mDcdytAlKnKGj62BD67DpOqrUp8+18grBFriWUqIiFMCJ//7
   vYvEb79AwnENEcRDOqWVO+B7UwZTL2yHEv458TPyhBIDDQZiqZB/3uNIJ
   TXfKagRuryiuY7ERWquY0gJrIHSKEwf4ZqsqTyyA8TympucWVMLbz9ce8
   g==;
X-CSE-ConnectionGUID: BTzIH6xjQtmM3ssfGqgVZw==
X-CSE-MsgGUID: W7TQ5ZxtSxWPTaKIG0sNtg==
X-IPAS-Result: =?us-ascii?q?A0BEAgCwGWJq/5H/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?Z4egX4PAQEBD0QNBAEBhD+OIgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAS0LARgBWQMBAlojGQgJgnkBgnQDEcJNgXkzgQGCZ?=
 =?us-ascii?q?kIBPwJDUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKEfoEFgVwBAYEnhn4EgiJ6E?=
 =?us-ascii?q?oFaHpAkSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BLHmEW?=
 =?us-ascii?q?yMfAzl/gTB1SnctahIXgSaDSQKBHQMLGA1IESw3FBkEPm4HjWQjgkABgQ0BK?=
 =?us-ascii?q?gGBbRcoEaNEgh6hEgoog3WMIZU6GjOFW6URC5h9jgqWUIRpgWg8gUcLB3AVg?=
 =?us-ascii?q?yIJShkPji0LC4NggX+DFMVCPDUCCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:qabh2KkqO7FWUAz0CjpTBlDo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcC2iOO6mLYDemedh3bt+x/EJT75+ByoVrG1M5pChmEltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfnb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fack6MdXX3FMz
 OAdDWsWdR6snu2I8q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZz/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIIoLSHZwPxBjwS
 mTuwDvFO0woJMCk2QW9znuPp8CXhgXnV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:LGOIRK7YQLM4i4tL5QPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:XiglkG61kmbSjmZEKNss3nIGO+B7Yn/k0HL1eFSjB0lwR4OnVgrF
X-Talos-MUID: 9a23:Za5pCwauidDHzOBTiGDQvWxQJNtT85uWNEkusLpeoO+YOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="506001226"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 13:44:00 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 6C7B918000595
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:44:00 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 900A3CC037D; Thu, 23 Jul 2026 19:13:58 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] sqlite3: fix CVE-2026-11822 and CVE-2026-11824
Date: Thu, 23 Jul 2026 19:13:40 +0530
Message-Id: <20260723134340.2506000-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241843

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
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
new file mode 100644
index 0000000000..1764d5c6e2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
@@ -0,0 +1,41 @@
+From ceece94b0040125a12192f6f23b1ec413871b04c Mon Sep 17 00:00:00 2001
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
+index fb42adcd7..6acf46a5b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239694,7 +239694,7 @@ static void fts5DataRelease(Fts5Data *pData){
+ static Fts5Data *fts5LeafRead(Fts5Index *p, i64 iRowid){
+   Fts5Data *pRet = fts5DataRead(p, iRowid);
+   if( pRet ){
+-    if( pRet->nn<4 || pRet->szLeaf>pRet->nn ){
++    if( pRet->szLeaf<4 || pRet->szLeaf>pRet->nn ){
+       p->rc = FTS5_CORRUPT;
+       fts5DataRelease(pRet);
+       pRet = 0;
+--
+2.51.0
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 1b3ac83b58..975f3bdab8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-6965.patch \
            file://CVE-2025-7709.patch \
            file://CVE-2025-70873.patch \
+           file://CVE-2026-11822_CVE-2026-11824.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6


