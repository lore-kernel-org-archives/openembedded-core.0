Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E41FC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 19:18:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.7938.1647112706621649546
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 11:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JT1G3xDz;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id t187so10285904pgb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 11:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ozi19OZDofDYQE7x2Il6FeA30ae09aRIkzTh92UxQHo=;
        b=JT1G3xDz4XBH6lwTvMbRmtDdN1zQswhzoMxUyFk5ld7MDblWvWkCIHrr2UmDzbQDA6
         uoiaPOTDkwLgbkwtKWBsNhNhtWNwkqgvxhWqTs0NQ4IDSttR56aa2NZdeIMnxZMh9ZZU
         CCvJCVuiwRiv1F7S6JcU1xTcX2wmIM5ipUWbO43eeT2gjAQ5pyQbas0tEfpZXdjrYe5w
         KrhuwDFqCUGYBKCD1cQ485H1r3qLVCJKogrdwDyq+TndjupPzf6OVfUbjN4zziih3Yf4
         3s9gDr2zPL2YnGUOk0EPk5u7+KyxHLY1LxQAz7Xx1HGgoYY+zdImZM6Cnvi6ALpD7Ww4
         Gy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ozi19OZDofDYQE7x2Il6FeA30ae09aRIkzTh92UxQHo=;
        b=dwOwBQPeRMJ20O0Y5IJvMBTa++vmIwikf6wcGjJinzQMKCVFFQKBkLTsRDuVfSdSEk
         b0UUKNL8OKvz70S2gR2oFLqNvFMFHwjceqSQ+7SGaid4VVY//PfjBiEZEzHBD5f0ymQm
         wTvXaIPOTfs/b1pkL2HgyF1vJ5clhMXa16ia63/4OYNrzdGXNECQgdknHctF1DZ0AH0A
         JysVxYsl1H2JhLYPLZMVp55E8u3diL1IqFvdlvH8whWDt/KC7rX+RJLrequ0DNmmflcM
         CdzH+fsIvZrV0PrLZaIu+FeZy6HR+WeD+dyJBSXC8wGT0LjOM/w5EfQtrJ5eIdGv8i3t
         9a9A==
X-Gm-Message-State: AOAM531akkaKFv3pgUTz+3X7hWA5qeTgWNVDEzL3Vj7/VDlhhv8LF2lR
	abQsO8HNY8q+nHh5h/jMkWQzUqHmakEiuQ==
X-Google-Smtp-Source: 
 ABdhPJy6MBoK/Qx5iXW0Qq8Em4vlHaLELSLRngmN/qXRKjt+dJqiC3GGVJmNFgBXLdQhSoFSnvnA2g==
X-Received: by 2002:a05:6a00:1310:b0:4ca:cc46:20c7 with SMTP id
 j16-20020a056a00131000b004cacc4620c7mr16158638pfu.44.1647112705740;
        Sat, 12 Mar 2022 11:18:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f10-20020a056a00228a00b004f769b40bd6sm12339989pfe.103.2022.03.12.11.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 11:18:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ppc/siteinfo: Fix differences between musl and glibc
Date: Sat, 12 Mar 2022 11:18:22 -0800
Message-Id: <20220312191822.546798-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312191822.546798-1-raj.khem@gmail.com>
References: <20220312191822.546798-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 19:18:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163099

There is a key difference between glibc and musl when it comes to
ppc/ppc64 and that is that musl does not support 128-bit long IBM doubles format
it only supports 128-bit long double IEEE format on ppc64 alone.
this change ensures that we account for this change, so far we have been
doing it a bit wrong for ppc/musl case.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass   | 24 ++++++++++++------------
 meta/site/powerpc32-linux       |  1 -
 meta/site/powerpc32-linux-glibc |  8 ++++++++
 meta/site/powerpc32-linux-musl  |  2 ++
 meta/site/powerpc64-linux       |  1 -
 meta/site/powerpc64-linux-glibc |  2 ++
 meta/site/powerpc64-linux-musl  |  1 +
 7 files changed, 25 insertions(+), 14 deletions(-)
 create mode 100644 meta/site/powerpc32-linux-glibc
 create mode 100644 meta/site/powerpc32-linux-musl
 create mode 100644 meta/site/powerpc64-linux-glibc
 create mode 100644 meta/site/powerpc64-linux-musl

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index c5f4dfda412..3555d5a6631 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -101,18 +101,18 @@ def siteinfo_data_for_machine(arch, os, d):
         "mips64el-linux-gnun32": "mipsel-linux bit-32",
         "mipsisa64r6-linux-gnun32": "mipsisa32r6-linux bit-32",
         "mipsisa64r6el-linux-gnun32": "mipsisa32r6el-linux bit-32",
