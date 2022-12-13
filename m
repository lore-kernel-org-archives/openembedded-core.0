Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E787EC25B04
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.70922.1670929891962143381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iqZEEdqz;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h12so15198549wrv.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=594qFos5MUFZzxAVYz9a8SlFh/xDXgPZHoBQTYi1LUA=;
        b=iqZEEdqzEaC0dL1PJqMhkxHb3kQBfe0YhAh4p0Ly09rycSuBtVsvvyoxC8fAF6xYnd
         ql+IVQezBNJKXU/yFI3aQa2x7CvrfmBq2UeRck1EfZ0pcqbP11KV4snhkmDleP7rLaxL
         ce/uj1uYQX7WqZwMMt9lUwsrSAfsJCmtbLotBFKhzHggpzABccgB2V4dh4RDO+pHiHTi
         fedKVg+v4tWsjJZTI2adyhqmBgvMcUvOwylZqzJUj8yCPKkfFHd0ztutaVlbfUTpIl+C
         AW9J/S6LC/QH7C6uIkO4JHrauXQY/7xewzP+6Ck5jboA5eVYOuuME+Y2TbIICPpGRTLz
         RkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=594qFos5MUFZzxAVYz9a8SlFh/xDXgPZHoBQTYi1LUA=;
        b=L4K0hif+3MTD5md6ipA3FuhRQmdRKwTMdh0OZZqo3NmW08/wJUGaqM88sQrFOb03XF
         rZcZVOlS07pvdbUcrfbYKPCm2eFuxN65sg7j3BvKYDt5r65dHoMfPjbECwwiLt4zyB+x
         RY+El2zT8pfvDli5w/KYw26IAIpCucu1iv51/QpwUIVK0QH7IinVtAuW+zTMM662FtHm
         OLwthDPdDLlrOu0OaGSj95XOwsZVk2a0XjfsqIB51in0dyW491kazBDAwMpT4d5ZCDpH
         ptIaR3OMgTmD5tku22t3PKAj5lQ9DGw2KyEZhnrBoaaLiTSTPcM+5tT3u18fVsfKOYcl
         olaQ==
X-Gm-Message-State: ANoB5plO582TnmdsW7WkHLTIgl0VCMdOT82ayoHvV9ZailHOp6Ioxoi5
	7RBN43zXC9v5d8w0uPoc14fCsaCSQZc=
X-Google-Smtp-Source: AA0mqf615MMm5q7JzwfgelPGe9dHlH9zCzRqa4Ekjw+dT/4XWyJW4TJvzG+To/FmxMXNrOUqx5MQlQ==
X-Received: by 2002:adf:a743:0:b0:242:1c1a:37ec with SMTP id e3-20020adfa743000000b002421c1a37ecmr11765862wrd.17.1670929900219;
        Tue, 13 Dec 2022 03:11:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/24] systemtap: upgrade 4.7 -> 4.8
Date: Tue, 13 Dec 2022 12:11:17 +0100
Message-Id: <20221213111118.149697-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174533

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemtap/systemtap/python-3.11.patch     | 37 -------------------
 .../systemtap/systemtap_git.inc               |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/python-3.11.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch b/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
deleted file mode 100644
index 6e0c97b8d6..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 069e109c95d1afca17cd3781b39f220cf8b39978 Mon Sep 17 00:00:00 2001
-From: Stan Cox <scox@redhat.com>
-Date: Wed, 13 Jul 2022 09:49:51 -0400
-Subject: [PATCH 1/1] python 3.11 removed direct access to PyFrameObject
- members
-
-Take into account the change in PyFrameObject definition to allow
-building systemtap with python 3.11.  Additional support for python
-3.11 is forthcoming.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=069e109c95d1afca17cd3781b39f220cf8b39978]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- python/HelperSDT/_HelperSDT.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/python/HelperSDT/_HelperSDT.c b/python/HelperSDT/_HelperSDT.c
-index 967cb6077..4d287132e 100644
---- a/python/HelperSDT/_HelperSDT.c
-+++ b/python/HelperSDT/_HelperSDT.c
-@@ -14,7 +14,13 @@
- // PR25841: ensure that the libHelperSDT.so file contains debuginfo
- // for the tapset helper functions, so they don't have to look into libpython*
- #include <frameobject.h>
-+// python 3.11 removed direct access to PyFrameObject members
-+// https://docs.python.org/3.11/whatsnew/3.11.html#c-api-changes
-+#if PY_MAJOR_VERSION <= 3 && PY_MINOR_VERSION < 11
- PyFrameObject _dummy_frame;
-+#else
-+//PyFrameObject *_dummy_frame;
-+#endif
- #include <object.h>
- PyVarObject _dummy_var;
- #include <dictobject.h>
--- 
-2.31.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index b05a5a2b0d..d309a89496 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,13 +1,12 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "0c335a75a789ff44b514e567d458881e15cc283d"
-PV = "4.7"
+SRCREV = "b176afb2e49119ef844d193d27b0752a6d84fe8f"
+PV = "4.8"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://python-3.11.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.30.2


