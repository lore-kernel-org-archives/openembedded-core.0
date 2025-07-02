Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA135C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.15026.1751425954581324415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HVbrLLUR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74b56b1d301so23995b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425954; x=1752030754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cWNSbxVq8ffBpgKBquglQDHz428qaEY2sY39Xz45pg=;
        b=HVbrLLURHOucssIHPF/fDy3M8hJQOdaw/ihRfLC0fvUIgfZM0rhtTuqoT3Za/8Jsbq
         uc07RyDiH/+8lB7nXA64K/6QFq07bcTgmg7mfoCAGfVYtvTvP6NhXcIBjUYzMVm2Mdjx
         GKMyXvzfiaZTssu/a4q84sMF2gwaA6CVIuBTVpRWFI/40+pMN55CgUOyLvPVRtKzL+xy
         NAGha3mf8S7RJaITB2r2DGceH8CtP6vGINwmvZyiCw3ZY9Hx1HjnopDikqDrdN6KKK+G
         sdrHHZ+ll6C+aVsGs+G5Aa98DWICibIqQyWlaqoXHijzu6WgLUiSYHUrE4nzhPpAsQV2
         FUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425954; x=1752030754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cWNSbxVq8ffBpgKBquglQDHz428qaEY2sY39Xz45pg=;
        b=oeWatiI6rqAQhNjcT0WXoGyFf7lbVafXLfW2TN4kqpizG46E0Iu+A9eZmwWy3JQ1DL
         o/d/jKhfKj4dWiw9lZ4oFDlTTl7ie4u7nKBb7KJFr4eYP0BNqTW3B3uuBX3d2CnRfOPT
         cXhbp6zvcOY5MedKNvDi1o7wK3TjBTYgNWzdeVBWJqYATImT90cigo86VMxLhCJVXdmW
         kgHJ3gL4GjpE6XLXgCdpRvx0HuVY4k+gDXJ1J9SIsbo11kVjTpMzVMso2q0ySZm+d3tg
         dY7lU1t2aq6356oJxDUkODllRDMS2/jvi9K6NCgDwBVF0Rej3YaZ7gVXbpzUSdylFstZ
         eb7Q==
X-Gm-Message-State: AOJu0YwFEb09OTMwNeEcGvS7yFdaoBqzvwzRcYbMwDUhktmwLDk/v8ok
	5QWTlAVYlRz/BwgtUr5VPL2RQQ5N/rTtC/68EVchLk38jy/uHeJzlqhmXRobHWEP2lMieRJgHCz
	kbymQ
X-Gm-Gg: ASbGncvMcMbTVM2wnFwlS3krEhT+sOw5yE7poxuWKbfLK+C6lsFHtdm5+7oFzmqXyj/
	7z1Yu/leSIoCIT6gG8mviimbZh6+qjuEj4jUTJBuPW0lKNShyOG/7rn0rGqWDxrXJukFhAfHXLn
	HOuWjm1F9zPN53WRyPt8u/gjrO7YaNYA7qpbhogmQU7xNlIC8qsI6Jo26UHGEuzqw4tfjflc5y6
	IfNnqQUorp8c5t/6iZbton1kzPrWjkEgDCsGXsOtDxEWoHlyEXxGb4qNizojrQNGzaKErq6+BKc
	CrpQvg1x58Q+woK5qcq1nxy0RNboJ3V3BB6wk+whFj57R90h2rUMTw==
X-Google-Smtp-Source: AGHT+IFwrrTWSiWLb7o5uLjDQh+lH7Nwry8cDGTwdJ+DZ2x/vlM9Hih4Wqod4NVaFAIQlbu3laSyvA==
X-Received: by 2002:a05:6a21:33aa:b0:220:b05c:815a with SMTP id adf61e73a8af0-222d7f086c0mr2519247637.34.1751425953437;
        Tue, 01 Jul 2025 20:12:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/19] linux/cve-exclusion: update exclusions after script fixes
Date: Tue,  1 Jul 2025 20:11:52 -0700
Message-ID: <f79e2180be8d6190d8a6721ac758537fbd6b3188.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219761

From: Peter Marko <peter.marko@siemens.com>

This will shift fixed version of many CVEs, it does not change status of
any CVE.

