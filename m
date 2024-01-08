Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C041AC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:42:15 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.8329.1704724925616661266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gzeehLyg;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: jhatnedap@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5edbcdc323dso15444347b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 06:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704724925; x=1705329725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VkYqm272y1+H1FvBisREJafQGIaPJSDYApzI9iL+mdY=;
        b=gzeehLyg9OzQVxCuBH9X87lNVVZyhOxEQ0aLWxVDhBJ7xTnT5Caf563+f+kkbN0B9h
         Lirx/piCLob20hn/7/NQx+o69M0mXvyrlcN5zzucZKW5vbF9x1QrxkGuNR75SZXeYYJl
         XGGDmA8T+ILgQ/8e4xDRCgjLPu1RIMfYiZ6SADuvBB4HVWYhMjnoo+mPtStWahqDI+cn
         +0JdEDHPogpbKDN3yU2xDLlVeDcnIPBR/4xXKr7htBBKZZacARB2oA1Mc7o3Ye78CVCN
         tbmxgGksM7oDcxIQJtJR/32zYjVRiL04E2R4mum1l9h9rhBl+SIr5tLoIudCmw63WzVd
         1HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724925; x=1705329725;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkYqm272y1+H1FvBisREJafQGIaPJSDYApzI9iL+mdY=;
        b=I/7Iuc7kvH3HFKP+GoV3r3WBHeCFbSPyf7ypYCgit6kuMPuedMGui7btvBbz3pdgvz
         0nSWKKRfIVxOtgA8XmEd836XkIxpog87ad9rGxbGY41rblaL383gtK8uyRzIKQPPDr30
         XVZyay9TY6pAWOUPZCCb/3DLtzXWlZDIGjcGghfJlIrJZhp8s8Io4WCWhBLn3igkHoD2
         qFuC5VkX1+FrvEnX1yQVkTUxa3zZZrIf8C6o19smNvrb6t+4H8JuL2/0Xlpgku1GcYTS
         v96smzXHzeHJ/XEf1m2jdtxqhM0dfZMoZVqaR5STbyOnFsP/I/M+cQmIGrWvsVdR6JT3
         Rf0w==
X-Gm-Message-State: AOJu0YwS/FbrpCmY6Od4euGHqOqIh1guMaUCKD8+a5XEjCu0DAsgYQhM
	RmWaIQzMaH37S5isa+eiNCaC9fhLKgc=
X-Google-Smtp-Source: AGHT+IEYnhQVuC8t+G8/0tv02obLCLiXlbzyqOZvyf+CYHkeNlG2Qmx5KRIb8Zvqtk4gHDqgO5q0XA==
X-Received: by 2002:a81:a006:0:b0:5e6:9e4e:ca79 with SMTP id x6-20020a81a006000000b005e69e4eca79mr2074069ywg.97.1704724924790;
        Mon, 08 Jan 2024 06:42:04 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id g188-20020a0df6c5000000b005e25dc30d2fsm3241233ywf.45.2024.01.08.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:42:04 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v3 1/2] bitbake-layers: Add ability to update the reference of repositories
Date: Mon,  8 Jan 2024 15:38:58 +0100
Message-ID: <20240108143857.2316-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240108143857.2316-2-jermain.horsman@nedap.com>
References: <20240108143857.2316-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193408

From: Jermain Horsman <jermain.horsman@nedap.com>

This uses an existing setup-layers configuration and modifies one
or more repositories using a reference provided by the user.

This is a very minimal implementation, no validation of this reference
is done and it is left to the user to provide a valid value.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 .../bblayers/setupwriters/oe-setup-layers.py  | 71 +++++++++++++++++--
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index bd71ca1f51..a4bd9c8c3d 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -31,16 +31,64 @@ class OeSetupLayersWriter():
         with open(output, 'w') as f:
             json.dump(repos, f, sort_keys=True, indent=4)
 
+    def _read_repo_config(self, json_path):
+        with open(json_path) as f:
+            json_config = json.load(f)
+
+        supported_versions = ["1.0"]
+        if json_config["version"] not in supported_versions:
+            raise Exception("File {} has version {}, which is not in supported versions: {}".format(json_path, json_config["version"], supported_versions))
+
+        return json_config
+
+    def _modify_repo_config(self, json_config, args):
+        sources = json_config['sources']
+        for repo in args.repository:
+            if not repo in sources.keys():
+                raise Exception("Repository {} does not exist in setup-layers config".format(repo))
+
+            layer_remote = json_config['sources'][repo]['git-remote']
+            layer_remote['rev'] = args.reference
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
+            if args.repository is None:
+                logger.error("No repository specified. Please provide one using '--repository REPOSITORY'.")
+                raise Exception("No repository specified. Please provide one using '--repository REPOSITORY'.")
+            if args.reference is None:
+                logger.error("No reference specified. Please provide one using '--reference REFERENCE'.")
+                raise Exception("No reference specified. Please provide one using '--reference REFERENCE'.")
+
+            json = self._read_repo_config(output + ".json")
+            if not 'sources' in json.keys():
+                raise Exception("File {}.json does not contain valid layer sources.".format(output))
+
+        else:
+            # Create new layers setup
+            if args.repository is not None:
+                if args.reference is None:
+                    logger.error("No reference specified. Please provide one using '--reference REFERENCE'.")
+                    raise Exception("No reference specified. Please provide one using '--reference REFERENCE'.")
+            elif args.reference is not None:
+                logger.warning("Reference specified, but no repository, this has no effect.")
+
+            if not os.path.exists(args.destdir):
+                os.makedirs(args.destdir)
+            repos = parent.make_repo_config(args.destdir)
+            json = {"version":"1.0","sources":repos}
+            if not repos:
+                raise Exception("Could not determine layer sources")
+
+        if args.repository is not None:
+            self._modify_repo_config(json, args)
+
         self._write_json(json, output + ".json")
         logger.info('Created {}.json'.format(output))
         if not args.json_only:
@@ -50,3 +98,12 @@ class OeSetupLayersWriter():
     def register_arguments(self, parser):
         parser.add_argument('--json-only', action='store_true',
             help='When using the oe-setup-layers writer, write only the layer configuruation in json format. Otherwise, also a copy of scripts/oe-setup-layers (from oe-core or poky) is provided, which is a self contained python script that fetches all the needed layers and sets them to correct revisions using the data from the json.')
+
+        parser.add_argument('--update', '-u',
+            action='store_true',
+            help='Updates an existing layers setup.')
+        parser.add_argument('--repository', '-p',
+            action='append',
+            help='Repository to customize, this requires a reference to be specified.\nThis option can be used multiple times.')
+        parser.add_argument('--reference', '-r',
+            help="Reference to use when updating repositories.\nThe value can be any git reference, however it is up to the user to provide a valid value.\nThis option is only useful when using '--update'.")
-- 
2.42.0.windows.2


