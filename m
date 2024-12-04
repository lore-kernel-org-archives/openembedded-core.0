Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36554E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.25352.1733345142569934975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1egzZhV2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215a0390925so1909335ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345142; x=1733949942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eowyinHnsXUieJ+QuG81jJvYprYot7nGOT710bDte3M=;
        b=1egzZhV2bpP4e3VvlPJAUgf8j44D2livnUHSNEORJwjDNiZ4JyVm4rLVpFr+RihqVI
         8BjRkaEZ61H6dH3NilgO9UrRJcxKajtgOARdtIOJRHaVAl3gOCAPod/7LnM7Y8owYhSm
         0cv+UuV/LNkz7oUibBi+PVm1ZPooymsUjXIMmlZfvj/tBj/5nVTIUlsOp0w8beMgmlz/
         Fl7RPNuEM72jwmss1y1RHVksv60S8SH/jxcfJwc8DUUJ/QioyAHvK36EMK7DeD3fTOgO
         /vFCxSPHyxP2NOPa9Li3JH1vo9E3vxYm2dgy2BD/5zuGa/VAgxEwHE2uoJtO2D74GwjD
         hTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345142; x=1733949942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eowyinHnsXUieJ+QuG81jJvYprYot7nGOT710bDte3M=;
        b=N73bb2gExICejNr2iYNFmybWtlsedvKAAEHBZotpcih0iPfLLZhcSny7e+tSnppyN8
         mWBOTM2f8I/UrNuNgahAb1YzCmORM+eWpDr0WDoJjjQKG+Lk27N0k2hrlVcoK6v6PgYC
         Awfdy6ecystwr2ZOJO+8VzVKXWAN8rgMuX3mZ/z10UYbiiq6wyioKGJthEPqdjv65+Qz
         OjzkAXSrDN0u/reWDWzmXCk6Gh6U4EUzG/Th6q5tWfYNvN4ZeCplfXkPJQ+XQ2Q6gV0f
         tKqs8ACaMYWmOZ8xbZxHslsE91Ts5QaIZassvl/Eux5T4X7RrT9/dhg3PxNWswefOVJC
         85Wg==
X-Gm-Message-State: AOJu0Yx6HnoJkych00GwBcsouBmVjUDnbYcmlNH3r4OA+kYmiAI9Nu/E
	lKr04PAcLYFJkTpinGn4pNthjMjAN5M8ByM0EAVKgGrOTRvqS9Tts8YAZO4IAakrBi3hBxk5PbZ
	x
X-Gm-Gg: ASbGncsNUxWd8whrVau29F2hj9Rlf1IBtGE1HNxsTwggJqCQnP3/Y73tl2aVwRiQuLE
	zUgMfrldXhF921H9v2ljk5qCM2ukSxl5ZUFRqt8jBkZ5siEaK+FEzg8m211dVyyWstQ7/+UIipl
	i9AETrR64TXQMcuRQ6KMFMcZyQHBWCf9JQcJ2yQ+Ln5NtwTv7tbL7vQPdCuo+jb9hGliuAPeYQo
	inaj5X294b2IR3d3DvNHIXJHe+4l4cBT4GATMU=
X-Google-Smtp-Source: AGHT+IFFd7XAQkxha8V0D+kgTl5bmly+oInMzraKRxh4MKva3wfRe3B2ngo5AY3f/0Q2ftrv0ObRCg==
X-Received: by 2002:a17:902:ce0e:b0:215:6cb2:7888 with SMTP id d9443c01a7336-215bd24aef9mr111023875ad.43.1733345141924;
        Wed, 04 Dec 2024 12:45:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/14] resulttool: Add --logfile-archive option to store mode
Date: Wed,  4 Dec 2024 12:45:19 -0800
Message-Id: <174e86868178f817f2bb6b3d9c7224a4352144ed.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208354

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


