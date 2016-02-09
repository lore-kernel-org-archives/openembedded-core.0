Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id C3A646FF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 23:12:26 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ho8so1318277pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 15:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DZd2n+DHtsj/bX6dGHNiqdV+T9poFT0PKyWFBJl1yyM=;
	b=VABqd9zG3uNmWVORoji+dOyZJpBaA4wFC0uzDBItBMKLqM3Kxwah4NuFJkUMY3uq5s
	u5+WA38LzU228IA8RMlH0FJV6FKkd3LG7EA1WRYsLCbfLxc0eI3IbVtsA4Eiyok3X/7J
	sqzhrrfLNiYeAwfWU/mVHXF69JgYz38/H450OAeh125GlkBVOJ/aWcWfncHbJShba4yd
	W7ZhFYlDOCVOFhBtZVdtpDom9Q0/kzLW0igTquVg0QQEa+Zmm8/wjbuu2/8p6Ev2dobd
	/SoWeKvebU4K1Dqjr+KSZQEacg1T7imJnCAJ+ddFIZZpACkAnKbda8283kt2YpBn85IF
	Vg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DZd2n+DHtsj/bX6dGHNiqdV+T9poFT0PKyWFBJl1yyM=;
	b=d9wFUJLs/nNUxP/9tQoQ1Qp7rlgdBntXD3NhlabhLrmznEmi/LIUlqhF3QKxj1gJxX
	k7RE5/DNV32HibLHd95gTrN4dx9MCSQLzzgLc7y8628ST7r9GI+lxx20BYmRTLeKjr1W
	N0klG+/H6/D5d7Md3gPJ8oFyNbf0C7z1HH36s1dUmuwDoly5chXLHRlZsz9PxpUnAIrD
	nZgsN1OTnd6F/bNjpuCgquV18sTF7FuqNZ4fOYM12JPvPUcaPNpIvJaqJ2VJLA5ckLH4
	hjx4Dyrt7wV6wiTjF8DTrPj3sr06653mCRIRxqPwtbRsJaFvojwlQg2ZSMVf/zQOXpfW
	if+w==
X-Gm-Message-State: AG10YOTuyVgSxTrNNJ7daVD7j7PjTviV5BXhKse3kuz22DPdN3IiLyQ0dxQr6SBj6Zn7pw==
X-Received: by 10.66.234.200 with SMTP id ug8mr54321693pac.129.1455059547454; 
	Tue, 09 Feb 2016 15:12:27 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	lt14sm209889pab.39.2016.02.09.15.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 15:12:26 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 16:12:06 -0700
Message-Id: <1455059526-23665-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] recipetool.newappend: add -e/--edit argument
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
X-List-Received-Date: Tue, 09 Feb 2016 23:12:28 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/newappend.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index f9b8d85..5625a8e 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -25,6 +25,7 @@ import errno
 import logging
 import os
 import re
+import subprocess
 import sys
 
 
@@ -89,17 +90,26 @@ def newappend(args):
         bb.utils.mkdirhier(os.path.dirname(append_path))
 
         try:
-            open(append_path, 'a')
+            open(append_path, 'a').close()
         except (OSError, IOError) as exc:
             logger.critical(str(exc))
             return 1
 
-    print(append_path)
+    if args.edit:
+        editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
+        try:
+            return subprocess.check_call([editor, append_path, recipe_path])
+        except OSError as exc:
+            logger.error("Execution of editor '%s' failed: %s", editor, exc)
+            return 1
+    else:
+        print(append_path)
 
 
 def register_commands(subparsers):
     parser = subparsers.add_parser('newappend',
                                    help='Create a bbappend for the specified target in the specified layer')
+    parser.add_argument('-e', '--edit', help='Edit the new append. This obeys $VISUAL if set, otherwise $EDITOR, otherwise vi.', action='store_true')
     parser.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser.add_argument('destlayer', help='Base directory of the destination layer to write the bbappend to', type=layer)
     parser.add_argument('target', help='Target recipe/provide to append')
-- 
2.2.1


