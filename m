Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540E8C07E97
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:57:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.102653.1701788212261075963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xHNhchHm;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b479ec4a3so56972685e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788210; x=1702393010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaM1y6GJfxFWYeJtjpQbVhu13+8lNFtoz2xL337IAAk=;
        b=xHNhchHmn3wFpiP7EkRFWavwvUBPRKE05pCPrGtko5fu2TwEUmyM3C/VPAngKmO+Ps
         yFyPQ1PY07APB+OK1hhEC2uuushizAPsIDO4gBozv4epvLeE/xmMATOYv0zg0ycQhWuC
         PPqIkXRk1LsrCOCOqbU5Qd4qGVXUDh3+AWYkYJmK3FpvgcZWjM81APBGxX5MjzJcJhG/
         z5XOIaqqEEOUQ442shEqqN0HgClSl3Ww/wc/XK3o/MGsaZOLlJgFwQvz6zsjYgzdC7Yy
         9yma1MZOSLPP6CGmVsbxrW9fM6MYAtgVYpB3mWmgV3XsvGLm3oiZBi2/NNUyOdm7y4cN
         A+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788210; x=1702393010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaM1y6GJfxFWYeJtjpQbVhu13+8lNFtoz2xL337IAAk=;
        b=o6IukZrs7z/Y09cVaA4/6E8n1HJs+qMCnHCxOKMYMXB4833CMe6XTBV5WXyTGB7evz
         MUFdIiC3wt8gWZt5J3zPYq7hDOFJebBAJcZ3ikCxEP4BbwM53zDSuUio5QrNn7ijbX7L
         lsItvZH/2zsLfqsCZ73uPLs+UyVrS1FXz1QMQofSSE2rSCZLAKwQjRPOeaRdOf3g34N/
         W/EMHvgamAMSSkoqxbRZ3EpxMb8kxaugS5URgfLqGum7m5OetbyWpHnT+83vIn+bwcos
         AopoKwmMVQcgMRUMecPQTGEy6gsPmgMXKrTaby3EF8zeE0nEO4l1TuU+B4klY+bgUvn5
         Vx8Q==
X-Gm-Message-State: AOJu0Yw6Th3smDhx2OVS+E9/azSMQvHVY9kr2NhxtwGNV6TWR8EwCkYq
	m4ujhkg5EyeT3w8Cfcm4I/fQNoiHnpOHTCEIvwN8gg==
X-Google-Smtp-Source: AGHT+IEunwtjcg44Ce2WNo5jZ+AUWnNl5jH3xYrW314G1A2Xpahn0Pr7Rkk1KgsUml7/sikecKBg4g==
X-Received: by 2002:a05:600c:42c1:b0:40b:5e22:971 with SMTP id j1-20020a05600c42c100b0040b5e220971mr4181234wme.96.1701788210204;
        Tue, 05 Dec 2023 06:56:50 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:49 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 08/10] recipetool: appendsrcfile(s): add a mode to update the recipe itself
Date: Tue,  5 Dec 2023 15:56:34 +0100
Message-ID: <20231205145636.960819-9-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191837

Add a new option -u/--update-recipe to update the recipe itself instead
of creating/updating a bbappend file

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/append.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index fc3cc4a0b7f..341e8933057 100644
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


