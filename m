Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987FDD637C9
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 21:23:34 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.23109.1731533011405538315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 13:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=me2APi3N;
 spf=pass (domain: linaro.org, ip: 209.85.219.51, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbe700dcc3so50109596d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 13:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731533010; x=1732137810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpHCu7kxb9oCC8HTHCBOqtoxnNqxsAflVaU8yh74dHU=;
        b=me2APi3NTMkgUQaNN3udhwyANZRBSvHkTAb0I3L9RzxWC/TXTYrps+2e2x2wMNB3/G
         w+MwdUepHyrNrCzJJkno0fu9+XYA/dFDnXZMgkFgdH47PpJklJT5/St42Y+4GE7J1t9e
         auUW7U+bmjvKf0iK/JJCBCIjHr/9SSb7iX1RgPo2FqHuDVAsMQq1vYjx5z6b7YzWEaWI
         peB5lnibZvk+orp3PafBp7OYzDTjtsee3mZnoIbKH/25qVfv+j6oRoxh9ZqS3ps56g53
         CU/KveXwQbFiJQ0TWK0Xo60zGjsvxBwBy2IEPATjtL+8rYMRatASBPduE6iEF3+tl4Sn
         +rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731533010; x=1732137810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpHCu7kxb9oCC8HTHCBOqtoxnNqxsAflVaU8yh74dHU=;
        b=YipANP+0qgotoULPbwSIUkLCjDRFg9KQepeLlnJZ44qUodJebS1T8sHxLkfR6GfBDH
         7/jccZCMz49eL/OGI1oYBaHj77xkawonJS8i0Gdu+7Rxpuxy8kxOMHuzpGLhd7fR3tsw
         /iOfuym4OiNjbxHH9FbBu6xk+xPAxgOI39CX+a6I4Q3LQev630ehaMHZBPgWMJFQE6NO
         dy4VHcY+fAymtwBCLPzuEwwNvW38FicjmTByzi7ViYClX8ONbFdsanwEH7wN9f16YbLe
         OnVs4ei9ZxHCPe7Ejfmd7Cujm24drkXp2TnMiMRr8ML9Wo953G4EhKkTC2a821xrsp2S
         KI8A==
X-Gm-Message-State: AOJu0Yym9Sei6j98rdAWYma2avFFzFDD2cznXZogYF6Lnk4AFISd/M2d
	PYMAfPCQ9KcgPTiLvJ7YexBTFSF3yZX7tvRcn3b/pohZYEQbrKLXkJ9Uc0jfr1S+28unWeHB/nj
	/
X-Google-Smtp-Source: AGHT+IGaAkbadKyAepWfWjpvysH8Wo1pNxhde01sHXu28PiSjPbYkktoarQUCXFNEuXEWd4OWGOjPA==
X-Received: by 2002:a05:6214:44a0:b0:6cb:2f11:6b9 with SMTP id 6a1803df08f44-6d39e18548amr326148586d6.23.1731533010488;
        Wed, 13 Nov 2024 13:23:30 -0800 (PST)
Received: from maple.home ([184.148.161.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961df9f1sm89498576d6.23.2024.11.13.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 13:23:29 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] rootfs-postcommands: Actually do the re-ordering
Date: Wed, 13 Nov 2024 16:23:03 -0500
Message-ID: <20241113212303.784400-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.45.2.121.gc2b3f2b3cd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 21:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207135

Previous commit added logic to move certain tasks to the end, but these
had no effect, because the result of the make_last() function was not
used to update the post_process_cmds variable.

Also, once this is fixed, it becomes evident that the commands need to
be joined using whitespace, otherwise they all run together, and cannot
be executed as individual commands anymore.

Fixes: 0ffff2c1f8 ("rootfs-postcommands: Try and improve ordering constraints")
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/lib/oe/rootfs.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8cd48f9450..e9613aa7b8 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -199,12 +199,12 @@ class Rootfs(object, metaclass=ABCMeta):
             if command in commands:
                 commands.remove(command)
                 commands.append(command)
-            return "".join(commands)
+            return " ".join(commands)
 
         # We want this to run as late as possible, in particular after
         # systemd_sysusers_create and set_user_group. Using :append is not enough
-        make_last("tidy_shadowutils_files", post_process_cmds)
-        make_last("rootfs_reproducible", post_process_cmds)
+        post_process_cmds = make_last("tidy_shadowutils_files", post_process_cmds)
+        post_process_cmds = make_last("rootfs_reproducible", post_process_cmds)
 
         execute_pre_post_process(self.d, pre_process_cmds)
 
-- 
2.45.2.121.gc2b3f2b3cd


