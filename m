Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 722F17E600
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:36 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p1so6106668plo.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UYegzLWPU9h1HWJLvS//y3QhslsFZWpTDk5CLtNTKd4=;
	b=PHvyahyEJrBq+RXMUFBsg4lgKMeR506yf+JE5jUJChRij0EDUHbTfCRRBeq2IKgvKu
	VoQMXv8CtFZJF5VwMESX/C2YKhTdpu2i9ASpSsBMU050Xmgpa3nsS6pDyQD+1j6FKmqB
	VP3R3KbIhZqkwvohUwn7RVE/xFI4l6lqrGLQjqKvaPj8/rSQSlTPBPgvvcP0KpKzvKVi
	P8KVDRvBasCscKPfP7PlS5dg9ORRrLWgurSOtDqf3dJRyhhLzyJA+1J4/kSwXm2qoDuk
	0BPLRH6gUtOTKtT5pyCNjTi+zYPlMVWMlER1Ir30c8PKZvr/t9QoD2dmcmOPoPxXNuUX
	pJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UYegzLWPU9h1HWJLvS//y3QhslsFZWpTDk5CLtNTKd4=;
	b=D+7CEHSJwbYRZ8JQJhE9cX0uwy4zI8DqulBOym4AsVsc9jOkyRg+2SnfNwwHyWqILM
	TD81pCOPjHSx0DRq0UH/YSYQR/CLV8jfg6JsOrFvQpKM6/OCsrD7lChyT6g/jiRR/Agi
	QnAWkh3Pv/sOCCUYhgQEyt5ugCFb8SPeKcsMsjRuXpaK3407tCbVw2mXysPI/fmwAKJL
	MX8Org9nFR7eHBJ46XUM/gr7Gc4hGTC7cXzxHYnxWnstEQTIfYIoY8Tm2ykUZwSvvrc/
	k4+rxUIa5sHO5uoLfY4aTmwCU6Z4lBqaORrt6R61IG99X2WYxLOK6JlUn/b8FZLrVg+o
	32ew==
X-Gm-Message-State: APjAAAUTLLDU8p8Ax7/dGUmk/0dVTrX8geW8vAoZSEXBkIoxG74UncUw
	tmso9VZ+qzZflCnwojOObdzaDOpenxg=
X-Google-Smtp-Source: APXvYqyFStH6G6JzgUhm1JpO2dslRXlstWHb0NoivLGuYWKa2c4gyFuIWpHUPHpdkz6Nfarj5X5TtA==
X-Received: by 2002:a17:902:42d:: with SMTP id
	42mr139219184ple.228.1561348477472; 
	Sun, 23 Jun 2019 20:54:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:15 -0700
Message-Id: <198cfe95eb41d07b0f7fec62de2e4ccf2291eadf.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 16/19] texinfo-dummy-native: Rewrite template.py to use argparse
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:36 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The original version of template.py parses the arguments manually. This
fails when looking for the -E option if, e.g., an -I option is specified
without any space before its argument, and that argument contains the
letter 'E'.

A minor difference to the original version is that it parsed the
arguments in the order they were specified on the command line whereas
this version will always handle -E before -o.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../texinfo-dummy-native/texinfo-dummy/template.py | 55 +++++++---------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
index fcc2854..86c7c18 100644
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
2.7.4


