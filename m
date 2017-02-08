Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 330 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Feb 2017 06:23:28 UTC
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.119])
	by mail.openembedded.org (Postfix) with ESMTP id 2063C71A9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 06:23:28 +0000 (UTC)
Received: from atl4mhob15.myregisteredsite.com
	(atl4mhob15.myregisteredsite.com [209.17.115.53])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	v186I1CI029366 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2017 01:18:01 -0500
Received: from mailpod.hostingplatform.com ([10.30.71.209])
	by atl4mhob15.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	v186HvkW027856 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2017 01:17:57 -0500
Received: (qmail 30852 invoked by uid 0); 8 Feb 2017 06:17:57 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 8 Feb 2017 06:17:57 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 07:17:53 +0100
Message-Id: <1486534673-18706-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
References: <9b8f8f39-aa5f-cbdf-8d45-9bd0e27c9404@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [bitbake][PATCH] lib/bb/build.py: Raise proper KeyError if function does not exist
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
X-List-Received-Date: Wed, 08 Feb 2017 06:23:29 -0000

If one adds the following line to an image recipe without defining
the function:
ROOTFS_POSTPROCESS_COMMAND += "rootfs_funky_stuff;"
bitbake will terminate with a cryptic error message:
AttributeError: 'NoneType' object has no attribute 'get'

To inform the user of what bitbake wasn't able to find, raise a KeyError
exception denoting the function name before that happens. This changes the
message to the much more useful:
KeyError: 'rootfs_funky_stuff'

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 lib/bb/build.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/bb/build.py b/lib/bb/build.py
index c4c8aeb..5bc18c1 100644
--- a/lib/bb/build.py
+++ b/lib/bb/build.py
@@ -194,6 +194,8 @@ def exec_func(func, d, dirs = None, pythonexception=False):
         oldcwd = None
 
     flags = d.getVarFlags(func)
+    if flags is None:
+        raise KeyError(func)
     cleandirs = flags.get('cleandirs')
     if cleandirs:
         for cdir in d.expand(cleandirs).split():
-- 
1.9.1


