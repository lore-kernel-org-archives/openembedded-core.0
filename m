Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18699E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:44:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.62664.1734371061132794736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3JNboLB;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2467668f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371059; x=1734975859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z+Jas9GGCrS1wIN2nVLEaEi5vvOZqNogZHg/MfNjio=;
        b=j3JNboLB6EizJqGJ5ty4ofuQVJq7CbkdyjfwX6yZW8Hq8L0BXmtQxb1UoqSf8x47bP
         2dUmb09nWWEAzhcLt/Euvk7vDIUIBTz7hMJx+wZyZcvEPAKNGtUhQiJ3AzVJWq/OJoDt
         ggbZUnTpiYtzJ/1cCHQftlWQIJqmY8IxqGeq7DHQ7G2/MVgubr4yC6H1nmRcMI9/+SWE
         lnHSjMegQu0W4aZJAWkQ4QPHfYRtbeVSDJGD2Xf1vvqPMklGqga+hCJQa7kRIlFPGd8a
         QKPydX2Uuv2nb9RMsOADkS+3FsNyQ56tgmCmf+ahlX19hvroj5oHU8uDb41pG6QjLr47
         cllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371059; x=1734975859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Z+Jas9GGCrS1wIN2nVLEaEi5vvOZqNogZHg/MfNjio=;
        b=foK8b0vI9PD9cX7ziG+krK5KR/LkVKpvSz1TgUiaBMESRZBWLG9YvhkbvPtLJUT7ci
         juyyKxM6CXjIfBypXk8usPm5Ukn9SeGcDbgY4DF2mwI01is/cYkO7G90FCvc54upNkdm
         1YtnRRu0ykKhLvYEvusW/0YtPUM8AqQLwMVwISHVpMKSr1RGoWaOHhqdKW4BTVMa68aZ
         /aAepdbe7wluRCh8xMPMGUHazqEQsBBrAf21lYJYyp+zbgLWQ7JpyRFesIwIKHkbml/X
         ZArJk6H7Jjlac6A0Tmw88YL3TRzVANIy4AQ9hFM06WCkme3h3XTVZZW9B8KL+Vfi9BeV
         EJvw==
X-Gm-Message-State: AOJu0YxjdvGmQS0FDC4xZCV6ni7kd6o5Nm1XyyM7kB0XZxY8UzyOQuIx
	KeMPLHstA2dM0EIMdEuOOqax31EwVuqrRPajjyTmQcwwFg7SqZB5UN2Y/g==
X-Gm-Gg: ASbGncuGw9vx8kZYNRYPDGP8HAnuRFlTnffiF51lXi6IPT/LspYgNH98e/NjIrqlTWE
	HgCb+BYTkxhtXOdnJg341YMBm7MVWBq88XkbwjGo2O8oxeDWAUWF5wFJu1XRZPWm3McI5uPnfCz
	+dimVDkvuS0T+DFgvEao2yJySFpZt6Z5hlo2exuLqJTuPiTzWyd3Ry/YG9s0e9FsomUxAAoYklF
	/KeWFBI++1TyyU8nrA51tU/WpGki+++y8W5znWCr9EOa12LGeUnABLrcri66Fc6Qz9eywEclVS9
X-Google-Smtp-Source: AGHT+IEZ/p6WRn9E/lSlRHA1geX4q24dKRuOrLynuAvJ9HqGG+WZIPWmwdjnEjc5FvxHq0b1Ivyj6Q==
X-Received: by 2002:a5d:598e:0:b0:385:e1a8:e2a1 with SMTP id ffacd0b85a97d-38880af153bmr12231315f8f.3.1734371058980;
        Mon, 16 Dec 2024 09:44:18 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c46sm8892338f8f.71.2024.12.16.09.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:44:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] devtool: modify support debug-builds
Date: Mon, 16 Dec 2024 18:43:03 +0100
Message-ID: <20241216174406.3128556-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
References: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208786

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a new option --debug-builds to automatically add DEBUG_BUILD = “1”
to the bbappend file of this recipe. This is especially useful when
invoking devtool modify before invoking devtool ide-sdk to perform a
remote debugging session.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f2440ae804f..fa846ce61ac 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -972,6 +972,8 @@ def modify(args, config, basepath, workspace):
                     if branch == args.branch:
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
+            if args.debug_build:
+                f.write('\nDEBUG_BUILD = "1"\n')
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
@@ -2310,6 +2312,7 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
+    parser_modify.add_argument('--debug-build', action="store_true", help='Add DEBUG_BUILD = "1" to the modified recipe')
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.47.0


