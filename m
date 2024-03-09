Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B468C54E49
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 23:57:59 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.24543.1710028672006915408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 15:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fkh4Qd8v;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so2184154a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 15:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710028671; x=1710633471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNd2IsGNihojabAAIq3wFTKohVHMTXxDXrovhwdd5Wg=;
        b=Fkh4Qd8vndM/FHN60mBoWyxZqhQqus9ZD7MJ4xfcugYLLPN0hMbXXyxmdF0gV+aCvk
         8qg+FQj7SRA9fK2ZGrKsnOPBUzJeKaVVFJKms9ITQD/k3Kcfsb4kIkKPGDT+4vOrTqwJ
         kv4psYoLPXTHBIKx9nBffWjRCeuNRg0EzUpOf2x/foPuYlD4QTFwryZfDQUyBqfnGhuH
         jdNeDuk2Xt+5A572AATY7vrscNiE6l103k5lcckjdLm+f1smKODKsiUxuw1aoOfF1Bbr
         DQBO966oozxDyt4oqQj66B2GmZYfdsiFoOM2x68qYS3teYbXB0+pTNAuffoZapCnVnHP
         zAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710028671; x=1710633471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNd2IsGNihojabAAIq3wFTKohVHMTXxDXrovhwdd5Wg=;
        b=Ccrb9i9z0TYdUfwjyQTWk5CPUAxIjYB9/z1dLsovMZiFRCN6Idt9qgOew2Zo29EKwY
         n6l7vRYWbUtM+pnRkzkOUaP7fxpdQk8hLC8oNf9C3b9vlvC8roA3TObvVtoR0Sv8f6FT
         NKnYx9FHeyXKDyVxwp59mKVJtlUQworNALmtlo8pKbfeswRg4VvZPnDK/Kwzi0LQ+/nD
         x/ZWeG16D2gBMmbURE1dImEZXQAZFA8bWI/cbZXZdFGta41tNlel1QBEP+tr3RhGzW3p
         JtlhQXHeYszWQ675s7ua7AIEPy/k7bnNXVD4Sym7XzjgFRC2TylWqXbCwGWj2z7UiSKq
         sLlA==
X-Gm-Message-State: AOJu0Yx40GQ6IfxZpARneeYQBHQnwx8WyZyLMpUJ5AE5seB0gq4LAdd8
	UblZiGsbF//EhZ3JM0xDzPN/KTDaNlf7UaUI/TZ14t8ZwHVmr7DQuXDdhWHq
X-Google-Smtp-Source: AGHT+IHkeV1Amh7BMPxODJpOUmyRPcCYV6nbxNPYlE+qj7QV27QnKIJtuQCCBI4SjdBLPMuusVK++A==
X-Received: by 2002:a05:6a20:748e:b0:1a1:8ba3:500f with SMTP id p14-20020a056a20748e00b001a18ba3500fmr1745518pzd.31.1710028671071;
        Sat, 09 Mar 2024 15:57:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::bc23])
        by smtp.gmail.com with ESMTPSA id h1-20020a17090aea8100b0029b96ab89bbsm4662075pjz.10.2024.03.09.15.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 15:57:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Fix build break with clang
Date: Sat,  9 Mar 2024 15:57:48 -0800
Message-ID: <20240309235748.517154-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 23:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196875

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 ...01-debuginfod-Remove-unused-variable.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index b3b2476f0f3..c5c1542b051 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-debuginfod-Remove-unused-variable.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
new file mode 100644
index 00000000000..81f49dbf216
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-Remove-unused-variable.patch
@@ -0,0 +1,34 @@
+From c3502140e51886bffc6ae5cd256308e40e0cbb78 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Mar 2024 15:52:32 -0800
+Subject: [PATCH] debuginfod: Remove unused variable
+
+Recent commit acd9525e9 has removed all references to max_fds
+therefore remove it, moreover clang18 is happier
+
+| ../../elfutils-0.191/debuginfod/debuginfod.cxx:1448:8: error: private field 'max_fds' is not used [-Werror,-Wunused-private-field]
+|  1448 |   long max_fds;
+|       |        ^
+| 1 error generated.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2024q1/006900.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ debuginfod/debuginfod.cxx | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
+index 560880f2..72617848 100644
+--- a/debuginfod/debuginfod.cxx
++++ b/debuginfod/debuginfod.cxx
+@@ -1445,7 +1445,6 @@ private:
+ 
+   map<key,fdcache_entry> entries; // optimized for lookup
+   time_t last_cleaning;
+-  long max_fds;
+   long max_mbs;
+ 
+ public:
+-- 
+2.44.0
+
-- 
2.44.0


