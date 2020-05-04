Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.9033.1588607348367658302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 08:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P0hPIyr8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id s8so11250839wrt.9
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQn8UjQOwlkGXSDmHkOuWMLrtGAL3zdgePbhnMYnW2k=;
        b=P0hPIyr8En7jvIZwMs2QjVnXZLskH4xnSaieIj/7bPaihD0/cI0M0JcGLxXXvwb+YK
         pvuF1tjfdFS7WJmUmxFg1qcR7bYZFp1zIofRBsqBcBsLFSKCbDJKsAe6CNW7xTS2vUVU
         Ixk39Lv270hqW5+rWZaY/Z/gkI0xI+MdjOnC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQn8UjQOwlkGXSDmHkOuWMLrtGAL3zdgePbhnMYnW2k=;
        b=tSTh8l9+QNKScFujKRiJLOkBtGS+qa1vTLe/lyU+60LyAFaQFMgu1F5KZ3Gnv22WlR
         cO8LMhp8h1EI8ZsoNz0DmxVTcelhuUDCiKwCQwYYZHqzENXiWgycl8SBbnKAYT2OUaAI
         eBNb3IVvD2rj+zl++mWMaDGs046Bw1mdKcwhpq8L6Be9wA4fLPThFZmelYBXVr8KhZQD
         6EN/TBULkawis+FipfVXecQN7J7TFBt30Q1OZhexu8EjiEUaLccpoCnBTdXVaBRttERt
         nPHr3MAV7HlGdes4Ldk+9kOlhrwdpRyaJNRjE239hhjUoycDcvITOAJEXePKaEMUXjZM
         ppSg==
X-Gm-Message-State: AGi0PuZ66tak9qIZL11BoEg3OGdeM9kPWoQoD72K8TG3BVqtxYfG+b3v
	XKrV9KoI8GXiy9IzoGjWs/cD37/6SP0=
X-Google-Smtp-Source: APiQypJeSqP+qa5DlmCFPKCuVi1EMDtl/TgZc3Uj9Tl+ti2GlPh96K6ecljj3HPR88qgnEJ6ZHZKKw==
X-Received: by 2002:adf:a1c8:: with SMTP id v8mr11330506wrv.79.1588607346470;
        Mon, 04 May 2020 08:49:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 5sm13632271wmg.34.2020.05.04.08.49.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 08:49:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] utils: Drop FILESPATHPKG usage
Date: Mon,  4 May 2020 16:49:04 +0100
Message-Id: <20200504154904.3230000-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in OE-Core uses this and its been deprecated for some time. Remove
the last reference to it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index cd3d05709ed..c32b868aa88 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -1,12 +1,10 @@
 def machine_paths(d):
     """List any existing machine specific filespath directories"""
     machine = d.getVar("MACHINE")
-    filespathpkg = d.getVar("FILESPATHPKG").split(":")
     for basepath in d.getVar("FILESPATHBASE").split(":"):
-        for pkgpath in filespathpkg:
-            machinepath = os.path.join(basepath, pkgpath, machine)
-            if os.path.isdir(machinepath):
-                yield machinepath
+        machinepath = os.path.join(basepath, machine)
+        if os.path.isdir(machinepath):
+            yield machinepath
 
 def is_machine_specific(d):
     """Determine whether the current recipe is machine specific"""
-- 
2.25.1

