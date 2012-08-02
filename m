Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swro1-0002yQ-Sv
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551556"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:08 +0100
Message-Id: <43958d012edeefff0cf2e5515e84b0b9ef3bcec8.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/9] buildhistory_analysis: ignore removal of self-dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 09:34:58 -0000

The recent removal of self-dependencies for dbg/dev packages produced
a fair amount of noise, so filter it out since we know this is a
reasonable change.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index a1a0408..a5da7d9 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -286,8 +286,9 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
     adict = blob_to_dict(ablob)
     bdict = blob_to_dict(bblob)
 
+    pkgname = os.path.basename(path)
     defaultvals = {}
-    defaultvals['PKG'] = os.path.basename(path)
+    defaultvals['PKG'] = pkgname
     defaultvals['PKGE'] = adict.get('PE', '0')
     defaultvals['PKGV'] = adict.get('PV', '')
     defaultvals['PKGR'] = adict.get('PR', '')
@@ -320,6 +321,9 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
                 alist.sort()
                 blist = bstr.split()
                 blist.sort()
+                # We don't care about the removal of self-dependencies
+                if pkgname in alist and not pkgname in blist:
+                    alist.remove(pkgname)
                 if ' '.join(alist) == ' '.join(blist):
                     continue
 
-- 
1.7.9.5



