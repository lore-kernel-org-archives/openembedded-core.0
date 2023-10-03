Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBBDE7AD6E
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 14:57:12 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.110330.1696345024762959122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 07:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzVecaVX;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso189544166b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696345023; x=1696949823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TcbP2zkFkaQPVL6a3D+wDsWeF7VurPY8FgWEDA2gp7E=;
        b=mzVecaVXX3SloERR0hqL5y9m+Y7SDcqmxSKA4vLqa3+UM7F/y71yYNbFd2iTlPteaW
         Zs/bA2YNZoYW/4eAtNh9uuZQc2LmdW4mugNKhaYRsq9m7xGmS6z2SmpUaUkDZAvmQq0v
         /J957MLWFjSJensE8v+0S4GrFBNoJijSuQhf2xvPa1M6ZaYg06SAEPjyAOOdOoxVAGOR
         vyNB4iDgJdUUvBhEDzI2bCRYhxZZnfYcYBY8f7QfJ/mfGdhnkEJXwFoJ17VyhtcbWFia
         3VwuitL6Dl9QQTAFnb+az81hgycq++0N0cFdp2XCQTeZUeuzBMQLBPWtgRQJdwF+8wD0
         TL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696345023; x=1696949823;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcbP2zkFkaQPVL6a3D+wDsWeF7VurPY8FgWEDA2gp7E=;
        b=ka45WhwciToAoEGdztKifaEGpDq+0T7hYOptQm8FwE6SfseEeKGnsR4bIlpiXe9J8a
         da+5Nwu/5vS+qCFFWVp7dlMa1569AcP7Lksr/mjvy0BfltDg8/mvGHQRV5nZKXWJ29A1
         pQcote5cxmKfPW+uQGYE/0LsCVdBtKkAmRRrCrkxuq3B0df529ej9qUsVJitqgy+Bnyc
         RM//q0uhqbntGnGBpB5qRSHLp85MhIhLZcfxc0iyHtkcnpl6PT8ZBKWyYT6ggXDL6GaI
         rG5h9am1Y0ROpdOoDKVkAaku7woDjwF6v1pYz8kE+165Aa2kDp+A5YKgJwOwfLaAe6Tz
         ARcw==
X-Gm-Message-State: AOJu0YzS61we1MEJL+MviAmQQKCMuSfQkFlWQ/hMvyVQsScFZEE4DOX5
	bJk1coFGfMvhTs3tM2Ouxxt84kMzSZg=
X-Google-Smtp-Source: AGHT+IErWsaLvtMLPmk3iOjjjTRg9335FNDFdCHvMjGqEm8BStrsUsL00iziDU88dNgIsYPriiqKuQ==
X-Received: by 2002:a17:906:cc15:b0:9b6:53a9:792c with SMTP id ml21-20020a170906cc1500b009b653a9792cmr3849902ejb.15.1696345022759;
        Tue, 03 Oct 2023 07:57:02 -0700 (PDT)
Received: from NVC4181.nedap.local (159-210-178-143.ftth.glasoperator.nl. [143.178.210.159])
        by smtp.gmail.com with ESMTPSA id h14-20020a17090634ce00b0099b6becb107sm1199249ejb.95.2023.10.03.07.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:57:02 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] scripts/oe-setup-layers: Update how to determine if directory is git repo
Date: Tue,  3 Oct 2023 16:56:36 +0200
Message-ID: <20231003145636.1031-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 14:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188642

From: Jermain Horsman <jermain.horsman@nedap.com>

Previously _is_repo_git_repo() would return a result containing b'true\n' or
b'false\n' if 'git rev-parse' ran successfully, instead of True of False.

While this can be solved using e.g. result.strip().decode("utf-8") == "true",
there are some other cases to consider.
First, .git can be a file and not a directory when using a worktree.
Second, an emtpy .git directory in 'repodir' for which some parent of
'repodir' is an actual git repo will still return True in this case.

To account for these cases as well, use 'git rev-parse --show-toplevel'
and compare the result against 'repodir' instead of
using 'git rev-parse --is-inside-git-dir'.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 scripts/oe-setup-layers | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index c8012fa670..6d49688a32 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -20,13 +20,13 @@ import os
 import subprocess
 
 def _is_repo_git_repo(repodir):
-    git_dir = os.path.join(repodir, ".git")
-    if not os.access(git_dir, os.R_OK):
-        return False
     try:
-        return subprocess.check_output("git -C %s rev-parse --is-inside-git-dir" % git_dir, shell=True, stderr=subprocess.DEVNULL)
+        curr_toplevel = subprocess.check_output("git -C %s rev-parse --show-toplevel" % repodir, shell=True, stderr=subprocess.DEVNULL)
+        if curr_toplevel.strip().decode("utf-8") == repodir:
+            return True
     except subprocess.CalledProcessError:
-        return False
+        pass
+    return False
 
 def _is_repo_at_rev(repodir, rev):
     try:
-- 
2.42.0.windows.2


