Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB25BC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 22:34:20 +0000 (UTC)
Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1318.1790116457021474180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 15:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O3jn+JZw;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.96, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so234476f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790116455; x=1790721255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XGRmnaDLx8Kq8Yc+7Y4YFrBc5bcTwisq0aGeGwxayI=;
        b=O3jn+JZwbwbaWP4cG9NwwOQSvhHu+jizY9g03bmjz+KROqlD5ypsMijNsBEHEKlQ2P
         JiFT+OJi2EJGsN1mmNEIrc2WxiKsQWqPoNy3JKug8trVgz7qiaNSLrWFBVqpD/BUnK7R
         NQq1d1x+6q9UvNV1ai1SL6veiCqJXqDXu32iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116455; x=1790721255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/XGRmnaDLx8Kq8Yc+7Y4YFrBc5bcTwisq0aGeGwxayI=;
        b=ZYLoAI0YG8QoXqpg+2r2fE6Z/KA2UN3PdWJFaiLP+ZOrxsszMF2Xlbw29hpUvM7+vm
         hR2p8p5OydxUDRCox05ZG3Yoi5XwvmjYuCfjXu0v+AFQdseSPpkEaaA0mH/UWoVoCWsp
         AZrj4JH0Ft/FjK8CpPmSjB4EDGj4jHeehGz7/FKCrUPcF377RJQ2NiZkOa2jN4tddod6
         Zuvik8n6QZJP0hfsYOootZz9V2LAogZdTNwzQF2+Iad29j/9T/8gsdjx3o9AdRcm7/R3
         qP8IG9c6G88jLrBJ2q+FJQ3rzE4rw8pqTYFywE7beFBxoQKHmJXM9PlLi6Bq/b7qFFcB
         7qcQ==
X-Gm-Message-State: AFuF++ko2V95btsNKAsVINstuWAKF95RMVyjer4GXfYzMgg2x7LV7MVz
	hvjf8uwOwvY8uk//5BZHpmOrMIUL89gpfnKnSFAg0+qhHvqxE+tLA1zs0MbJtKKzZzgPoh64whf
	fgfmlS2g=
X-Gm-Gg: AYBFou0paxfws635D5P3pODLI25eU7iRiFvniQOMWHPCycQ8htqSX9NpkRhAkLqptYy
	NYkaiHxUj+MCad8QCEDe1sr+xhqwBKFQ7ePGCe7B0Lpt6+Ypj0NxT4+oTI5FB0W7LLUMm4dWlqr
	oFZZYh5k6nz+TLo7vBdUUzeH4hkdtVMhbCF9hSDRFmJ2PtGbhnaSUyxYv2w1ghoASMxmQVaLzP9
	Ob22le8F9ZbPwAskJ+jp5aJtbcV/dMeVO1ucHbnYazFBrSSGEoKJbJ068x+Uw4jVNbjKnwK91zt
	MFZ69aM+8MtRdHSvH/1WeovkZw7V1gIDe7uh6OgVIobi1GEUmjFsTDTJiJffFj8uTQ9fVPBBwFZ
	xHYDAHCqNlyTHrfbPNDPWhuTQuuZMIOeKxUfa9N+HOdNh4PDR412QdJ4WSpX8r6DrGns9EXIc7d
	1eKgwfFmfM5fFRjulZvS/7A4YJ8JVSW/Ux2gqlkt97BYA2Ydu5MpboArC988QQNcbhV0RnR4ZRv
	Y3OypP2w7ZBwY9461Q9MOKofTYQ+PKVFtgK5g==
X-Received: by 2002:a05:600c:1396:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49fdf135413mr7328495e9.20.1790116454562;
        Tue, 22 Sep 2026 15:34:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fc4d:729f:8bd0:1e4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e60c4sm28356475e9.13.2026.09.22.15.34.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:34:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: Upgrade 2.8.4 -> 2.8.5
Date: Tue, 22 Sep 2026 23:34:12 +0100
Message-ID: <20260922223412.2881012-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 22:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246430

https://github.com/libexpat/libexpat/blob/R_2_8_5/expat/Changes

Security fixes:
           #1282  CVE-2026-93990

Bug fixes:
           #1346  lib: Fix OOM-related memory leak on a failed overflow check
           #1371  lib: Fix memory alignment for architectures with 128bit
                    pointers like CHERI-RISC-V
           #1367  xmlwf: Handle errors when closing output files

Other changes:
           #1354  lib: Reject an XML declaration version other than `1.[0-9]+`
                    (which is less strict than XML 1.0r4 (fourth edition)
                    and matches XML 1.0r5 (fifth edition))
           #1362  lib: Make Clang, GCC and MSVC warn about use of function
                    XML_SetHashSalt that is deprecated since Expat 2.8.0
           #1357  lib: Drop internal macros FASTCALL, PTRCALL, PTRFASTCALL
           #1367  xmlwf: Document that with `-k` the last error determines the
                    xmlwf exit code in `--help` output
           #1367  xmlwf: Make exit code 3 documentation match exit code 2 more
                    closely in `--help` output
     #1352 #1353  CMake|Windows: Refrain from adding `/source-charset:utf-8`
                    for MSVC
     #1366 #1374  Autotools: Be explicit about the minimum required version of
                    GNU Automake, currently version 1.13 of 2012-12-28
           #1351  Autotools|macOS: Sync CMake templates with CMake 4.4.3
           #1349  Replace some internal use of XML_Bool with standard bool
           #1364  tests: Propagate xmltest.sh failures via exit status
           #1360  tests|xmlwf: Add `#include "expat_config.h"` where missing
           #1355  tests: Start covering hash table operation
     #1350 #1369  tests: Drop __cplusplus leftovers
           #1378  tests: Fix tail pointer when unlinking the last tracked
                    allocation
           #1376  docs: Emphasize that XML_StopParser is not immediate
           #1381  docs: Sync XML_FeatureEnum value list in doc/reference.html
     #1356 #1361  Version info bumped from 13:4:12 (libexpat*.so.1.12.4)
                    to 13:5:12 (libexpat*.so.1.12.5); see https://verbump.de/
                    for what these numbers do

Infrastructure:
     #1366 #1374  Autotools: Start to also produce .tar.bz3 release tarballs

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/{expat_2.8.4.bb => expat_2.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.4.bb => expat_2.8.5.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.4.bb b/meta/recipes-core/expat/expat_2.8.5.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.4.bb
rename to meta/recipes-core/expat/expat_2.8.5.bb
index 050f148b07a..c032e18c77a 100644
--- a/meta/recipes-core/expat/expat_2.8.4.bb
+++ b/meta/recipes-core/expat/expat_2.8.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "963250a823c16a498582b4ad82ad0f88926be0769675d3b6956be4d769a1cd8f"
+SRC_URI[sha256sum] = "952c03c33a6b337f12dae7a9b0f9dee86f867550d35c994d6bdaaddd37dc8454"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

