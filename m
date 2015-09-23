Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3507576903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:21:46 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so251227129wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=roZHyLneYybTkE198+cENn32WLIDR06LLEObBfhxl5g=;
	b=Qui3gZW6k9/U6DZ++SCioEyJbpPySgVfnsG/3LJfszg02Kai+orJcUbDqTgit/CXeq
	j6CLRAPrnvM5+/7c2IN1KT2OXatQxZQDyvRMkIuNCidaLKGeL9D+LLYmUL13PWPmAF6x
	6QNFXCxNZbhO4y0cFP62eWFTrZpN/fGcATVv83s4XaBbC/TWt3rBrVRIiVgv/9hYPBs+
	y+T2exFK3f1TgidNgFOtDJuf6+V4Ortw3sfenADLOQw/iLnMbtJ/l/fz6X+soHwVn0Ox
	QwY1u720UZmavWVA88hbTkhX94WuCaLJyhKnHPLikt/yMOAYdIpA2GC9ujRFSAJtfLq+
	CqJA==
X-Received: by 10.180.109.135 with SMTP id hs7mr5739769wib.12.1443032506608;
	Wed, 23 Sep 2015 11:21:46 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id h8sm9775279wib.21.2015.09.23.11.21.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 11:21:45 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:24:17 -0700
Message-Id: <232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1443032533.git.chris_larson@mentor.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] oe.scriptutils: enable color in a more flexible way
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Sep 2015 18:21:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

Rather than recreating handlers and forcing them, iterate over the handlers
and enable color on ones we can handle. This makes it easier to handle color
properly when we introduce the bb.msg default log filters.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/scriptutils.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 3366882..3c165eb 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -30,12 +30,12 @@ def logger_create(name):
 
 def logger_setup_color(logger, color='auto'):
     from bb.msg import BBLogFormatter
-    console = logging.StreamHandler(sys.stdout)
-    formatter = BBLogFormatter("%(levelname)s: %(message)s")
-    console.setFormatter(formatter)
-    logger.handlers = [console]
-    if color == 'always' or (color=='auto' and console.stream.isatty()):
-        formatter.enable_color()
+
+    for handler in logger.handlers:
+        if (isinstance(handler, logging.StreamHandler) and
+            isinstance(handler.formatter, BBLogFormatter)):
+            if color == 'always' or (color == 'auto' and handler.stream.isatty()):
+                handler.formatter.enable_color()
 
 
 def load_plugins(logger, plugins, pluginpath):
@@ -59,6 +59,7 @@ def load_plugins(logger, plugins, pluginpath):
                 plugin.plugin_init(plugins)
             plugins.append(plugin)
 
+
 def git_convert_standalone_clone(repodir):
     """If specified directory is a git repository, ensure it's a standalone clone"""
     import bb.process
@@ -70,6 +71,7 @@ def git_convert_standalone_clone(repodir):
             bb.process.run('git repack -a', cwd=repodir)
             os.remove(alternatesfile)
 
+
 def fetch_uri(d, uri, destdir, srcrev=None):
     """Fetch a URI to a local directory"""
     import bb.data
-- 
2.2.1


