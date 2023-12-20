Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA40AC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 18:02:42 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.28040.1703095361095199438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 10:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AfmOIkFw;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6da69dd6e9fso2796317a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703095359; x=1703700159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXfzHdU8Doi7ViDwnouKxvWJV3fGsxyYPX5+dHykPpg=;
        b=AfmOIkFws6debXmVlg+AYQdUx6Six93j4qYQKBVgXb05wUzShiGkZxHOH0m13qemvA
         L0pxii/Q52aZBbDmpZFtHjL6VeiBNPwZvdO6mFgGuuui0fa4KrZvdZUs2uos921JARf2
         CPR4Fm4AjPunCBO8hxxwDGiysiJ9eHTZsYz14ORIlZ0SAtnfdE4ZdsjjRsIRZ9UFcWPe
         npNLM/+JIZVknkp0v/+BJZsVRrsXdHDHKXd7eyJDt0gV1GxY+2AHKURC15VJrOh7kYo8
         xbK1oGFvVOyDuJY0M/xp31e4P8iCW0c7E56GSITDXQXJEe6G4tp3gJRQavEjdflP2dve
         Wf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703095359; x=1703700159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXfzHdU8Doi7ViDwnouKxvWJV3fGsxyYPX5+dHykPpg=;
        b=owS8CR1XPAgYa6TCB2LhYWpKn3/U3A6mUYESxvnkhmJFARrpJ7RB8ZIeUsR/7tv9XD
         50p/yt+u+KddD/1DlxCX5KsYpjvoJEJHKUQD8gH0FeSiz8ZXMKAzrH9hBW7zsI92xz6x
         WhFWiyRRKCzqzX2/FpgkrnWen57nhAhJMJ6/L1CoQO09/qg3VT0hBwulIco82Nqp0Sw4
         5dGXzobBEGOaMdYrO9X23rDmHQOfe858TW8XCQohfcOayVQRxmNDPe7uV39qkY7gFZQm
         AHpIFyjfNrdx3T0KKHnd1F5rfviV5bwpNaIr6ayZwhTTLwWPqT00emQqOkHLPxN5Ynq1
         6RCg==
X-Gm-Message-State: AOJu0YyMI8Vfpt3wJwSf9Zp2XxfM7QLngw7aSLe3wKBL99FPVgYh7Lvr
	gwGE+mdk2ruzASkzrGM7xHM+SuLk/20=
X-Google-Smtp-Source: AGHT+IHQLnvTEOAl/J7h2eZ3XXrrO2wb/+35neRA1BrwHwSkALO15zP8R6NxdCivq+EYOljKTodZbQ==
X-Received: by 2002:a05:6830:2b2a:b0:6d9:9e1c:491e with SMTP id l42-20020a0568302b2a00b006d99e1c491emr19834605otv.51.1703095359333;
        Wed, 20 Dec 2023 10:02:39 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d6e0])
        by smtp.gmail.com with ESMTPSA id k11-20020a9d7dcb000000b006d8786f3510sm43976otn.57.2023.12.20.10.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 10:02:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC 1/2] lib/packagedata.py: Add API to iterate over rprovides
Date: Wed, 20 Dec 2023 11:02:34 -0700
Message-Id: <20231220180235.3502418-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192807

Adds an API that makes it easier to iterate over the package data for a
all providers of a runtime dependency.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/packagedata.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index d59f6f5a569..2d1d6ddeb75 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -116,6 +116,21 @@ def recipename(pkg, d):
 
     return pkgmap(d).get(pkg)
 
+def foreach_runtime_provider_pkgdata(d, rdep, include_rdep=False):
+    pkgdata_dir = d.getVar("PKGDATA_DIR")
+    possibles = set()
+    try:
+        possibles |= set(os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdep)))
+    except OSError:
+        pass
+
+    if include_rdep:
+        possibles.add(rdep)
+
+    for p in sorted(list(possibles)):
+        rdep_data = read_subpkgdata(p, d)
+        yield p, rdep_data
+
 def get_package_mapping(pkg, basepkg, d, depversions=None):
     import oe.packagedata
 
-- 
2.34.1


