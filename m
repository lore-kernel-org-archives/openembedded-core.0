Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15365C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.71449.1701703573537689677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=klZVmYDQ;
 spf=pass (domain: baylibre.com, ip: 209.85.221.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3316c6e299eso3970811f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703572; x=1702308372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BmDN1+RRD2JSJlTHpXnX4DHNnxVXDnsKlyPlGhM9EE=;
        b=klZVmYDQppr/or4WdgPMO7zIKw6ioAZ+nx/1qdct4WgXrI7gsF7mda8mmaomctvgya
         jE/0XmpryB6nyGT3V92ygDH6HuNFFgIrIKuFe319Ceh+mmNMvAoLfdcxtnn1+kCunjzD
         8NbNePhs6Uyt9433d8OIg0/MK1SlZk4Zd3MUcyyZuRyZ3s2dZR7k8MG9bQWoDiaUTLJ8
         5Nn77cJcS+oVqEJwjf1whJN72OS5gdbducY2t8kjGLoj1C6uLnPLSMlMLpCuTxDPfHFM
         VVuo+RNiP5WsRweEK/CUy0tWcFkr43A76F0M/1AB7rjLH9zz8xymHvuLVsO0ghOaIsQP
         jVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703572; x=1702308372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BmDN1+RRD2JSJlTHpXnX4DHNnxVXDnsKlyPlGhM9EE=;
        b=TcCtV8Loi/PHYj/GETyMNmb6Jrx4+Ue2IUivpU3BEU+L0RxYyUUxQOPAqGu1VOUMNR
         qfb3hahy650l/NkxaqyWWqID+pw3IvrwBoQJDp1XGPUzeQ4mxGTr5BXFhI73ziGtJlke
         HPx3kMIiuAqFhzspC0BXHZMKsdjJ+tDBuETg/GFydvEZQEDpasnQoXlJY0gRJmGX0+No
         Q1Qg6pympyDCsXAo4ynekNfSnBlN7C9HntxZlv3FnkLGYoJZHbe8Q7bmh6snpunckM6c
         bJoU99XSsBQ9ToZKp4PzeQR5gXHQyJkbrDL2E9oGPxUgwUObhR2IDKbnWgSPFc5njxxH
         4wnQ==
X-Gm-Message-State: AOJu0YwPPMpEIRjNG97M44nQN9HwT6/aduRut9fZjdkRdC9dYejBvnzL
	m24C1lOMeaBrxU/4FSnpsaSe9XE6sCTmKEHMekNP0w==
X-Google-Smtp-Source: AGHT+IFdkRnzJPvSc7eQE2klEmK95lgQsJeHK9B+R+dRpQJPqKOELHTBATYItm+LTkWfgegdgFmWog==
X-Received: by 2002:a5d:42d1:0:b0:333:5436:be45 with SMTP id t17-20020a5d42d1000000b003335436be45mr96965wrr.13.1701703571949;
        Mon, 04 Dec 2023 07:26:11 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:11 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 1/9] recipetool: appendsrcfile(s): add dry-run mode
Date: Mon,  4 Dec 2023 16:25:55 +0100
Message-ID: <20231204152603.831495-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191743

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