Note that the current format of cvelistV5 does not allow us to determine
real value of "fixed_in" without also checking the hashes, but the
result are still fine.
The reason is that many entries are missing original_commit_for_fix
field and thus we see the final "fixed_in" version to be set to backport
to previous branch (e.g. 6.12.23 instead of 6.13).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1697404589e2d3a625f9da2e8906e47af668c1c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 138 +++++++++---------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 24d5631588..5249572cd4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-04-27 08:54:24.704112+00:00 for version 6.12.23
+# Generated at 2025-04-27 09:28:35.170900+00:00 for version 6.12.23
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.23"
@@ -96,7 +96,7 @@ CVE_STATUS[CVE-2021-46920] = "fixed-version: Fixed from version 5.12"
 
 CVE_STATUS[CVE-2021-46921] = "fixed-version: Fixed from version 5.12"
 
-CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.10.33"
+CVE_STATUS[CVE-2021-46922] = "fixed-version: Fixed from version 5.11.17"
 
 CVE_STATUS[CVE-2021-46923] = "fixed-version: Fixed from version 5.16"
 
@@ -592,7 +592,7 @@ CVE_STATUS[CVE-2021-47177] = "fixed-version: Fixed from version 5.13"
 
 CVE_STATUS[CVE-2021-47178] = "fixed-version: Fixed from version 5.13"
 
-CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 4.9.271"
+CVE_STATUS[CVE-2021-47179] = "fixed-version: Fixed from version 5.12.9"
 
 CVE_STATUS[CVE-2021-47180] = "fixed-version: Fixed from version 5.13"
 
@@ -706,7 +706,7 @@ CVE_STATUS[CVE-2021-47237] = "fixed-version: Fixed from version 5.13"
 
 CVE_STATUS[CVE-2021-47238] = "fixed-version: Fixed from version 5.13"
 
-CVE_STATUS[CVE-2021-47239] = "fixed-version: Fixed from version 4.4.274"
+CVE_STATUS[CVE-2021-47239] = "fixed-version: Fixed from version 5.12.13"
 
 CVE_STATUS[CVE-2021-47240] = "fixed-version: Fixed from version 5.13"
 
@@ -1092,7 +1092,7 @@ CVE_STATUS[CVE-2021-47434] = "fixed-version: Fixed from version 5.15"
 
 CVE_STATUS[CVE-2021-47435] = "fixed-version: Fixed from version 5.15"
 
-CVE_STATUS[CVE-2021-47436] = "fixed-version: Fixed from version 4.14.252"
+CVE_STATUS[CVE-2021-47436] = "fixed-version: Fixed from version 5.14.14"
 
 CVE_STATUS[CVE-2021-47437] = "fixed-version: Fixed from version 5.15"
 
@@ -1318,7 +1318,7 @@ CVE_STATUS[CVE-2021-47553] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-47554] = "fixed-version: Fixed from version 5.16"
 
-CVE_STATUS[CVE-2021-47555] = "fixed-version: Fixed from version 5.4.163"
+CVE_STATUS[CVE-2021-47555] = "fixed-version: Fixed from version 5.15.6"
 
 CVE_STATUS[CVE-2021-47556] = "fixed-version: Fixed from version 5.16"
 
@@ -1390,7 +1390,7 @@ CVE_STATUS[CVE-2021-47593] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-47594] = "fixed-version: Fixed from version 5.16"
 
-CVE_STATUS[CVE-2021-47595] = "fixed-version: Fixed from version 5.10.88"
+CVE_STATUS[CVE-2021-47595] = "fixed-version: Fixed from version 5.15.11"
 
 CVE_STATUS[CVE-2021-47596] = "fixed-version: Fixed from version 5.16"
 
@@ -1574,11 +1574,11 @@ CVE_STATUS[CVE-2022-48639] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-48640] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48641] = "fixed-version: Fixed from version 4.14.295"
+CVE_STATUS[CVE-2022-48641] = "fixed-version: Fixed from version 5.19.12"
 
 CVE_STATUS[CVE-2022-48642] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48643] = "fixed-version: Fixed from version 5.10.146"
+CVE_STATUS[CVE-2022-48643] = "fixed-version: Fixed from version 5.19.12"
 
 CVE_STATUS[CVE-2022-48644] = "fixed-version: Fixed from version 6.0"
 
@@ -1618,7 +1618,7 @@ CVE_STATUS[CVE-2022-48661] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-48662] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48663] = "fixed-version: Fixed from version 5.10.146"
+CVE_STATUS[CVE-2022-48663] = "fixed-version: Fixed from version 5.19.12"
 
 CVE_STATUS[CVE-2022-48664] = "fixed-version: Fixed from version 6.0"
 
