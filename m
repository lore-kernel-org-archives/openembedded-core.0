Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C207BC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:29:24 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.16661.1745504962691229381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Jg8++4dO;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5675dec99so124386185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745504961; x=1746109761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKM8Pv/K4kqkabwMJQO7zbzX5P35Xm7pb3cwRduEV2s=;
        b=Jg8++4dOYrD67YCua6oeVhlfcTPbiKr4RD0z5pyK6NBgwH1yeZAt8Cwzx0UWOyCej2
         ywbEsvwzUGay5eeVfU7rNhh+vSgXfZv+R0If0JLfKCM4Z/CLZkoxMs6ve+vb06WOHmax
         T4bfmEavP5ab2jL9qzotwIOh3UE82WfzaBjbfRcrvYvOwMuM6qkxpUO5HcM5fYD8GlxN
         rFWlu9RxYxavKW65J+rCJrRmIuayWtMpksyyIkmQSSo8VMwG185cM5oUc0Pk8aUyfymF
         Aj3W7t30vU2kUQUFwMrrBGamiD5UZaxZ3sa1wAV3ieD42YVTflurSzscm7s01tSkbTSZ
         K7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504961; x=1746109761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKM8Pv/K4kqkabwMJQO7zbzX5P35Xm7pb3cwRduEV2s=;
        b=LwXoUZ8ZbY/Dj5jEHDQGJoPkG36Ug0JmxnR6a7ePv9lKuk27zVk9GRXl6r09qm6Exh
         45OL2ede1H2hsDy6ZHuNf+rNR5wUDg8EdY6CytRwPhlZeHQaTrC4BiOFrxVJ9ojtqB66
         GtKr+ZHFsLs9V7PvFrbtBcmBTgRVdg8YgOg6nAtRgl6utVsL7k0WgBdTagLRh+rpGHvi
         gkU6MQANcEr2dsShOFLf9nz3M0jkyRgs4+gzVSNgIqy+T2x2PO2VOMwUDwiAcM5fqSMu
         bUSxzF2sBFXXIiHF5g7dNYxeirLUI6GKbuPMuSMp86r0CvQQYjD/nk3BI//nzhAO7X1n
         aTNA==
X-Gm-Message-State: AOJu0YxiW+oPvLlZITf4DLJrzkgf4tkQ+ImmIpL1873wLmrKZWuXE7OA
	o4oBhDCIBjcduu0WnY+bEUl981xBrbVo7JLZBJFfmgqJSX7VOkq6Fx0NIO4l9lGV+SK/BO+JLE8
	eaq0=
X-Gm-Gg: ASbGnctPa75DaNKi4cINaYl6FTCzFaZeEeJiHKLe+srfF2t09ITPeEkbfSPMrNZ6SlI
	1TnTfy5ksHDE9SZGM4PWAKqDAjiwted5drMCuvGn43U1kxeALB/xJKN2Gxfrt2RFc2eHJmjhOpa
	ocJKanmCZkaHDs+tigSVhYbb86YvtlBctet/bZYZWrRnMyFtVo9txnra2ZEsx7e3lCZaIyx8RLl
	eYnKM74aFN397tYFejcwuhmBXnwhzhSlToTJA69fHQMMTFaf1vNHhmlWu0X5uxmdPfk6nFOM65p
	qFlk2tCLJ/hQOn4I41rnsEB29UfdK8KnCb1f3rM83jMjsooR6PenrvzMOCwUs/oDL7jJ+laEXBU
	s
X-Google-Smtp-Source: AGHT+IE7/9Tvm0Ca5XmwxZQeCbJYvlyEn1H2AKsQB5bUwfZZYT8cR0Po/1Io2ZftfnyiDG2hk4S4fA==
X-Received: by 2002:a05:620a:24d6:b0:7c5:3da2:fc75 with SMTP id af79cd13be357-7c956eaa41amr431922185a.24.1745504961065;
        Thu, 24 Apr 2025 07:29:21 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e7f083sm92308385a.87.2025.04.24.07.29.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:29:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-numpy: upgrade 2.2.4 -> 2.2.5
Date: Thu, 24 Apr 2025 10:29:17 -0400
Message-Id: <20250424142918.3811330-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215378

Changelog: https://github.com/numpy/numpy/blob/main/doc/changelog/2.2.5-changelog.rst

Reproducibility looks OK:

|2025-04-24 10:27:00,978 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1203.06s)
|2025-04-24 10:27:00,985 - oe-selftest - INFO - SUMMARY:
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1233.056s
|2025-04-24 10:27:00,985 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
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


