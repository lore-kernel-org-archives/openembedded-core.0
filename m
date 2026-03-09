Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AEEF417EA
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:37:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16004.1773067041169404722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Kf0YJ3/z;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae5423b02aso54162165ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773067040; x=1773671840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6P983G9m2vH2bA+wLDOMtUI5W1hbqMUzLC1d6ijjxEM=;
        b=Kf0YJ3/znPtVc0ZzMFJpH1mwPq5rEqc7ZadWcRzsfPgVE5sUsfbC/XrPh9kS9Hadwg
         tVZBAl2Yg7Uf49BB42u2fwk31av9J+fMUQpOTklacX78NGhSZjdlnZ4q49t0M0bz2RZp
         dYmVmfwnpHkG4L7sp66HvYuAG4rXDtOBY+snk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067040; x=1773671840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P983G9m2vH2bA+wLDOMtUI5W1hbqMUzLC1d6ijjxEM=;
        b=i/WZU8oNH/bC9GFBCIF/2UbNOdqs/RT597l019tU3oNOPC1ZP3FynXvM3ofW4kJ0uQ
         f5LL5wNNuUsc4Su2Qtvg7JPAb49Uz8/yffBwRGOFIq/nA3BKGuVtbyp5YTKZAUHJNLhr
         gmdjkFCCB6v9kjSpo3BmzrtJn7+SKi+buvxfAWIwPgBr+Fj+o2AktfSxTY2EXpBFSZoa
         SpaHzpFMoESBf02lE5NKxNU0dyMlXt925R7W06y4mVW68Uh8BfebTDjYlRaEiIBC3vwr
         nTI6qS8OiXJKR16458VFztnSojxhBAysx39CLuMEaY/PPsofZD3jyNOPaM79WkFdtjWb
         PcNw==
X-Gm-Message-State: AOJu0Yyp/7nAB0zpHxlj3lpz1FHoTHMeiVdo4DSDhjVTipSt8kj4igO+
	STs2xFGB9fqAHzD6QmBOqP8djKOuhyO/fEGBtgxlFSriuuJXycABONdOTS+osNsr+5gqiLt5MDE
	2hpYm
X-Gm-Gg: ATEYQzyUEjk027UB+bJnaKg/POUGzW5I/Qqst6Yvzb5TBQKWRzwqj63PovcsZ2Aeqls
	q4+Br1SQGIcsdl5Kgw+PhBrYJx6t88QJ3pewwUv7xWfIgOkTT2iuahkPH1K6hbBNdjaca7Z0NGO
	tgliODC9qqfAYaOLzrPzKmi5Jl/RRZ1K6xJ/OJsQ3cOcQlA2lNHTRU1xnJhvHG/D0RDTmadk5l8
	bcNJ0PrfK4XS4014EiegSosZ9ebPCJfqHcRBj7MYSuFN2+CXoPsWtHzn0Sa1a8IHpKwQAlhqHps
	+88EBQLwEw4xvn1hrkS8YX2KZcYo/8g8okQuCTgGk/XJCZSsgpro1Dz1HHVkd0gg/ob1iXGQrpu
	Q2cZW9aUsIvZEMKycP/C9EvEKpAg6oNBGXwIaekpIj6KYJUo4L2QxQ3J5cQ+DYorYp4jt+ZWw/N
	M23EAxXzD7pvV0S0ATFn2nhrBdprrCJW57QltX
X-Received: by 2002:a17:903:1988:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae82433dccmr109417135ad.32.1773067039888;
        Mon, 09 Mar 2026 07:37:19 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:1b6c:f501:3067:34d0:f6d6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57c1csm164531395ad.18.2026.03.09.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:37:19 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch] freetype: Fix CVE-2026-23865
Date: Mon,  9 Mar 2026 20:07:10 +0530
Message-ID: <20260309143710.2567451-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 14:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232724

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-23865
           https://security-tracker.debian.org/tracker/CVE-2026-23865

Picked patch mentioned in NVD

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../freetype/freetype/CVE-2026-23865.patch    | 54 +++++++++++++++++++
 .../freetype/freetype_2.13.3.bb               |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch b/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
new file mode 100644
index 0000000000..aa0d4326f8
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
@@ -0,0 +1,54 @@
+From fc85a255849229c024c8e65f536fe1875d84841c Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 3 Jan 2026 08:07:57 +0100
+Subject: [PATCH] [ttgxvar] Check for overflow in array size computation.
+
+Problem reported and analyzed by povcfe <povcfe2sec@gmail.com>.
+
+Fixes issue #1382.
+
+* src/truetype/ttgxvar.c (tt_var_load_item_variation_store): Do it.
+
+Upstream-Status: Backport [https://gitlab.com/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c]
+CVE: CVE-2026-23865
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/truetype/ttgxvar.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
+index 2ff40c9e8..96ddc04c8 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -628,6 +628,7 @@
+       FT_UShort  word_delta_count;
+       FT_UInt    region_idx_count;
+       FT_UInt    per_region_size;
++      FT_UInt    delta_set_size;
+ 
+ 
+       if ( FT_STREAM_SEEK( offset + dataOffsetArray[i] ) )
+@@ -697,7 +698,19 @@
+       if ( long_words )
+         per_region_size *= 2;
+ 
+-      if ( FT_NEW_ARRAY( varData->deltaSet, per_region_size * item_count ) )
++      /* Check for overflow (we actually test whether the     */
++      /* multiplication of two unsigned values wraps around). */
++      delta_set_size = per_region_size * item_count;
++      if ( per_region_size                                &&
++           delta_set_size / per_region_size != item_count )
++      {
++        FT_TRACE2(( "tt_var_load_item_variation_store:"
++                    " bad delta set array size\n" ));
++        error = FT_THROW( Array_Too_Large );
++        goto Exit;
++      }
++
++      if ( FT_NEW_ARRAY( varData->deltaSet, delta_set_size ) )
+         goto Exit;
+       if ( FT_Stream_Read( stream,
+                            varData->deltaSet,
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.13.3.bb b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
index dbfffdb65f..1fda9c57e7 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec \
                     "
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
+           file://CVE-2026-23865.patch \
+"
 SRC_URI[sha256sum] = "0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


