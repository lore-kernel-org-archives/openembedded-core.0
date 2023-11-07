Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A043AC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:27:54 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.13567.1699370864675365944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXtVg+RQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9e2838bcb5eso113643766b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370863; x=1699975663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/cZ/9Mo+MI4jon5yOj1vuIgOr8TwKVVqvSz7TzeEJU=;
        b=bXtVg+RQ392SsZGrFv6p859baqENGfIysWD4DVJvgDa+AhZkf6gtRzJ00Uw2Sy+c+O
         CuXRky9JOTl8lDhwkOdx8Oot27vJKfBAJirBYfJ7hTm2Wwd/9u3StSd2M7fYsV917wcE
         K3YW5sqZepJVgkNRZftIVIRcTCMvhrhnAKwK0YYK1u/zgGq44Vc0vSws4jDcXCHvu2xh
         kCGLJps8YeG4C0O2MM6FU2WGwAO53mKtdC8c71v8O+WhyYPJ+cG2JbTmAIVl+avymnZq
         lDWZ5dtPCF3dhZBp5dMPLTt+H771+vBIw2EnMdsiIJLt8SwEO/gbhI3QZPQWh8CjM7PX
         bSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370863; x=1699975663;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/cZ/9Mo+MI4jon5yOj1vuIgOr8TwKVVqvSz7TzeEJU=;
        b=GYtrCEk4tG5dywvA2hxw8JBCLaWcWYAU7SzFdNAfJbUoMUtJFuc0/Jg9d0qdHroPFY
         Wxg87w6Qq5qlUzTYDYBPWTRa+7na8Hps+v5ptG5ikWKOWV+lixIZbEEavFDviQNg0zOh
         S9LGnnVkRBQOwSpXGLF00rfyfjqZJa8Gc72uVFngEHAvruQqTRfnvLHIykcU/LmKZ4sA
         pND67o60jiK7LvqyDr5L6nHNJ12+LRaYCeWofsVx7K1vARHNi53b20SJevkLJcbMPHKR
         yVtLTkNvWpURvDlYgtmqj7i7+yZxHclbCSK3buogfB9jj/+gQf2p+IRArwQtHarJg70T
         2kKA==
X-Gm-Message-State: AOJu0YxU1/biBBCFBSw6MiZXfyU1/kTiTmOt2WtGYEWoqLHnkX42ose8
	n6JAUscAU76v7Eh7dtMF/j9kUGQWrQc=
X-Google-Smtp-Source: AGHT+IHRRIxlGKjwOkMOEzQbEgUlfg3PJhSAMmtTvjcIx2WMD7Xhk0ztROLXFwb4WxsSHLMlI/y+Wg==
X-Received: by 2002:a17:906:d54b:b0:9a5:b878:7336 with SMTP id cr11-20020a170906d54b00b009a5b8787336mr18591632ejc.7.1699370863151;
        Tue, 07 Nov 2023 07:27:43 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:42 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 2/7] lib/oe/buildcfg.py: Add additional git functions
Date: Tue,  7 Nov 2023 16:26:37 +0100
Message-ID: <20231107152641.1043-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190292

From: Jermain Horsman <jermain.horsman@nedap.com>

Includes a git describe and git toplevel function and functions
to get info for git remotes.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oe/buildcfg.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index b3fe510309..f9cb0cc74c 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -28,6 +28,35 @@ def get_metadata_git_revision(path):
         rev = '<unknown>'
     return rev.strip()
 
+def get_metadata_git_toplevel(path):
+    try:
+        toplevel, _ = bb.process.run('git rev-parse --show-toplevel', cwd=path)
+    except bb.process.ExecutionError:
+        return None
+    return toplevel.strip()
+
+def get_metadata_git_remotes(path):
+    try:
+        remotes_list, _ = bb.process.run('git remote', cwd=path)
+        remotes = remotes_list.split()
+    except bb.process.ExecutionError:
+        remotes = []
+    return remotes
+
+def get_metadata_git_remote_url(path, remote):
+    try:
+        uri, _ = bb.process.run('git remote get-url {remote}'.format(remote=remote), cwd=path)
+    except bb.process.ExecutionError:
+        uri = ''
+    return uri.strip()
+
+def get_metadata_git_describe(path):
+    try:
+        describe, _ = bb.process.run('git describe --tags', cwd=path)
+    except bb.process.ExecutionError:
+        return ""
+    return describe.strip()
+
 def is_layer_modified(path):
     try:
         subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
-- 
2.42.0.windows.2