@@ -1634,7 +1634,7 @@ CVE_STATUS[CVE-2022-48669] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2022-48670] = "fixed-version: Fixed from version 6.0"
 
-CVE_STATUS[CVE-2022-48671] = "fixed-version: Fixed from version 5.4.215"
+CVE_STATUS[CVE-2022-48671] = "fixed-version: Fixed from version 5.19.11"
 
 CVE_STATUS[CVE-2022-48672] = "fixed-version: Fixed from version 6.0"
 
@@ -1770,7 +1770,7 @@ CVE_STATUS[CVE-2022-48750] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48751] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48752] = "fixed-version: Fixed from version 5.10.96"
+CVE_STATUS[CVE-2022-48752] = "fixed-version: Fixed from version 5.16.5"
 
 CVE_STATUS[CVE-2022-48753] = "fixed-version: Fixed from version 5.17"
 
@@ -1822,17 +1822,17 @@ CVE_STATUS[CVE-2022-48776] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48777] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48778] = "fixed-version: Fixed from version 5.4.181"
+CVE_STATUS[CVE-2022-48778] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48779] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48780] = "fixed-version: Fixed from version 5.15.25"
+CVE_STATUS[CVE-2022-48780] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48781] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48782] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48783] = "fixed-version: Fixed from version 5.10.102"
+CVE_STATUS[CVE-2022-48783] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48784] = "fixed-version: Fixed from version 5.17"
 
@@ -1840,7 +1840,7 @@ CVE_STATUS[CVE-2022-48785] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48786] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48787] = "fixed-version: Fixed from version 4.14.268"
+CVE_STATUS[CVE-2022-48787] = "fixed-version: Fixed from version 5.16.11"
 
 CVE_STATUS[CVE-2022-48788] = "fixed-version: Fixed from version 5.17"
 
@@ -1878,7 +1878,7 @@ CVE_STATUS[CVE-2022-48804] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48805] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48806] = "fixed-version: Fixed from version 5.4.180"
+CVE_STATUS[CVE-2022-48806] = "fixed-version: Fixed from version 5.16.10"
 
 CVE_STATUS[CVE-2022-48807] = "fixed-version: Fixed from version 5.17"
 
@@ -1940,13 +1940,13 @@ CVE_STATUS[CVE-2022-48835] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48836] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48837] = "fixed-version: Fixed from version 4.9.308"
+CVE_STATUS[CVE-2022-48837] = "fixed-version: Fixed from version 5.16.17"
 
 CVE_STATUS[CVE-2022-48838] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48839] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48840] = "fixed-version: Fixed from version 5.15.31"
+CVE_STATUS[CVE-2022-48840] = "fixed-version: Fixed from version 5.16.17"
 
 CVE_STATUS[CVE-2022-48841] = "fixed-version: Fixed from version 5.17"
 
@@ -2092,13 +2092,13 @@ CVE_STATUS[CVE-2022-48912] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48913] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48914] = "fixed-version: Fixed from version 4.19.233"
+CVE_STATUS[CVE-2022-48914] = "fixed-version: Fixed from version 5.16.13"
 
 CVE_STATUS[CVE-2022-48915] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48916] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48917] = "fixed-version: Fixed from version 4.9.305"
+CVE_STATUS[CVE-2022-48917] = "fixed-version: Fixed from version 5.16.13"
 
 CVE_STATUS[CVE-2022-48918] = "fixed-version: Fixed from version 5.17"
 
@@ -2236,7 +2236,7 @@ CVE_STATUS[CVE-2022-48985] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-48986] = "fixed-version: Fixed from version 6.1"
 
-CVE_STATUS[CVE-2022-48987] = "fixed-version: Fixed from version 4.9.336"
+CVE_STATUS[CVE-2022-48987] = "fixed-version: Fixed from version 6.0.13"
 
 CVE_STATUS[CVE-2022-48988] = "fixed-version: Fixed from version 6.1"
 
@@ -2382,7 +2382,7 @@ CVE_STATUS[CVE-2022-49068] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49069] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49070] = "fixed-version: Fixed from version 5.15.34"
+CVE_STATUS[CVE-2022-49070] = "fixed-version: Fixed from version 5.17.3"
 
 CVE_STATUS[CVE-2022-49071] = "fixed-version: Fixed from version 5.18"
 
