Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8E3CCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.28034.1658155787184776661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1H4Aju+F;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so18421950pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0F9wCgphh2RDxSmzoDZuRZPGVkNaMy7AU7AR/k1fIi8=;
        b=1H4Aju+F1AMoj2sYXtyqvN6ro6vV+Df4sDl37DXNxJA1jTzZ3l4W5odx2g06x+SzR/
         10hmeqFxde+BDkoayGTcRVs8nsGvdmZ2MLpPmc6BWmoloU2K5enHKsK9Emv7ausuFjaA
         LeUYwcs+xwnu+VL5yPN9vSGcGwg/GMacfkBvbzKeQoWDQ9IYj8bY/+6a2YoQm5X2Uhak
         0C2WxRhiNQy71RLr7wv23KxVTm4C3QZz132bjqvgt7uUCepaI2YZukJY44q0vVCufvb9
         xpOYGijRFURTbww18A02dkk2/2nMCRL9d3m9BWf+Pnz5pC3zVd3KmgLhn5wEbEFQetOA
         Yq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0F9wCgphh2RDxSmzoDZuRZPGVkNaMy7AU7AR/k1fIi8=;
        b=slyfZSbsCZGjC1EhRyjtCrRGlK8vwc4Fm1ddh+LbhsIAoEndc+pFCbmfiYOommgdP9
         qlZ8IOyoXTiFENb505OVLqOmYFsERYAjRwsTZjwPaNB7waWmbyfvlxF0yiI0jFOENRgV
         9QaWTvYTf+Ljsj3ykBeEqGT29hM5jWRL3rernUz3JNKuGVnfWNgWtgstmRrGItVBUS07
         uNrqO+kwpI4H9LHMdC18RL+4wqnFjNh2FN5YYjMYq2Ujy8tLHTYDscnbCkX7YSLLTpcr
         WzaZ/HNp4PhM2KSg5T+NDMp//6Q4IhE8tRnVkKjP8EMuqbADOqcgdtN2OgzJpf5Ki3Wv
         lzGQ==
X-Gm-Message-State: AJIora9hubqhqx1Q/VGrPP3OXSfqIusAEIJuTvplpItr8qap70iMPhPE
	v6kjq6v5cy7FGoWdRbmd31YZ3mKRt349asDL
X-Google-Smtp-Source: 
 AGRyM1tqUaFaPY6RHtHce6L69TDuAS+f9/zgyxwh/rH8YaO6tSQUytrq1xW6IlZGnz+UUsM/S0PmGg==
X-Received: by 2002:a17:90b:2496:b0:1ef:a94:7048 with SMTP id
 nt22-20020a17090b249600b001ef0a947048mr32784898pjb.244.1658155785866;
        Mon, 18 Jul 2022 07:49:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/35] python3: Backport patch to fix an issue in
 subinterpreters
Date: Mon, 18 Jul 2022 04:48:37 -1000
Message-Id: 
 <39d57ef7e341a048b94bc5dd9c29d58f57e06f19.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168212

From: Markus Volk <f_l_k@t-online.de>

This adds a backport patch that fixes a problem in subinterpreters related
to the garbagecollector. Without the patch, there are random segfaults in
several Kodi addons that use python3-sqlite3. Presumably there are real world
issues in other programs as well.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch | 54 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.4.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch b/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
new file mode 100644
index 0000000000..6a58c35cc6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
@@ -0,0 +1,54 @@
+From 178a238f25ab8aff7689d7a09d66dc1583ecd6cb Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 4 May 2022 03:23:29 -0700
+Subject: [PATCH 01/40] gh-92036: Fix gc_fini_untrack() (GH-92037)
+
+Fix a crash in subinterpreters related to the garbage collector. When
+a subinterpreter is deleted, untrack all objects tracked by its GC.
+To prevent a crash in deallocator functions expecting objects to be
+tracked by the GC, leak a strong reference to these objects on
+purpose, so they are never deleted and their deallocator functions
+are not called.
+(cherry picked from commit 14243369b5f80613628a565c224bba7fb3fcacd8)
+
+Co-authored-by: Victor Stinner <vstinner@python.org>
+
+Upstream-Status: Backport
+---
+ .../2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst           | 5 +++++
+ Modules/gcmodule.c                                          | 6 ++++++
+ 2 files changed, 11 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst
+
+diff --git a/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst
+new file mode 100644
+index 0000000000..78094c5e4f
+--- /dev/null
++++ b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst	
+@@ -0,0 +1,5 @@
++Fix a crash in subinterpreters related to the garbage collector. When a
++subinterpreter is deleted, untrack all objects tracked by its GC. To prevent a
++crash in deallocator functions expecting objects to be tracked by the GC, leak
++a strong reference to these objects on purpose, so they are never deleted and
++their deallocator functions are not called. Patch by Victor Stinner.
+diff --git a/Modules/gcmodule.c b/Modules/gcmodule.c
+index 805a159d53..43ae6fa98b 100644
+--- a/Modules/gcmodule.c
++++ b/Modules/gcmodule.c
+@@ -2170,6 +2170,12 @@ gc_fini_untrack(PyGC_Head *list)
+     for (gc = GC_NEXT(list); gc != list; gc = GC_NEXT(list)) {
+         PyObject *op = FROM_GC(gc);
+         _PyObject_GC_UNTRACK(op);
++        // gh-92036: If a deallocator function expect the object to be tracked
++        // by the GC (ex: func_dealloc()), it can crash if called on an object
++        // which is no longer tracked by the GC. Leak one strong reference on
++        // purpose so the object is never deleted and its deallocator is not
++        // called.
++        Py_INCREF(op);
+     }
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index 357025f856..34fd2895a3 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


