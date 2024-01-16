Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33611C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 10:57:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.10683.1705402619051926523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 02:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+GL3Wbd;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-559bd483877so169265a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705402617; x=1706007417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nwjb8TPJh9KTuqXluYnJRWLYD1vGo95ouZ0iggvSZSA=;
        b=W+GL3WbdP5Sy4idEQhHw+XfvcXElqM1Z/XiqQ/MTjCXaM3hlBPVlkDCxfJEHlqYTqU
         DLYeV+v8d0zqSzxxI47/alIUnwd/e9BpSAvfrW+osEQEz8vv/02seuAfAICzJf0p+kpu
         r5VIQO/yUsiv1+iFyl7ruoKqOzC+PHkwYgnjK7xuqqSBldLg6abVlJSm7hOUuR18eJzO
         QytbZ87S4mhW6On99WfGhpIbCRdDtyoJ5SCHicshiUCsJIJrV3uWCMitgk6qErhUVzoj
         qZ2Ij8yyrwNuLfKceVV/a+8146dD1ezMXHG3r2fdVUlDWLKMaqAs2bEhHORjaiuNb8g6
         unYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705402617; x=1706007417;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nwjb8TPJh9KTuqXluYnJRWLYD1vGo95ouZ0iggvSZSA=;
        b=qPgQ2+aJOlaSiHybPC0+gnjpXl6XEYMQRwPLxR8g+kCdAo5tdchxvZ+3pqu2ZosMrH
         iWMtv0Z+7L+3vMsPEFoNDHj24zuuRtxgcaqLTJ1w2SKC3riswKql/N/R96b95AF32V9+
         DN5dh4lTCBgMXIBnbQiCtfVO0pysPQFfc0BrPaemB+NFQOwXuSSHvTqNFaOXLSjqvtVq
         8Ya2rAI8h3ASkj+wamdwf/n1zJQuCQ4MtRH+SUT9+McDDb2kLPM7VpHUTVUy8Vsh+rkN
         edk2o7PpS9uFRQowvyxmPUKkFiuwPuQUbnm3H5fK92pw8/c3YmUggBEFzBvl3dJQnv71
         uepw==
X-Gm-Message-State: AOJu0Yx1xooH+hAefNM96Msb5nJWuGGFPyK8zEfeGtQ3qV2C1yhVHAmw
	Bi0GRSiXIR1hQJMZFy9bc98HXC2uxV8=
X-Google-Smtp-Source: AGHT+IFK2PuDJl8nFZ+7zvwwEZHQ8NIBGQ2nuI/9yNsVUOt+FRqvARhDtgjjqyKouQplUV+GeDW33Q==
X-Received: by 2002:a17:907:7f11:b0:a2b:29bc:f1de with SMTP id qf17-20020a1709077f1100b00a2b29bcf1demr3792149ejc.9.1705402617165;
        Tue, 16 Jan 2024 02:56:57 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id tg14-20020a1709078dce00b00a2cb117050fsm5366969ejc.126.2024.01.16.02.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 02:56:56 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v4 1/2] bitbake-layers: Add ability to update the reference of repositories
Date: Tue, 16 Jan 2024 11:55:37 +0100
Message-ID: <20240116105537.961-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240116105537.961-2-jermain.horsman@nedap.com>
References: <20240116105537.961-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193851

From: Jermain Horsman <jermain.horsman@nedap.com>

This uses an existing setup-layers configuration and modifies one
or more repositories using a reference provided by the user.

This is a very minimal implementation, no validation of this reference
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
2.42.0.windows.2