@@ -2778,7 +2778,7 @@ CVE_STATUS[CVE-2022-49270] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49271] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49272] = "fixed-version: Fixed from version 5.10.110"
+CVE_STATUS[CVE-2022-49272] = "fixed-version: Fixed from version 5.17.2"
 
 CVE_STATUS[CVE-2022-49273] = "fixed-version: Fixed from version 5.18"
 
@@ -3920,7 +3920,7 @@ CVE_STATUS[CVE-2023-52523] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-52524] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 4.14.327"
+CVE_STATUS[CVE-2023-52525] = "fixed-version: Fixed from version 6.5.7"
 
 CVE_STATUS[CVE-2023-52526] = "fixed-version: Fixed from version 6.6"
 
@@ -3970,7 +3970,7 @@ CVE_STATUS[CVE-2023-52574] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-52576] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 4.14.327"
+CVE_STATUS[CVE-2023-52577] = "fixed-version: Fixed from version 6.5.6"
 
 CVE_STATUS[CVE-2023-52578] = "fixed-version: Fixed from version 6.6"
 
@@ -4246,7 +4246,7 @@ CVE_STATUS[CVE-2023-52743] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52744] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52745] = "fixed-version: Fixed from version 5.4.232"
+CVE_STATUS[CVE-2023-52745] = "fixed-version: Fixed from version 6.1.12"
 
 CVE_STATUS[CVE-2023-52746] = "fixed-version: Fixed from version 6.2"
 
@@ -4622,7 +4622,7 @@ CVE_STATUS[CVE-2023-52975] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52976] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 4.14.306"
+CVE_STATUS[CVE-2023-52977] = "fixed-version: Fixed from version 6.1.11"
 
 CVE_STATUS[CVE-2023-52978] = "fixed-version: Fixed from version 6.2"
 
@@ -4634,7 +4634,7 @@ CVE_STATUS[CVE-2023-52981] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52982] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52983] = "fixed-version: Fixed from version 5.15.93"
+CVE_STATUS[CVE-2023-52983] = "fixed-version: Fixed from version 6.1.11"
 
 CVE_STATUS[CVE-2023-52984] = "fixed-version: Fixed from version 6.2"
 
@@ -4720,11 +4720,11 @@ CVE_STATUS[CVE-2023-53025] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53026] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 5.10.165"
+CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 6.1.8"
 
-CVE_STATUS[CVE-2023-53029] = "fixed-version: Fixed from version 5.15.91"
+CVE_STATUS[CVE-2023-53029] = "fixed-version: Fixed from version 6.1.8"
 
-CVE_STATUS[CVE-2023-53030] = "fixed-version: Fixed from version 5.15.91"
+CVE_STATUS[CVE-2023-53030] = "fixed-version: Fixed from version 6.1.8"
 
 CVE_STATUS[CVE-2023-53031] = "fixed-version: Fixed from version 6.2"
 
@@ -4818,7 +4818,7 @@ CVE_STATUS[CVE-2024-26623] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26625] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26626] = "fixed-version: Fixed from version 6.1.77"
+CVE_STATUS[CVE-2024-26626] = "fixed-version: Fixed from version 6.7.4"
 
 CVE_STATUS[CVE-2024-26627] = "fixed-version: Fixed from version 6.8"
 
@@ -5114,9 +5114,9 @@ CVE_STATUS[CVE-2024-26778] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26779] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26780] = "fixed-version: Fixed from version 6.1.81"
+CVE_STATUS[CVE-2024-26780] = "fixed-version: Fixed from version 6.7.9"
 
-CVE_STATUS[CVE-2024-26781] = "fixed-version: Fixed from version 5.10.212"
+CVE_STATUS[CVE-2024-26781] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26782] = "fixed-version: Fixed from version 6.8"
 
@@ -5138,11 +5138,11 @@ CVE_STATUS[CVE-2024-26790] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26791] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26792] = "fixed-version: Fixed from version 6.1.81"
+CVE_STATUS[CVE-2024-26792] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26793] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26794] = "fixed-version: Fixed from version 6.6.21"
+CVE_STATUS[CVE-2024-26794] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26795] = "fixed-version: Fixed from version 6.8"
 
