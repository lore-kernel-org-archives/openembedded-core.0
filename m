Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EC1C47073
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 14:59:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.19136.1704293947533254123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 06:59:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cv3Z5HVv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d3352b525so115219065e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704293946; x=1704898746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCw1wEoC/sfK3+Dtl5SFHGTFTTMSUmiz6eair/qQqJI=;
        b=cv3Z5HVvG0tsHyB5p+0+Ji68AznNlSt/8fiTB4Hk5P8kwzKj5lG+fix7ujqXIJe8br
         sm2fTG7xchWzogwcaNnbxLxOwkgNe+/KmG6myBP8imarjOWEUw1RwposBPF/lX4VSEQZ
         C5pnk1sLSFVbnVMUCkRygm0bqWPeB9TihajaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293946; x=1704898746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCw1wEoC/sfK3+Dtl5SFHGTFTTMSUmiz6eair/qQqJI=;
        b=Tczy6yOVp3LYc8cJhJs+kPfxtq9RO8oKA+YMR8n0pYUzdscIw8z3GR3rA9qxkAJmb9
         czi5bLLNDR5p2xJsMLH5S3FrrnMSfeePwOz6qdID3fby+3YJ78Tx+yss9tU6uZlWPh29
         C2vjJHoQvGi/EkKs57MkGAFvXDyIMSnO1OngxTu1YGAFhIsojQ0s1XLWopoo6Q5xt8aB
         6LCjnKj6M6e5+AsKj1M2iXHr/r1gERIpb9neFU2PXeal3/Js5s8E4NDLIaiwgUfwB8Zx
         nMZsqh5g2IUoIJizHx3+z4pdEBrxRjjWz6KG1lF6UG97hjPbBZy9bw1HZbSa9kYt1mGu
         /EaA==
X-Gm-Message-State: AOJu0YzLhgGamSMQ1dDse1XBIpz2Y1k7wWf1J1vrsiMlblf2cgPxkt1V
	au+PGuQJEtcEpQhHpbFX6TCMxJ8VADfENo7j5qkNY/vABbA=
X-Google-Smtp-Source: AGHT+IGhN0dAIyekOBA9NeJJ2WbqEwYpDH/wpwZz/j07kpvFoB5nJtD6tE22td5UpwDFGMX0hlFQTQ==
X-Received: by 2002:a05:600c:cc4:b0:40d:8d12:25fb with SMTP id fk4-20020a05600c0cc400b0040d8d1225fbmr1103783wmb.5.1704293945586;
        Wed, 03 Jan 2024 06:59:05 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a0e2:8719:e940:13c9])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d4612000000b003367bb8898dsm30992081wrq.66.2024.01.03.06.59.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:59:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] rootfs-postcommands: Try and improve ordering constraints
Date: Wed,  3 Jan 2024 14:59:01 +0000
Message-Id: <20240103145902.2124110-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 14:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193290

The current code is in race to see who can set things last. This isn't scalable or
sustainable and problemtic in the face of inherit ordering changes.

Move the ordering issue into the actual code execution, which isn't ideal but
the best of several bad options and at least lets us drop the anonymous python.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 13 ++++---------
 meta/lib/oe/rootfs.py                           | 12 ++++++++++++
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 29ee74932a3..163c7f41b11 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -55,19 +55,14 @@ inherit image-artifact-names
 # deterministic. Package installs are not deterministic, causing the ordering
 # of entries to change between builds. In case that this isn't desired,
 # the command can be overridden.
+SORT_PASSWD_POSTPROCESS_COMMAND ??= "tidy_shadowutils_files"
+ROOTFS_POSTPROCESS_COMMAND += '${SORT_PASSWD_POSTPROCESS_COMMAND}'
+
 #
 # Note that useradd-staticids.bbclass has to be used to ensure that
 # the numeric IDs of dynamically created entries remain stable.
 #
-# We want this to run as late as possible, in particular after
-# systemd_sysusers_create and set_user_group. Using :append is not
-# enough for that, set_user_group is added that way and would end
-# up running after us.
-SORT_PASSWD_POSTPROCESS_COMMAND ??= "tidy_shadowutils_files"
-python () {
-    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', ' ${SORT_PASSWD_POSTPROCESS_COMMAND}')
-    d.appendVar('ROOTFS_POSTPROCESS_COMMAND', ' rootfs_reproducible')
-}
+ROOTFS_POSTPROCESS_COMMAND += 'rootfs_reproducible'
 
 # Resolve the ID as described in the sysusers.d(5) manual: ID can be a numeric
 # uid, a couple uid:gid or uid:groupname or it is '-' meaning leaving it
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1a48ed10b3f..fb73318ca61 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -194,6 +194,18 @@ class Rootfs(object, metaclass=ABCMeta):
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND")
         rootfs_post_install_cmds = self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
 
+        def make_last(command, commands):
+            commands = commands.split()
+            if command in commands:
+                commands.remove(command)
+                commands.append(command)
+            return "".join(commands)
+
+        # We want this to run as late as possible, in particular after
+        # systemd_sysusers_create and set_user_group. Using :append is not enough
+        make_last("tidy_shadowutils_files", post_process_cmds)
+        make_last("rootfs_reproducible", post_process_cmds)
+
         execute_pre_post_process(self.d, pre_process_cmds)
 
         if self.progress_reporter:
-- 
2.39.2


