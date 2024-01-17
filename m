Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0824C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:02:49 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.4507.1705503760466676993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQ2Y14QY;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a271a28aeb4so1213203366b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705503759; x=1706108559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8nWMs8GhueY1LCbn0DjNHpI8ur4GQAGNsq4/jga0ro=;
        b=fQ2Y14QYeXdhQHTi6EKoRLpZw1oV56I6UFZCfQvaqJs6Icw8jM/1ZUm3EvC1r9OvfO
         ltuXObiXjtuuJwZZCkmP2q3WNTVMiO38qES/wi+wXUkW7u1OHG4Ij1u3+FfWT81WU5dF
         ExGB/esa2YvqlCBrhxg2Hc8YbrxCFR1daxsHPkJ/3ll6aT6XL6qdbqGVzvXHvINsYiBp
         QUZnto6I1zc5idpnJ838nUK+WiW41dZKiW6W8zUCHMDoP8NRN/oHjVq2gQNR6pd8+1TR
         ExGCpgi5IniZpAwttTh/k1qFEes9e8Ai4BON3Lzc9f0ztawi2s3puPfRYFDtoyeTtxyL
         Xvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705503759; x=1706108559;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8nWMs8GhueY1LCbn0DjNHpI8ur4GQAGNsq4/jga0ro=;
        b=icL895vq5eCA/nXE1N9qXWcG2XwGdIVvLB9XW8kyNbEG/EKdjcQ4T5eRxtOtPJXA3x
         ZkAcUZf4zl5ZVICDvmNzcqjP5KyaU8U18zc3hz5jNCeKPhTQCNLWK70ujST147pqPyE9
         0OeYqbVLMyzh7XpCMTcUxectHz5TOZJDWZqYkdlEe/UJqJgrTZ9ucya0bt3igeq6GbHr
         1GGLiBPzKAr2PyKdewbXFwJFpHB1HwK+kheXaCoKIAUse5I3PJwM26SuvVx2r2BjxHpd
         ALj7hgDXaMRB3Ksve+pXXg66aA/AtlWB0Je17hhZoySiFEBXZzCilzTaVXnmAKf3buQL
         XXMQ==
X-Gm-Message-State: AOJu0Yx8jlDWpYnYjk64R7jdXqafJEiEjbe0bIuWT3BDuFb48qG+4R28
	P3e/s+j09dY0VrXb4ECGK6FNq+K2AgE=
X-Google-Smtp-Source: AGHT+IFO0E/A+c0qbHFY233eTK8BJLwj1qfd2/Wc+Sq3SVOGT4AtMJivBaLgqlGz0+DEAfj3e1CqVg==
X-Received: by 2002:a17:907:31c6:b0:a28:93cb:19a6 with SMTP id xf6-20020a17090731c600b00a2893cb19a6mr5311027ejb.61.1705503758603;
        Wed, 17 Jan 2024 07:02:38 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906399900b00a29db9e8c84sm7867465eje.220.2024.01.17.07.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:02:38 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH 1/2] bitbake-layers: Add ability to update the reference of repositories
Date: Wed, 17 Jan 2024 16:02:13 +0100
Message-ID: <20240117150214.1110-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193917

From: Jermain Horsman <jermain.horsman@nedap.com>

This creates a new layers setup with, or, modifies an existing layers
setup using, one or more repositories where the references are provided
by the user.

This is a very minimal implementation, no validation of any reference
is done and it is left to the user to provide a valid value.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 .../bblayers/setupwriters/oe-setup-layers.py  | 79 +++++++++++++++++--
 1 file changed, 72 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index bd71ca1f51..59ca968ff3 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -31,16 +31,69 @@ class OeSetupLayersWriter():
         with open(output, 'w') as f:
             json.dump(repos, f, sort_keys=True, indent=4)
 
+    def _read_repo_config(self, json_path):
+        with open(json_path) as f:
+            json_config = json.load(f)
+
+        supported_versions = ["1.0"]
+        if json_config["version"] not in supported_versions:
+            err = "File {} has version {}, which is not in supported versions: {}".format(json_path, json_config["version"], supported_versions)
+            logger.error(err)
+            raise Exception(err)
+
+        return json_config
+
+    def _modify_repo_config(self, json_config, args):
+        sources = json_config['sources']
+        for pair in args.custom_references:
+            try:
+                repo, rev = pair.split(':', maxsplit=1)
+            except ValueError:
+                err = "Invalid custom reference specified: '{}'. Provide one using 'REPOSITORY:REFERENCE'.".format(pair)
+                logger.error(err)
+                raise Exception(err)
+            if not repo in sources.keys():
+                err = "Repository {} does not exist in setup-layers config".format(repo)
+                logger.error(err)
+                raise Exception(err)
+
+            layer_remote = json_config['sources'][repo]['git-remote']
+            layer_remote['rev'] = rev
+            # Clear describe
+            layer_remote['describe'] = ''
+
     def do_write(self, parent, args):
         """ Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build. """
-        if not os.path.exists(args.destdir):
-            os.makedirs(args.destdir)
-        repos = parent.make_repo_config(args.destdir)
-        json = {"version":"1.0","sources":repos}
-        if not repos:
-            raise Exception("Could not determine layer sources")
         output = args.output_prefix or "setup-layers"
-        output = os.path.join(os.path.abspath(args.destdir),output)
+        output = os.path.join(os.path.abspath(args.destdir), output)
+
+        if args.update:
+            # Modify existing layers setup
+            if args.custom_references is None:
+                err = "No custom reference specified. Please provide one using '--use-custom-reference REPOSITORY:REFERENCE'."
+                logger.error(err)
+                raise Exception(err)
+
+            json = self._read_repo_config(output + ".json")
+            if not 'sources' in json.keys():
+                err = "File {}.json does not contain valid layer sources.".format(output)
+                logger.error(err)
+                raise Exception(err)
+
+        else:
+            # Create new layers setup
+            if not os.path.exists(args.destdir):
+                os.makedirs(args.destdir)
+            repos = parent.make_repo_config(args.destdir)
+            json = {"version":"1.0","sources":repos}
+            if not repos:
+                err = "Could not determine layer sources"
+                logger.error(err)
+                raise Exception(err)
+
+        if args.custom_references is not None:
+            self._modify_repo_config(json, args)
+
         self._write_json(json, output + ".json")
         logger.info('Created {}.json'.format(output))
         if not args.json_only:
@@ -50,3 +103,15 @@ class OeSetupLayersWriter():
     def register_arguments(self, parser):
         parser.add_argument('--json-only', action='store_true',
             help='When using the oe-setup-layers writer, write only the layer configuruation in json format. Otherwise, also a copy of scripts/oe-setup-layers (from oe-core or poky) is provided, which is a self contained python script that fetches all the needed layers and sets them to correct revisions using the data from the json.')
+
+        parser.add_argument('--update', '-u',
+            action='store_true',
+            help=("Instead of writing a new json file, update an existing layer setup json file with custom references provided via the '--use-custom-reference' option."
+                  "\nThis will only update repositories for which a custom reference is specified, all other repositores will be left unchanged."))
+        parser.add_argument('--use-custom-reference', '-r',
+            action='append',
+            dest='custom_references',
+            metavar='REPOSITORY:REFERENCE',
+            help=("A pair consisting of a repository and a custom reference to use for it (by default the currently checked out commit id would be written out)."
+                  "\nThis value can be any reference that 'git checkout' would accept, and is not checked for validity."
+                  "\nThis option can be used multiple times."))
-- 
2.43.0.windows.1