@@ -5154,7 +5154,7 @@ CVE_STATUS[CVE-2024-26798] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26799] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-26800] = "fixed-version: Fixed from version 6.6.21"
+CVE_STATUS[CVE-2024-26800] = "fixed-version: Fixed from version 6.7.9"
 
 CVE_STATUS[CVE-2024-26801] = "fixed-version: Fixed from version 6.8"
 
@@ -5528,7 +5528,7 @@ CVE_STATUS[CVE-2024-26995] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-26996] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-26997] = "fixed-version: Fixed from version 4.19.313"
+CVE_STATUS[CVE-2024-26997] = "fixed-version: Fixed from version 6.8.8"
 
 CVE_STATUS[CVE-2024-26998] = "fixed-version: Fixed from version 6.9"
 
@@ -5580,7 +5580,7 @@ CVE_STATUS[CVE-2024-27021] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-27022] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-27023] = "fixed-version: Fixed from version 6.1.80"
+CVE_STATUS[CVE-2024-27023] = "fixed-version: Fixed from version 6.7.7"
 
 CVE_STATUS[CVE-2024-27024] = "fixed-version: Fixed from version 6.8"
 
@@ -5848,7 +5848,7 @@ CVE_STATUS[CVE-2024-35813] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35814] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35815] = "fixed-version: Fixed from version 4.19.312"
+CVE_STATUS[CVE-2024-35815] = "fixed-version: Fixed from version 6.7.12"
 
 CVE_STATUS[CVE-2024-35816] = "fixed-version: Fixed from version 6.8"
 
@@ -5864,7 +5864,7 @@ CVE_STATUS[CVE-2024-35822] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35823] = "fixed-version: Fixed from version 6.8"
 
-CVE_STATUS[CVE-2024-35824] = "fixed-version: Fixed from version 6.1.84"
+CVE_STATUS[CVE-2024-35824] = "fixed-version: Fixed from version 6.7.12"
 
 CVE_STATUS[CVE-2024-35825] = "fixed-version: Fixed from version 6.8"
 
@@ -6126,7 +6126,7 @@ CVE_STATUS[CVE-2024-35960] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35962] = "fixed-version: Fixed from version 5.10.216"
+CVE_STATUS[CVE-2024-35962] = "fixed-version: Fixed from version 6.8.7"
 
 CVE_STATUS[CVE-2024-35963] = "fixed-version: Fixed from version 6.9"
 
@@ -6168,7 +6168,7 @@ CVE_STATUS[CVE-2024-35981] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35982] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35983] = "fixed-version: Fixed from version 5.4.275"
+CVE_STATUS[CVE-2024-35983] = "fixed-version: Fixed from version 6.8.9"
 
 CVE_STATUS[CVE-2024-35984] = "fixed-version: Fixed from version 6.9"
 
@@ -6194,7 +6194,7 @@ CVE_STATUS[CVE-2024-35994] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-35995] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-35996] = "fixed-version: Fixed from version 5.15.158"
+CVE_STATUS[CVE-2024-35996] = "fixed-version: Fixed from version 6.8.9"
 
 CVE_STATUS[CVE-2024-35997] = "fixed-version: Fixed from version 6.9"
 
@@ -6306,7 +6306,7 @@ CVE_STATUS[CVE-2024-36884] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36886] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36887] = "fixed-version: Fixed from version 6.6.31"
+CVE_STATUS[CVE-2024-36887] = "fixed-version: Fixed from version 6.8.10"
 
 CVE_STATUS[CVE-2024-36888] = "fixed-version: Fixed from version 6.9"
 
@@ -6418,7 +6418,7 @@ CVE_STATUS[CVE-2024-36941] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36943] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36944] = "fixed-version: Fixed from version 5.15.159"
+CVE_STATUS[CVE-2024-36944] = "fixed-version: Fixed from version 6.8.10"
 
 CVE_STATUS[CVE-2024-36945] = "fixed-version: Fixed from version 6.9"
 
@@ -6454,7 +6454,7 @@ CVE_STATUS[CVE-2024-36960] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36961] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36962] = "fixed-version: Fixed from version 6.1.91"
+CVE_STATUS[CVE-2024-36962] = "fixed-version: Fixed from version 6.8.10"
 
 CVE_STATUS[CVE-2024-36963] = "fixed-version: Fixed from version 6.9"
 
@@ -6888,9 +6888,9 @@ CVE_STATUS[CVE-2024-40918] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-40919] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-40920] = "fixed-version: Fixed from version 6.1.95"
+CVE_STATUS[CVE-2024-40920] = "fixed-version: Fixed from version 6.9.6"
 
