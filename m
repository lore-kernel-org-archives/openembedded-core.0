Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2BC9731AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979107"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:08 +1300
Message-Id: <92f1b8e538a70ac3f775c7da39d9e92d0ddb3ea8.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 15/26] scripts/lib/argparse_oe: handle intermixing of optional positional arguments
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:54 -0000

Python's argparse module can't handle when several optional positional
arguments (set with nargs='?') are intermixed with other options. If the
positional arguments aren't optional then this isn't an issue; thus when
changing positional arguments to optional (as we are doing with devtool)
we need this workaround.

This is a pretty horrible hack, but we don't want this flexibility of
ordering to disappear simply because we made some arguments optional.
Unfortunately the corresponding bug remains unresolved upstream even in
Python 3, and argparse is not really designed to be subclassed so it
doesn't make things like this easy.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/argparse_oe.py | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index c2fee6d..ec7eb8d 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -9,3 +9,42 @@ class ArgumentParser(argparse.ArgumentParser):
         self.print_help()
         sys.exit(2)
 
+    def add_subparsers(self, *args, **kwargs):
+        ret = super(ArgumentParser, self).add_subparsers(*args, **kwargs)
+        ret._parser_class = ArgumentSubParser
+        return ret
+
+class ArgumentSubParser(ArgumentParser):
+    def parse_known_args(self, args=None, namespace=None):
+        # This works around argparse not handling optional positional arguments being
+        # intermixed with other options. A pretty horrible hack, but we're not left
+        # with much choice given that the bug in argparse exists and it's difficult
+        # to subclass.
+        # Borrowed from http://stackoverflow.com/questions/20165843/argparse-how-to-handle-variable-number-of-arguments-nargs
+        # with an extra workaround (in format_help() below) for the positional
+        # arguments disappearing from the --help output, as well as structural tweaks.
+        # Originally simplified from http://bugs.python.org/file30204/test_intermixed.py
+        positionals = self._get_positional_actions()
+        for action in positionals:
+            # deactivate positionals
+            action.save_nargs = action.nargs
+            action.nargs = 0
+
+        namespace, remaining_args = super(ArgumentSubParser, self).parse_known_args(args, namespace)
+        for action in positionals:
+            # remove the empty positional values from namespace
+            if hasattr(namespace, action.dest):
+                delattr(namespace, action.dest)
+        for action in positionals:
+            action.nargs = action.save_nargs
+        # parse positionals
+        namespace, extras = super(ArgumentSubParser, self).parse_known_args(remaining_args, namespace)
+        return namespace, extras
+
+    def format_help(self):
+        # Quick, restore the positionals!
+        positionals = self._get_positional_actions()
+        for action in positionals:
+            if hasattr(action, 'save_nargs'):
+                action.nargs = action.save_nargs
+        return super(ArgumentParser, self).format_help()
-- 
2.5.0


