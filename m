Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989DFE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:15 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.21227.1733334914667563400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ntputo5Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fc22a88bcbso44374a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334914; x=1733939714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eowyinHnsXUieJ+QuG81jJvYprYot7nGOT710bDte3M=;
        b=ntputo5Q0OtgX8Ow/ofJpSZviEU1M+NExOnEVxJIYcWhTyELtK0jA0rUGB/9NaK3pN
         sB6LYC3iDNIRwTtcDvK3SGSdWmeD32hKgsurKM8Xr9h/lcOvX6MKptEtGE1V14lTL7FN
         VBYZMTXBufMA7odJ2Ja8C9dGBEdfE0bkQR/x9GWtZlOV5YmKVsk9Qhdbh28rxgwZAuzE
         iJpmDihtpzJWHgYzhVIvF+Pipzap+m/SenqXMFQp7FJnTAdywl1lnuuaXaGNMWNUYDmT
         KRpdrvp9ZFCvOTEtaK2SrY5akAh21TrepuzRI+rWy3rph4kOcvKbtKtoWgSWcKOGpJIu
         2riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334914; x=1733939714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eowyinHnsXUieJ+QuG81jJvYprYot7nGOT710bDte3M=;
        b=Bk+MbKNFkJg9bHKImqGfHyCH9FIL50DIWW5LOzc8f69ND8f9EkfsRG24Xj0wqnIUs/
         1ow+r0yKNYmuQvoWOVTY56oVe+LtZtLEpIaQRRC5pa3FQG5vcWjfYb7cfgpvYlTEACrU
         05XrQs5I6XfOPw5aIAXWdRIcp7od5PuPFY1wQhnq+1sTrzSbF5DaLLMu01JuIXqMH5qx
         7S6mrWU5paIIuQRb3KKLwRlpmn1ZumVMoVwgtAMBTtNTwtivyXjjbKHbU1HbrKBwSo+E
         Ve8pPtX+uy54lhey/Es7awijUiwyvjndR98oQSj25J9pnWfU1mc3f1Y+HrmGcqZ08eNe
         kc3Q==
X-Gm-Message-State: AOJu0YyVYDw3HaUic8LhDpEH8cvsMbSVkJKuHyBQqGBgwkNeoIhA1JBz
	+3gCUtGw50VMvmHsW9iaSoJjbPb5+/phkp361GzenZ2eD74e9cWThrdT/C6JVvlTx9UuRWY9ytm
	I
X-Gm-Gg: ASbGncs/+4j4Orch8qg7MmDqWO/YcLAGh9oBmqySeOiinuZFb4iaECQqaBIPy1nN5YD
	RN3FLB6eO2Eh+uy3dmcyoSJ4GkfCCctgMqeZWcYpYQq1tiDyRyjloMt3JdUn/61hqv+xFKJJ2q5
	xzdTRFQsSACLv7jam5EJ5TUaTVU4AN841xREA4umAxQjU8latfBs+vaTZLJRZgQBICQjLR6aQs2
	fAiFcwJ2diKC9xKDM+MYwvlKGVC5Pwh5TPFaow=
X-Google-Smtp-Source: AGHT+IGJNn9OHvCHU4wZr3d3F157iUHvtwGLIGn6/Dr83qMdvrxR1Gy7OXpwzINo33RbgR98lQENUA==
X-Received: by 2002:a05:6a20:430d:b0:1db:ebf4:2cb8 with SMTP id adf61e73a8af0-1e1654132b6mr12039069637.38.1733334913975;
        Wed, 04 Dec 2024 09:55:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/38] resulttool: Add --logfile-archive option to store mode
Date: Wed,  4 Dec 2024 09:54:01 -0800
Message-Id: <1084e88534f7a1341249ab453b82a35f0cddba87.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208317

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Storing the log files inside the testresults git repo isn't scaling and isn't
really appropriate use of a git repository. Allow these to be optionally stored
in a separate filesystem location so the git repo can remain managable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1afc0f3d7e93fa8496be241e9622d3b9a6904bd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/store.py | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 903e29627a..578910d234 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -74,12 +74,25 @@ def store(args, logger):
 
             logger.info('Storing test result into git repository %s' % args.git_dir)
 
-            gitarchive.gitarchive(tempdir, args.git_dir, False, False,
+            excludes = []
+            if args.logfile_archive:
+                excludes = ['*.log', "*.log.zst"]
+
+            tagname = gitarchive.gitarchive(tempdir, args.git_dir, False, False,
                                   "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                                   False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                                   'Test run #{tag_number} of {branch}:{commit}', '',
-                                  [], [], False, keywords, logger)
+                                  excludes, [], False, keywords, logger)
 
+            if args.logfile_archive:
+                logdir = args.logfile_archive + "/" + tagname
+                shutil.copytree(tempdir, logdir)
+                for root, dirs,  files in os.walk(logdir):
+                    for name in files:
+                        if not name.endswith(".log"):
+                            continue
+                        f = os.path.join(root, name)
+                        subprocess.run(["zstd", f, "--rm"], check=True, capture_output=True)
     finally:
         subprocess.check_call(["rm", "-rf",  tempdir])
 
@@ -107,3 +120,5 @@ def register_commands(subparsers):
                               help='add extra test environment data to each result file configuration')
     parser_build.add_argument('-r', '--revision', default='',
                               help='only store data for the specified revision')
+    parser_build.add_argument('-l', '--logfile-archive', default='',
+                              help='directory to separately archive log files along with a copy of the results')
-- 
2.34.1


