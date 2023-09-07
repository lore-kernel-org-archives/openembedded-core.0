Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC609CA0FF6
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 10:50:48 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.9799.1694083844718108858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 03:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eWap3zKb;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4146085a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694083843; x=1694688643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46IX7GUO0GwGdoHTAxLGlHAXCz5djlif2Ns/4/l1pCc=;
        b=eWap3zKb+VoXFj6qIN4jRzeCV8nL1sDn6AzTA1SsXTuOxGh97QtUHDR78Mt35z+FXd
         3GhJXVseiCyHcaItv3U7ZSeX/3DCoOEFhE6w3dEuhvFjKBXJSckzw5LBM6vSs4cJnDpm
         K22x0cgzh5AJkhqS5sF0Q6cj2bL0p1ZbRXeU35wBlO+GloQHqcBGDL8BdByvRip7p+i0
         aoSSXtdtIcTJU5dc30CbAuRpQgwmjZlRmoyw3V3oUt9Zyny1aqvGvD2UhhmJkw9sp906
         PN5ak18UBtTDEC4WJ5VmX6qKz2Ih2gVv8QY3oKT9RajDNsZJi6hmyhFxommRDnnJ4tBb
         P4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083843; x=1694688643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46IX7GUO0GwGdoHTAxLGlHAXCz5djlif2Ns/4/l1pCc=;
        b=iAfc0J9y0MwR899OU7ukO5HbiZ8veIw82VupVib6l8cPRvsGaH893IsUPpzWxQpiEA
         yKG2C3TRx+Ufq9LxyYM3Jdn+Wg6QN/dAqXNxw0fUpZnlxRin8r1OhkVh9tMymJDG4hnf
         r1OWLbR06WQxE2AKWEisZTJ8xft7i8PCWGaJU1NslN5jBHRzhawKq6QEm7aLC+VfWBgq
         WroWgaXJhPUjRA+qiDO2MG/fUJP8vVp0Nu5NYsAE3/k2GR3GLTRqkx29D3KRVm5WtMPs
         k5k3AZSfACvJ5+wTtW8qDmY4eYSCvMDsQN5Mn2J/T9cHW+S+J7IcAI1yInqu5SnEudNx
         Tj9A==
X-Gm-Message-State: AOJu0YxopsEhPQliTeDA9GmuTjGRc7q/zqvjYNaHOk2szQn6GyM8wXKL
	QyySQa9r7q7P4CapD6hZLbApeVFWM4w=
X-Google-Smtp-Source: AGHT+IH4qalyWgyV682fyB4WKN15EwSajSXu0YxmKs35nAcZrvop/Un84NcI9WYLykqysCwiTYB6RA==
X-Received: by 2002:a17:907:a04d:b0:9a2:26e4:a5e2 with SMTP id gz13-20020a170907a04d00b009a226e4a5e2mr3049002ejc.25.1694083842566;
        Thu, 07 Sep 2023 03:50:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id dk24-20020a170906f0d800b009937dbabbd5sm10215222ejb.220.2023.09.07.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:50:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] runqemu: check permissions of available render nodes as well as their presence
Date: Thu,  7 Sep 2023 12:50:33 +0200
Message-Id: <20230907105033.7763-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 10:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187373

qemu itself is not helpful when render nodes exist, but can't be opened:

qemu-system-x86_64: egl: render node init failed

To fix this, users likely need to

 * modprobe vgem (presence when physical graphic card is absent or has a driver without
support for render nodes, such as many older cards found in server machines)

 * add their user to "render" group to write to /dev/dri/renderD* (permissions)

With this change runqemu should print hints for the above as appropriate from probing the nodes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0e105a918b1..3a170332689 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1383,8 +1383,18 @@ to your build configuration.
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
         try:
             content = os.listdir("/dev/dri")
-            if len([i for i in content if i.startswith('render')]) == 0:
-                raise RunQemuError("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
+            nodes = [i for i in content if i.startswith('renderD')]
+            if len(nodes) == 0:
+                raise RunQemuError("No render nodes found in /dev/dri/: %s. %s" %(content, render_hint))
+            for n in nodes:
+                try:
+                    with open(os.path.join("/dev/dri", n), "w") as f:
+                        f.close()
+                        break
+                except IOError:
+                    pass
+            else:
+                raise RunQemuError("None of the render nodes in /dev/dri/ are accessible: %s; you may need to add yourself to 'render' group or otherwise ensure you have read-write permissions on one of them." %(nodes))
         except FileNotFoundError:
             raise RunQemuError("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
 
-- 
2.30.2


