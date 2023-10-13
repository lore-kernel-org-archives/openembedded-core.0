Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB9EC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.51170.1697234005460857388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mWNVxXH6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso1928915b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234004; x=1697838804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euNEbQsuec6wuVRrg/IhF+uiLtg9A08NmB0BrDaGwrw=;
        b=mWNVxXH6QkY9VqJh3USZcy6M2F4r0Jm8Bo/mtfCy0nPyrsxJjlDOUllObYZd2Vh6+Q
         DDpasIhxwTreK5dlgK3Ybfjd1Wokv/48GZnhFt6JTrGTLIfy75Q0Af/RHalIUxG+kr7B
         5OdwlzMXQytaWtXkc6YQJu1edsfnToKOw8q1LTBO9IH1BW3iGjxSi/+ElkB8QpQgP1Hq
         Ahg4SwLbKED2RTV0YZo50SaEC22kQ9ZmD/9Drfn/P1Q2RmZCLS6tXRbo/6qZHKW4he/s
         WbZgCdkmuBXSE1hjjoP3+KqlFoJcOBNjxyLnyQDNMH2i/VsMmL5RylzjneF9tS5B0+1+
         319w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234004; x=1697838804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euNEbQsuec6wuVRrg/IhF+uiLtg9A08NmB0BrDaGwrw=;
        b=La8OalB1VKQ97w8wHNrnviQf71uu92R+jhkcpPsPmw9bWzSUh1r7YegQab763bxnYD
         vUIfQ9uqAwKbEPXNHU0babwWQUx23bgh9AXA5haquogZgmhWFj4ucilJewPhP6IBqDJG
         9RK3PzwiyblwJ6cLICCGOf9f5hGmNAE4CcIc9SuXV/WnkLUV9uzgekoznepwa5PHrSXe
         LKpZbru/sJ+CckWXPT+XHHSjfNpU6oXB0krCK+EKQnldj/MgOVf1t8epF6NHNfi8MNCk
         gn4N9iAeibX+RyATsM+7Igl4vI/7442Q067ePhCYRIlAipVzYPWnKguUo0MAL7UmWX7K
         BHvw==
X-Gm-Message-State: AOJu0YxQyrHqB6oXj/y3KLuOKietFV383jMBOOLswW6EUPSyC4y+5cF1
	pmYVz4Hz8HIIvtP1m83pulZKX1npxaIJACIfFn4=
X-Google-Smtp-Source: AGHT+IGFqMkEbKKXrD5Bu+aMiVLFRvY3V/kC6UNLSW735I3mqwVRw6l2076NQ4aGm0ZRuYWSDGeHSA==
X-Received: by 2002:a05:6a00:a29:b0:692:6417:728a with SMTP id p41-20020a056a000a2900b006926417728amr2595815pfh.14.1697234004612;
        Fri, 13 Oct 2023 14:53:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/27] runqemu: check permissions of available render nodes as well as their presence
Date: Fri, 13 Oct 2023 11:52:37 -1000
Message-Id: <12ae43abbc4e7d6184198a912487ace3a4e66e50.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189090

From: Alexander Kanavin <alex.kanavin@gmail.com>

qemu itself is not helpful when render nodes exist, but can't be opened:

qemu-system-x86_64: egl: render node init failed

To fix this, users likely need to

 * modprobe vgem (presence when physical graphic card is absent or has a driver without
support for render nodes, such as many older cards found in server machines)

 * add their user to "render" group to write to /dev/dri/renderD* (permissions)

With this change runqemu should print hints for the above as appropriate from probing the nodes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit acd85925cb197b7a31a25b60e8de762e2c3697ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ef24ddc6b2..ea44600e64 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1374,8 +1374,18 @@ to your build configuration.
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
2.34.1


