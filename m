Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465E8C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:32:58 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.630.1743435173320953415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 08:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=x4A20uMq;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c55b53a459so486657585a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743435172; x=1744039972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mtmb1GdJHPX/73C+U6hTtifc8OOZ26K10g4wVHfR8yo=;
        b=x4A20uMqs5t1nGUUcqFmx/r0SBilmC6ZRnLB8UlYQbW90+sDdh9OHy5s9Pow/7/FAf
         Nk8VRC4U9q+EXYOv+QfpimsdsNVJ1ZSRcN63PlmC9aBppejxD1qFHZygFQwZrZiOmIQO
         c2StQ9oQLhHgoEQCGuRHFHgnHovsBBNDsYCld/+vUBX4Lw3c1wL0P7LQCxwDR4+ZYJp0
         /F7/Mr8k5U6Z4w+rPfQaBKPOPeuQ3v1wCZqcNGyH6jPX73wV/ZxtFxIeH8iCyBoiTmzi
         EzVWBLCrGRmnN1n09y2y5I3jQTtbZJJXj26qBjsf5Q6maRZn7/2bDcWnl30eM9ZcJsfu
         +NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435172; x=1744039972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtmb1GdJHPX/73C+U6hTtifc8OOZ26K10g4wVHfR8yo=;
        b=OVyxpQD3DPK8g/91+5KqZNpf2DaUXaxY2RtOIXsGF8fsDamMNjBpT5zX7Sh/DZOYyF
         vBfmjNLINwgXopsCixcTtQV4PZbBWhFlDHTuLy/vPXIy+zLqlPZ+c9Jo8lULiI6lPTOY
         5L03DFieIt3vYxksaEFebPg6w7/WGwKr51kmR3gNsSeozFO1XSbu12zL6VuaFdlSYawZ
         Ck44QUMpnPCGFdU1zJXHDl61ceLIUYeqYmKAnDC4Rf2tuvmXWxuHnchSZNwfcrg97ajX
         e8C+Me3jlob4SUXKMCfBEmfoqNj6GvF080c4KKOoH4Fe+K6fNaEVrI28k/2PM/PL3rvc
         eDuA==
X-Gm-Message-State: AOJu0YxXIS1u82CEP0r6uo4QQny2FQhjJh2u8yNDywtTa+8509OSqXNg
	3m7vSO1syXoPjRZ3tyANAMRKTRsK68wIQ0MEu2xNVyhMMm9rrbstsiBJLpDkH43TgAEF6A9YbZ+
	bgEo=
X-Gm-Gg: ASbGnctn/UnzjM0mxF+nQdWik1GpiQDUDEzbViQ4hsfGbdUWxK2PWC13xPUtWT5mTY7
	vnVUVQ0H7zOtpdRDSl2+BXyzZETlZe3pybdOO07sQbeiqeSzqENIFhyPcb2s+g+TKULbrnvyr+O
	sgmCKm9J3R5Kh9eyuYRWGW7t/MGA0W/TppuWJ4Q8I0u5mK+KuQ6CFS5nSZkOtCC3OLtXT5y6kkx
	2Mteh/ylyWZgmvfGsrKxLQSiHstXMJE40+dWWTFOMgnjAlB1RLjRpkLKN7Vd+seo6xiFEgjQ/U0
	U2+1AujpkaOO4GCTAeZE8D3gbtoEkZyT2oFzZKh8VxIZKBdxjslhHrfPPriCZcYNYeOEeTQr+FD
	xa7AIG+obGoUAQh0=
X-Google-Smtp-Source: AGHT+IE32dPwAMDaOWFD9pv6JJuEj5ZMHH+tM2D26K+Y+2HyQQT1gGg3gQUh+0FvofZOtSzgq4m5Dg==
X-Received: by 2002:a05:620a:4106:b0:7c5:6a35:81c1 with SMTP id af79cd13be357-7c69089025emr1135706185a.48.1743435171719;
        Mon, 31 Mar 2025 08:32:51 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f765ad89sm513449085a.16.2025.03.31.08.32.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:32:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 2.2.3 -> 2.2.4
Date: Mon, 31 Mar 2025 11:32:49 -0400
Message-Id: <20250331153249.319860-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213984

Changelog (https://github.com/numpy/numpy/blob/main/doc/changelog/2.2.4-changelog.rst):

    #28333: MAINT: Prepare 2.2.x for further development.
    #28348: TYP: fix positional- and keyword-only params in astype, cross...
    #28377: MAINT: Update FreeBSD version and fix test failure
    #28379: BUG: numpy.loadtxt reads only 50000 lines when skip_rows >= max_rows
    #28385: BUG: Make np.nonzero threading safe
    #28420: BUG: safer bincount casting (backport to 2.2.x)
    #28422: BUG: Fix building on s390x with clang
    #28423: CI: use QEMU 9.2.2 for Linux Qemu tests
    #28424: BUG: skip legacy dtype multithreaded test on 32 bit runners
    #28435: BUG: Fix searchsorted and CheckFromAny byte-swapping logic
    #28449: BUG: sanity check __array_interface__ number of dimensions
    #28510: MAINT: Hide decorator from pytest traceback
    #28512: TYP: Typing fixes backported from #28452, #28491, #28494
    #28521: TYP: Backport fixes from #28505, #28506, #28508, and #28511
    #28533: TYP: Backport typing fixes from main (2)
    #28534: TYP: Backport typing fixes from main (3)
    #28542: TYP: Backport typing fixes from main (4)

Reproducibility looks OK:

2025-03-31 11:23:01,459 - oe-selftest - INFO - Checking ipk packages for differences...
2025-03-31 11:23:01,510 - oe-selftest - INFO - Reproducibility summary for ipk: same=107 different=0 different_excluded=0 missing=0 total=107
unused_exclusions=[]
2025-03-31 11:23:01,511 - oe-selftest - INFO - Checking rpm packages for differences...
2025-03-31 11:23:01,564 - oe-selftest - INFO - Reproducibility summary for rpm: same=107 different=0 different_excluded=0 missing=0 total=107
unused_exclusions=[]
2025-03-31 11:23:01,567 - oe-selftest - INFO -  ... ok
2025-03-31 11:23:33,135 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-03-31 11:23:33,135 - oe-selftest - INFO - Ran 1 test in 1411.458s
2025-03-31 11:23:33,135 - oe-selftest - INFO - OK
2025-03-31 11:23:38,075 - oe-selftest - INFO - RESULTS:
2025-03-31 11:23:38,075 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1379.73s)
2025-03-31 11:23:38,079 - oe-selftest - INFO - SUMMARY:
2025-03-31 11:23:38,079 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1411.459s
2025-03-31 11:23:38,079 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_2.2.3.bb => python3-numpy_2.2.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.3.bb => python3-numpy_2.2.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.4.bb
index db9a99946ca..a2ee2b48d46 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "dbdc15f0c81611925f382dfa97b3bd0bc2c1ce19d4fe50482cb0ddc12ba30020"
+SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


