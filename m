Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1F2C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.101429.1701788206597176109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=n5R/9oZQ;
 spf=pass (domain: baylibre.com, ip: 209.85.221.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3333131e08dso4329914f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788204; x=1702393004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyrxp4HY1RDWuQUHFFLL/K1O/fmAKmFzoC9Fnl5D99Q=;
        b=n5R/9oZQQId2fs+gVH1Qf54QoRXC93WgsFclxetoPYz0gNDnWf8SzLF4xBhFy97Evm
         MWVWfcCNmCi81SzCtM1aqIduGvUicFbEG35y75HpC8KUhuSu5SAD2FJS+82cTxh/dabf
         qWZeBJmQ2OOCV1RvL+Z8d3vW5ggK76y5gmHgILBIstWvpE0uRionMhzGeb+9ii49N2eC
         l+HwEFOHTjtXignwkUMCCN0SSaYrE6OY3LYha2c6cd3aq8iIbDR91yCECWSdCcH05WCE
         Zqnw1oHj5ljrPdGs2ijIc9ZMkMxbE7tcghztqlNwuPs0fxlF+JomsyUTtu0vl5L4YXhH
         hjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788204; x=1702393004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyrxp4HY1RDWuQUHFFLL/K1O/fmAKmFzoC9Fnl5D99Q=;
        b=sEB+bsRXobL6ncOs/ucI4NbrFuW7ROPyWyVAwC2q/F77qwAfUvP1kpGVcHyY2gv++2
         Z1oRJ5BoxzwJKDvZ4086LuJ2GFUorP/md4RaC55qKeLatzIbR7taUmQE1Iclh3YsZ4R4
         eort5mAONTIt+JVphpKYXxWYJ/hXG1gpdOF86EGDvd8UWWWHzGg3NDjNkZIOTsENK45Q
         3aLv8y43lk2KvHHXdTr+vwUU1yLK9zoVFRpPHd5GCKTXNtdWlTuE3vQPdwu+hWVRD3AW
         aIn1XBWMbweQmZJaHqFsPudpjDC3WrmZ7LSLdwca78diIjOH+ZbvU3sbo4ualPl5S9tc
         kwXg==
X-Gm-Message-State: AOJu0YyUn4uwXApgAIHIqpS1H4Bzuq6shHxxAqeFMDNMl4q0MjIaJrk6
	ePGR2gFo/wwBlsS08s8lq29P2RM6T/0KV4dSotBE9w==
X-Google-Smtp-Source: AGHT+IGz040QoWdT/Vq5eQXcQFwWC9U6pGGAe8ZNt0Pyce3Q3h/E7KIaKEkYGVsvfw6OnxqZILWgZA==
X-Received: by 2002:a5d:62c2:0:b0:332:ca69:2fb5 with SMTP id o2-20020a5d62c2000000b00332ca692fb5mr3737082wrv.11.1701788204387;
        Tue, 05 Dec 2023 06:56:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 01/10] recipetool: appendsrcfile(s): add dry-run mode
Date: Tue,  5 Dec 2023 15:56:27 +0100
Message-ID: <20231205145636.960819-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191829

Add dry-run mode for recipetool appendsrcfile and appendsrcfiles, with
if necessary, a diff of changes

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/append.py | 33 +++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 4b6a7112c2b..58512e9e4b4 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -18,6 +18,7 @@ import shutil
 import scriptutils
 import errno
 from collections import defaultdict
+import difflib
 
 logger = logging.getLogger('recipetool')
 
@@ -355,7 +356,35 @@ def appendsrc(args, files, rd, extralines=None):
             extralines.append('SRC_URI += {0}'.format(source_uri))
         copyfiles[newfile] = {'path' : srcfile}
 
-    oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines)
+    dry_run_output = None
+    dry_run_outdir = None
+    if args.dry_run:
+        import tempfile
+        dry_run_output = tempfile.TemporaryDirectory(prefix='devtool')
+        dry_run_outdir = dry_run_output.name
+
+    appendfile, _ = oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines, redirect_output=dry_run_outdir)
+    if args.dry_run:
+        output = ''
+        appendfilename = os.path.basename(appendfile)
+        newappendfile = appendfile
+        if appendfile and os.path.exists(appendfile):
+            with open(appendfile, 'r') as f:
+                oldlines = f.readlines()
+        else:
+            appendfile = '/dev/null'
+            oldlines = []
+
+        with open(os.path.join(dry_run_outdir, appendfilename), 'r') as f:
+            newlines = f.readlines()
+        diff = difflib.unified_diff(oldlines, newlines, appendfile, newappendfile)
+        difflines = list(diff)
+        if difflines:
+            output += ''.join(difflines)
+        if output:
+            logger.info('Diff of changed files:\n%s' % output)
+        else:
+            logger.info('No changed files')
     tinfoil.modified_files()
 
 def appendsrcfiles(parser, args):
@@ -436,6 +465,7 @@ def register_commands(subparsers):
                                    help='Create/update a bbappend to add or replace source files',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified file in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify multiple files with a destination directory, so cannot specify the destination filename. See the `appendsrcfile` command for the other behavior.')
     parser.add_argument('-D', '--destdir', help='Destination directory (relative to S or WORKDIR, defaults to ".")', default='', type=destination_path)
+    parser.add_argument('-n', '--dry-run', help='Dry run mode', action='store_true')
     parser.add_argument('files', nargs='+', metavar='FILE', help='File(s) to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.set_defaults(func=lambda a: appendsrcfiles(parser, a), parserecipes=True)
 
@@ -443,6 +473,7 @@ def register_commands(subparsers):
                                    parents=[common_src],
                                    help='Create/update a bbappend to add or replace a source file',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified files in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify the destination filename, not just destination directory, but only works for one file. See the `appendsrcfiles` command for the other behavior.')
+    parser.add_argument('-n', '--dry-run', help='Dry run mode', action='store_true')
     parser.add_argument('file', metavar='FILE', help='File to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.add_argument('destfile', metavar='DESTFILE', nargs='?', help='Destination path (relative to S or WORKDIR, optional)', type=destination_path)
     parser.set_defaults(func=lambda a: appendsrcfile(parser, a), parserecipes=True)
-- 
2.42.0