-CVE_STATUS[CVE-2024-40921] = "fixed-version: Fixed from version 6.1.95"
+CVE_STATUS[CVE-2024-40921] = "fixed-version: Fixed from version 6.9.6"
 
 CVE_STATUS[CVE-2024-40922] = "fixed-version: Fixed from version 6.10"
 
@@ -7030,7 +7030,7 @@ CVE_STATUS[CVE-2024-40991] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-40992] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-40993] = "fixed-version: Fixed from version 6.1.96"
+CVE_STATUS[CVE-2024-40993] = "fixed-version: Fixed from version 6.9.7"
 
 CVE_STATUS[CVE-2024-40994] = "fixed-version: Fixed from version 6.10"
 
@@ -7146,7 +7146,7 @@ CVE_STATUS[CVE-2024-41050] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-41051] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-41052] = "fixed-version: Fixed from version 6.6.41"
+CVE_STATUS[CVE-2024-41052] = "fixed-version: Fixed from version 6.9.10"
 
 CVE_STATUS[CVE-2024-41053] = "fixed-version: Fixed from version 6.10"
 
@@ -7324,7 +7324,7 @@ CVE_STATUS[CVE-2024-42101] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-42102] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-42103] = "fixed-version: Fixed from version 5.15.163"
+CVE_STATUS[CVE-2024-42103] = "fixed-version: Fixed from version 6.9.9"
 
 CVE_STATUS[CVE-2024-42104] = "fixed-version: Fixed from version 6.10"
 
@@ -7800,7 +7800,7 @@ CVE_STATUS[CVE-2024-43895] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-43896] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-43897] = "fixed-version: Fixed from version 5.15.167"
+CVE_STATUS[CVE-2024-43897] = "fixed-version: Fixed from version 6.10.5"
 
 CVE_STATUS[CVE-2024-43899] = "fixed-version: Fixed from version 6.11"
 
@@ -7904,7 +7904,7 @@ CVE_STATUS[CVE-2024-44966] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-44967] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-44968] = "fixed-version: Fixed from version 6.1.105"
+CVE_STATUS[CVE-2024-44968] = "fixed-version: Fixed from version 6.10.5"
 
 CVE_STATUS[CVE-2024-44969] = "fixed-version: Fixed from version 6.11"
 
@@ -8156,7 +8156,7 @@ CVE_STATUS[CVE-2024-46732] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-46733] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-46734] = "fixed-version: Fixed from version 5.15.167"
+CVE_STATUS[CVE-2024-46734] = "fixed-version: Fixed from version 6.10.10"
 
 CVE_STATUS[CVE-2024-46735] = "fixed-version: Fixed from version 6.11"
 
@@ -8410,7 +8410,7 @@ CVE_STATUS[CVE-2024-46863] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-46864] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-46865] = "fixed-version: Fixed from version 5.10.227"
+CVE_STATUS[CVE-2024-46865] = "fixed-version: Fixed from version 6.10.11"
 
 CVE_STATUS[CVE-2024-46866] = "fixed-version: Fixed from version 6.11"
 
@@ -9004,7 +9004,7 @@ CVE_STATUS[CVE-2024-50030] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50031] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50032] = "fixed-version: Fixed from version 6.6.57"
+CVE_STATUS[CVE-2024-50032] = "fixed-version: Fixed from version 6.11.4"
 
 CVE_STATUS[CVE-2024-50033] = "fixed-version: Fixed from version 6.12"
 
@@ -9124,7 +9124,7 @@ CVE_STATUS[CVE-2024-50095] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50096] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50097] = "fixed-version: Fixed from version 6.6.57"
+CVE_STATUS[CVE-2024-50097] = "fixed-version: Fixed from version 6.11.4"
 
 CVE_STATUS[CVE-2024-50098] = "fixed-version: Fixed from version 6.12"
 
@@ -9348,7 +9348,7 @@ CVE_STATUS[CVE-2024-50208] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50209] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50210] = "fixed-version: Fixed from version 5.10.229"
+CVE_STATUS[CVE-2024-50210] = "fixed-version: Fixed from version 6.11.6"
 
 CVE_STATUS[CVE-2024-50211] = "fixed-version: Fixed from version 6.12"
 
