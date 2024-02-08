Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEF6C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:56:27 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.18102.1707400584167441036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GNs7+ZF4;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7c029beb8efso19758739f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707400583; x=1708005383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/6+U6f5QEo93nNE0qYTVg9EYO2YNWpW/MVY2uq0xOw=;
        b=GNs7+ZF42uT54dC5U2FHV0nUbtBi3+lGI4JF2G24tTK7OetCCVZl3XwhuUDCx0iehs
         vdbzS/dT+gCM/SqCdbvNvt8Z4BA1KPuK3VJoElTom6PaInVs3Wn2MazJy4VJHerWRB03
         8W6Xh8sdlpCqENQpZwm0VpfKhqyhltVJAS3mf3t8hySHdQmJVeUP3YdiPUzOm46BwsD0
         gv7DmQLae7Qqp1SVGHO0frcJM9IyeDZynpWBXFeb7EiuZ/0lIbCbfrs4U8J8dFp0jx4S
         +WxwdMzgexDcimMGc9/VtY+oZt/fI6FnMVXSw3Krrr1kzIhcsfSuzdsyw+1Gob8g7ZpY
         0FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400583; x=1708005383;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/6+U6f5QEo93nNE0qYTVg9EYO2YNWpW/MVY2uq0xOw=;
        b=cMQIKMWzTGS+Ut0eGyfnQ4GvF3yxZXgCWyVu+STWIFZZ/TihHy5jjW/6EFjDSKlg6T
         8J7bMCj6LKZGYEVbKslxvCzgYL3cEmW/udYOpxJTLf/5JlDATy66zbuzfHFa9lFq6zdu
         IIBoXIvxQ1kS4N3bKj7jm9+N1VRT0vBouI797RC5Rlshjd7usKNQ3CTZ4t3dxY6TyhQt
         Zm0lN1IgrSd/bsA6itlS0Wgny78CyNagkEYK5vRTL9q4/+YQNii8GsJPeGCSienp5Ql/
         Pah22ksOkQ3qAFn1rgrg+ne/DOeklphvaoFVZ342UttfxMjsnP5vII0p01DxOSmwV8bk
         yp5Q==
X-Gm-Message-State: AOJu0YzZrMpCDNdjLbh4JvMu+XHUB2cQUD8DFu3zAV5dEsboFp2vzohA
	NbTHo5v2k2VCZWkDyT1KkMcQjWi0H/Szk8wcyGlVjMGnu2T26VeK/gsZoj8I
X-Google-Smtp-Source: AGHT+IFaToypFNaautkhwRondUztpXFlzbLdWwimQd0BbLkVE8izWme1nzmVFqYxoEbN2nElWfPrUw==
X-Received: by 2002:a6b:7a0b:0:b0:7c3:f413:cb56 with SMTP id h11-20020a6b7a0b000000b007c3f413cb56mr2022612iom.8.1707400583388;
        Thu, 08 Feb 2024 05:56:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+xAOlNvVxiOKP1D4+GZv3ShS6kijQi5ZRvq0Vv2XEdNLet/yKE7XJcjKSty8rD6/YbfX08kdS6kyDnTA8EZERU/czx9/0WzcI+xpxLg==
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id m8-20020a02c888000000b004713ba1b284sm890412jao.44.2024.02.08.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:56:22 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/2] bitbake-layers: Add ability to update the reference of repositories
Date: Thu,  8 Feb 2024 14:50:28 +0100
Message-ID: <20240208135028.893-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 13:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195155

From: Jermain Horsman <jermain.horsman@nedap.com>

This creates a new layers setup with, or, modifies an existing layers
setup using, one or more repositories where the references are provided
by the user.

This is a very minimal implementation, no validation of any reference
is done and it is left to the user to provide a valid value.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---


Changes in v2:
- Rebased on abelloni/master-next as per requested

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>



 .../bblayers/setupwriters/oe-setup-layers.py  | 79 +++++++++++++++++--
 1 file changed, 72 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index bd71ca1f51c..59ca968ff33 100644
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


