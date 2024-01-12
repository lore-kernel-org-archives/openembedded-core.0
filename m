Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19242C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 13:52:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7345.1705067553949503356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 05:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=H7tU8Okv;
 spf=pass (domain: snapchat.com, ip: 209.85.218.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a29058bb2ceso713747366b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705067552; x=1705672352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTgaBzqtEHxh3lNRSRGCWOFuDkSh4EEzUKARGAgYSIM=;
        b=H7tU8OkvI8eRDIaEAhO6YJiYZ66wZKY/hxg44RdgWtRv//+u2bOj8/JCFQAI1NeXhL
         EDznrLHvVw2zDu3cMGQbeUzIj1wYfOnOi+HE/7PdSxM7Cdp20KuBmDwYnYuRgNhdlK9P
         cAgw8k1VvN/3BZH2OQT8b5Gs4DfpKtHyXmr9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705067552; x=1705672352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTgaBzqtEHxh3lNRSRGCWOFuDkSh4EEzUKARGAgYSIM=;
        b=KZZIyncAqc9GVepgG9Bcpcd112jU/XB5fEiNpoF+Y8pmUObVRp882XGl2GfKui1SbP
         /ZsYep8PiL9OIixpL1pTJQJXPCfXucJKBQwK5h5yjG7fPTEyfmUmYpO+ZUVJrrICEbFh
         ubHWyjtBNZwsg23XJoGLuLXpVZ1iIfWWNf4e0QJGwbdL83SXqC/LIpMbN11eZ4VjSngT
         Ir0up2oFNE7bKA698asFkvkBh2icgUkIT+rfpuH3cmgJpfCc+u4zEJ2KfzimlLslPj+h
         l6hujllXFFrTXZQC3DYT3bJiXm5W7rh0ZFAxhMb01tR4n4L1n/LMNEQJJVVdDzY1z2DU
         ywIA==
X-Gm-Message-State: AOJu0YxyQz2PZiMoh4iSku+cgtKuNy0Oa/wsN13Hnb/cwKW1VU2G6r/Z
	6i34rs6OQTQhy6vZBOsMdSLp77Y3HgvC0CI6bRimvkpbtvvrT5t+
X-Google-Smtp-Source: AGHT+IEz3lNC0JJPEdr9LfA3pb0DsOWxbOFaLJrl6BCL52H4i3L0tCq0x+6MjnmFSFllz/y7PFoIVQ==
X-Received: by 2002:a17:906:600c:b0:a2c:8e99:5a6a with SMTP id o12-20020a170906600c00b00a2c8e995a6amr454063ejj.212.1705067551674;
        Fri, 12 Jan 2024 05:52:31 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id y11-20020a170906524b00b00a233515c39esm1820644ejm.67.2024.01.12.05.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 05:52:31 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Dominik Schnitzer <dominik@snap.com>
Subject: [PATCH] cmake.bbclass: add Darwin support
Date: Fri, 12 Jan 2024 14:52:12 +0100
Message-Id: <20240112135212.1871270-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 13:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193580

From: Etienne Cordonnier <ecordonnier@snap.com>

This was initially added by https://git.yoctoproject.org/meta-darwin/commit/?id=97a84e083d0c2812e44231d48fb478e9a9cfac79
to the meta-darwin repository, however having it directory in openembedded-core will make the maintenance of meta-darwin easier.

Signed-off-by: Dominik Schnitzer <dominik@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index d978b88944..1e353f660f 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -72,6 +72,8 @@ OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
 
 def map_host_os_to_system_name(host_os):
+    if host_os.startswith('darwin'):
+        return 'Darwin'
     if host_os.startswith('mingw'):
         return 'Windows'
     if host_os.startswith('linux'):
-- 
2.36.1.vfs.0.0


