Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D17CC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:41:43 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.3760.1747845700237690204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 09:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iSpyq5Zv;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so69311106d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747845698; x=1748450498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7tDrEISR911S1Qs0ZboJzD7fP/WYD0iGsIiL5GHw6c=;
        b=iSpyq5Zv3C42HXppd99UKnhQyqLJ74vEFDZ/1JV2KOZHTMPtEqmo7qw08T2ZyLKsot
         GVxiN2kkKTMcfbxoFWesbQ24WoTyaoffw7Lb8LsAhy4RhWpFl9nmTt9p/16ikRvRK4xH
         Fvwq7Wv1XkW1XiCYTB3mt+KcB165mwto6ZX7Ih0WkzDtCI3XTt4GMZw7/oPMUZPN5eqt
         ZF74iNRl8HdO5J2CHWmtIvvfSxYbClKP+bzZVoZwIbaHA1ruHQH1H4yCZJLDZihown2T
         HgKJgDtOkT4RBd5wdYSJ+FpPFa6+GqJF8A6CUI3dKYthlemOuABWnxBGlNyAVz9L6FwK
         gI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845698; x=1748450498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7tDrEISR911S1Qs0ZboJzD7fP/WYD0iGsIiL5GHw6c=;
        b=nkitLl7EQwlCP/EY44HEfrwbrRJQKYSgTJ/DyBGBiO2IZ4HjzmZBQ0d6mJQRdW8dpp
         Zzv3pl7+4vM72XynmAuYIcErjJQ0UaW9GHNvqDXCZY1AgI8qc8S3fYVpgVFzPDoZisrB
         8LOPt9TjQ+CcvezElTLeYyLrZv59F4ql2Qk4uBZuR1w0oL9lIIAVNXBW9kp+SCHoE55E
         J0L737fb6ZfMS+9GJYgPYIuLlKzZ+yji9bdC00ug0z1bDMa7jU2TWRDRrE9plmwM+p/I
         NrKQFOKZ894uyaDBFZaeRF2k/FXzm/OUoqnOj79tjuON9nE7E1Fc0sh3SuA3uZJBz1Ag
         LM7Q==
X-Gm-Message-State: AOJu0Yzvi+UqvQat7hSriVjIK1Fce4QpG++Mv6wQecxLwfvJG+OINdFd
	YplQ84Q1664Jq+5ubwCFT85pIzFM2VzkvaTFcY+GLnI/o6mQH+WmbnjK68PC3wa34x6wtxTOk1E
	dt9ZflPk=
X-Gm-Gg: ASbGncuDDewnYHRSf8tNw6LblvAEJEjacJL5nMiz+ia3U3nseFAna0mSlQTLfVdJpPm
	PIvrh70VmEOlSY08myVu8uNTqdblyB49SdOgldP5i1q+vJjT7GUjPefpbdEB/Ci1rr0ITcPl/d9
	rh5jCC/ETM96e8OYU2a/Ua3ISLjxWa3nfCHKpMjwTPid8X5PCYToUPZ8GY4fAIk7jCxORkPImt3
	yEGwywOYsi6Puc2EcCM5LppqaCV1pmyYA1OIz6E2QlOIGCt9UwoeP1yD+ByaLOH5AEcpmskf7d/
	No5TlNne+NF7X4zLcJ6jwBoE+U0gpBs2vszHhFHRYhs2YY6z5II6b4z0f3dOuUuDflqVjb8miHQ
	eeivcJp3PyRcagmx77r6xcg==
X-Google-Smtp-Source: AGHT+IH4Ss54Bt+ea6L5+r/XXICu2KkGctxg4bxSTIuiqa+3TKY0SuMmmdbX2dlGDIwQCdhblI/qAQ==
X-Received: by 2002:a05:6214:2405:b0:6f8:997d:fc75 with SMTP id 6a1803df08f44-6f8b088f52amr306209876d6.26.1747845698253;
        Wed, 21 May 2025 09:41:38 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097b6e1sm86666606d6.111.2025.05.21.09.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:41:37 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 2.2.5 -> 2.2.6
Date: Wed, 21 May 2025 12:41:35 -0400
Message-Id: <20250521164135.2973120-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 16:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217049

Changelog: https://github.com/numpy/numpy/releases/tag/v2.2.6

ptests are OK:

|============================================================================
|Testsuite summary
|# TOTAL: 48687
|# PASS: 44845
|# SKIP: 3805
|# XFAIL: 32
|# FAIL: 0
|# XPASS: 5
|# ERROR: 0
|DURATION: 81
|END: /usr/lib/python3-numpy/ptest
|2025-05-21T16:09
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Reproducibility looks OK:

|2025-05-21 11:20:30,349 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-05-21 11:20:30,349 - oe-selftest - INFO - Ran 1 test in 1619.910s
|2025-05-21 11:20:30,349 - oe-selftest - INFO - OK
|2025-05-21 11:20:33,239 - oe-selftest - INFO - RESULTS:
|2025-05-21 11:20:33,239 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1589.05s)
|2025-05-21 11:20:33,242 - oe-selftest - INFO - SUMMARY:
|2025-05-21 11:20:33,242 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1619.911s
|2025-05-21 11:20:33,242 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_2.2.5.bb => python3-numpy_2.2.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.5.bb => python3-numpy_2.2.6.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.2.5.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.6.bb
index f963e15b830..10468d68503 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
+SRC_URI[sha256sum] = "e29554e2bef54a90aa5cc07da6ce955accb83f21ab5de01a62c8478897b264fd"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


