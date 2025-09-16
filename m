Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FA3CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 13:08:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.19474.1758028084245279759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 06:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAlvawBK;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b079c13240eso860210566b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028082; x=1758632882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2aUaDasIhJCYpEJ+O27RxGY6vnJI8derNzYOGkynDE=;
        b=IAlvawBK8YRSlJixBItZ9R1/BSTlQLVioIetsEPjafOb4RRDHfKYVL6IGZueDz5OBS
         tJNW+BagLEV689hcIO1RdqL6FVxD6h1GDLe+9piI/nlffxuup7DFtMfRbm2LVueAyAop
         J5Jh4oD9ah4uWrwYiO0BmRDm2E2xvjot6JzXWPfU0YUJgfXpLnOi/iL+LYEoEt9DJ7L/
         eMCwD2rIREzvrAAPbY2N49SHZvBMH9Cx5gMEFdtXqHVtJ1OHP3Guoj5EewUgis2Tn2KA
         EsgrlkJQIOg7XNlYtk5UEOQRW/NtNpuMwDt9uKI2ybiVCclF7mhgZQSIQK7micOt1I3F
         MjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028082; x=1758632882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2aUaDasIhJCYpEJ+O27RxGY6vnJI8derNzYOGkynDE=;
        b=M9MT9SzNo2Dp0ATeS7c532tfHHHDjQY7s3m6+PLrsxbTbdm20BXzvbpjXJsuf2U1wN
         YUtCGRycYOc5/WDu1NtfasvBKpogx/siXcfEZdYed0ESQTV5ne5xhEs4DFMnwFMnmkbR
         f86qknBdD4DI6l8itsY1gfpy5BWw3633FACEzjP65t8TjYMYXYp88gSr/QfZKWjbVitm
         uc/agJrMtzSG2KexXLZU3tF8j8p9FftIgkmzmzHAbYa5ylzsdjzRjtpmvv7Pr5uH/8JI
         2V2SHztdcqVnfPjYW2/xhUuA3pm82BfMw7XDS/Ub7BUepApk42tOn2cHmqh7VOjJmlt+
         9/Kg==
X-Gm-Message-State: AOJu0Yxl2G7QsR/SYLjBMHtMa0mYB6LUXJlguHkLVqplg2D0EzoysXLL
	5mfUr/PrwjHswmNJGdHArTf0OuV0w+VVijuYCmVyFkjbAiVMMH6CyZqZAGYzNUsk
X-Gm-Gg: ASbGnculYxkfuCX4Avg+NBzMb9a9E3GKEBK4GbPtYm+Ne+v57lyUuVBnpV5w4Hv4T6y
	jQlJ8xL3vXbaWnOvp2drvkrUV0PFHg+KidnzBKWRUQ5d5JbL1mR8S8mQnwJta9er7Tww9C6n9Cc
	WoNzJzit/vmiH7mQUqNIOqLMTrhy6XL6HJi6+ikjwxMk8P1qC348WQ+4tkuPVWcQEZ4iZwo76Pv
	1wN009N6BNjU8HT+nSWcKqyGhsF0kJVQKn0YB61/fksycmr9ZYh9xOB58v2SxRxWPvn1NfeLxZk
	zu0j3w71oN3DAe9U8dTmebBWnInI0o7KqEXuEzUrLrqks8z9LitkkF/wtl2jYwJiNjLE9jE84qz
	ho3Ap/dJ8AoXgBaUFSG2E
X-Google-Smtp-Source: AGHT+IGR5Jjg9j73A5D+lN3GGIhhL3gSQIjgWAPOvO2Je5aAAtfFujfpm+EFJvz0Vo3HVkMNhEhtcg==
X-Received: by 2002:a17:906:478b:b0:b0d:ff2c:3cd2 with SMTP id a640c23a62f3a-b0dff2c5222mr1093527366b.12.1758028081865;
        Tue, 16 Sep 2025 06:08:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da4c5sm1128267666b.21.2025.09.16.06.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:08:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] selftest/devtool: make 'git status' list all files separately
Date: Tue, 16 Sep 2025 15:08:00 +0200
Message-ID: <20250916130800.2616414-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 13:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223549

By default, when running "git status", and git finds an untracked folder with some
files in it, it lists only the folder, without the file content. In case the folder
is already tracked, then the new/modified files inside the folder are displayed
separately.

Some tests rely on listing all the files separately to be able to determine the outcome
of the test. As an example, test_devtool_git_submodules creates a patch that's stored
in the meta layer. It verifies from git status that the patch is present in the layer.
However, when using the default "git status" behavior, to be able to see the file listed,
its parent folder must be tracked by git already, otherwise only the folder is listed.

Specifically vulkan-samples recipe is used for one devtools test, which verifies patch
creation in the layer, however an update[1] to the recipe removed all the patches and the
folder that stored them (as they became unneeded), which in turn broke this test, because
the test coulnd't find the newly created filename in git status output, because it was
stored in the folder that became untracked after the recipe update.

To avoid this problem, add "--untracked-files=all" argument to the git status request,
which displays all untracked files, regardless of their parent folder's tracking-status.

[1]: https://lists.openembedded.org/g/openembedded-core/message/223296

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Commit message updated, no code change.
v1: https://lists.openembedded.org/g/openembedded-core/message/223346

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 19a205912b..a59d9e123a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -122,7 +122,7 @@ class DevtoolTestCase(OESelftestTestCase):
 
     def _check_repo_status(self, repo_dir, expected_status):
         """Check the worktree status of a repository"""
-        result = runCmd('git status . --porcelain',
+        result = runCmd('git status . --porcelain  --untracked-files=all',
                         cwd=repo_dir)
         for line in result.output.splitlines():
             for ind, (f_status, fn_re) in enumerate(expected_status):

