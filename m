Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02914C10DCE
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8240.1701381738204360162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UpS0yhCx;
 spf=pass (domain: baylibre.com, ip: 209.85.128.42, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40b4746ae51so13830335e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381735; x=1701986535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BmDN1+RRD2JSJlTHpXnX4DHNnxVXDnsKlyPlGhM9EE=;
        b=UpS0yhCxGFjxIwfJm2HD2lgfRPgwjQwX+GSsrVEM66WmguRNWRmJ4sEHcRis3hpcWM
         C66UbAsBFPrjmL3gmvYfRBThDjUkDLQ/Dji9VGEyoxXvBpKttZtGWmFQyxnQB54x/lW6
         gSftV21toh/vIYtvKJWPFm1PlY38ezkPKtT1YRhUM6A5lCek+71n+cWDY/XHFMJHPmAj
         KDq7VtkTJ0J2yglr/HQdJpI4w00wzz1p3XghTgdX3yV5mDO62bx1gZGcUaVLIjQDGZM4
         hgeibBbHCKQ6y0hTilk7QML/+izQVCfswc2/8RLr+ie7jMCjpAOL51PvHJaRYta2gYK7
         FVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381735; x=1701986535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BmDN1+RRD2JSJlTHpXnX4DHNnxVXDnsKlyPlGhM9EE=;
        b=MkjWvKtjGV+XueA7ZEn+mm1P1yZ69xlS4G49Sp4uJrfVhHGhOsHvUNUe81YVWQ0qWK
         V9NfFp5/mPcbwjgX0kpOQO19rfSvwwnOO+5EIcFJipwqZrahGkii5SbFvp+U+C7hGt0h
         fsTv1V9gvcQbEqs1aVkcu7PCrzpL+kcZahUGMsaCJO+cnihdDNKXdGlg6Cj1piAHuglg
         4MRQ0rHBB6/NWlK77seuvMOrRtK/wLlsyMUDAk0A6gm7CL9Hvmr/MXnrc2yG/hCvSwsh
         /E2/bKAzSq65B6uA8V7VL9KmbmwTk/XKp5I7tB0RclvDqJDg+ACN3VmgM6W6d6NU9psZ
         U9iA==
X-Gm-Message-State: AOJu0Ywi7YIVXtqqfNzURvFLalOYkhXhO4DWoduT5XP92q2T7wv8vFDt
	vk1gM/vgZyTX31NwZEnKIbDes7zE4M1iPqTFZDq2Og==
X-Google-Smtp-Source: AGHT+IEb02TxhHYRk1TbLIWezjUgz5erF7QRw2dRdQf2MmQrppvCme1UuhSvtCbbtyT1pLHDSqZJqw==
X-Received: by 2002:a05:600c:3418:b0:40b:5e59:c568 with SMTP id y24-20020a05600c341800b0040b5e59c568mr65887wmp.146.1701381735746;
        Thu, 30 Nov 2023 14:02:15 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:15 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/8] recipetool: appendsrcfile(s): add dry-run mode
Date: Thu, 30 Nov 2023 23:01:49 +0100
Message-ID: <20231130220156.726263-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191545

Add dry-run mode for recipetool appendsrcfile and appendsrcfiles, with
if necessary, a diff of changes

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/append.py | 33 +++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 9dbb1cc4b5a..314ff4e20fd 100644
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
         copyfiles[newfile] = srcfile
 
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


