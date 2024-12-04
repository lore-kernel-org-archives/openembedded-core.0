Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC932E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.25430.1733344606185868117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WuisVsSB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so135706a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344605; x=1733949405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eowyinHnsXUieJ+QuG81jJvYprYot7nGOT710bDte3M=;
        b=WuisVsSBpA6crZOuvGbfe2CXI5yKMJ8UTJVxp6Dwb5bbVduTPXwhUWxEi0uLui0VWN
         2Bc1FcBg3XFwoPE79MjQ+FAmCCFFcfWF27lP63lOaXqB501JwhPJtREddkGZQFv2+wkb
         I/JYBFXdlpAbqMAi4KLq8QDM8tpAulIamUk6DuSb5sHIiN4rYXmciGrRvP87e3pZyrQ2
         lV2nijKbyuRYKs1/XDU0cn7HfALTIEZkG0SEaqZquuU2E6g6ohdmzQ3JKp6SyTk6xqFe
         0ke7Rj89xvZqIeh0LRYMy0mqS4ogl0GrNMhjz5irowj2QaRxOecB8Rll2YKYzSUyrN5k
         guTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344605; x=1733949405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eowyinHnsXUieJ+QuG81jJvYprYot7nGOT710bDte3M=;
        b=v0dZ51GuYXlpZJqkX1V3yOa0PcY42e4t194ePphGISOH5KxSpFwC0l0yxImOllDyjo
         Nyde2ElcMLtcRGfk5xs9zRuoTDflqp5JXXX9OWM0/MGtLelr5Dm3MhZ7bJyTYmLalcHx
         AVxTBbhqfFHAV1Y2PiIS7lrbRR6/DE5pDbFVXaNbLB1JpV/9ISLp6p+/AQdOrztQm0A5
         b9bq0cNW3RisRkoKfsk6WG3eeBgLDkwyse/TQ1WalvPSjR11E5h9O4/IbGP6GT5ZUzix
         F01QvyZQEDTn3Dmhx9/TXV7PXLoKtdNAbSr93og1KvtfgOQyk3gyVE6jIDjaEZGEJIqS
         glXg==
X-Gm-Message-State: AOJu0Yy80IfcvBDn4PMMwQhj/GrFSYkQO0WzPSOW7Xs4Oe6J775Q3Pnz
	uD4IwpHud9JRFcnOUQCdRvZiAUP7k19to7Zigl0yyQGlO0P5YmBazLQvr02Vs6J5cx9/VutLDFZ
	y
X-Gm-Gg: ASbGnctuYzcKBnwJiAkO3HV2bt7Hib28R75bKpeivyUr0qb/wlMKwxrlmKcmz2DUddR
	fpUqUPMJ5tcmKN2cwl1DRJMJ72EP7GCZrfSVxx+AccATR47WkL5HlLCdvdIIblN32K1VMC1cSGs
	sJ7D9+s7gHEZhG2cRYoSM66pFndYiPmFiH4Q1mg8OIrWRg2gLlyYwX8bOeWLI0n81GpB2PUT28o
	gCw1Cz5T6dgdsPRljJotSHbMeZtJU5g/ik410A=
X-Google-Smtp-Source: AGHT+IEdO738aA5QCo0W3hgo1OLot6HVZpVXGVCkRxPLek8BOUOy/t42+YCQJoToUKZIAj/EHDRpHg==
X-Received: by 2002:a05:6a21:6d94:b0:1db:d8df:8c4e with SMTP id adf61e73a8af0-1e16bdf9bc5mr9991035637.12.1733344605474;
        Wed, 04 Dec 2024 12:36:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/15] resulttool: Add --logfile-archive option to store mode
Date: Wed,  4 Dec 2024 12:36:18 -0800
Message-Id: <3472833b50b5ec97ec19f510ba926ab6aa5429b3.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208339

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


