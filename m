Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66355C67871
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 15:49:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.118503.1673711366208379132
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 07:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EtI45U1v;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id dw9so23807019pjb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 07:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YipErtJRNJG3GUwP/74vmiBKBrwWyRpl/H8nPx3YY0=;
        b=EtI45U1vf8e6CGJLJHYnec2RycqwtGY2s6DS8zZPqo8ZjjJ1xS5zZy5m3m0zkwvIWv
         bghsPmae21AF6jE4o52C2TTCk6sfxgKwseBX+W5iAnik37IHjrhqv4eARIAD3Exzizcp
         F1UihWJs51PFSCWPwbwNHtLKvD8zRxtJWhCFGtwmOHjQODg6gHvQirzy1q6iCy9fCw9c
         gn1IWI2a67UKIJjVVNyKrTCPCbSNzzy7LSffcqm81EfvzIWNoipERghnxYpWlEcnCSUs
         0C2fMN1q1kq7siCtFaJO+WLLVSetY2z4GgYlEZWRXcOCIRk/yf4zcpduJpPo9ioRDB/Z
         IPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YipErtJRNJG3GUwP/74vmiBKBrwWyRpl/H8nPx3YY0=;
        b=gBZjSrWGwjy2lBx/zRuQBpcIm/msQPAUsm0QC63IBp00EBBp3YvC3KIfaxh7zR68r3
         ePIYEjoe9cTIhWvxJuXNdzeEbChhcW3m5gPnwASqlvzSE+oIGQBhLeC46NMW7FVkXki2
         Zjko+eGIUwsantLDiv8D95be6JVbFHFKY7VaP+wv/OP4lzliMBN6ZnIxCgsPFq1BrU+8
         r+niwtX1hMptd1CEWj0Gwn4VBZvNdZUiM3MIPs9pQFY9/4Z27GV4N2ATyTAIT7l4vLZb
         2sZdxmxWg5+PH0no+EkBHsaZ3LA/RpCNw28grSaDqZ+s9N+zGJHBwXwgimoqLzRveN34
         t/7A==
X-Gm-Message-State: AFqh2krjJ08thDttVdN5fMBuGzmyQiwSbBRpRGEN9gO1RjObhP3LnU/S
	iqWqaKkdb0KdhttpGYv8H8ycjZ9dsV4IOg==
X-Google-Smtp-Source: AMrXdXvj+0zv/MoYR2Cj4sCWzR3OKoTqQBpFFQs/Uq0Qx3LHt4Ud7hAcl2dvhL8OzFTF6ojJkm1wcw==
X-Received: by 2002:a05:6a20:3d1a:b0:a4:b2e4:c561 with SMTP id y26-20020a056a203d1a00b000a4b2e4c561mr122841315pzi.51.1673711365074;
        Sat, 14 Jan 2023 07:49:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id b7-20020a63eb47000000b00460ea630c1bsm13129200pgk.46.2023.01.14.07.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 07:49:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] cpio: Do not use _Noreturn in gnulib
Date: Sat, 14 Jan 2023 07:49:17 -0800
Message-Id: <20230114154921.3757493-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 15:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175850

Backport a gnulib patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-obstack-Fix-a-clang-warning.patch    | 27 +++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a-clang-warning.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a-clang-warning.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a-clang-warning.patch
new file mode 100644
index 0000000000..6f6e396ef3
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-obstack-Fix-a-clang-warning.patch
@@ -0,0 +1,27 @@
+From 02f1f63d3ff58f3473f1689a0322a234ce10b659 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Jan 2023 22:13:45 -0800
+Subject: [PATCH] obstack: Fix a clang warning
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=0cc39712803ade7b2d4b89c36b143dad72404063]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gnu/obstack.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gnu/obstack.c b/gnu/obstack.c
+index 54b675d..4d6a1d5 100644
+--- a/gnu/obstack.c
++++ b/gnu/obstack.c
+@@ -326,7 +326,7 @@ int obstack_exit_failure = EXIT_FAILURE;
+ #   include <libio/iolibio.h>
+ #  endif
+ 
+-static _Noreturn void
++static __attribute_noreturn__ void
+ print_and_abort (void)
+ {
+   /* Don't change any of these strings.  Yes, it would be possible to add
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index e72a114de9..50d3e14c14 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
+           file://0001-obstack-Fix-a-clang-warning.patch \
            file://CVE-2021-38185.patch \
            "
 
-- 
2.39.0


