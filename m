Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8971E7E470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 18:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 528DA18343
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:59 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2CPKZaYX0De8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5F0E7185DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 498D21A07C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E1B31A077
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 323B6186C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x4NIgwZE015047
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x4NIgw5k015046
	for openembedded-core@lists.openembedded.org;
	Thu, 23 May 2019 20:42:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 20:42:54 +0200
Message-Id: <20190523184254.14995-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523184254.14995-1-pkj@axis.com>
References: <20190523184254.14995-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] texinfo-dummy-native: Rewrite template.py to use argparse
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
X-List-Received-Date: Thu, 23 May 2019 18:42:59 -0000
Content-Transfer-Encoding: 8bit

The original version of template.py parses the arguments manually. This
fails when looking for the -E option if, e.g., an -I option is specified
without any space before its argument, and that argument contains the
letter 'E'.

A minor difference to the original version is that it parsed the
arguments in the order they were specified on the command line whereas
this version will always handle -E before -o.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../texinfo-dummy/template.py                 | 55 ++++++-------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
index fcc28548af..86c7c1811a 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
@@ -28,10 +28,8 @@
 # of the executable from argv[0] and emulate the corresponding program, so
 # multiple copies of this script will exist under different names.
 
-import sys, os
+import sys, os, argparse
 
-olong = "--output="
-Elong = "--macro-expand="
 
 this_binary = sys.argv[0].split("/")[-1]
 
@@ -61,18 +59,9 @@ complex_binaries = "makeinfo texi2any".split()
 
 valid_binaries = simple_binaries + complex_binaries
 
-# For generating blank output files.
-def touch_file(path):
-    with open(path, "w"):
-        pass
-
 assert this_binary in valid_binaries, \
        this_binary + " is not one of " + ', '.join(valid_binaries)
 
-if "--version" in sys.argv:
-    print(version_str)
-    sys.exit(0)
-
 # For debugging
 log_interceptions = False
 if log_interceptions:
@@ -81,35 +70,27 @@ if log_interceptions:
 
 # Look through the options and flags, and if necessary, touch any output
 # files.
-arg_idx = 1
-while arg_idx < len(sys.argv):
-    arg = sys.argv [arg_idx]
-
-    if arg == "--":
-        break
+p = argparse.ArgumentParser()
+if this_binary in complex_binaries:
+    p.add_argument('-E', '--macro-expand', metavar='FILE')
+p.add_argument('-o', '--output', metavar='DEST')
+p.add_argument('--version', action='store_true')
 
-    # Something like -I . can result in a need for this (specifically the .)
-    elif len(arg) < 2:
-        pass
-
-    # Check if -o or --output is specified. These can be used at most once.
-    elif arg[0] == '-' and arg[1] != '-' and arg[len(arg) - 1] == 'o':
-        touch_file(sys.argv[arg_idx + 1])
-        sys.exit(0)
-    elif arg.startswith(olong):
-        touch_file(arg.split("=")[1])
-        sys.exit(0)
+args, unknown = p.parse_known_args()
 
-    # Check for functionality that isn't implemented yet.
-    else:
-        assert arg[0] != '-' or arg[1] == '-' or 'E' not in arg or \
-               this_binary in simple_binaries, \
-               "-E option not yet supported" + stub_msg
+if args.version:
+    print(version_str)
+    sys.exit(0)
 
-        assert not arg.startswith(Elong), \
-               Elong[:-1] + " option not yet supported" + stub_msg
+# Check for functionality that isn't implemented yet.
+assert not getattr(args, 'macro_expand', None), \
+    "-E/--macro-expand option not yet supported" + stub_msg
 
-    arg_idx += 1
+# Check if -o or --output is specified.
+if args.output:
+    with open(args.output, 'w'):
+        pass
+    sys.exit(0)
 
 # The -o/--output option overrides the default. For makeinfo and texi2any,
 # that default is to look for a @setfilename command in the input file.
-- 
2.21.0


