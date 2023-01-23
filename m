Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005C3C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 17:42:01 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.49463.1674495719725639948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 09:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p5NALBPn;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z20so10181621plc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMZkbVHD7NM3lBFZvjkZ1lJhoZmo6pN3DXRFTNIyQq8=;
        b=p5NALBPndri4eC8w1wWjVyvbO5wGGcL2IUKUHp2NhR1kizOlaCdftnpiKqDhVwrRIG
         wcUEU9X6N6S1hO6FrYRVLC8DJPDE1spEtmUjMY1ps8ReiQHPkY/YtLcVtUGcIcTo7QN5
         cBoELEhAUguLMpnZLXoIT+2CN0co+EJyEd1SqNevAXt/1cZSig/Ifa7tOFP5r4zXYJpO
         BiCIwIxBDLOh29bpS6ZFpbx/fmLnk47GrqW9zQRsMrugDeX50TQklcDKGcBhqVhqFlUO
         BYijIma86MeKqWSSUcWj09IIbBESXVeZ09tuBxS7+fdSYrmrEuaSlLcRBJKSkVVXgGHO
         byWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMZkbVHD7NM3lBFZvjkZ1lJhoZmo6pN3DXRFTNIyQq8=;
        b=qSrV0b124yxYcqDgvnQ9EX2Bhn077xnDUXHZI6WueafwC1uTbYzBaFhb3oxt2BGX3Y
         oZ7ERGTDHJ433WbeEqFkYYV0uGs2QzAHm4+XBvYluCWwa2F37/VBq8qXNAwX7BlRNrbx
         iqYSGdVJKaGr0Rijb8YIrgvRaye1UU0Xiob6/1XcmOZrgc3zsYVvjl8urHk5HENotr2y
         z2YSgIgk5pbhmEprgCzButxBR5GasUVImUKSkWokFCen7qGggydVNuyF+vnh9NpFf68i
         HlGkO7ZLBwYXcY++QuciQBBsmuj2181vNAeR5QFegnZuhZSRr76XJU5GcTIM2RVMSQgv
         FvCw==
X-Gm-Message-State: AFqh2koaAWg2F8i4YtrbYKJX/nIRJH5+wD/YRiyFYzaNeu5/iMLYyZww
	px70kbKVDsNYXbi3wpS44mGrbjbx5bgDdQ==
X-Google-Smtp-Source: AMrXdXu0ctZ3F1m36uxPKlY/EmiRVkNYvGCYy9UQp/I0cvDIsMIf5w/F+uw5w4Om0oE+Ir5Lu2We2Q==
X-Received: by 2002:a17:903:1ce:b0:194:9268:d427 with SMTP id e14-20020a17090301ce00b001949268d427mr36351318plh.57.1674495718897;
        Mon, 23 Jan 2023 09:41:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902e54700b00194ab9a4febsm12580684plf.74.2023.01.23.09.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 09:41:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] stress-ng: Robustify test-float test
Date: Mon, 23 Jan 2023 09:41:56 -0800
Message-Id: <20230123174156.44919-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 17:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176314

Latest compilers are able to figure out that whole code can be optmized
away when CFLAGS has -O2 or more agressive optimizations. In order to
ensure the test is doing the right thing, make the variables global so
compiler is not able to optimize it away.

This fixes build on x86 especially when using clang compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-test-float-Make-variables-global.patch | 34 +++++++++++++++++++
 .../stress-ng/stress-ng_0.15.02.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch
new file mode 100644
index 0000000000..2e598ca4f4
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch
@@ -0,0 +1,34 @@
+From 958a86069c8d0149969b5c32212a28009c4a9ded Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Jan 2023 23:18:18 -0800
+Subject: [PATCH] test-float: Make variables global
+
+Latest clang ( clang 16+ ) is able to optimize everything out when -O2 is used and as
+a result build succeeds and test output comes out to be wrong. Therefore
+make the variables global, so clang does not optimize away the functions
+
+Upstream-Status: Backport [https://github.com/ColinIanKing/stress-ng/commit/e299eb60a3a029e975304cc43045aea6ab1fad70]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/test-float.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/test/test-float.c b/test/test-float.c
+index d2800cd3..ad5503c3 100644
+--- a/test/test-float.c
++++ b/test/test-float.c
+@@ -61,10 +61,9 @@
+ /* Avoid implicit int in the definition of test even if FLOAT is not known. */
+ typedef FLOAT float_type;
+ 
++FLOAT a = 0.0, b = 0.0, c = 0.0, d = 0.0;
+ static float_type HOT OPTIMIZE3 test(void)
+ {
+-	FLOAT a = 0.0, b = 0.0, c = 0.0, d = 0.0;
+-
+ 	float_ops(FLOAT, a, b, c, d, sin, cos);
+ 	float_ops(FLOAT, a, b, c, d, sinl, cosl);
+ 
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
index c554bb403e..75400f589e 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.02.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+           file://0001-test-float-Make-variables-global.patch \
            file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
 SRCREV = "4164f6842c712c2d9a13619c3c70fd35d8d02cdb"
 S = "${WORKDIR}/git"
-- 
2.39.1