-        "powerpc-linux": "powerpc32-linux",
-        "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
-        "powerpcle-linux": "powerpc32-linux",
-        "powerpcle-linux-musl": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
-        "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux-musl": "powerpc-linux powerpc64-linux",
-        "powerpc64le-linux": "powerpc-linux powerpc64-linux",
-        "powerpc64le-linux-musl": "powerpc-linux powerpc64-linux",
+        "powerpc-linux": "powerpc32-linux powerpc32-linux-glibc",
+        "powerpc-linux-musl": "powerpc-linux powerpc32-linux powerpc32-linux-musl",
+        "powerpcle-linux": "powerpc32-linux powerpc32-linux-glibc",
+        "powerpcle-linux-musl": "powerpc-linux powerpc32-linux powerpc32-linux-musl",
+        "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux powerpc32-linux-glibc",
+        "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux powerpc32-linux-musl",
+        "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux powerpc64-linux-glibc",
+        "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux powerpc64-linux-musl",
+        "powerpc64-linux": "powerpc-linux powerpc64-linux powerpc64-linux-glibc",
+        "powerpc64-linux-musl": "powerpc-linux powerpc64-linux powerpc64-linux-musl",
+        "powerpc64le-linux": "powerpc-linux powerpc64-linux powerpc64-linux-glibc",
+        "powerpc64le-linux-musl": "powerpc-linux powerpc64-linux powerpc64-linux-musl",
         "riscv32-linux": "riscv32-linux",
         "riscv32-linux-musl": "riscv32-linux",
         "riscv64-linux": "riscv64-linux",
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index f8200ce5029..501e5b605de 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -8,7 +8,6 @@ ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
 ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
 ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
 ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
 ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
 ac_cv_sizeof_long_long_int=${ac_cv_sizeof_long_long_int=8}
diff --git a/meta/site/powerpc32-linux-glibc b/meta/site/powerpc32-linux-glibc
new file mode 100644
index 00000000000..62da4359892
--- /dev/null
+++ b/meta/site/powerpc32-linux-glibc
@@ -0,0 +1,8 @@
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
+
+# libc
+libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
+libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
+libc_cv_mabi_ibmlongdouble=${libc_cv_mabi_ibmlongdouble=yes}
+libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
+
diff --git a/meta/site/powerpc32-linux-musl b/meta/site/powerpc32-linux-musl
new file mode 100644
index 00000000000..8575ba75313
--- /dev/null
+++ b/meta/site/powerpc32-linux-musl
@@ -0,0 +1,2 @@
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+
diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
index 820a4b84403..18f9f29a6b5 100644
--- a/meta/site/powerpc64-linux
+++ b/meta/site/powerpc64-linux
@@ -4,7 +4,6 @@ ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
 ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
 ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
 ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
 ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
 ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
 ac_cv_sizeof_long_long_int=${ac_cv_sizeof_long_long_int=8}
diff --git a/meta/site/powerpc64-linux-glibc b/meta/site/powerpc64-linux-glibc
new file mode 100644
index 00000000000..dc5c28524b8
--- /dev/null
+++ b/meta/site/powerpc64-linux-glibc
@@ -0,0 +1,2 @@
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
+
diff --git a/meta/site/powerpc64-linux-musl b/meta/site/powerpc64-linux-musl
new file mode 100644
index 00000000000..38c537dd1b2
--- /dev/null
+++ b/meta/site/powerpc64-linux-musl
@@ -0,0 +1 @@
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
-- 
2.35.1


