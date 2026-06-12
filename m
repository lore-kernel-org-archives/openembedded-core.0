Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97888CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:18:40 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69120.1781266706209870303
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PrraaQDZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3361; q=dns/txt;
  s=iport01; t=1781266706; x=1782476306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JR2C+eSvl0w5Sp5RSFjrc+twQ4f9ZVIWBCXXEfVyjWA=;
  b=PrraaQDZH2bhZixfsqmMiOGRrRRI6QA0tjiqEht1e75Hr3Jo1FxwJJMI
   m3u0cEKouUd59eINHRgl4qiX85axggkJL+qw2aXoiBUOYwUfMZ65Rv8Uw
   Nf3Dy64NzT+sR31FBnJHZCqp7NJ/WYb9vM8B/MZT6Jzs5HaM5PZRgCAd1
   rZ3oQj2E2L3QU6UrzQXOaC2UcRpDzErwh6OCnRFdxBezI3YcQQAQlSuH4
   uuwJ4Bwj2EAe/fAuYLWbo3LSNUIjDzr4yX/RcxULY6iTKEWdRUuhvs9wD
   +JrpopiVX69v7i3L7RNZO+4J2/7vMR/nvHQwH8esL2Y18RKr1TcBt13eF
   g==;
X-CSE-ConnectionGUID: fElPrjO0S7aWn2UY54l43g==
X-CSE-MsgGUID: 49EguB1aRRyTiykEqZJb4Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgDf9ytq/4r/Ja1aglmCV3RfQkkDlkgDi2SSNxSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBgKNQAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAycLAUYQHAMBAhYZIAsjCBmDAgGCOgM2AgERskYaN?=
 =?us-ascii?q?4F5M4EBg1oFCQJDUNhJDYJWAQUGFAEFgTOFP4J8hSNbGAGEfCcbG4FyhH6BB?=
 =?us-ascii?q?YEaQgWBFoEGhgYEgiKBDIFdHoIuggqKM0iBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYFKgStqgQOFDSMfAzl/gXSBKGdpFTA1gQEBERIDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4xCFw+CHiABgQ0BK3uBGRildqAecQoog3WMIY8+hXwaM4QEl?=
 =?us-ascii?q?BeSUZkIjgqECZErgRyEaIFoPIFZcBWDIlMZD1aNYoNrhRPCfiQ1CwMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJF9AQE?=
IronPort-Data: A9a23:Qt/Fi6j6Jb41FVvDrbMLpKkbX161MREKZh0ujC45NGQN5FlHY01je
 htvXGzSOvuDN2rzc9gkb4TlpEhX65TSzNFlTwpr+X1jRntjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfvZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUW1+JPG2Npr
 cdHIQ8LNC2y2r6ynOm0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9JoPbGJ0EwB/Cz
 o7A1zioLx4HHoWW8wCUznO9hcLWrwHxBLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:glb8nq17F2kqDbvDBU9VSwqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WByB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3ARoG6k2lRhnejkJM74kDZ6PPrW+jXOXPwyE/KIWj?=
 =?us-ascii?q?gMjlgd7vPdG7NpKc4yMU7zg=3D=3D?=
X-Talos-MUID: 9a23:K1HHmgQnzUh17oZ7RXSw1RxtKe0x6p6UGXwMgJYrovumP3BJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="479509612"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:18:25 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 2B7D218000307;
	Fri, 12 Jun 2026 12:18:25 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id B4662CBF203; Fri, 12 Jun 2026 05:18:24 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/3] qemu: Fix CVE-2026-2243
Date: Fri, 12 Jun 2026 05:18:17 -0700
Message-ID: <20260612121820.2298565-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260612121820.2298565-1-asparmar@cisco.com>
References: <20260612121820.2298565-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238613

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v10.0.9 stable backport for
CVE-2026-2243. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://gitlab.com/qemu-project/qemu/-/commit/37ff880a1252de304985c7e8493765014012ed2f
[2] https://access.redhat.com/security/cve/CVE-2026-2243

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-2243.patch             | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3b5146e981..9357a8c6f0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
            file://CVE-2026-0665.patch \
+           file://CVE-2026-2243.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
new file mode 100644
index 0000000000..f67dae85dc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
@@ -0,0 +1,45 @@
+From 8480e4b3718302e7f63efb87e07720f70509c8c7 Mon Sep 17 00:00:00 2001
+From: "Halil Oktay (oblivionsage)" <cookieandcream560@gmail.com>
+Date: Tue, 10 Feb 2026 13:33:25 +0100
+Subject: [PATCH] block/vmdk: fix OOB read in vmdk_read_extent()
+
+Bounds check for marker.size doesn't account for the 12-byte marker
+header, allowing zlib to read past the allocated buffer.
+
+Move the check inside the has_marker block and subtract the marker size.
+
+CVE: CVE-2026-2243
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/37ff880a1252de304985c7e8493765014012ed2f]
+
+Fixes: CVE-2026-2243
+Reported-by: Halil Oktay (oblivionsage) <cookieandcream560@gmail.com>
+Signed-off-by: Halil Oktay (oblivionsage) <cookieandcream560@gmail.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+(cherry picked from commit cfda94eddb6c9c49b66461c950b22845a46a75c9)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 37ff880a1252de304985c7e8493765014012ed2f)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ block/vmdk.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/block/vmdk.c b/block/vmdk.c
+index d6971c706..7f63d0947 100644
+--- a/block/vmdk.c
++++ b/block/vmdk.c
+@@ -1949,10 +1949,10 @@ vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
+         marker = (VmdkGrainMarker *)cluster_buf;
+         compressed_data = marker->data;
+         data_len = le32_to_cpu(marker->size);
+-    }
+-    if (!data_len || data_len > buf_bytes) {
+-        ret = -EINVAL;
+-        goto out;
++        if (!data_len || data_len > buf_bytes - sizeof(VmdkGrainMarker)) {
++            ret = -EINVAL;
++            goto out;
++        }
+     }
+     ret = uncompress(uncomp_buf, &buf_len, compressed_data, data_len);
+     if (ret != Z_OK) {
-- 
2.44.1


