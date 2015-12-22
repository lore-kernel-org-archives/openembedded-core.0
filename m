Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C07427318B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 20:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978944"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:02:59 +1300
Message-Id: <f31f1db86a81f36d3de293de2d86181766700a5b.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/26] recipetool: create: prevent attempting to unpack entire DL_DIR
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:26 -0000

If you specify a URL ending in /, BitBake's fetcher returns a localpath
of ${DL_DIR}, and if you then try to unpack that it will attempt to copy
the entire DL_DIR contents to the destination - which at least on my
system filled my entire /tmp. Obviously we should fix the fetcher, but
at least detect and stop that from happening here for now.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/scriptutils.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 4dd7ef2..69e76d8 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -86,6 +86,10 @@ def fetch_uri(d, uri, destdir, srcrev=None):
             ud = fetcher.ud[u]
             ud.ignore_checksums = True
         fetcher.download()
+        for u in fetcher.ud:
+            ud = fetcher.ud[u]
+            if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR', True).rstrip(os.sep):
+                raise Exception('Local path is download directory - please check that the URI "%s" is correct' % uri)
         fetcher.unpack(destdir)
         for u in fetcher.ud:
             ud = fetcher.ud[u]
-- 
2.5.0


