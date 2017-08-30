Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 25DEB7835F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:47:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 30 Aug 2017 16:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="1189997553"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2017 16:47:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:46:22 +1200
Message-Id: <df4c691694e90455864e890936727b40787a8d49.1504136074.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504136074.git.paul.eggleton@linux.intel.com>
References: <cover.1504136074.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/license: drop erroneous sha256 parameter in LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 30 Aug 2017 23:47:02 -0000

In OE-Core commit a48fea275b08ff3d3dfc9a928aeb04768db35873, a check on
the value of a "sha256" parameter was added, however there was no
mention of this in the commit message and no corresponding code to
actually verify the checksum as sha256 was added along with it either,
so there's no point in getting the value. Additionally it was assuming
that a sha256 value would be present without checking first, with the
result that if you leave out the md5 value in a recipe intentionally in
order to get it to tell you the correct value on the next build, you got
a traceback instead of the appropriate error containing the information.
Drop this entirely - if we want to implement this we need to do it
properly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4f7842c..d353110 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -486,7 +486,7 @@ def find_license_files(d):
         except bb.fetch.MalformedUrl:
             bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF'), url))
         # We want the license filename and path
-        chksum = parm['md5'] if 'md5' in parm else parm['sha256']
+        chksum = parm.get('md5', None)
         beginline = parm.get('beginline')
         endline = parm.get('endline')
         lic_chksums[path] = (chksum, beginline, endline)
-- 
2.9.5


