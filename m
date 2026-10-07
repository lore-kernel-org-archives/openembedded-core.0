Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D69BCA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 08:50:06 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5068.1791363005153087013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 01:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RXFsDcVy;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3745; q=dns/txt;
  s=iport01; t=1791363005; x=1792572605;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vt2Cwkipj/Q3cHCMRmlk0HftKWbbscGl0KgtZCwl9/Q=;
  b=RXFsDcVyssb3QQwvBVeToyfD9VAe6BZtRUOPm5ict75Tju2uRcilFZ8x
   6i/mRmhxZw16eF2VR0BCkDGy9GDYyywSxycZT8YU4n6nPV2r9f3aySu9K
   CfSaUrhhwjSPuPryO7emwveB85EHsKHZi4ox8VuNTiQl9jbtJMBY69/kI
   yPKhHy8syv5l9VcDL8jv1JYPbMUMzxylyRMhoHSKAKvqfQBzXZVYk+TGZ
   774MjCw045EfAPBCO7KonQdq5ff0fbd3fPB4iisU8zOq7bIeYGlnYJjpt
   L8iX4nx1j9c65wa59Jh22i0gp8a82l7I2UvZ9DqFDA5A4AlHpd52ek5WY
   w==;
X-CSE-ConnectionGUID: PZmjGRi7Rz2pWRxXTYonNA==
X-CSE-MsgGUID: UFzPnYLMS/qZtowBEbsYCg==
X-IPAS-Result: =?us-ascii?q?A0BDAgDWBsZq/5H/Ja1aglmCV3VgQ0mUKYIhnh2Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGTEAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgE4ARgBWQMBAlojIYMCAYJ0AxG1IIIsgQGDCh8BPwJDUNlKgWgBC?=
 =?us-ascii?q?xQBgTiFQIgjXRgBhHwnG4FJRIR+gQWBXAEBgUqGWwSDHBKBWpN1SIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF?=
 =?us-ascii?q?4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMKRgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5BbHoJggQ4BExggNxyBFTULpVqhD4QojCKVOhozhVulFAuYf?=
 =?us-ascii?q?Y4KllCEaYFoPIFHCwczGggbFYMiCUoZD445g2uBf4IIyDInMgIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAAEnBIFSAQE?=
IronPort-Data: A9a23:WFgZq67O4TDy4Hc4NPkXYQxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mQWXWmBMqmONzakctl2aN7kpB9XuZbSmINiGQRqqnsyZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpMtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eBb8d+MlNAD505
 6YAFwodXiyygOSQ6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4OFIIzSHZQ9ckCwm
 0zUx2LIJjQhc8Wt1T2a2F+mnd7kknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:Sj/5natCXiC2/BS7e9sQVvoL7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AU6lC9Wl9qSxVIZR6r/1SNb5IoufXOUXvyXX/GU7?=
 =?us-ascii?q?nM3QzUIKvWW+syaRiteM7zg=3D=3D?=
X-Talos-MUID: 9a23:OwMUlwSbp5hnU45bRXTRqiNaMvZMxp/pEXIRlooslsOfBAd/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="531828009"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 08:50:04 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id E40EC18000466
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 08:50:03 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 8B6BFCC1611; Wed,  7 Oct 2026 01:50:03 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH v2 1/2] hdf5: Fix CVE-2026-17573
Date: Wed,  7 Oct 2026 01:50:01 -0700
Message-Id: <20261007085002.1261301-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 08:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247378

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17573

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Prepared v2 to include the previously missed CVE-2026-26197.patch
  and CVE-2026-26199.patch patches. Updated the source code to
  resolve hunk errors.
---
 .../hdf5/files/CVE-2026-17573.patch           | 49 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
new file mode 100644
index 0000000000..0acbbbf0c8
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
@@ -0,0 +1,49 @@
+From dd3080a58cc6bb86f3b34284399915da9e513262 Mon Sep 17 00:00:00 2001
+From: jhendersonHDF <jhenderson@hdfgroup.org>
+Date: Tue, 27 Jan 2026 05:55:38 -0600
+Subject: [PATCH] Fix double-free issue in H5D__chunk_copy (#6160)
+
+Fix double-free caused by loss of buffer pointer after re-allocation
+
+CVE: CVE-2026-17573
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262]
+
+Backport Changes:
+- Omitted CHANGELOG.md file changes
+
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+(cherry picked from commit dd3080a58cc6bb86f3b34284399915da9e513262)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/H5Dchunk.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Dchunk.c b/src/H5Dchunk.c
+index 4727cc5d12..86340be16e 100644
+--- a/src/H5Dchunk.c
++++ b/src/H5Dchunk.c
+@@ -6809,7 +6809,7 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+                 H5O_storage_chunk_t *storage_dst, const H5S_extent_t *ds_extent_src, H5T_t *dt_src,
+                 const H5O_pline_t *pline_src, H5O_copy_t *cpy_info)
+ {
+-    H5D_chunk_it_ud3_t udata;                       /* User data for iteration callback */
++    H5D_chunk_it_ud3_t udata = {0};                 /* User data for iteration callback */
+     H5D_chk_idx_info_t idx_info_dst;                /* Dest. chunked index info */
+     H5D_chk_idx_info_t idx_info_src;                /* Source chunked index info */
+     int                sndims;                      /* Rank of dataspace */
+@@ -6974,5 +6974,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+     /* Initialize the callback structure for the source */
+-    memset(&udata, 0, sizeof udata);
+     udata.common.layout    = layout_src;
+     udata.common.storage   = storage_src;
+     udata.file_src         = f_src;
+@@ -7024,3 +7023,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
++done:
+     /* I/O buffers may have been re-allocated */
+     buf = udata.buf;
+     bkg = udata.bkg;
+@@ -7029,2 +7029,1 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+-done:
+     if (dt_dst && (H5T_close(dt_dst) < 0))
+         HDONE_ERROR(H5E_DATASET, H5E_CANTCLOSEOBJ, FAIL, "can't close temporary datatype");
+     if (dt_mem && (H5T_close(dt_mem) < 0))
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index a69e86ee5f..d0da4dc086 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2026-26199.patch \
     file://CVE-2026-26197.patch \
     file://CVE-2026-17572.patch \
+    file://CVE-2026-17573.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


