Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.26386.1611849178749252775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 07:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WROTTaFK;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id y11so6943461ljk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jgcprxr6CSFIa4u8Y3+SgDb6dxFVJNHwAl6RPSOsok8=;
        b=WROTTaFKx1+mG80bk70YvmgJdpHRcI7SBVh2ZFOUYaQhg7RpFFcWhoUmriEj+0mEQm
         3Bkaj+xUp6mjD+iQAMv4hRj0ck0aKyRzLkw7Z87KRpi+2BP3LlbUSCQAYHdELoNAJ0g2
         KcvOaKXBTH32IXox2nVelPIIkT1cxuczwhgxOJeLnHQO/5utnKj4AhCWpo59eiwIerU9
         emFt0vsglJOtqAaYjN0WcReQ+goSzPil4hOMds2iOCwFZS51xiCB1VczOGEuJUO5igMX
         ZrOoGF1zhawJcZzgtUgjVA9IjpbAzz03MRhl/Bp19/LOLIy7/PYB2m/PW8N2t1jKYNq1
         fNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jgcprxr6CSFIa4u8Y3+SgDb6dxFVJNHwAl6RPSOsok8=;
        b=cUGIZlxjehfgnTZZOSDpYUrmhA2cftrcWmHeceuAe0n6wxkGxqEiUmboQUoJfM9gJc
         REt4wgWEt3N/L+xPZ7NKFIBzHQasG4rkzzN83NxCNXRfL83RnoYV4ia2jze1Zb/jH6WU
         Lo4rNvJMV4nZfT63/v8woyH4j7M4BFY0VWBNYdhtLLj9WwzW7DjShjO4YlGpXvUOuIRO
         ecWmi7LhbuTarZuELmToi2KTVdeXDW2q4Acz78GuuOCdJY+y6tO0kBPpcPeUW8xqj9f/
         zBodOvs1LybtA/eVS7tAyZIPHNrjNfOekMpKVlkeVBQmn2RluWCsu9QVCK0Uht02Pcc/
         aYcQ==
X-Gm-Message-State: AOAM531SM9gGut6prLHM8tnsWn4ULRGlhfLVN7zegp0kg5oYl9TmxGMX
	lnT3nnWWe3+w5kaIDEtfS6HnYk1VDA0=
X-Google-Smtp-Source: ABdhPJxFHM4zUYU8wslfn3DRojTGYmOy0mVrLlGhR4GH/nN0WakcYeRWawIX12I6Qom0famsMHt2Lw==
X-Received: by 2002:a2e:9819:: with SMTP id a25mr4516049ljj.502.1611849176454;
        Thu, 28 Jan 2021 07:52:56 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id 70sm1709540lfb.165.2021.01.28.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 07:52:55 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
Date: Thu, 28 Jan 2021 16:55:34 +0100
Message-Id: <20210128155534.7104-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we run `devtool build mc` recipe's task dependencies are expanded
to "mc:do_populate_sysroot" where "mc" name is treated as multiconfig
and "do_package_sysroot" as multiconfigname.

| ERROR: Multiconfig dependency mc:do_populate_sysroot depends on
| nonexistent multiconfig configuration named do_populate_sysroot

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 bitbake/lib/bb/cache.py    | 4 ++--
 bitbake/lib/bb/cooker.py   | 6 +++---
 bitbake/lib/bb/runqueue.py | 6 +++---
 bitbake/lib/bb/siggen.py   | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

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
index 83cfee7fb4..3d8dbd6065 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -533,7 +533,7 @@ class BBCooker:
             self.reset()
 
         def mc_base(p):
-            if p.startswith('mc:'):
+            if p.startswith('mc:') and p.count(':') == 2:
                 s = p.split(':')
                 if len(s) == 2:
                     return s[1]
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

