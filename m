Return-Path: <kergoth@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 227197C876
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:36:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w6so7181162wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UiHwnU4yd573oTzVrDPFK3n0ZE5C8O09i0WDkag11I8=;
	b=rGUzIidmoDLYhRrXx/ZerTibmc6xz9kEmnen4RsksUyGEGbsO/jD4/d2bpv53AL/8I
	8oyJR3fg9oKJsPEQVqDe0Tzt07n/c1QLkBZT8YL6WUqtSS539D6Ouwj3Epc6wTfey+Ic
	qx0x54esr4qu63Afp2Cl2Y9wNXZ7Yj9K3kwybwGoWVt/eKdyQoc2QwS/oHw0XGC/IwCA
	Pp80CdTWrGROBjSWE2+/i6ms21a4IKKi6vEfSbzrwBs/+77tdgxa+KsTh/IyvV0dCDbM
	TmKRgJNAJQNqkWkTaWQexEXP15FKCGoFXP0OXBO+asAPG1FQkJjXZ/PcQbUlOTJAXAwP
	enDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UiHwnU4yd573oTzVrDPFK3n0ZE5C8O09i0WDkag11I8=;
	b=RcVzq02gZQv0aZFjDu2LR/x1nP3dnz1dth4F4LUBScJfZypGgSyc0uKXhsblhX0eal
	+8pmBSj1q+/BJ/yyFtPV6ORrmoqNLYxXG8flzuQjwUQDBQETiEI/o3Q+qiXR6FGOeW5n
	FE01HcrJKkdo2h3cFWTX9huTNw/92eXiZEREvB3aSyTpv6Ak1vqrshCDPTsBvKv/ZMpt
	9scPB8a4t8U40sMQTkFdPw2bybg4OKXceJnBZEneAFvjgkZk3iCNR058fY3PHSihabFF
	RFqv1qY/LcTT/l4DKuCx3EeqBscBj9eD8mvIM70O3CE/cD+g7C5KxbDR8KyG1LBOqORp
	zIZQ==
X-Gm-Message-State: APjAAAWNeasgcIhD1SGqab5OqrtwTuszNo1RZre8bweZxHpRe1UGQ7Fl
	d3ZkHRzzSGUyK8EdXseyQsSeSkQu04M=
X-Google-Smtp-Source: APXvYqwU0rQ+DnGzSjHnC3E5HLWKaT9GBvX044aymQ5YcvHImR2OQgN67DXPgyu3pJWlSl3/kzoPnQ==
X-Received: by 2002:adf:ba12:: with SMTP id o18mr15047543wrg.326.1551735391537;
	Mon, 04 Mar 2019 13:36:31 -0800 (PST)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
	[139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x6sm11819411wmg.0.2019.03.04.13.36.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:36:30 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:36:23 +0000
Message-Id: <dfce484de2ad4c2753e162e5bc11c7cf353275bc.1551735224.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1551735224.git.chris_larson@mentor.com>
References: <cover.1551735224.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] oe.scriptutils: enable color in a more flexible way
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
X-List-Received-Date: Mon, 04 Mar 2019 21:36:31 -0000
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

Rather than recreating handlers and forcing them, iterate over the handlers
and enable color on ones we can handle. This makes it easier to handle color
properly when we introduce the bb.msg default log filters.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/scriptutils.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 3c60c3a1e6..0633c7066e 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -39,12 +39,12 @@ def logger_create(name, stream=None):
 
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
@@ -69,6 +69,7 @@ def load_plugins(logger, plugins, pluginpath):
                 plugin.plugin_init(plugins)
             plugins.append(plugin)
 
+
 def git_convert_standalone_clone(repodir):
     """If specified directory is a git repository, ensure it's a standalone clone"""
     import bb.process
-- 
2.20.1


