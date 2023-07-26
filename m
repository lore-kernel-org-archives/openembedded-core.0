Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2853C001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 11:10:09 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.8471.1690369799122555197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 04:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=I9cbcJQz;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36QB9t0W485367
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 13:09:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1690369796;
	bh=tXdQ3Lw3if3eAj7Utiz7YjRGCf4xuTI9uO2u1+V+8XM=; l=3177;
	h=From:To:Cc:Subject:Date;
	b=I9cbcJQzQXcpYjVjYcWTn+zjPyDzwA2wVcuJBoYZaMc2rEC4kMQ/+Os9nq05J99QG
	 f97QM6tdH4kLza4jbSNa+bLBRpjbDhKBAOXqNtGzcFIr7gjiI0MNcxighYmYkLQel3
	 eqiSC5tkRj1hBol2Hh084ieEy1KwoJrlHOVm7X+VHpeKyPnycf+7GZOtz0Lp7ERVkS
	 p6dNh3J4fNL9A/K9dqCM0gO0+nDK+UkEGL9Y1PP5ssb9jEHEzPdij+zpqCcL6dSwl6
	 iGJB1X77T5gBTGtIWQ4UdwHgaxTFeLM3KPn0B2Mrqg8/tc10EtXTweOGeqDlMiUNLh
	 bKOjNUrOGzz7A==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 36QB9rfU1119920
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 26 Jul 2023 13:09:53 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id CEWO4KXM89; Wed, 26 Jul 2023 13:09:52 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de ([192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36QB9qwM485143
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 26 Jul 2023 13:09:52 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qOcOu-000Xny-1G;
	Wed, 26 Jul 2023 13:09:52 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] oe.data: allow to mask out secret variables
Date: Wed, 26 Jul 2023 13:09:46 +0200
Message-ID: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64c0ff00a75c1ce670d19be4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 11:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184876

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Some integrations require that passwords or secret tokens are
assigned to bitbake variables.  E.g. the meta-dependencytrack
layer has a 'DEPENDENCYTRACK_API_KEY' or my sstate-server requires
a 'SSTATE_SERVER_SESSION' token.

These secrets will appear in testdata.json which can easily leak them
when the deploy directory is published publicly.

Patch adds a special 'secrets' flag for variables.  When a variable is
marked with it, its content will be replaced by '**masked**'.

E.g. formerly

|    "SSTATE_SERVER_PATH": "HKBOZ8C279S4iwBA",
|    "SSTATE_MIRRORS": "    ... https://sstate..../api/v1/download/HKBOZ8C279S4iwBA/sstate/...

and now

|    "SSTATE_SERVER_PATH": "**masked**",
|    "SSTATE_MIRRORS": "    ... https://sstate..../api/v1/download/**masked**/sstate

Corresponding bbclass contains

| SSTATE_SERVER_PATH ??= "-"
| SSTATE_SERVER_PATH[secret] = "true"

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/lib/oe/data.py | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 37121cfad2b7..57a8e5b5e049 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -5,7 +5,9 @@
 #
 
 import json
+import re
 import oe.maketype
+import oe.types
 
 def typed_value(key, d):
     """Construct a value for the specified metadata variable, using its flags
@@ -23,9 +25,10 @@ def typed_value(key, d):
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
 
-def export2json(d, json_file, expand=True, searchString="",replaceString=""):
+def export2json(d, json_file, expand=True, searchString="",replaceString="", mask_secrets=True):
     data2export = {}
     keys2export = []
+    secrets = []
 
     for key in d.keys():
         if key.startswith("_"):
@@ -38,12 +41,34 @@ def export2json(d, json_file, expand=True, searchString="",replaceString=""):
             continue
         elif d.getVarFlag(key, "func"):
             continue
+        elif mask_secrets and oe.types.boolean(d.getVarFlag(key, "secret") or "false"):
+            var = d.getVar(key)
+
+            ## When secret variable contains a placeholder (is empty
+            ## or single character), show it.  When it is too short
+            ## emit a warning and exclude it completely from output
+            ## but do not mask out its value in other places.
+            if var is None or len(var) < 2:
+                bb.debug(1, "variable '%s' is marked as secret but seems to contain some placeholder; showing it" % key)
+            elif len(var) < 8:
+                bb.warn("variable '%s' is marked as secret but content is too short; skipping it" % key)
+                continue
+            else:
+                secrets.append(re.escape(var))
 
         keys2export.append(key)
 
+    if len(secrets) == 0:
+        secrets = None
+    else:
+        secrets = re.compile('|'.join(secrets))
+
     for key in keys2export:
         try:
-            data2export[key] = d.getVar(key, expand).replace(searchString,replaceString)
+            var = d.getVar(key, expand).replace(searchString,replaceString)
+            if secrets:
+                var = secrets.sub("**masked**", var)
+            data2export[key] = var
         except bb.data_smart.ExpansionError:
             data2export[key] = ''
         except AttributeError:
-- 
2.41.0


