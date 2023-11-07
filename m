Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2417C00141
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:28:04 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.13765.1699370876337448445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIiM3sDo;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9d10972e63eso862339466b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370875; x=1699975675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jEov84liuOIYpydN2gCeN6fg+lXT8deOyhMLeA1Of9o=;
        b=GIiM3sDorlaXOBa1KyuC1R8u1XxGR6MIUSHw6tBoD7HD5JBAblRzCDTw2l47s7tlK3
         TbnnRTnKUPp41qAcrmISanjtDYMIUMGTON3ucFeLfoXprEMhM70WTyJxfsnD7NbSBpvj
         +68oP0togjHpfWsC6OSXO5rPMQwIqDdv7ts/tYI720yD8OMFhxGvdhHooWvYrS51E0sy
         acVKjwZ7/AHKLarq/FDxiXF3Mkj/vWcJ7Ex8fLR+QFa2PyDd2GNkeuAi2OIXeJkChgfj
         F82V0EEfJjjquAx5MGvOQtsMA2daQNShaDpLDLVZ85gfHM0XT6FkxgtTxyBUEokeQKKB
         7yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370875; x=1699975675;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEov84liuOIYpydN2gCeN6fg+lXT8deOyhMLeA1Of9o=;
        b=tahCsTSb7yei/U5gndNooLWXJlGT/OSGj9yNJ6V8s/962gd0rxslJzjCa74fx6391L
         4vAkDolB4xs6kMGInd8Gjahw4ndy8VUpTDRIWLGHyvyCanDgUVTiFccSCD8/Q+jJz1VE
         KbvIFNjSDTEzp6EgSvGXSlbSKntEheFQ6gae1xt14dCVfS07hLWY4RIyry7C62VkBR4Y
         6xkVn5KtYGpYkGjeS4+bNRGHvFiSwGQqyDbQFfl06rSFVKyjCH5AGPAqu2Ex3G82crbg
         EYXyf6AnwWxklyvtEYvG68R4nfVoddO8hanr9mLrNlU2LnUSrdu6+l14eV5crg2u9Q06
         tP/w==
X-Gm-Message-State: AOJu0YycnwZnimzxEFYCiOAge+qIWnPzhh633Z+6HAs1MeDmTZZ6GYpe
	vqjKg9wrroczBGTc00L1xQtQ62wRDu4=
X-Google-Smtp-Source: AGHT+IGC5Jz3slPl3vu1WeA3jf/Fh+Dt94VWBWGYhPLDui7sTatv2tVqdkfWS7Lq9HBTjSsjx3xrYQ==
X-Received: by 2002:a17:906:ef0e:b0:9c7:4d3e:1e50 with SMTP id f14-20020a170906ef0e00b009c74d3e1e50mr19752804ejs.76.1699370874815;
        Tue, 07 Nov 2023 07:27:54 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:54 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 5/7] lib/oe/buildcfg.py: Add additional git functions
Date: Tue,  7 Nov 2023 16:26:40 +0100
Message-ID: <20231107152641.1043-7-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190295

From: Jermain Horsman <jermain.horsman@nedap.com>

Includes a function to determine the default remote.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oe/buildcfg.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index f9cb0cc74c..2ca654e56e 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -50,6 +50,22 @@ def get_metadata_git_remote_url(path, remote):
         uri = ''
     return uri.strip()
 
+def get_metadata_git_default_remote(path):
+    remotes = get_metadata_git_remotes(path)
+    if len(remotes) == 1:
+        default_remote = remotes[0]
+    else:
+        try:
+            default_remote, _ = bb.process.run('git config --local checkout.defaultRemote', cwd=path)
+        except bb.process.ExecutionError:
+            default_remote = ""
+        if not default_remote:
+            try:
+                default_remote, _ = bb.process.run('git config checkout.defaultRemote', cwd=path)
+            except bb.process.ExecutionError:
+                default_remote = ""
+    return default_remote.strip()
+
 def get_metadata_git_describe(path):
     try:
         describe, _ = bb.process.run('git describe --tags', cwd=path)
-- 
2.42.0.windows.2


