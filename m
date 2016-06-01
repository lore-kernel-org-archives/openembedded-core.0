Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 420A577358
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIU006852; Wed, 1 Jun 2016 13:35:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZI1DoUw_EQEg; Wed,  1 Jun 2016 13:35:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpd8006883
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000lM-Dx; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:33 +0100
Message-Id: <1464784540-2786-15-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/22] scripts: Fix urlparse imports for python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:02 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Used urllib.parse instead of urlparse to make code
working in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/recipetool/create.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 744ff1b..1297428 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -24,7 +24,7 @@ import re
 import json
 import logging
 import scriptutils
-import urlparse
+from urllib.parse import urlparse, urldefrag, urlsplit
 import hashlib
 
 logger = logging.getLogger('recipetool')
@@ -283,7 +283,7 @@ def determine_from_url(srcuri):
     """Determine name and version from a URL"""
     pn = None
     pv = None
-    parseres = urlparse.urlparse(srcuri.lower().split(';', 1)[0])
+    parseres = urlparse(srcuri.lower().split(';', 1)[0])
     if parseres.path:
         if 'github.com' in parseres.netloc:
             res = re.search(r'.*/(.*?)/archive/(.*)-final\.(tar|zip)', parseres.path)
@@ -355,7 +355,7 @@ def create_recipe(args):
     srcrev = '${AUTOREV}'
     if '://' in args.source:
         # Fetch a URL
-        fetchuri = reformat_git_uri(urlparse.urldefrag(args.source)[0])
+        fetchuri = reformat_git_uri(urldefrag(args.source)[0])
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
-- 
2.5.0


