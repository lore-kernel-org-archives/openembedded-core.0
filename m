Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B6CCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 16:37:56 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.27980.1760891870841464303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 09:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=m6L3LAKw;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8915bd01244so436890685a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760891869; x=1761496669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfJfU1wM3zm1JwQ/LLM6xRluZfTTYsk1TBZWAmmLkwY=;
        b=m6L3LAKwZnMHYQJ9biLp/LRwlR3MGuc+rTbBE883ZUZo3HJaP7WquNp4+QFpkfAFK+
         gCrOnnfYp/sbwY5BxzXqqY/8Vy4dgsusI5Kmj2CnmjEXT0z42hwJUHXSPr47E9Gc7GeM
         VCEsSWzyK/u5x3cnJAhJWAPhPJ50eYo3n+nxgCKLrptF5W8dhFeYgu4P1iGmKRERGGC3
         DS/iDO/ZZQhY28pPsqQ+aghmXy0+qu6IrbZogUaMPQHqkL9gROaosBBKogUFflwgMB8Z
         EuYd3xUWeIXSXphBtTpvd5jO1LXQt/dgSZqSYu0S7KBoTWX+awpdwanOxJcfooISgoXi
         6g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760891869; x=1761496669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfJfU1wM3zm1JwQ/LLM6xRluZfTTYsk1TBZWAmmLkwY=;
        b=Xw9cKhiSyyRvIY0UVNEU9EdLsrr7+RlsdPXyiUR9rqGTj29K2MD9exLAr4CGIXvmlf
         /5r4GduKPX2sHnyJAGjxUAJjpBAvXpwaJGA4957e2Z9wHSHtXsu4L71q3g/3hipMrDFr
         VAC4C8Rk+87x9vc0fsvUjbn1RJPtaquMzL+rNzEQ66/GoLvmgZqYZlRMlcLZ3lT1p+6h
         G4afW7lJVQVaF7IneZHVnaDiFVDXJhJXMmp6c7skc2ZQhC/j0EKbcqTZKeSkl37JCO+I
         8LnuTqEGQoDbRTiGLL+oWJIc4A6D2cDHdu46n0bPq/72ETaHS7lINAHaT0Z2jbwb+mCl
         FJCQ==
X-Gm-Message-State: AOJu0YySdjiprKtgTXwRDwIxg1mIK29cK21BpsvKNsJuz+LIneeYIQsk
	EF72Lar9jYcOp2ZRNuPT0ZiUPQkq7HOXKIOw/8uuV+0RskoJqXUe8DvtfRzLjm/ao2FRc/a3x85
	DdDS4BJM=
X-Gm-Gg: ASbGncsZ780+wkrMTrPSDEyBnmUKH+i//O6iDAs57IAI+pPly7QG9qMGRtKr4kWgCRW
	KJuXIK3bK3NMwz99uf0gAsa0YhU+xWH3UPzFmn5qMlE+uTqSAZV8BG6xhlKK719PVXNfqgXZ653
	XWOBNBZBWbsHRItCjIFUVe6qGp0UyfeWh0qp0N9ZSNy+9iuSW/mYF8m/tam30lBSrTxSJXGlySw
	j40XWSp7e927ONmV4iUQXN7EihYPE1QLBfFF3k6boVWRoGl7oR3IZJ7fLzkbSVuqowUJTzklM6M
	saeKhob3FOzUz3OhdLvbaEE7oxiM1On6eFfNIxxF7OzlA6GRDW5Lq7VxJ0SXehggaekhgV9hrZF
	/0lNRiqwJEIGMGP6/m7uUQ+WPT8ZGnLZ5jA8jSXkBAlX/BMHj4LWLSCuV39EDiZdRNFl6CRd7qO
	zd5km8sGlwSQHSmbQ=
X-Google-Smtp-Source: AGHT+IF79zaR+JP5+c33sH+sFmB9zr3b/3ImWf36rsKuk6SnzrGlqaSzAMRr5T10P5KrIVwRMr7iLw==
X-Received: by 2002:a05:620a:3955:b0:892:495f:70be with SMTP id af79cd13be357-892495f738dmr564295285a.46.1760891868551;
        Sun, 19 Oct 2025 09:37:48 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba8f0sm380580185a.40.2025.10.19.09.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:37:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 2.3.3 -> 2.3.4
Date: Sun, 19 Oct 2025 12:37:43 -0400
Message-ID: <20251019163743.1453141-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 16:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225084

Reproducibility looks OK.

ptests look OK:

|============================================================================
|Testsuite summary
|# TOTAL: 48977
|# PASS: 46513
|# SKIP: 2426
|# XFAIL: 33
|# FAIL: 0
|# XPASS: 5
|# ERROR: 0
|DURATION: 119
|END: /usr/lib/python3-numpy/ptest
|2025-10-19T16:03
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Release notes (https://github.com/numpy/numpy/releases/tag/v2.3.4):

The NumPy 2.3.4 release is a patch release split between a number of maintenance
updates and bug fixes. This release supports Python versions 3.11-3.14. This
release is based on Python 3.14.0 final.

Changes

- The npymath and npyrandom libraries now have a .lib rather than a .a
  file extension on win-arm64, for compatibility for building with MSVC
  and setuptools. Please note that using these static libraries is
  discouraged and for existing projects using it, it's best to use it
  with a matching compiler toolchain, which is clang-cl on Windows on
  Arm.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_2.3.3.bb => python3-numpy_2.3.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.3.bb => python3-numpy_2.3.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.3.bb b/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.3.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.4.bb
index 9968d89c13..59daeb5266 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ddc7c39727ba62b80dfdbedf400d1c10ddfa8eefbd7ec8dcb118be8b56d31029"
+SRC_URI[sha256sum] = "a7d018bfedb375a8d979ac758b120ba846a7fe764911a64465fd87b8729f4a6a"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.51.0


