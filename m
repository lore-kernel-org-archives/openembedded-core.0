Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06A2CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 17:10:34 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2839.1760980231895929819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 10:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=DhkubjNS;
 spf=pass (domain: snapchat.com, ip: 209.85.218.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso815041066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1760980230; x=1761585030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jpgC6K7KqhYBCuGrt/mO1qXNNhNo1wGcs06X4jKmU8=;
        b=DhkubjNSF12Jl+w543WT9+fqD+GL1/ThtDQQv6ShNYnKLg21wh0HsEGxnZqEt0SGVu
         ZN4my4zAbeinANXOwyMyUyk+MBVvkxhj9wld2W9o7ks4UAoHCl6SK7UXr2Sx4abY920E
         XcWCb6kKqJORl4mgrJk3Rcn1P6ssqVoot2mo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980230; x=1761585030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jpgC6K7KqhYBCuGrt/mO1qXNNhNo1wGcs06X4jKmU8=;
        b=E5tGBbOOr2p2ppZYUO6HxII4IjCjeaQeNQ8HmeZbeYVqowqXOz6JDUnUA3Dpf7knGw
         vfsqDqifKhRgsvVfh0mPD+SzSQ+NVS8OATn0V/SVi8nMqk3rNizzSXtB2Jwpz//Q5Dyf
         3zngVa8pMmPB0AlMEjHny3eYSAJPnQBnLYL/3pttudqYs7fv/fyoizvFWkzqd6e0Ft7n
         KAynQOaP0OlSyv7qML5WMbQbNjBIL92C6+tX/m3Hv7i9ZCTk1GnZfuJFMtUU/8A87tKL
         hMpe+tdfBWtC99oGPuUe0MACHcIDFV88BmIEc1p4jyoxaF8Qs2jb6ubMh0PKcSlB4lBF
         Xr1Q==
X-Gm-Message-State: AOJu0Yz3y+LkfvYWN0vqhsug0iHQQNnwHS34BPvos/OBWlL4azzEYxbf
	HIRb8hhdaYzZtQaPGDs4qUcrkfwOtQvZBDd8TaBz8xymy6fNPecxvYMtJuHiBX2H1SxQC29JwSM
	na6sdENM=
X-Gm-Gg: ASbGnctpq1ntSdc6foRb0UNy46gRg8RDu1M470X9/dqMximZqe+o17zD2fdOv05i9Td
	zruifReTvTQiXiUgs6Xmi+buqT6FyP0fgmlOh8IQpezsn3GeQ6NJLc9+sJ2vo9OIITKvqD51jrn
	VbBztGqGSgBPzonQOGq/3ywQRivWVHzITX6GiySazo7PG5H7akIJKuX6AXK80mUpCTgcncaoRa5
	p/Me/FqazuEos4e5whI6Kzbc7z+wYu2Vf6g7TEaX5xnO1itr/Pv6nzvo4+4sO/d/wU1a10QV6Up
	svJr0rS2DNIrfjjPw7mHy86Z7JUsBrWlwvHO8d6Kzy9YhWG3bErCJZ/ulVtqKA+fzx4daFsAMq2
	pX/x1PHSkxRDIoMX9sWhCvquLKqkxPpn/m6EKfR5hh/gWiqi6aDgL4kBqxSVf76LlgZ2d1mjPwq
	n6yg41uBruwEXAog3q80pOAHq4/ht80h0Q0llI8je7GPPq
X-Google-Smtp-Source: AGHT+IETCMBTJ40f7a6EmU3zYeYT6idG6p9TcQ+iWuuWZRF/yF3KeEMxl6huereJnAir6FGgCtF22w==
X-Received: by 2002:a17:907:2685:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b647254f6bdmr1531984166b.3.1760980229778;
        Mon, 20 Oct 2025 10:10:29 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6aaf93a32asm387935866b.51.2025.10.20.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:10:29 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v3 1/2] opkg: upgrade 0.7.0 -> 0.8.0
Date: Mon, 20 Oct 2025 19:10:25 +0200
Message-ID: <20251020171026.2965650-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 17:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225128

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at
- http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-notes

[0.8.0] - 2025-01-10

The minor version bump in this release is due to the changes to cURL error output line format.

- [Changed](https://git.yoctoproject.org/opkg/commit/?id=ab03377868256427279b36c4b2a298edae4260b8) the error output for the curl download backend, to now report the HTTP error code for failed requests.
  - e.g. `error: log_curl_download_error: Failed to download headers of https://foo.bar/all/Packages.gz: The requested URL returned error: 401`
- Enabling debug-verbosity, while using the cURL backend, [will now](https://git.yoctoproject.org/opkg/commit/?id=ce6fede3db931bb0da70d1334cdc4101d0aec702) print cURL's verbose error log to stderr when there is a download failure.
  - The verbose output may contain confidential information about your cURL transactions. So this is your reminder that debug-verbosity should not be enabled in production systems or sensitive security environments.
- The commandline configuration file option (`-f`) [can now](https://git.yoctoproject.org/opkg/commit/?id=36d08b93d2859992b624a4ba2f412cfa5c766050) be specified multiple times, and each configuration file will be loaded and their settings merged.
- [Fixed](https://git.yoctoproject.org/opkg/commit/?id=c87188d7535684fddb8cf80993c147b215602b63) a bug in control field parsing where custom fields whose keys are similar to other fields could be confused by the parser.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/{opkg_0.7.0.bb => opkg_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb => opkg_0.8.0.bb} (97%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb b/meta/recipes-devtools/opkg/opkg_0.8.0.bb
similarity index 97%
rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.8.0.bb
index 95480b47164..12e2edf7e3f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.8.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
+SRC_URI[sha256sum] = "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.43.0


