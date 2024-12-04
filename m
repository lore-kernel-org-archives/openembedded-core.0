Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AC9E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:15 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.21218.1733334908351074306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NMhN0EYb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso966551a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334908; x=1733939708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqCFXr63BV/To2djs8Pkrk4glJPRCZ8K3tC2riG44o4=;
        b=NMhN0EYbE62A4DKKmeFdFqdI8E4eieBTPVPKqJAri50p9VQ2o0WVg1Z0B8HwNxrRE/
         LmOxLlRq4I7nIFqrr9p3MAN0NFRRTSNWPjLBkS2Ev7PPiam+U9Z6HXUNnTV6RwFnW4Ay
         kZIw3uKDeemC/zZtfoC78JP+ZQxxbTB0AvIsrTSPxEWYRdT5qbwNxkgKuCioX6H6qAEr
         +F7GvhlBxe8AOh2vyKmtzfFBKGkZIN4yq6KrIuFWN8taKB1q+J3Ueq345T1pdTb6TFTv
         mjp+zJvY0sqldQ7dnAKyeY8L9Kj2rQy9dYcaCs/zQ3BPvm99dpsZ4lmgaZkWEJmcVlU0
         qhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334908; x=1733939708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqCFXr63BV/To2djs8Pkrk4glJPRCZ8K3tC2riG44o4=;
        b=htlOHQh/3de6QKkG1QQbQ7MgrrxtisaUShhgiXOvy02oq/YaU1kuedAn+ASnWketGO
         nZTLH/I1I8mwr6rXepZA52wL2DPZqL1EtLQulVGpB7ohTtRFbckT9wfHf7ECsfo9ljF5
         oLNpZG502vbfbeldiwWTlJknFbImvghGAI8D7kVJa9c2HeTGWLBTlMXAUGDaleJQy1DI
         LJBslsuj2pAqGQ79KuI+4EYW2hp5ISxzsnTDI+Nly3X4+kqc3R0wcQBhTL/xGJCRue8/
         hyuvtxhFP73Vwy7WG7pf0i9eQGrtIBN6VFiC8vLc8spkeHCJJNSygN17fT5GxwT0G7+D
         OPag==
X-Gm-Message-State: AOJu0Yy0szXSMJVp+fl1cnnH9gdRz/TLXWqjUiBB4NLPrcCee4SuW1hx
	wt11O4wU7ebxuEv2deAUHyEbcilgb0/+hKX5rn709jSiTgCyfTSkWP6ApwuObJXbC2Ke49gwNQ9
	K
X-Gm-Gg: ASbGnctv3E/zXe+P8qh7WCDYOCBA9m5M/1HkUvby5AXOSmv9MORf24U2JTqx27FmiVF
	KVq3ZBspVWLPCY264mYvO5D7qYSzxu9cNoeF/gOramVYgGmlVyz1nzfQKv0MtILY0poE4jkx7Of
	wQLetdmoxAhNMs19zvbx8VjMNbG+YIu6lnmMy/cvNdTsiAXsxD8qxpMdgqFhXVk92T0Itjv9LP4
	VfUeu/KE6Ub7vkDk2i26bTO2gaXOnhksD8LeVY=
X-Google-Smtp-Source: AGHT+IFa3NBMrcv7FIeE96Z6BxAn0GR8dWgopfdibflbIec28d29r5mFYXxyIX0BF9oWqfRspIkzOw==
X-Received: by 2002:a05:6a20:b4a0:b0:1d4:f7b7:f20 with SMTP id adf61e73a8af0-1e17d441f33mr332727637.21.1733334907464;
        Wed, 04 Dec 2024 09:55:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/38] resulttool: Allow store to filter to specific revisions
Date: Wed,  4 Dec 2024 09:53:57 -0800
Message-Id: <5588459188ea21cb7a2064828245d39f1328c6cb.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208313

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


