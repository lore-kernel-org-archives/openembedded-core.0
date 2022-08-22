Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D6CC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 08:10:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.15767.1661155814209913736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 01:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FBNXeVup;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id r16so12166485wrm.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=0MnwJLgUqTCJ97kvBQWYiOibEB9uCU0OHewLlvL6NMI=;
        b=FBNXeVupEW/evm1pl/FF8c+T3iKCYBOIIgL5YgoHlnywpYgfD5FHN3dm9V+7nQFvcH
         T15nVWdGfcKrccx5bI2LQF9Z2FL54PJXgqVJca0Mnz+T0Y7svo1XxPrwwdLxiSe3qJzL
         NuyGwb1MWy+px5fOlJpTrtiQJm+5FYxgri/KOlAoCLMDPl6/gZAMTzv9MFb86mWUoiMr
         0yUKssAFS6KodZQ8SZwEqAtCLpAuP2wva8iamsN1u5RUeOHHTfC3Jrv0dx26TdUbzNSj
         WGJolWqi0ugtqJ7c/BB3NTHrHB7GcnSTqyJQrX8oWxfecJJqggBYnRt+mwJGgUJcUtSu
         Dokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=0MnwJLgUqTCJ97kvBQWYiOibEB9uCU0OHewLlvL6NMI=;
        b=xK+748qj0X1/URioxGVQXL/iI5434W2jcLInMDEPVNqFNgeLJrVlNE0Clg9L/nW0Cm
         lXtjyXEbXwX+/FbwE/aUJOufYm48+6YgAyJi57lsYwjeLOeZweRt7slNrzPs/isK1100
         YVZyIXSRCfGTyHl997HXxq0Xb7FuJwi4ON4l4Zk193DDiOtKg7/P3GMD+dCkR4dmcU15
         +K6jy4PrYGSSAQFh61nkLT+ensHX1saCG/LBndzh2Yu3Ve+Q4VU6sq5zNgDAk1m6E1jp
         LN/VeFcKMzerZ+TrZ03mvWAXGIbetdcFxoVKmocFbEgg3Ih4RPpscZabucw+zWrNsSS+
         hWeQ==
X-Gm-Message-State: ACgBeo32GNuXIDXsZyGpXzSUlSso8HOn7p3ATqQ/x1ybDx2nZQHQDf8w
	e0FpwlRJMj1GqWRx3H53GGaagXGHPVI=
X-Google-Smtp-Source: 
 AA6agR6I3QjnIzGcy4UX2OQ5ysXlCBzksCi31AkI2izCzQx4sw5X8WX5t1TlPGgc5gvuqmy3QyuOfg==
X-Received: by 2002:a5d:58ca:0:b0:225:24a8:8861 with SMTP id
 o10-20020a5d58ca000000b0022524a88861mr10329105wrf.316.1661155812259;
        Mon, 22 Aug 2022 01:10:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c1c0700b003a319b67f64sm16791456wms.0.2022.08.22.01.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 01:10:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] systemtap: add a patch to address a python 3.11 failure
Date: Mon, 22 Aug 2022 10:10:08 +0200
Message-Id: <20220822081008.1356484-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 08:10:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169665

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemtap/systemtap/python-3.11.patch     | 37 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/python-3.11.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch b/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
new file mode 100644
index 0000000000..6e0c97b8d6
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
@@ -0,0 +1,37 @@
+From 069e109c95d1afca17cd3781b39f220cf8b39978 Mon Sep 17 00:00:00 2001
+From: Stan Cox <scox@redhat.com>
+Date: Wed, 13 Jul 2022 09:49:51 -0400
+Subject: [PATCH 1/1] python 3.11 removed direct access to PyFrameObject
+ members
+
+Take into account the change in PyFrameObject definition to allow
+building systemtap with python 3.11.  Additional support for python
+3.11 is forthcoming.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=069e109c95d1afca17cd3781b39f220cf8b39978]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ python/HelperSDT/_HelperSDT.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/python/HelperSDT/_HelperSDT.c b/python/HelperSDT/_HelperSDT.c
+index 967cb6077..4d287132e 100644
+--- a/python/HelperSDT/_HelperSDT.c
++++ b/python/HelperSDT/_HelperSDT.c
+@@ -14,7 +14,13 @@
+ // PR25841: ensure that the libHelperSDT.so file contains debuginfo
+ // for the tapset helper functions, so they don't have to look into libpython*
+ #include <frameobject.h>
++// python 3.11 removed direct access to PyFrameObject members
++// https://docs.python.org/3.11/whatsnew/3.11.html#c-api-changes
++#if PY_MAJOR_VERSION <= 3 && PY_MINOR_VERSION < 11
+ PyFrameObject _dummy_frame;
++#else
++//PyFrameObject *_dummy_frame;
++#endif
+ #include <object.h>
+ PyVarObject _dummy_var;
+ #include <dictobject.h>
+-- 
+2.31.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 2b79aa8fca..b05a5a2b0d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
+           file://python-3.11.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.30.2


