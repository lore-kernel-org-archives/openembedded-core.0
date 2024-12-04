Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29648E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.25348.1733345141066112831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BBXcZLnT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21561af95c3so1175455ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345140; x=1733949940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS5Dzor0W9iUDuKafvxj246UrBt7NjTx4a4U1Q2s7K4=;
        b=BBXcZLnTjJtpYKbc0azenjfouWejldmPgnNNph36CnKXlegTQHORTwUEKvtqO6L7lh
         AQ4cL1sg+TUAZWrLutUyfPPZhvtvxXRblVUPiWkzCGJH9qQvyn2zC4DNrH6/5vZ+JK17
         gEE6VifmrOoX8Ju7PKAkyBYn2fyugN4hYQIukMR7CSF2GmCN9YrAHr3whbZzbyNklWAW
         zIfS7hHmT1aBObQwqJ7x9DXU+NGT4/uixT08irwgHFmydgJ60tYCHa1hc9hopojarGfV
         3tnEVbzAn5+7+F0XbllhwP73OBVPQZGPDooBu1JoZULb5aLbEvwAbsw27vH//a4P3eus
         TMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345140; x=1733949940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS5Dzor0W9iUDuKafvxj246UrBt7NjTx4a4U1Q2s7K4=;
        b=GnvriYRjBvu9eOFRKz3dHt8JiMeB3wDpO+VQ3nlUCPPt8GEI4Jsx85yaxXWK9m9stb
         JzbwqLR6vSXhiSDgSg1ltBpjYozCjwJAupV7VhjeG2lbRApWAVWIobl5agSe39Qadup3
         RViT1IO8sDbvAeNoH4uBFEEbsojygGjx1LKsI8UWG5Mg0s5TIBKozbp0WlxX9dhJ4zAH
         KOxFAWMlCkblfbylaor6R3nkGvfww8Zh5rME8Kon/cnj0iqBBvPWL8J5gZKrfVbHNesK
         dB8qGKIrL+RRZ+Cq7oS0dYpqLLz9b7Hkq+lGGE0Xyk0/WkSSFssikQ2fIBnl/0osB7+Y
         4qtg==
X-Gm-Message-State: AOJu0YypDDts5dhs/D7ojgU0w5/B0z8xBqAkHw4YNVYoafo6M9LXUGit
	yiJyX69MFnWjGY0bQN3ZiaCCbMBfXLiURGnv+e7o/rulEGqwVjUOJlZpt2whpRv9SqrEFuTuxs/
	F
X-Gm-Gg: ASbGnctMMCgpl5V77+QLacpZoDmj6AP+1RDV71pECasHDQvdUV4n2iwpY3rVSGHSpUF
	JlKmTZ2kO4GbMNxH3fPcu5JKIXDJAhkRKrUoPbWc2YhuJKYKoW0ejdxCsVB2F8PjcZgyUEQKfRD
	PN86bfodrbK51QLoORpqUBpj2EPsRbZ75wiDaX6gokbgIide/+yZ/ape4uyYSu/dBWvcosxYp3r
	C5Pp0wyYC/E2/hFupOkfVdo5DStSLOyYtj55fI=
X-Google-Smtp-Source: AGHT+IHzlsta8rpvk/KArD1L3sij+WTZHKAFJ490PG+JZffp4dSKWXa3EJPNvMfkNb9wSywuZ0f0bg==
X-Received: by 2002:a17:903:189:b0:211:6b21:5a88 with SMTP id d9443c01a7336-215bcfbe4f4mr94048845ad.20.1733345140361;
        Wed, 04 Dec 2024 12:45:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/14] resulttool: Fix passthrough of --all files in store mode
Date: Wed,  4 Dec 2024 12:45:18 -0800
Message-Id: <ad850837d3a45fa7cc094e3eb9c059120664c8e2.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208353

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When using store mode, --all was broken as not all files were being preserved.
Fix this by limiting the scope of the git rm command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9604561d2022b6c76b1cb4186d40800d1affdd2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/store.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 430213bbfe..903e29627a 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -69,7 +69,7 @@ def store(args, logger):
                 logger.info('skipping %s as non-matching' % r[0])
                 continue
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
-            subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
+            subprocess.check_call(["find", tempdir, "-name", "testresults.json", "!", "-path", "./.git/*", "-delete"])
             resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
 
             logger.info('Storing test result into git repository %s' % args.git_dir)
-- 
2.34.1


