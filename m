Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3BECD3435
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 13:39:00 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.23404.1725370736929922291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 06:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S77zjFI6;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: mail2szahir@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7176645e501so1140199b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725370736; x=1725975536; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbuemUBsKKX4z8StVNtMl975uecd6lg+tz5kDrwo2NI=;
        b=S77zjFI6yD3QuGlRi/Pevgew/vNFjGso6QAZh+aHR9Vi/bQNduw1UkswSPU2V8gLUD
         C84CXPYBJtLnOiOSCbHdVqDyYow7nbAaSW+maJ/U1+DIrTMzaBYBvtg2YyvoVCQ+M6r5
         J8NCSkV/koJ6jb4n3/rNuNVXceaxIInYrL1mivxFx8cKbMS4dolg9eDrmd2gzI5aXfZB
         aGmtbgFHLmc+G6BGI/J8x579vSVL2NcoBUbPDwX38ver+D0IKv8boTvLmjEABnaAmsmM
         SbZ5X+rsR3IP2J+w+mRZv8XCcRP+jTsfzPmG97BEukRt9Fn3qnJ1RrtLfLzT9hVKOTwq
         xAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725370736; x=1725975536;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbuemUBsKKX4z8StVNtMl975uecd6lg+tz5kDrwo2NI=;
        b=RuDEcCN/XuaPvu4+URLN8IYxIJvfMn1wZsg8YTPN312f8PNWVPpIbhdTg7oLsMzSi5
         XHm3NWtGLAIZgUaosW1FiC5AbEc3IUcPJtqy4H5NCfA2yYLiYNHV6Ll99CbpaK/QIN9D
         gwZPs4n41IrGKGkQMV9mkSjxcSpaCnIABLpHUiwSnJRMiCaojaWjnZmTHKLx+OvDmiPr
         7ZSdcOeJ9hLQu0zg+Wut228/7k3qIrg7aDA23d7l6HTSD/MXeWw5A+p74t7CqUogm/y/
         /bQ9Wr/ONkn6bGXPSI1hTlZtdLvR8Wce7rt1y0nwfX74vSbC55ihvVFKYDPkkasPeuQO
         wnEQ==
X-Gm-Message-State: AOJu0YzmuECcHw+gp2RD1/KOCdehOCgpO8YWkbhkkSqGzc9zHAL3M2EO
	qT6le01Fkdsg3WDWXSA4hdavaYTG/B75eMOoJIcIwXf54kfyzns9WlJFFg==
X-Google-Smtp-Source: AGHT+IGhz6CJFxicqnZOMSdwZ7Bj9VYzBCdZazpkaorrXV6nw+jJ/BlNgwyK0O4nvBj8cZDrcDh3pA==
X-Received: by 2002:a05:6a00:a25:b0:714:17b5:c1d9 with SMTP id d2e1a72fcca58-71744333c32mr8685480b3a.1.1725370735847;
        Tue, 03 Sep 2024 06:38:55 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55b9cf0sm8734225b3a.96.2024.09.03.06.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:38:55 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: zahir.basha@kpit.com
Subject: [OE-core][kirkstone][PATCH] glib-2.0: Remove gvariant byteswap test
Date: Tue,  3 Sep 2024 19:08:28 +0530
Message-Id: <20240903133828.3762-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 13:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204163

As byteswap has some issue sporadically, remove the byteswap
completely from gvariant. When run in QEMU, could see the
below failure sporadically

Executing: glib/gvariant.test
Executing: glib/gvariant.test
Test timed out after 300 seconds
FAIL: glib/gvariant.test (Child process killed by signal 9)

Until issue is fixed removing byteswap test
from gvariant to increase stability.

Signed-off-by: Zahir Hussain <mail2szahir@gmail.com>
---
 ...ib-2.0-Remove-gvariant-byteswap-test.patch | 45 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch
new file mode 100644
index 0000000000..4cefd2e522
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-2.0-Remove-gvariant-byteswap-test.patch
@@ -0,0 +1,45 @@
+From f4c529805aed5ee92b8d7d729cfa501be5835d7e Mon Sep 17 00:00:00 2001
+From: aszh07 <mail2szahir@gmail.com>
+Date: Mon, 29 Jul 2024 16:19:10 +0530
+Subject: [PATCH] glib-2.0: Remove gvariant byteswap test
+
+As byteswap has some issue sporadically, remove the byteswap
+completely from gvariant. When run in QEMU, could see the
+below failure sporadically,
+
+Executing: glib/gvariant.test
+Executing: glib/gvariant.test
+Test timed out after 300 seconds
+FAIL: glib/gvariant.test (Child process killed by signal 9)
+
+Until issue is fixed removing byteswap test 
+from gvariant to increase stability.
+
+Signed-off-by: Zahir Hussain <mail2szahir@gmail.com>
+---
+ glib/tests/gvariant.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 939f073..a25a4a4 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5656,7 +5656,6 @@ main (int argc, char **argv)
+   g_test_add_func ("/gvariant/serialiser/tuple", test_tuples);
+   g_test_add_func ("/gvariant/serialiser/variant", test_variants);
+   g_test_add_func ("/gvariant/serialiser/strings", test_strings);
+-  g_test_add_func ("/gvariant/serialiser/byteswap", test_byteswaps);
+   g_test_add_func ("/gvariant/serialiser/children", test_serialiser_children);
+ 
+   for (i = 1; i <= 20; i += 4)
+@@ -5679,7 +5678,6 @@ main (int argc, char **argv)
+   g_test_add_func ("/gvariant/valist", test_valist);
+   g_test_add_func ("/gvariant/builder-memory", test_builder_memory);
+   g_test_add_func ("/gvariant/hashing", test_hashing);
+-  g_test_add_func ("/gvariant/byteswap", test_gv_byteswap);
+   g_test_add_func ("/gvariant/byteswap/non-normal-non-aligned", test_gv_byteswap_non_normal_non_aligned);
+   g_test_add_func ("/gvariant/parser", test_parses);
+   g_test_add_func ("/gvariant/parser/integer-bounds", test_parser_integer_bounds);
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 35b51a3ec9..3beb324383 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2024-34397_16.patch \
            file://CVE-2024-34397_17.patch \
            file://CVE-2024-34397_18.patch \
+           file://0001-glib-2.0-Remove-gvariant-byteswap-test.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.17.1


