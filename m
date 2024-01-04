Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E02C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 12:35:52 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.52896.1704371747416334148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 04:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Piz1FazH;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jhatnedap@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b9f727d94cso255111b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 04:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704371746; x=1704976546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ScJG4WObXJZd+TUXnBOfXow32P8urGSxsyd6VTydXA4=;
        b=Piz1FazHHLlzmE49S9xOUc9EV1Q7yOvD//nQHfplVhHb5RfcXKOm554jDLQJxBredN
         3sDRkpl7DhHtjHgRHuD8M3zDYvGibJjEV9XouFdC1SY71uWbygvhSJN/v8JRjPPVun3g
         y2BAPlBJjnMDMaWoGMDPxgzBu2o6OVgxWAEonnq+dAV3BgynrQ6W0kLNT+IrvK0KQ2hv
         B7NT2NiPDMIvlE2qugQud+Bnb/yD8dQc47Yv6bTS9I22PRN+juIrW/R6zvxvG4hhXkEt
         UTGP0sMbav7esvAcj8YjbpSDWFA46+NnqhYd/Ph4GWP3XwwFX5IZpwUDKtrT59Qc+L38
         YE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371747; x=1704976547;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScJG4WObXJZd+TUXnBOfXow32P8urGSxsyd6VTydXA4=;
        b=arlnuz3eKo+jXCQK4EZhGuQW9juj3fnA1WmvS85aQlapG8aXvOdPH6R6SAs3OWnKAr
         VJjrJ/LcTP+eA+bts/iVRIFvq8FfDBpITnLzVDFca9ezwIbJd122mZH7SdpSuQsPouG6
         Tm7envjfUjk6QDxfbq3kQkR4tIM7fLWzxB9OiZvPZixbN4DHdUUNZmfxlkk+HZX/r6Jc
         U11LWs/yM/6UlYfpl/oZV0OKOM92XGjskEDC/REaCLm1P7D2zNeJ58C2z2DQe0BITUbs
         5InXZn0Up361T4jopZcjDdQd+yRr2YMspoLq+28FgocMVtaVBGg5/9DClf6SpyslBgxi
         hjrg==
X-Gm-Message-State: AOJu0YwnUxS+dK9SILm1I4rdqtoAe2f8R9Pfhflb9Ywrpnkak9CQlE0z
	dN/SHLQvu2RmhZmDLcGR3H/LthUV4DE=
X-Google-Smtp-Source: AGHT+IGqYyFlytni8SnEIBMehCmE3pDKp5iKke0bCKuR8VaDLyMF8GXp948F8xF0FOjIluEXG5EP0w==
X-Received: by 2002:a05:6359:28cb:b0:175:5b44:755f with SMTP id qb11-20020a05635928cb00b001755b44755fmr258935rwb.42.1704371746546;
        Thu, 04 Jan 2024 04:35:46 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id i11-20020a05622a08cb00b004281ce041f6sm4516537qte.21.2024.01.04.04.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:35:46 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v2 1/2] bitbake-layers: Add ability to update the reference of repositories
Date: Thu,  4 Jan 2024 13:33:17 +0100
Message-ID: <20240104123420.932-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240104123420.932-2-jermain.horsman@nedap.com>
References: <20240104123420.932-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 12:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193317

From: Jermain Horsman <jermain.horsman@nedap.com>

This uses an existing setup-layers configuration and modifies one
or more repositories using a reference provided by the user.

This is a very minimal implementation, no validation of this reference
is done and it is left to the user to provide a valid value.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/bblayers/makesetup.py                | 11 +++++
 .../bblayers/setupwriters/oe-setup-layers.py  | 43 ++++++++++++++++---
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 99d5973760..df266c645d 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -78,6 +78,10 @@ class MakeSetupPlugin(LayerPlugin):
 
     def do_make_setup(self, args):
         """ Writes out a configuration file and/or a script that replicate the directory structure and revisions of the layers in a current build. """
+        if args.update is not None and args.reference is None:
+            logger.error("No reference specified. Please provide one using '--reference REFERENCE'.")
+            return
+
         for p in self.plugins:
             if str(p) == args.writer:
                 p.do_write(self, args)
@@ -89,6 +93,13 @@ class MakeSetupPlugin(LayerPlugin):
         parser_setup_layers.add_argument('--output-prefix', '-o',
             help='File name prefix for the output files, if the default (setup-layers) is undesirable.')
 
+        parser_setup_layers.add_argument('--update', '-u',
+            action='append',
+            metavar='REPOSITORY',
+            help='Repository to update, this requires a reference to be specified.\nThis option can be used multiple times.')
+        parser_setup_layers.add_argument('--reference', '-r',
+            help="Reference to use when updating repositories.\nThe value can be any git reference, however it is up to the user to provide a valid value.\nThis option is only useful when using '--update'.")
+
         self.plugins = []
 
         for path in (self.tinfoil.config_data.getVar('BBPATH').split(':')):
diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index bd71ca1f51..fdc33d94d5 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -31,16 +31,45 @@ class OeSetupLayersWriter():
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
+        for repo in args.update:
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
+        if args.update is None:
+            if not os.path.exists(args.destdir):
+                os.makedirs(args.destdir)
+            repos = parent.make_repo_config(args.destdir)
+            json = {"version":"1.0","sources":repos}
+            if not repos:
+                raise Exception("Could not determine layer sources")
+        else:
+            json = self._read_repo_config(output + ".json")
+            if not 'sources' in json.keys():
+                raise Exception("File {}.json does not contain valid layer sources.".format(output))
+            self._modify_repo_config(json, args)
+
         self._write_json(json, output + ".json")
         logger.info('Created {}.json'.format(output))
         if not args.json_only:
-- 
2.42.0.windows.2


