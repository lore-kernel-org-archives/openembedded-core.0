Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DDFDA73212
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="972537069"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 08:27:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id A13D66A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:26 +0300
Message-Id: <8a9be5c905f1536c6cf9a176c3e2ba4928fe5670.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 13/14] wic: don't encode unicode strings
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
X-List-Received-Date: Wed, 04 May 2016 15:27:42 -0000

Removed check for unicode type as it doesn't work in Python 3.
This check is not needed for wic as all its output seem to be
strings. This allows to run code under both pythons.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/msger.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index 2340ac2..4d8e704 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -66,10 +66,6 @@ def _general_print(head, color, msg=None, stream=None, level='normal'):
         # skip
         return
 
-    # encode raw 'unicode' str to utf8 encoded str
-    if msg and isinstance(msg, unicode):
-        msg = msg.encode('utf-8', 'ignore')
-
     errormsg = ''
     if CATCHERR_BUFFILE_FD > 0:
         size = os.lseek(CATCHERR_BUFFILE_FD, 0, os.SEEK_END)
@@ -118,9 +114,6 @@ def _color_print(head, color, msg, stream, level):
                 newline = True
 
     if msg is not None:
-        if isinstance(msg, unicode):
-            msg = msg.encode('utf8', 'ignore')
-
         stream.write('%s%s' % (head, msg))
         if newline:
             stream.write('\n')
-- 
2.1.4


