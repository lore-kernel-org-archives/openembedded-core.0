Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A67E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.25155.1733344603245411375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wsgNyxcQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fccc26ad01so208077a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344602; x=1733949402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMFqt1CM9+7zhlSc+UjlIkxc/bUPByGBA7Cy4ZLzWBY=;
        b=wsgNyxcQbzp5ZAb0MQ5ZL0Wu+y9z2zHhR5OsASEXqtlkQ7JJNKD1SSV8uS6jdwRLwB
         wP/jOWgDUd0Rl/FToYxm6RS3DZBzSb0JoQXZpoitKLaHuaH+G17Leogi570AoWkJ/KpP
         LKgnieTL/xDv4nZsyvUdeGPAiLnNB+skLuQknSJWK1Syfwiccl3FbIB0qFMQjibSJPil
         YwyYdYEyeaLEESsKyGGSJ2nEf5AaCxcr5XhzxF1m9dOzsChX1Fh3yCUMdKQNiOdsDnuV
         ki5/5fzvxk5nzetSK7Q9/w0J3onbzhZXIw4Jc34aLDvMHXdlRqNWMHpUJ8F5/I61bbYY
         8ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344602; x=1733949402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMFqt1CM9+7zhlSc+UjlIkxc/bUPByGBA7Cy4ZLzWBY=;
        b=rmsjzZn0Fa1JEwRT14SyL7+4SjMBqgsXlZDM+QefGqtL9Mkd9RMIezyefWoM8i721S
         Sjc6r9byX1H3wZ9i6KYI3CBZBk30gfxuCHrGoBQgJ++ZOy4bVIMe3GjGM/n2+umGkaL7
         TEozGWliDrWsG72BhBSmCNGBzxctj4LXl52ldcvJcYpIxinvDDMgzKFh+ZVIZ3/q6jzy
         0E4yTPZn6XeSIx0lren7c3bYHR12t9dvI2IdxVXzAZIJgqRAXAcsL4w2jHj2w7Gj48yQ
         O04m1pdgnyUhTcTPHTAtTsXdmcjQ3FnumniZ5sVq0yMRJpWLQmoX8Z12nxm22WknBAH4
         T1dQ==
X-Gm-Message-State: AOJu0YwWt/OIl1M77qM3xAA+h3RdVn4vK33xXiGFMOQ3cOsCxMjdEVlS
	DAGDhWHmtSHqXIyshDG45siofmSYlge3ebIbH+7QXdGEmojB4Cf310ctqsBwweZViaMxWzAeiYW
	K
X-Gm-Gg: ASbGncs+6ADJM2FKCZXVDaLjqSo+vx/UerR6rWDslXhFpmBzzAHoRLds/x7g1IRtBpI
	2s8AGm7jVyT3nc0iUE9zbExJ5vUz0vqzkkF8z5wB9SIymhcSqw8xNpell/aaalavC4265Iy+gJq
	0LAP2FGHqdZlRGThGh1waEdkeatLJ0FZIoYewTaDtnLCsUX9nvNZEa808mbzDspzi0oIUTtVWcP
	eTfp8zK77tMHACveztelS/3tHwsJyHSmSSvAHw=
X-Google-Smtp-Source: AGHT+IGO64TyOHEejpdczAkQSsoBYgMdp+fnQ89/Y35sQGvUpdce6JTK6at59Ze/w5pFhecu62Porw==
X-Received: by 2002:a05:6a20:6a0f:b0:1db:eea8:6b79 with SMTP id adf61e73a8af0-1e1653b7d53mr11347987637.16.1733344602539;
        Wed, 04 Dec 2024 12:36:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/15] oeqa/utils/gitarchive: Return tag name and improve exclude handling
Date: Wed,  4 Dec 2024 12:36:16 -0800
Message-Id: <0a5b4fabf8bf9b559295bb4d2583809ca11522f4.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208337

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Tweak the gitarchive exclude handling not to error if excluded files
don't match.

Also return the tagname created so that other code can then use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1adba3430faffdf6217b6a00533a3b48a9388abc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 10cb267dfa..a826646059 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -67,7 +67,7 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
 
         # Remove files that are excluded
         if exclude:
-            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
+            repo.run_cmd(['rm', '--cached', '--ignore-unmatch'] + [f for f in exclude], env_update)
 
         tree = repo.run_cmd('write-tree', env_update)
 
@@ -202,6 +202,8 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
+    return tag_name
+
 # Container class for tester revisions
 TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
 
-- 
2.34.1


