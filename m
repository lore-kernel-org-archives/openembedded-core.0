Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 268D070988
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:29:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2014 03:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,771,1400050800"; d="scan'208";a="551757066"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2014 03:29:06 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 13:29:24 +0300
Message-Id: <a6a9bbd35ef333407ed5ea297effba0ae596450a.1406802531.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1406802531.git.roxana.ciobanu@intel.com>
References: <cover.1406802531.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1406802531.git.roxana.ciobanu@intel.com>
References: <cover.1406802531.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] SRC_URI parameter: "subdir" does not work for local files
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
X-List-Received-Date: Thu, 31 Jul 2014 10:29:17 -0000

Check if the 'subdir' parameter exists and assign it to 'destdir' so that
files are copied in ${WORKDIR}/destdir.

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index df2f2b0..68c8329 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1265,7 +1265,10 @@ class FetchMethod(object):
                     if urldata.type == "file" and urldata.path.find("/") != -1:
                        destdir = urldata.path.rsplit("/", 1)[0]
                     else:
-                       destdir = "."
+                       if urldata.parm.get('subdir') != None:
+                          destdir = urldata.parm.get('subdir')
+                       else:
+                          destdir = "."
                     bb.utils.mkdirhier("%s/%s" % (rootdir, destdir))
                     cmd = 'cp -f %s %s/%s/' % (file, rootdir, destdir)
 
-- 
1.9.1


