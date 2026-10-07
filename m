Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6EACA6002
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 08:50:06 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4853.1791363005264810892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 01:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EobCRI54;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4334; q=dns/txt;
  s=iport01; t=1791363005; x=1792572605;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0Fx9cGwGj2+HBbB9aZT9TEqnNuiJCp/Q8yOzTgUJrI8=;
  b=EobCRI54NMJ3/XP9eOEcOjv5lNnqbu2DtRjlMEF1ISkV3NSUTc5bIhMD
   YD7JYhY1ZiUceu06o9ClG47e/rJHS/JeACz2N3N39KgQmPnVO6tL6ejI8
   I1OX6cRiIlWO8XCU38nnTRLrIk8ZD1tuEVrMjYr8mTv8pKK1Cjr0iW3Uo
   znTAh5HnGefvKdzr/4LM+sbjzNtnsWG5iQjkxRs1Vg2PjbLvwjDUglhoU
   5d1fzsUiyVGNcl5lmzRnnDlDh3W545lwJSC2dq3XEk7sgE9M8QdiYs+/8
   9ZtElgo8cEbfrEA8IkXXFR0eXbZm0/zGSu9NbibVfVO/6MJ6rmF3JTHor
   g==;
X-CSE-ConnectionGUID: O9UmpoExSLqWBM8KuhuhsA==
X-CSE-MsgGUID: ZoQKEYLJTtC7yvbNtLLm4A==
X-IPAS-Result: =?us-ascii?q?A0BKAgDWBsZq/47/Ja1aHgE8DA4LgVmCV3VgQ0mUKYIhA?=
 =?us-ascii?q?54agX4PAQEBD0QNBAEBhQUCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQDEbUgg?=
 =?us-ascii?q?XkzgQGDCh8BPwJDUNlKgWgBCxQBgTiFQIgjXRgBhHwnG4FJRIEVgTuCLoEFg?=
 =?us-ascii?q?VwBAYglBIINgQ8SgVqFDo5nSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kcmIggSCQETGjALgRs4PAkoQRcMKRgNSBEsNxUZBD5uB5BbHoJgAXoTASsXX?=
 =?us-ascii?q?AyBCQsoAg2KR5sRoQ+EKIwilToaM6M/hzALmH2OCpYBT4RpgWg8gUcLBzMaC?=
 =?us-ascii?q?BsVgyIJShkPjjmDa4F/yjonMgIJMgEBBwIHDgMLgWiQAi1vYAEB?=
IronPort-Data: A9a23:TGBiFKt5QRZZ2qh8u3m+w9a45+fnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWDTPvffM2unKI92YYvnphxTucTVyN41QQFuqy81Q3gQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvrb90s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw3bdKBHlJ2
 OwjDCkyRDXTpP+23bKgY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIIYbWH54MwxrwS
 mTuzWPAITwrEP6j1RHa42ymoPPruSancddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:/wPQuaBJlCLNfLHlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:327OJWzOGiV+J7NvEQ0/BgUzS/0ganrw3Ez0OnCSLDZKVb2ISUS5rfY=
X-Talos-MUID: 9a23:UYMrnQWXY5tiwzvq/A3rvRJPBeNK37iFV1ETm7Man+2BaQUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="532423154"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 08:50:04 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id E74F418000201
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 08:50:03 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 8F133CBF201; Wed,  7 Oct 2026 01:50:03 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH v2 2/2] hdf5: Fix CVE-2026-17574
Date: Wed,  7 Oct 2026 01:50:02 -0700
Message-Id: <20261007085002.1261301-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007085002.1261301-1-yurade@cisco.com>
References: <20261007085002.1261301-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 08:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247379

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17574

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Prepared v2 to include the previously missed CVE-2026-26197.patch
  and CVE-2026-26199.patch patches. Updated the source code to
  resolve hunk errors.
---
 .../hdf5/files/CVE-2026-17574.patch           | 62 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
new file mode 100644
index 0000000000..bebe52cbf2
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
@@ -0,0 +1,62 @@
+From 3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Thu, 28 May 2026 17:26:57 +0200
+Subject: [PATCH] Validate VL datatype type during decode and check file
+ pointer in H5T_set_loc (#6395)
+
+H5O__dtype_decode_helper() reads vlen.type from the file without
+validation. With corrupted HDF5 files (e.g. from fuzzing), this field
+can have an invalid value that is neither H5T_VLEN_SEQUENCE nor
+H5T_VLEN_STRING, which later triggers assert(0) in H5T__vlen_set_loc()
+(debug builds) or a NULL pointer dereference / SEGV in release builds.
+
+Fix by:
+1. Adding a validation check in H5O__dtype_decode_helper() immediately
+   after reading the vlen.type field, returning an error if the value
+   is invalid.
+2. Adding a NULL file pointer check in H5T_set_loc() before calling
+   H5T__vlen_set_loc() when loc == H5T_LOC_DISK, so the low-level
+   assert(file) invariant is never violated.
+
+This fixes the root cause at the decode level where the bad value
+enters the system, as requested in review of #6378 and #6385.
+
+Found by OSS-Fuzz via the matio fuzzer (ClusterFuzz testcase
+5366895365914624).
+
+CVE: CVE-2026-17574
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc]
+
+(cherry picked from commit 3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/H5Odtype.c | 2 ++
+ src/H5T.c      | 5 +++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/src/H5Odtype.c b/src/H5Odtype.c
+index 085ce24cd0..5022f43d7c 100644
+--- a/src/H5Odtype.c
++++ b/src/H5Odtype.c
+@@ -760,6 +760,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+              */
+             /* Set the type of VL information, either sequence or string */
+             dt->shared->u.vlen.type = (H5T_vlen_type_t)(flags & 0x0f);
++            if (dt->shared->u.vlen.type != H5T_VLEN_SEQUENCE && dt->shared->u.vlen.type != H5T_VLEN_STRING)
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL, "invalid VL datatype type");
+             if (dt->shared->u.vlen.type == H5T_VLEN_STRING) {
+                 dt->shared->u.vlen.pad  = (H5T_str_t)((flags >> 4) & 0x0f);
+                 dt->shared->u.vlen.cset = (H5T_cset_t)((flags >> 8) & 0x0f);
+diff --git a/src/H5T.c b/src/H5T.c
+index 1b4e182cce..f49b2b78cf 100644
+--- a/src/H5T.c
++++ b/src/H5T.c
+@@ -6365,3 +6365,8 @@ H5T_set_loc(H5T_t *dt, H5VL_object_t *file, H5T_loc_t loc)
++                /* Validate file pointer for disk-based VL types */
++                if (loc == H5T_LOC_DISK && NULL == file)
++                    HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
++                                "NULL file pointer for disk-based VL datatype");
++
+                 /* Mark this VL sequence */
+                 if ((changed = H5T__vlen_set_loc(dt, file, loc)) < 0)
+                     HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "Unable to set VL location");
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index d0da4dc086..22e77bd4e6 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2026-26197.patch \
     file://CVE-2026-17572.patch \
     file://CVE-2026-17573.patch \
+    file://CVE-2026-17574.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


