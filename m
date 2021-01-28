Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web12.93.1611854439977637266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 09:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MPUaLQWB;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id u4so5754346ljh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 09:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CL01mzhwR5ZrjzkAsXkC20tIMaTgQ+6TUNIHUclXFgI=;
        b=MPUaLQWBGudfLUcUyOIYxveNdQBmxhXNqO/dJE2vTuPU1twlxTYEJ5TjTO+/OTOQlP
         4DmaTr6komcoBpzOXGEF6/sB4aGYjJbR8u7y8FOCu+sbxbcgnxJ3y+T7T3yg4kevsMEs
         AuSB1xkFeFc96D8DiRYyeRHdRopGjycGHRXmF05ra0t2VshWH/0OSZokGTgh+ToCevWz
         DakdNPTC0ocw+jkNu6Tf3Rc9jQp3MzjXLPeFUcTdJXkN0sbkexRUhy0RvyqwWoklQuXQ
         PXwyhvNlEhkCMCjUsMwhk4MyMlOMQsL7QZFMjiygyL1RISyn8NQotLow4+vn3dPn3Q3O
         h5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CL01mzhwR5ZrjzkAsXkC20tIMaTgQ+6TUNIHUclXFgI=;
        b=hA0oBwyHJ0K6xSWptMq0vynfUWLtkW/PZvgvFXc1vDIhDEOZzbwxRzGx9U5N3GpkmL
         x+TXPRDB9Xc1EV7rZsPBK+3n6HbxNhGiA/IwkJTEJoZIQUis6CFAXG0+MGKneTYnKR+Y
         45J8yqCq37zBwzeVZBMwDYFf/E2Npo6x7U1RkBfpaG0g3IsQqUqQOi4RDA8vtxLM00n6
         1/oXrHHTsu8RM2fjZbddT6tQi0W34VFh4BjY13OrWbNnldRTCIPkYNa+gAZdqsSNqhoj
         F32ionRqhncDC/FSOYiLrS4VluIhCkc0MmaqnBMMApcP5URMeyXEjbQs9URbDD3UA2dN
         hJvw==
X-Gm-Message-State: AOAM533ajTsnW+TuXpukDhI9l3YUpiDR8uiwFF4dVxIeJhHAGGdcmCOF
	YgZ2osBBgvdfQCaq4f1evyu8igGasOFvRQ==
X-Google-Smtp-Source: ABdhPJyucdpuJQN9rbihg3rPtbY7hHjOdjsvM09wpANsvZGLmhis6Lp2bxusuAFAKWBP11P2CuhtMg==
X-Received: by 2002:a2e:5802:: with SMTP id m2mr160607ljb.145.1611854437806;
        Thu, 28 Jan 2021 09:20:37 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id a11sm1739012lfl.259.2021.01.28.09.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:20:37 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
Date: Thu, 28 Jan 2021 18:23:13 +0100
Message-Id: <20210128172313.7681-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we run `devtool build mc` recipe's task dependencies are expanded
to "mc:do_populate_sysroot" where "mc" name is treated as multiconfig
and "do_package_sysroot" as multiconfigname.

| ERROR: Multiconfig dependency mc:do_populate_sysroot depends on
| nonexistent multiconfig configuration named do_populate_sysroot

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

--- skipped change in showEnvironment() to keep "bitbake -e" working
---
 bitbake/lib/bb/cache.py    | 4 ++--
 bitbake/lib/bb/cooker.py   | 4 ++--
 bitbake/lib/bb/runqueue.py | 6 +++---
 bitbake/lib/bb/siggen.py   | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
index 36270d0093..5497da384f 100644
--- a/bitbake/lib/bb/cache.py
+++ b/bitbake/lib/bb/cache.py
@@ -238,7 +238,7 @@ def virtualfn2realfn(virtualfn):
     Convert a virtual file name to a real one + the associated subclass keyword
     """
     mc = ""
-    if virtualfn.startswith('mc:'):
+    if virtualfn.startswith('mc:') and virtualfn.count(':') == 2:
         elems = virtualfn.split(':')
         mc = elems[1]
         virtualfn = ":".join(elems[2:])
@@ -268,7 +268,7 @@ def variant2virtual(realfn, variant):
     """
     if variant == "":
         return realfn
-    if variant.startswith("mc:"):
+    if variant.startswith("mc:") and variant.count(':') == 2:
         elems = variant.split(":")
         if elems[2]:
             return "mc:" + elems[1] + ":virtual:" + ":".join(elems[2:]) + ":" + realfn
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 83cfee7fb4..c200127b27 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -614,7 +614,7 @@ class BBCooker:
         # Replace string such as "mc:*:bash"
         # into "mc:A:bash mc:B:bash bash"
         for k in targetlist:
-            if k.startswith("mc:"):
+            if k.startswith("mc:") and k.count(':') == 2:
                 if wildcard:
                     bb.fatal('multiconfig conflict')
                 if k.split(":")[1] == "*":
@@ -648,7 +648,7 @@ class BBCooker:
         for k in fulltargetlist:
             origk = k
             mc = ""
-            if k.startswith("mc:"):
+            if k.startswith("mc:") and k.count(':') == 2:
                 mc = k.split(":")[1]
                 k = ":".join(k.split(":")[2:])
             ktask = task
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 28bdadb45e..d1fcb7cea4 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -38,7 +38,7 @@ def taskname_from_tid(tid):
     return tid.rsplit(":", 1)[1]
 
 def mc_from_tid(tid):
-    if tid.startswith('mc:'):
+    if tid.startswith('mc:') and tid.count(':') == 2:
         return tid.split(':')[1]
     return ""
 
@@ -47,13 +47,13 @@ def split_tid(tid):
     return (mc, fn, taskname)
 
 def split_mc(n):
-    if n.startswith("mc:"):
+    if n.startswith("mc:") and n.count(':') == 2:
         _, mc, n = n.split(":", 2)
         return (mc, n)
     return ('', n)
 
 def split_tid_mcfn(tid):
-    if tid.startswith('mc:'):
+    if tid.startswith('mc:') and tid.count(':') == 2:
         elems = tid.split(':')
         mc = elems[1]
         fn = ":".join(elems[2:-1])
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 0ac3952466..6859a7207b 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -748,7 +748,7 @@ def clean_basepath(basepath):
     if basepath[0] == '/':
         return cleaned
 
-    if basepath.startswith("mc:"):
+    if basepath.startswith("mc:") and basepath.count(':') == 2:
         mc, mc_name, basepath = basepath.split(":", 2)
         mc_suffix = ':mc:' + mc_name
     else:
-- 
2.30.0

