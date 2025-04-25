Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC695C369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:37:12 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.12252.1745602627624176266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MGQbSfqV;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4811fca8658so2065361cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745602626; x=1746207426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hr3/X3I/IX8UvNWrritMRvI+B+Bzzj1ee3v05pPg4w=;
        b=MGQbSfqVjgq90Oce3eY+K2JaPoTEDI4QrdMw/PYneR3r3ajPLlYV3uH434XEy8D+OB
         Fo/ERH2/nztJIIKhn9ju/sA77/uu/9dNFi2eXNKM8KafewAWkXbMC+HsvtOkuQknawr6
         8+VdIvjDwVFRFEsamQhQqOILSUaoYcZ2XO1QA52X47ATAyJjowcQaWK/8GXBvgZFFbNy
         gDRaIJKFdgWNSv17qARPNw+xnMujbdCFZYqu0W0+xStXBM665XgDGnXk6fXDmOT3E5vR
         RTJTCHBwsF1qG0YiRV4/SpFzvQ1GdJk0LUFAR87w9O7H8CaOg4xmI21gCzBPlMFlIxRh
         eLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602626; x=1746207426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hr3/X3I/IX8UvNWrritMRvI+B+Bzzj1ee3v05pPg4w=;
        b=U6z4072QijSlJfzU8AR3BlH/UU+fIdSwZyzsxw45v+CdQZF47qm19HC2fVcYRjyxWI
         t9CbBj2CNuFyJxe06eqcnqKaI+CBjlHzxSdf8uydHMvoOEQZVLhLX5FYm1Xs0GXI9F3J
         9dnuNY0tcqMqWgbRLEThHkDT0dcZKuzMnLAHAlyyN4oFUt/QXzJlI4RTmAix7MvP0fGu
         K7XZeP+4s0ye4iqMImRhQeBwDpzVYsJR1o4UUrYT1furfl3PXePMr1Nv6noWCsdd7UqR
         Q7izzHoN0cOIB/ZWGprhhTeZVXvOcmrxoc6+i0CuENnRgsOTWomwWmnr0glwjcn00Th2
         RORA==
X-Gm-Message-State: AOJu0YyedYXDFTab0rf0AgSkI0N52IJ5LJGBY9XjmuyCVNXvQfbYVw5j
	1ru/fCPUUu3zDYkn2/xsqlcuvly5iZCIZWaO01ClKEdcJnyWO1JTNF0nIUGg93MEWet1YCbzh+Y
	tqY8=
X-Gm-Gg: ASbGncvA5kEQ8VyJzFYelfmpdpfG10XL59AP9C4Lz4/yAu7zCj1TIzYrk7WmYPniEpc
	uXBwTuni1/igpHABhOKSe2Lnog2NsrH+BkuZECNSwEOghzXHnqxqjkXwFNBZt4hop0fM3ECj9pp
	c6Cmb8GMf8eiGI35xAREaqksHxCoDr1tiyOllFxbOxsERbMfpP+gvz7z/zmMjYfw6JdR6i5BXWj
	NZOoKPjWYGhQkXtO79/G6oeZml3ucjDGRr7StX6xtPfma0nmjFxQmBhSEcH7IeDRmTjICccG1Jr
	G8h5005Ze6GhpUE9De5xcYGqlT1D8MAjeaf0NGJ06cUmzcF7G6eFQu6XmVHtGhmKKgXGZRLY4in
	v
X-Google-Smtp-Source: AGHT+IG3HLX2HH6/kCQtvnjFTvL5fXXextnjqt1kVF/2KbBwooPKzmThqFp6u18/Cub1qMvZDGcFJA==
X-Received: by 2002:ac8:7d96:0:b0:476:8612:f01d with SMTP id d75a77b69052e-4801ebd26bbmr42330911cf.48.1745602625731;
        Fri, 25 Apr 2025 10:37:05 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9eaf3afesm27832291cf.9.2025.04.25.10.37.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:37:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2 v3] python3-numpy: upgrade 2.2.4 -> 2.2.5
Date: Fri, 25 Apr 2025 13:37:00 -0400
Message-Id: <20250425173701.3216403-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425173701.3216403-1-tgamblin@baylibre.com>
References: <20250425173701.3216403-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215491

Changelog: https://github.com/numpy/numpy/blob/main/doc/changelog/2.2.5-changelog.rst

Reproducibility looks OK:

|2025-04-24 10:27:00,978 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1203.06s)
|2025-04-24 10:27:00,985 - oe-selftest - INFO - SUMMARY:
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1233.056s
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
No change in v3 or v2, other than to include the patch with a cover letter.

 .../python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index a2ee2b48d46..c6a37c0a85f 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9ba03692a45d3eef66559efe1d1096c4b9b75c0986b5dff5530c378fb8331d4f"
+SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


