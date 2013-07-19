Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37C6C6B311
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:13:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9Dl5t020311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:13:47 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:13:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:13:41 +0800
Message-ID: <5cbd5a93188e5fe4453ba380c7f68d60eed379ca.1374224424.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374224424.git.hongxu.jia@windriver.com>
References: <cover.1374224424.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-native: remove unused and duplicated sitecustomize.py
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
X-List-Received-Date: Fri, 19 Jul 2013 09:13:45 -0000
Content-Type: text/plain

python-native doesn't use sitecustomize.py and there is another
duplicated one in meta/recipes-devtools/python/python.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python-native/sitecustomize.py          | 45 ----------------------
 1 file changed, 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/sitecustomize.py

diff --git a/meta/recipes-devtools/python/python-native/sitecustomize.py b/meta/recipes-devtools/python/python-native/sitecustomize.py
deleted file mode 100644
index 2739018..0000000
--- a/meta/recipes-devtools/python/python-native/sitecustomize.py
+++ /dev/null
@@ -1,45 +0,0 @@
-# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# GPLv2 or later
-# Version: 20081123
-# Features:
-# * set proper default encoding
-# * enable readline completion in the interactive interpreter
-# * load command line history on startup
-# * save command line history on exit 
-
-import os
-
-def __exithandler():
-    try:
-        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __registerExitHandler():
-    import atexit
-    atexit.register( __exithandler )
-
-def __enableReadlineSupport():
-    readline.set_history_length( 1000 )
-    readline.parse_and_bind( "tab: complete" )
-    try:
-        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
-    except IOError:
-        pass
-
-def __enableDefaultEncoding():
-    import sys
-    try:
-        sys.setdefaultencoding( "utf8" )
-    except LookupError:
-        pass
-
-import sys
-try:
-    import rlcompleter, readline
-except ImportError:
-    pass
-else:
-    __enableDefaultEncoding()
-    __registerExitHandler()
-    __enableReadlineSupport()
-- 
1.8.1.2


