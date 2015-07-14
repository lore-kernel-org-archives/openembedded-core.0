Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 409B075EA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:23 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so7999998pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CinYfwF97uhzrh9jQ3LjoxIXSvl3pVBggyzN8pLCCJ0=;
	b=HWrCsqLSlmUBBN/EvFwai5/hSKT3rD3KgR6gpsiOfQT7oUSPZ9rJ+UqlZWn3zZf8fx
	hfzGAQOsCIoKB0aCZxB9P4MwT7RcTaMXSo0ow4BY/i/c5garM1XGrJOv9ptod/wIhnlC
	Y2oEb6QpBE/oif66PvBd+fOrDRTiCNCli+OxVaBoXxq04PKfp0Ue73zd1u4Ink/upKOM
	1d/sJqyl58dW7ur+sCFyt9/qIXRyjDmQfCv0A/oW9VJUslXSTsDwRee9FWlRP1NXh1Xe
	2zNa2azl9dPZG/30VNqFc8/5vGDzHZGyz8qSOr/sDiTp7ds2zm4SqRT46EVsZdBFjrPM
	AFBw==
X-Received: by 10.70.37.144 with SMTP id y16mr81466760pdj.86.1436889443665;
	Tue, 14 Jul 2015 08:57:23 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id k5sm1781519pdb.53.2015.07.14.08.57.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:22 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:39 -0700
Message-Id: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] recipetool: catch BBHandledException from parsing
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:24 -0000

This ensures that we don't see a traceback on parsing failures.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/recipetool | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index c68bef4..3063cf7 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -82,9 +82,11 @@ def main():
 
     scriptutils.logger_setup_color(logger, args.color)
 
-    tinfoil_init(getattr(args, 'parserecipes', False))
-
-    ret = args.func(args)
+    try:
+        tinfoil_init(getattr(args, 'parserecipes', False))
+        ret = args.func(args)
+    except bb.BBHandledException:
+        ret = 1
 
     return ret
 
-- 
2.2.1


