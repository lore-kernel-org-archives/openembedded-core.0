Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 59B7876903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:21:48 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so251228382wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Vr01OgfHjvTfDZ30S7XgGpLXnONJFbXbxAoysSwgFqk=;
	b=GxPpK/evMrliM6B2NFVhIQ9g5EDq2P9cgU8ijnd031j8Q9XcCCjXmQ6Cn6IwUrI9IJ
	kuVsvz4wQLD/9GJgBPVGucHKtZ9JtsumkWXJYg2DldSARi2NpCLRALYLlc7Gy86SSaFM
	k3DourX+e5oTt+bzZxuwT3TO3RDTTt3jPg4qsKyZ6Qr0I7tkOo3vnOYurS6z1888X4BP
	ZReuFbDXLhdIl7WuBlUt+D0Gn9FkgLCgPQ+10ctEHjmPkJZKQ8/RxFqJ+zVnXuLXdFSu
	wl/7n129FFnTjQPLO6sOmc8xqSMh7OeAVMIG0OL2XgRPL0yYU76WwoC7SULLwrN+akwx
	QWdg==
X-Received: by 10.180.208.2 with SMTP id ma2mr5150916wic.44.1443032508870;
	Wed, 23 Sep 2015 11:21:48 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id h8sm9775279wib.21.2015.09.23.11.21.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 11:21:47 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:24:18 -0700
Message-Id: <6a7666e83c44ac56a09aec5619e44379d167972f.1443032533.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
References: <232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
In-Reply-To: <cover.1443032533.git.chris_larson@mentor.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] oe.scriptutils: add logger_setup_filters
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
X-List-Received-Date: Wed, 23 Sep 2015 18:21:50 -0000

From: Christopher Larson <chris_larson@mentor.com>

This function sets up the default bb.msg formatter and log filters, which by
default sends ERROR messages to stderr rather than stdout.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/scriptutils.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 3c165eb..db0394a 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -20,6 +20,7 @@ import os
 import logging
 import glob
 
+
 def logger_create(name):
     logger = logging.getLogger(name)
     loggerhandler = logging.StreamHandler()
@@ -28,6 +29,20 @@ def logger_create(name):
     logger.setLevel(logging.INFO)
     return logger
 
+
+def logger_setup_filters(logger):
+    import bb.msg
+
+    console = logging.StreamHandler(sys.stdout)
+    errconsole = logging.StreamHandler(sys.stderr)
+    bb.msg.addDefaultlogFilter(console, bb.msg.BBLogFilterStdOut)
+    bb.msg.addDefaultlogFilter(errconsole, bb.msg.BBLogFilterStdErr)
+    format_str = "%(levelname)s: %(message)s"
+    console.setFormatter(bb.msg.BBLogFormatter(format_str))
+    errconsole.setFormatter(bb.msg.BBLogFormatter(format_str))
+    logger.handlers = [console, errconsole]
+
+
 def logger_setup_color(logger, color='auto'):
     from bb.msg import BBLogFormatter
 
-- 
2.2.1


