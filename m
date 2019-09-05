Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA9887F2AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:54:54 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u185so4982418iod.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HakvGtEcnQAOOPzPR6ANZBjo0b4rYS6rxcOX8agWLZ8=;
	b=ij/MBWtSrA8wanEH3CYwKXPW85gshJuYdjFAf6zGLA6livVKtgmrt0oeUg5Tom2bwF
	6K6f6K/nAWmYdydUpHWjWRZ0b25VwI3nkgnrZ5eTA8DMloVH3CK/1NRfvssBboSBEcF0
	7lFGImiSSa3xTnOCL8x7pBP9YiZlEm+cr6tjUVYrf7Ndokd6H23aBT3q0yOv2/fu7atM
	9WWMVFGFmKHKiD10GuCXN4GRVWG0wj1yubmUpJ1mg65Y44zF16CajXoZYNGmCsunJwqt
	CJ+awuT2ZoXKIWo4Q4SUcDORJw3krzqYs/CH4TTbvbQJp49z2myqq2adtr4ArzHm7Bc/
	KWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HakvGtEcnQAOOPzPR6ANZBjo0b4rYS6rxcOX8agWLZ8=;
	b=Jzvu10nipcvqJn964ByXlvkV4IB2aqS4KkVQ6rIRC8BE6/99ZodUuCl388KbKZXP2l
	LQse/qvvqQDigMo1YynCslfJ84aAwKEpcLzXnTR0Ugw5lpiPnaaEbQ/eitvll9T9aNbp
	SrlUGBt6EVyTfhLtRW/28NqWgwVmz7o1oc1ZbAPzWfyksVSMJNGMZtTaTBkh2M51QZua
	yYInYZt48yfrnVxWd2l0edRUoB2y4yLEh6zmC3mdO6gUQAyjcbSdU2BgeUMMNRQNrl8f
	uZXD3dToTMCpX7ntW5Kap8x09CFSmRlghKFO3Zbo1zOoKiBjHBB+71eOwje/7mUbdrXe
	xgrQ==
X-Gm-Message-State: APjAAAUKdSyOZXqhl5yVuENXH4ETHjgSEZxI1vgSBmRyBogPBIlpHbNh
	wr2DOrXH7MlDXAKzmQus1/98qe00
X-Google-Smtp-Source: APXvYqxzqvYceF3CrCabYG+pIW6EaFcnkxRRqdN7EGuDHXDraD9BjiDToFIjwvo5JezWz03PmR7Wpg==
X-Received: by 2002:a05:6602:c7:: with SMTP id
	z7mr4346524ioe.130.1567691695769; 
	Thu, 05 Sep 2019 06:54:55 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	j11sm1635003ioa.55.2019.09.05.06.54.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 06:54:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 08:54:44 -0500
Message-Id: <20190905135444.16261-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] resulttool: Add reproducible log extraction
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
X-List-Received-Date: Thu, 05 Sep 2019 13:54:57 -0000
Content-Transfer-Encoding: 8bit

Adds an argument to the log subcommand to extract the raw logs from the
reproducible selftest.

To prevent ambiguity, the "--raw" argument has been renamed
"--raw-ptest", although the old "--raw" argument is kept around for
compatibility.

[YOCTO #13324]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/resulttool/log.py | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index 25c3396717e..2352c767d91 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -16,6 +16,16 @@ def show_ptest(result, ptest, logger):
     print("ptest '%s' not found" % ptest)
     return 1
 
+def show_reproducible(result, reproducible, logger):
+    try:
+        print(result['reproducible'][reproducible]['diffoscope.text'])
+        return 0
+
+    except KeyError:
+        print("reproducible '%s' not found" % reproducible)
+        return 1
+
+
 def log(args, logger):
     results = resultutils.load_resultsdata(args.source)
 
@@ -40,17 +50,28 @@ def log(args, logger):
                         with open(dest, 'w') as f:
                             f.write(ptest['log'])
 
-        if args.raw:
+        if args.raw_ptest:
             if 'ptestresult.rawlogs' in r:
                 print(r['ptestresult.rawlogs']['log'])
             else:
-                print('Raw logs not found')
+                print('Raw ptest logs not found')
+                return 1
+
+        if args.raw_reproducible:
+            if 'reproducible.rawlogs' in r:
+                print(r['reproducible.rawlogs']['log'])
+            else:
+                print('Raw reproducible logs not found')
                 return 1
 
         for ptest in args.ptest:
             if not show_ptest(r, ptest, logger):
                 return 1
 
+        for reproducible in args.reproducible:
+            if not show_reproducible(r, reproducible, logger):
+                return 1
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
     parser = subparsers.add_parser('log', help='show logs',
@@ -63,9 +84,15 @@ def register_commands(subparsers):
             help='show logs for a ptest')
     parser.add_argument('--dump-ptest', metavar='DIR',
             help='Dump all ptest log files to the specified directory.')
+    parser.add_argument('--reproducible', action='append', default=[],
+            help='show logs for a reproducible test')
     parser.add_argument('--prepend-run', action='store_true',
             help='''Dump ptest results to a subdirectory named after the test run when using --dump-ptest.
                     Required if more than one test run is present in the result file''')
     parser.add_argument('--raw', action='store_true',
-            help='show raw logs')
+            help='show raw (ptest) logs. Deprecated. Alias for "--raw-ptest"', dest='raw_ptest')
+    parser.add_argument('--raw-ptest', action='store_true',
+            help='show raw ptest log')
+    parser.add_argument('--raw-reproducible', action='store_true',
+            help='show raw reproducible build logs')
 
-- 
2.21.0


