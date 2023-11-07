Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8322C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:27:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.13762.1699370871546965525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6wBbjwy;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a6190af24aso891705366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370870; x=1699975670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFvbbG1puZVRW/plYLyDK792tCE0Y7pCAM6JPh/jJiY=;
        b=K6wBbjwyFbIypSKsRFI6r1YAZgSUolEsv/TyW48DNeWo/BQu27eh+qt908iOjiEdGj
         eTq40eBTWo2itGRbaIxbv1kzdm2i4vsicbAok60vykxe9qWz5ivwjjLnOZToj8j8S+Di
         PpVNBB2V8SF6uWc0eO1kt7qzMIkNw9pJ3BtVOLhdIlb3LrkWl/wBEBklAxnVBctYCF0+
         XeBX7dZnW+S80UTnjnt39vh9Qv+WBlmu80P4hFuuVS/IqP9OkW2LROC656T3imHJUQvu
         HoLxUQZg5QA6mqtefNNcAKZRL7cOY1nJhnKo1doTRkkl0jQqYm2eJVUzO8qy+ZN/dVJQ
         ntXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370870; x=1699975670;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFvbbG1puZVRW/plYLyDK792tCE0Y7pCAM6JPh/jJiY=;
        b=uF6gt8SUdLxfZCXIM2f5LSF03Aghm6x+uitlFsto5EwsNP1YtLRV3Sh+fkt53MwKrM
         AILZ7+YcES7cNI1/cuo4tV/6OAANb+KY5ZfJibpP9D6M+2j9xuGUtwScvYb54OE1S0XZ
         onXLPWT3jP+9VIzhDgZwTvQvSW3WhsMgjOO2nfiYt3+mUrunwYWWk6l0Vel2M3KALfk2
         b0fToG/NdKV/HtaKNW8be0cDpVBOA4KLRl/CKKjwQ3DEU2uzn9xptSkEtAAO4//6YGn6
         xWQcr8w8rOopXdTP7W0174in/f7dhdv/0YdxAIWGY7rmsdjWSPd63hYK+IZRl9frrAC5
         YH0w==
X-Gm-Message-State: AOJu0YxhF73RWqGiHRcJESbvYfc8Xvr0GwGwCslnrETsqLpVP+b06UwG
	G1agBT1Z0rIT2o5mMaT7B1myPhHMhgg=
X-Google-Smtp-Source: AGHT+IFutcOM7dX8FNYZeIHLwg0W7Pou5SVxud+2BWScjQA1vqx/vhKa/rw8837Q2DPgznd3iE1qfQ==
X-Received: by 2002:a17:906:fd89:b0:9ce:24d0:8a01 with SMTP id xa9-20020a170906fd8900b009ce24d08a01mr16919403ejb.60.1699370870036;
        Tue, 07 Nov 2023 07:27:50 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:49 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 3/7] bitbake-layers: Add ability to update layer repository configuration
Date: Tue,  7 Nov 2023 16:26:38 +0100
Message-ID: <20231107152641.1043-5-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190293

From: Jermain Horsman <jermain.horsman@nedap.com>

This allows for modifications of an existing configuration file
using current revisions.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/bblayers/updatesetup.py | 78 ++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 meta/lib/bblayers/updatesetup.py

diff --git a/meta/lib/bblayers/updatesetup.py b/meta/lib/bblayers/updatesetup.py
new file mode 100644
index 0000000000..1f8760f2d3
--- /dev/null
+++ b/meta/lib/bblayers/updatesetup.py
@@ -0,0 +1,78 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import json
+import logging
+import os
+import sys
+
+from bblayers.common import LayerPlugin
+
+logger = logging.getLogger('bitbake-layers')
+
+sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
+
+import oe.buildcfg
+
+def plugin_init(plugins):
+    return UpdateSetupPlugin()
+
+class UpdateSetupPlugin(LayerPlugin):
+
+    def get_repo_path(self, args):
+        layers = (self.tinfoil.config_data.getVar("BBLAYERS") or "").split()
+        for layer in layers:
+            if os.path.basename(layer) == 'workspace':
+                continue
+
+            repo_path = oe.buildcfg.get_metadata_git_toplevel(layer)
+            if os.path.basename(repo_path) != args.repo:
+                continue
+
+            return repo_path
+
+    def do_update_setup(self, args):
+        """ Modify an existing configuration file using current revisions. """
+        with open(args.json, "r+") as json_file:
+            setup_layers_json = json.load(json_file)
+            if not 'sources' in setup_layers_json.keys():
+                logger.error("File does not contain valid setup-layers config")
+                return
+
+            sources = setup_layers_json['sources']
+            if not args.repo in sources.keys():
+                logger.error("Repository {} does not exist in setup-layers config".format(args.repo))
+                return
+
+            repo = self.get_repo_path(args)
+
+            branch = oe.buildcfg.get_metadata_git_branch(repo)
+
+            if args.branch:
+                rev = ''
+                describe = ''
+            else:
+                rev = oe.buildcfg.get_metadata_git_revision(repo)
+                describe = oe.buildcfg.get_metadata_git_describe(repo)
+
+            layer_remote = setup_layers_json['sources'][args.repo]['git-remote']
+            layer_remote['branch'] = branch
+            layer_remote['rev'] = rev
+            layer_remote['describe'] = describe
+
+            json_file.seek(0)
+            json_file.truncate()
+            json.dump(setup_layers_json, json_file, sort_keys=True, indent=4)
+
+    def register_commands(self, sp):
+        parser_update_layers = self.add_command(sp, 'update-layers-setup', self.do_update_setup, parserecipes=False)
+        parser_update_layers.add_argument('json',
+            help='File location of the setup-layers json config.')
+        parser_update_layers.add_argument('repo',
+            help='Name of the repository to be updated.')
+        parser_update_layers.add_argument('--branch', '-b',
+            help='store branch',
+            action='store_true')
-- 
2.42.0.windows.2


