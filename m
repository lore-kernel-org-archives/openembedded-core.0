Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 213DC76536
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 12:10:51 +0000 (UTC)
Received: by wijq8 with SMTP id q8so54774376wij.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 05:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=D5kbNenGwo+TK9V4o1pjx7Kch10446KqsWVVJ1G0Do0=;
	b=Hk9qG4oFNYhCwRX4+zP6/SygSiWwzSOlDqeK7AsQ+deeKEdY8sSEM6M2KH2pVpfWtl
	ctB9WKMRkQYHTc9yH6w5/mkSeLSI/dUm+cYx/e5kx/o/nypLn68qE1XUBdTPE/CjgJct
	qQHDdP8yvAjiIUI4K8jQOfWWMGI5TnCXgCIwmjVEIwC9PtEiJL/VJQ8PZmhjZx1vlEu9
	O/qLUkCv/xYGHvPZs7xRVLVMtgODDgjXVM8tscoJMmqMQeVz8UxiwBQeiZAIttpvoh4C
	LUdO7N+UX2wePY33wOiW8drsrI9Z3ArqR32OURdLYdtO+ESf0/yTKClC25L2r/LPpm3g
	/Mfg==
X-Gm-Message-State: ALoCoQl94nkA6CJBBiyIqUQanBiveVxPktUXEgSckAqtIi++VnewomnJac6KrskvW+dP/2pvKlXt
X-Received: by 10.194.249.100 with SMTP id yt4mr35490036wjc.74.1444651850963; 
	Mon, 12 Oct 2015 05:10:50 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	12sm19503557wjw.15.2015.10.12.05.10.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Oct 2015 05:10:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 13:03:24 +0100
Message-Id: <1444651405-11188-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] devtool: add new command for selftest
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
X-List-Received-Date: Mon, 12 Oct 2015 12:10:52 -0000

In selftest we want to exercise devtool's ability to use plugins from other
layers, so add a basic command to reverse a string to meta-selftest.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/lib/devtool/__init__.py |  0
 meta-selftest/lib/devtool/test.py     | 15 +++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-selftest/lib/devtool/__init__.py
 create mode 100644 meta-selftest/lib/devtool/test.py

diff --git a/meta-selftest/lib/devtool/__init__.py b/meta-selftest/lib/devtool/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta-selftest/lib/devtool/test.py b/meta-selftest/lib/devtool/test.py
new file mode 100644
index 0000000..106c322
--- /dev/null
+++ b/meta-selftest/lib/devtool/test.py
@@ -0,0 +1,15 @@
+import argparse
+
+def plugin_init(pluginlist):
+    """Plugin initialization"""
+    pass
+
+def selftest_reverse(args, config, basepath, workspace):
+    """Reverse the value passed to verify the plugin is executing."""
+    print args.value[::-1]
+
+def register_commands(subparsers, context):
+    parser_build = subparsers.add_parser('selftest-reverse', help='Reverse value (for selftest)',
+                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_build.add_argument('value', help='Value to reverse')
+    parser_build.set_defaults(func=selftest_reverse)
-- 
2.1.4


