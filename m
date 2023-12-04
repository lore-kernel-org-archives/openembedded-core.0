Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D1FC10F05
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.72248.1701703578125144295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QKCJJ0DK;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c0a0d068bso12426655e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703576; x=1702308376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7E0X1BrF0yRxoyN/2tLqacemtLMSRM0Alj0fdSRIA8=;
        b=QKCJJ0DKoQGU+T4Pmt2hEjLnGzWk217XZC2Lnb2tWTM6ldPC4NZzUHYI1vxj/f0bqz
         VmKhCjeA6AfWXmld8lb3SW9ZumI5yRNo1WBUv5Vj57+NqzvI/sPxIlLKscog99cqHJ0v
         YiMO2KAIuK99fxYg5pI2wSK+OMmBKMAOUgVD2pSJ7WnE3K6GKfCSBkb4RtvWQAHRiFDe
         V/O54pMj2jSvsxLHGSvxBFXm03Ih2NE1qGQrlREp2SQ2AZCvxKv2yKJL1RWqeQdilbma
         QEUvHhudb1Zqu81p/waFSlVmdIQNGOElIOhYSVWps2NCz0YadPTJ8vRtD+BAchrbK5F1
         inhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703576; x=1702308376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7E0X1BrF0yRxoyN/2tLqacemtLMSRM0Alj0fdSRIA8=;
        b=Snj2GDvOMSawgfZU++XXeZu6o1a9YpV4H4OI4jdL4qFmrIzYFVhiK3p920xZhIPbDi
         y/RLc6zP98zIyeVwLdM7XT9+mBC8Gm3YTQOq2E1GtxOvz/GxxhVwk4/EB2CXh87LfwVR
         N9AlRUsRii4gQs8t5NDNxgEwSm4y7oFxk73/yG+/Q5r12v1N3IyAU4Gf13vPgL7dKzg/
         boesn+AP2oi57MGjoGCXHft/pr7gQEuZ+4iAIiABC63zRLyvmdWLlbrKMGcqrNs0lfMB
         LHZuhozbwyGhbdJQ+Zmo28OFj2n4yZPmRf4rCnqOlyorDctUve+YQWH51b4dDVDzGmos
         h5rw==
X-Gm-Message-State: AOJu0YyhGevjxx43+P4hO1O9GFEZiHvZebFOK6UTcI6xBpwfVDvVYA0+
	GYt2GG8jTUhqKBaMWOpltRO4fYFyBFufrCpZF7j1NA==
X-Google-Smtp-Source: AGHT+IEZGdJ994mKGDtoY91Bq5nK6X9BulSm9201o2gGAGqWWHOLCudjMsXSjYfFqq5SfjLwkO4q1w==
X-Received: by 2002:a1c:7716:0:b0:40b:50f5:3e6e with SMTP id t22-20020a1c7716000000b0040b50f53e6emr3204340wmi.24.1701703576506;
        Mon, 04 Dec 2023 07:26:16 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:16 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 7/9] recipetool: appendsrcfile(s): add a mode to update the recipe itself
Date: Mon,  4 Dec 2023 16:26:01 +0100
Message-ID: <20231204152603.831495-8-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191749

Add a new option -u/--update-recipe to update the recipe itself instead
of creating/updating a bbappend file

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/append.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 7e56290a0ab..66ed160a0a6 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -357,7 +357,9 @@ def appendsrc(args, files, rd, extralines=None):
         dry_run_outdir = dry_run_output.name
 
     appendfile, _ = oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines, params=params,
-                                                   redirect_output=dry_run_outdir)
+                                                   redirect_output=dry_run_outdir, update_original_recipe=args.update_recipe)
+    if not appendfile:
+        return
     if args.dry_run:
         output = ''
         appendfilename = os.path.basename(appendfile)
@@ -459,6 +461,7 @@ def register_commands(subparsers):
                                    help='Create/update a bbappend to add or replace source files',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified file in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify multiple files with a destination directory, so cannot specify the destination filename. See the `appendsrcfile` command for the other behavior.')
     parser.add_argument('-D', '--destdir', help='Destination directory (relative to S or WORKDIR, defaults to ".")', default='', type=destination_path)
+    parser.add_argument('-u', '--update-recipe', help='Update recipe instead of creating (or updating) a bbapend file. DESTLAYER must contains the recipe to update', action='store_true')
     parser.add_argument('-n', '--dry-run', help='Dry run mode', action='store_true')
     parser.add_argument('files', nargs='+', metavar='FILE', help='File(s) to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.set_defaults(func=lambda a: appendsrcfiles(parser, a), parserecipes=True)
@@ -467,6 +470,7 @@ def register_commands(subparsers):
                                    parents=[common_src],
                                    help='Create/update a bbappend to add or replace a source file',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified files in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify the destination filename, not just destination directory, but only works for one file. See the `appendsrcfiles` command for the other behavior.')
+    parser.add_argument('-u', '--update-recipe', help='Update recipe instead of creating (or updating) a bbapend file. DESTLAYER must contains the recipe to update', action='store_true')
     parser.add_argument('-n', '--dry-run', help='Dry run mode', action='store_true')
     parser.add_argument('file', metavar='FILE', help='File to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.add_argument('destfile', metavar='DESTFILE', nargs='?', help='Destination path (relative to S or WORKDIR, optional)', type=destination_path)
-- 
2.42.0


