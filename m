Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F04C10DCE
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.8314.1701381743411739681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FZ+qg2Gi;
 spf=pass (domain: baylibre.com, ip: 209.85.167.52, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50abbb23122so2024308e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381741; x=1701986541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob/M3cMQ1KqQvzFBI+qXBMu9o/DBcC9zNy7AYLBajCI=;
        b=FZ+qg2Gisp7Fss+e+/QeII/XXv+xY2xdNFH6GIRNUMzhGxagUI3qUefeZ21ckFxrCD
         Y2V/+uh5Tto3ea3D7yRKQFxup9kAh6oXoBHK9wG4beHFvZyd669K54e5zL2/1dVGfm8K
         AdRk2Nr/mnvRMrLkIUvuiXd0gXNaAZeF6JGAHjknNFsSEqQsYkqRS2b2jlh4rJP1cgSC
         mp6RjJTs62fGYGSv9K974HWDwXfcGD1oP6LRbLZtPqfYPQnGjGmUyQb8mmzKb3qRWIzf
         kWnPCMQvn2M+xl+2FuRnDIA9VSnE0BwUqNkc9O7D1rjASAzNIJ1ZNiujieltfKCA2rK2
         etRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381741; x=1701986541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob/M3cMQ1KqQvzFBI+qXBMu9o/DBcC9zNy7AYLBajCI=;
        b=wUj9bFuRSFcQvmUbNm+YGgaHFLLAgGcteiQv/kO0JJpv2w/L1FQffLMkLQrgeizxvC
         SLGrPlOT1ypOoUoSeHin/4POP4nZMkz/8He8SoFlDzlWRtITcGCzWY9uw6iEWOQiCNhC
         j/Lb23520b+4SoAPTCt3Sq+q9xFN5KDpr1ZrQXEUwiGLKy45UNmRwb0BeS6R9JsIqR0w
         om8RjpBNyMCkKJ2gQ//i//fNP2fZiSkoWiwVZOlYO7QxFRSswJn77X0y9CGcAibQisRk
         SVh+Mfr/s30BiWwyl7ewWmOvE8olXcWJBCErgRHTuIlAVt/OpLkF36/SXdYDL/EbSQ7v
         /bhA==
X-Gm-Message-State: AOJu0Ywfe7mN7oxUGydB2Rq8QlMFFWjXdgn0WZ5MPFQJjpt/2Lse/IoD
	/Pb9pNC7z1/GIzGP3TDChCm6bo7z69ORMs10Qeo7vQ==
X-Google-Smtp-Source: AGHT+IFFXIwMNP4tSO4GWNvlxX1zrQIdFmknRAQgtG7JdLGkiHw7n5q77qMefO5tVvoa06UQL0jWbg==
X-Received: by 2002:a05:6512:3eb:b0:50b:d764:8048 with SMTP id n11-20020a05651203eb00b0050bd7648048mr138488lfq.123.1701381741006;
        Thu, 30 Nov 2023 14:02:21 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:20 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 6/8] recipetool: appendsrcfile(s): add a mode to update the recipe itself
Date: Thu, 30 Nov 2023 23:01:54 +0100
Message-ID: <20231130220156.726263-7-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191550

Add a new option -u/--update-recipe to update the recipe itself instead
of creating/updating a bbappend file

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/append.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index d7597ca5154..6c4c9183f78 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -356,7 +356,9 @@ def appendsrc(args, files, rd, extralines=None):
         dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
         dry_run_outdir = dry_run_output.name
 
-    appendfile, _ = oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines, params=params, redirect_output=dry_run_outdir)
+    appendfile, _ = oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines, params=params, redirect_output=dry_run_outdir, update_original_recipe=args.update_recipe)
+    if not appendfile:
+        return
     if args.dry_run:
         output = ''
         appendfilename = os.path.basename(appendfile)
@@ -458,6 +460,7 @@ def register_commands(subparsers):
                                    help='Create/update a bbappend to add or replace source files',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified file in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify multiple files with a destination directory, so cannot specify the destination filename. See the `appendsrcfile` command for the other behavior.')
     parser.add_argument('-D', '--destdir', help='Destination directory (relative to S or WORKDIR, defaults to ".")', default='', type=destination_path)
+    parser.add_argument('-u', '--update-recipe', help='Update recipe instead of creating (or updating) a bbapend file. DESTLAYER must contains the recipe to update', action='store_true')
     parser.add_argument('-n', '--dry-run', help='Dry run mode', action='store_true')
     parser.add_argument('files', nargs='+', metavar='FILE', help='File(s) to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.set_defaults(func=lambda a: appendsrcfiles(parser, a), parserecipes=True)
@@ -466,6 +469,7 @@ def register_commands(subparsers):
                                    parents=[common_src],
                                    help='Create/update a bbappend to add or replace a source file',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified files in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify the destination filename, not just destination directory, but only works for one file. See the `appendsrcfiles` command for the other behavior.')
+    parser.add_argument('-u', '--update-recipe', help='Update recipe instead of creating (or updating) a bbapend file. DESTLAYER must contains the recipe to update', action='store_true')
     parser.add_argument('-n', '--dry-run', help='Dry run mode', action='store_true')
     parser.add_argument('file', metavar='FILE', help='File to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.add_argument('destfile', metavar='DESTFILE', nargs='?', help='Destination path (relative to S or WORKDIR, optional)', type=destination_path)
-- 
2.42.0