@@ -9422,7 +9422,7 @@ CVE_STATUS[CVE-2024-50247] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50248] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50249] = "fixed-version: Fixed from version 5.15.171"
+CVE_STATUS[CVE-2024-50249] = "fixed-version: Fixed from version 6.11.7"
 
 CVE_STATUS[CVE-2024-50250] = "fixed-version: Fixed from version 6.12"
 
@@ -9580,7 +9580,7 @@ CVE_STATUS[CVE-2024-53058] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53059] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53060] = "fixed-version: Fixed from version 4.19.324"
+CVE_STATUS[CVE-2024-53060] = "fixed-version: Fixed from version 6.11.8"
 
 CVE_STATUS[CVE-2024-53061] = "fixed-version: Fixed from version 6.12"
 
@@ -9600,7 +9600,7 @@ CVE_STATUS[CVE-2024-53068] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53069] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53070] = "fixed-version: Fixed from version 5.15.172"
+CVE_STATUS[CVE-2024-53070] = "fixed-version: Fixed from version 6.11.8"
 
 CVE_STATUS[CVE-2024-53071] = "fixed-version: Fixed from version 6.12"
 
@@ -9654,7 +9654,7 @@ CVE_STATUS[CVE-2024-53095] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53096] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53097] = "fixed-version: Fixed from version 5.10.230"
+CVE_STATUS[CVE-2024-53097] = "fixed-version: Fixed from version 6.11.9"
 
 CVE_STATUS[CVE-2024-53098] = "fixed-version: Fixed from version 6.12"
 
@@ -9730,7 +9730,7 @@ CVE_STATUS[CVE-2024-53134] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-53135] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-53136] = "fixed-version: Fixed from version 4.19.325"
+CVE_STATUS[CVE-2024-53136] = "fixed-version: Fixed from version 6.11.10"
 
 CVE_STATUS[CVE-2024-53137] = "fixed-version: Fixed from version 6.12"
 
@@ -11198,7 +11198,7 @@ CVE_STATUS[CVE-2025-21792] = "cpe-stable-backport: Backported in 6.12.16"
 
 CVE_STATUS[CVE-2025-21793] = "cpe-stable-backport: Backported in 6.12.16"
 
-CVE_STATUS[CVE-2025-21794] = "fixed-version: Fixed from version 6.12.16"
+CVE_STATUS[CVE-2025-21794] = "cpe-stable-backport: Backported in 6.12.16"
 
 CVE_STATUS[CVE-2025-21795] = "cpe-stable-backport: Backported in 6.12.16"
 
@@ -11380,7 +11380,7 @@ CVE_STATUS[CVE-2025-21883] = "cpe-stable-backport: Backported in 6.12.18"
 
 CVE_STATUS[CVE-2025-21885] = "cpe-stable-backport: Backported in 6.12.18"
 
-CVE_STATUS[CVE-2025-21886] = "fixed-version: Fixed from version 6.12.18"
+CVE_STATUS[CVE-2025-21886] = "cpe-stable-backport: Backported in 6.12.18"
 
 CVE_STATUS[CVE-2025-21887] = "cpe-stable-backport: Backported in 6.12.18"
 
@@ -11454,7 +11454,7 @@ CVE_STATUS[CVE-2025-21921] = "cpe-stable-backport: Backported in 6.12.19"
 
 CVE_STATUS[CVE-2025-21922] = "cpe-stable-backport: Backported in 6.12.19"
 
-CVE_STATUS[CVE-2025-21923] = "fixed-version: Fixed from version 6.12.19"
+CVE_STATUS[CVE-2025-21923] = "cpe-stable-backport: Backported in 6.12.19"
 
 CVE_STATUS[CVE-2025-21924] = "cpe-stable-backport: Backported in 6.12.19"
 
@@ -11620,7 +11620,7 @@ CVE_STATUS[CVE-2025-22004] = "cpe-stable-backport: Backported in 6.12.21"
 
 CVE_STATUS[CVE-2025-22005] = "cpe-stable-backport: Backported in 6.12.21"
 
-CVE_STATUS[CVE-2025-22006] = "fixed-version: Fixed from version 6.12.21"
+CVE_STATUS[CVE-2025-22006] = "cpe-stable-backport: Backported in 6.12.21"
 
 CVE_STATUS[CVE-2025-22007] = "cpe-stable-backport: Backported in 6.12.21"
 
-- 
2.43.0


