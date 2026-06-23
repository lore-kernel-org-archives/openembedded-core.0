Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED87FCDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20833.1782220472765060261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oNSSSLsU;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso57946045e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220471; x=1782825271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGUGz12nZ0mMLDekPxUOI0sbehsmwysFzGylWX/PYcw=;
        b=oNSSSLsUa99ZShn2PhUwuqKLGAx4n96kHUJUMZAa3wXtQ3KBhkMSwTf0a9+/r6bpuE
         4UR9HL7ITGbQVYU/AtqvKdKvb3ow9XEh7BoNSAshbZzRph+PRnZLM9ObAnSnM58xDN2p
         LwtvfKCY7HpxQp83hJxUlEVVajQkN3efr7SuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220471; x=1782825271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PGUGz12nZ0mMLDekPxUOI0sbehsmwysFzGylWX/PYcw=;
        b=B+mTByASzSuV/Zd9aZYxqW02gAe+9O2Dqaw69W6pSypMxGjr4qds+h64ZxP/ZkJVd9
         PoiMwkJ2EA9fdH6BHXYYal+Ec5UpAO9PQ4ENr+S2ftP9KDL13tmw3tDmTGl5GswEUZC0
         Cu3EASR6rA6FIFxxKO7BoNKKeWjRseGyW9nXQAop2xJvtJRVgZzw6F4ibxG2f+NDhwQt
         KBb2/BCBwJwpt/8HFRa3QQnPwQUqQbKKCGDPDHw61DWaxgI3cx1DH8JGoZFDRLCkS3M3
         df2gP+7zOtw/mxVTABMfc3GWaHh/CAnWuPgPukme21YfMPk4pw4Zbgsm1qB974P7gLkK
         6umg==
X-Gm-Message-State: AOJu0YzWrwCjuvMfAplVuqiVK9YidysuOoacuMB8HHno3pY8bFJ7/BVL
	difsULBJneQVwC7SJeuVvyvXmre/+GdY9DgKsPlnV1NPAn4TRBlUgtYdbcrHcm8dh9jsfUIjw0g
	Bgmcq
X-Gm-Gg: AfdE7ckfYZkocKO2E/o847N36RcqhQYRlelaTjm4Ox7tIo1SeRhf4kpw1/KJVxaaGsb
	ncV1vnhq1I8gcmbBHWPva+IFhNimN55GSD970743OgSNrV4wjH3+4y3Okq4qu+e/rVzh5N8BM6W
	OSvkIKnZ9FPKtn0JNemuQR7j838Wz1zfXD4FH+99UZ3ZTemwx5JMtBHTxA/yiUQKV0F6OH6CmBS
	GtkR8Da1wyNBjZw0HbO9JSTUAXVMUMlum6Nl+oQDu5xERYa/ebPv/SiFzRHydcaXZ3ay42jw6ed
	TAkj3/dPBPncSa+muEO9E81QaCri2SvWunhAgkRqkGhLEpRsWPpqN7IBei8JcKPdb6f/3B5ZOAM
	x8L2QYGVL10669UdDifeQWp0kH1W0ZZAenNfCisjDNMd230FCvc71kWXyG07u19kh8h5JvFWP2G
	NvA2TUcGiK2x3qaa+d84l2+g+qtq2Bn3BLGCcWSBN7g8BysxNVx1+1X75Cr+vBr52ZA7T7JPam7
	rDGJ69hUWwudYfwXCRdpmcEZ3+W
X-Received: by 2002:a05:600c:8b75:b0:490:d946:47cf with SMTP id 5b1f17b1804b1-4925b389c82mr42210975e9.4.1782220470748;
        Tue, 23 Jun 2026 06:14:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/26] binutils: Fix CVE-2025-69644
Date: Tue, 23 Jun 2026 15:13:48 +0200
Message-ID: <267ff299a6fe6f65e0dd86f5e59bb013921526ce.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239373

From: Deepak Rathore <deeratho@cisco.com>

This patch updates the existing CVE-2025-69647 backport metadata for
CVE-2025-69644. NVD records for CVE-2025-69644 and CVE-2025-69647
reference the same upstream binutils fix commit [1], and the public
CVE advisories are referenced in [2] and [3].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69644
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69647

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc               | 2 +-
 ...VE-2025-69647.patch => CVE-2025-69644-CVE-2025-69647.patch} | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69647.patch => CVE-2025-69644-CVE-2025-69647.patch} (96%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 1a865c45f4f..7e83f72632f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -72,7 +72,7 @@ SRC_URI = "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
-     file://CVE-2025-69647.patch \
+     file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
similarity index 96%
rename from meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
rename to meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
index 8e3c1c79e7d..c6b3cefed2b 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69647.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69644-CVE-2025-69647.patch
@@ -12,11 +12,12 @@ length too.
 	length too small to read header.  Limit length to section
 	size.  Limit offset count similarly.
 
-CVE: CVE-2025-69647
+CVE: CVE-2025-69644 CVE-2025-69647
 
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=455446bbdc8675f34808187de2bbad4682016ff7]
 
 Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
 ---
  binutils/dwarf.c | 20 ++++++++++++++------
  1 file changed, 14 insertions(+), 6 deletions(-)

