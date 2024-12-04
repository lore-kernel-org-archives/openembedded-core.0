Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB947E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.25152.1733344600226058709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hLVvYLxT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-724d57a9f7cso194375b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344599; x=1733949399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqCFXr63BV/To2djs8Pkrk4glJPRCZ8K3tC2riG44o4=;
        b=hLVvYLxTYAmsBT8VudlHbqI3mTLuEzfYeEBOoPyYRKdyFKJAav8nxs8W1SO+gHOolo
         Tgtre1wUAeCvlY7w9VobuXZ9YhGsV7a8D/n/RDC1we8wpJ0e9vgChWDjMRHejcWH3l7U
         GvEkv3h6hO8nR9R0eEX89te6SuTnWwuIztjjfx82Rw2r4N7weqZJ6q5B2GSXlUMpHSoA
         Jkaf34XcTZQoFIRu7WjnRBhRSTGxNiRhmmqCYHYfwv6v4h3pqk43WFEzTwilp3Cmoc1S
         csrCYseO2ucD5+nvbJOpxN2y/eQ0XSLpfrbIK1RHUu7CDu1kIvN3XNQQTof7VmAGA2gg
         f/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344599; x=1733949399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqCFXr63BV/To2djs8Pkrk4glJPRCZ8K3tC2riG44o4=;
        b=wNpYORz1GoKk24XP29bl/dUcxWb48+M9//r9MwWM39AaB4E6Jxy7F4u4bu52Y1qjkt
         sb3vveNkpK9gcUPAULWzLW/1JUH1z2iR1vvCUxYcXlYTYYv7A3UmB3zkfsYs5/jTks+p
         mGGO9GwQQXLwzpesaD0mOa0AHmPemckiJWX6/a1+J+RTx+M/u5kZza1wziPstxqekwak
         8LLwUVXGe7lArej01A4z2h4UhkhByuHFUa+f4qZgoK0kjheHSYSCbU2dwnWP0Lo5+XKj
         fvz4DBsHw2o2zUDW+14zu27mEbpBBc7XKLp8i7NUTEotBrlybKd5h+GF4I/Xk2qvHi9o
         KNpg==
X-Gm-Message-State: AOJu0Yxy105zLumMkEYUAgIHUM8mG8PfAXAObhoCnlZe3ld0/zugKGxY
	oO/qdHM55yMxQ1CNCSTZB6DJd/hY5aYcPRGGZFNLQk6DBYRD+2O8a6emCiIcrewl6lx1RqyrSS4
	8
X-Gm-Gg: ASbGncsIae+hjK/0aD0iBOPUto2lCuRsHPQgl5kz6nPptZccU99WHapFCc0Tctm212v
	59M27ssLQtJpS8sDlCyr/Yv0m9EfbtGICknWQjbMOnPCaIHO45KvYNDKhlVCuDgk/X8nGwTfNrT
	dUTK8Mww/hyXj9CKmDfC4BXxir5gqRLg94qW3mfl/Vlpo63C/Blv1DpMN//GkTWq3+GmUgbXH+9
	Fs8eEuAO6fBmqbYEeaoXhTL0/BBtAujFwIXVmc=
X-Google-Smtp-Source: AGHT+IFdGRkfGsSMHoHc0CjNX0R9NSNe+CPiNlgTIBXy3NxZIgLI8JISwPnHQAPeRnS92HD4NqSq7A==
X-Received: by 2002:a05:6a00:1782:b0:724:5aac:1687 with SMTP id d2e1a72fcca58-7257fcb029fmr10025880b3a.20.1733344599530;
        Wed, 04 Dec 2024 12:36:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/15] resulttool: Allow store to filter to specific revisions
Date: Wed,  4 Dec 2024 12:36:14 -0800
Message-Id: <974a6d5ebebc279df7c6994df7bd8c5d462e4447.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208335

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have a challenge on the autobuilder where test results from both OE-Core
and poky are being mixed together during result storage which is confusing the
data. Add a way to filter to specific revisions as the least worst way to fix
the various issues this is causing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f276a0dc65341668788853be2cf27ab6aa12b13)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/store.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index e0951f0a8f..430213bbfe 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -65,6 +65,9 @@ def store(args, logger):
 
         for r in revisions:
             results = revisions[r]
+            if args.revision and r[0] != args.revision:
+                logger.info('skipping %s as non-matching' % r[0])
+                continue
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
             subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
             resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
@@ -102,3 +105,5 @@ def register_commands(subparsers):
                               help='add executed-by configuration to each result file')
     parser_build.add_argument('-t', '--extra-test-env', default='',
                               help='add extra test environment data to each result file configuration')
+    parser_build.add_argument('-r', '--revision', default='',
+                              help='only store data for the specified revision')
-- 
2.34.1


