Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08168EB64DC
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.260.1686926256185734878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XRz4T25+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b51780bed0so6455635ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926255; x=1689518255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMHKBdCOxlaXuk0oH6To9aUgUSU+DCu8qsSKKpK5H+4=;
        b=XRz4T25+JE/QqVzkNSu36ESmvFswnMOAihF/f86EM57sYXQOizU5KZtzGSYXFNvsM8
         9QzNF1bCW6W62Tdsesj3Z5fIdkP8JQoqcA6eTRF7Ct8IjziT038WurMeBh3NqG8SHvr7
         D8d8x5dajR9s86QHxGju+XmiBWqCVRoGGL/tMdqRwE2ZGKyyE7+zdVyhV1VZz8MAFIbi
         KgjO0D/bqDS43S+6BABOSp/XnjSaPjk7yuhyeE2fhg7Z4/dimsawhAk8BNM9Q1iAbZFe
         SLN3yynVAnYY9HMWx4le0uzFHExu5VHJ2fu9VVBIxGQXKdbkmEAB3SzgAxfaom6nfJqQ
         nZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926255; x=1689518255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMHKBdCOxlaXuk0oH6To9aUgUSU+DCu8qsSKKpK5H+4=;
        b=PLopUE7/bvO45koY0jqmOcJioKUSXCSES0wf57PEKReqmK1QMU422tHsGV8oCLYCIr
         5Dy5VYZ4utczq+ULLGjT8BF6qMYZGFDoF4sFXuWrYjTPHuxYufPMspR2ZCw/gju8S35A
         RDl2N86C/cySsVTEp694YIQXYAoseWFa9xmo5EFJ8lcw//4IH3n6jUlFA+QzE87Zmbzl
         sCzMpZoD8cDoLQz+dqAYoLlTWjAAbN/gMh9xTpod++l3Hqf4DAqC4cixSEK8qDc++PS6
         6wSc0JKiX8VeNYecc0xqXYFXFLGUvRMfv5UoeRoZjyXhdsp5MaD+lNnI2uu1KjLDqOh6
         5rXA==
X-Gm-Message-State: AC+VfDyiUwT0slw5+Cu8K9tcVN2qT/BKcQNKA+XdsEvBwQwX/shHGNPO
	NSaCq32LppfdI4vzq72wTkK+9qn6rLv907yoMLE=
X-Google-Smtp-Source: ACHHUZ5QHdsGQB9lGDUnebrFilVw1SmnhHmlpH+m0+Aa9idQdmkEW/RZKCs98vLxeSvlx1jxD+ekRw==
X-Received: by 2002:a17:903:2341:b0:1ad:f138:b2f6 with SMTP id c1-20020a170903234100b001adf138b2f6mr2417525plh.16.1686926255332;
        Fri, 16 Jun 2023 07:37:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/24] systemd: Drop a backport
Date: Fri, 16 Jun 2023 04:36:59 -1000
Message-Id: <a0f5dc78f030a3c4efbc864c385b6592a22ef1ec.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183029

From: Khem Raj <raj.khem@gmail.com>

This patch should have been dropped when upgrading to 253
since its already available upstream since then

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b677b766280b39e8bf507d5aec4f08e49fd72a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0007-Add-sys-stat.h-for-S_IFDIR.patch     | 29 -------------------
 meta/recipes-core/systemd/systemd_253.1.bb    |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch

diff --git a/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
deleted file mode 100644
index 479b9a1ca1..0000000000
--- a/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1480ef4ea9f71befbc22272c219b62ee5cd71d43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Jan 2022 15:17:37 -0800
-Subject: [PATCH] Add sys/stat.h for S_IFDIR
-
-../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
-        r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
-
-Upstream-Status: Backport [29b7114c5d9624002aa7c17748d960cd1e45362d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/shared/mkdir-label.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
-index e3afc2b666..f1df778966 100644
---- a/src/shared/mkdir-label.c
-+++ b/src/shared/mkdir-label.c
-@@ -7,6 +7,7 @@
- #include "selinux-util.h"
- #include "smack-util.h"
- #include "user-util.h"
-+#include <sys/stat.h>
- 
- int mkdirat_label(int dirfd, const char *path, mode_t mode) {
-         int r;
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
index 9c2b96d3c1..f306765168 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -47,7 +47,6 @@ SRC_URI_MUSL = "\
                file://0023-Handle-missing-gshadow.patch \
                file://0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
                file://0005-pass-correct-parameters-to-getdents64.patch \
-               file://0007-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
                file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
                file://0003-errno-util-Make-STRERROR-portable-for-musl.patch \
-- 
2.34.1


