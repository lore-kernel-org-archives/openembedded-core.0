Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E672378343
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 03:16:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 20:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,336,1505804400"; d="scan'208";a="331471831"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.249.64.52])
	by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2017 20:16:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 16:16:10 +1300
Message-Id: <7e391bf8df107c186a729105ddc62df4eea87d0b.1509678875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1509678875.git.paul.eggleton@linux.intel.com>
References: <cover.1509678875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] lib/oe/sstatesig: fix wildcard matching wrong task signature files
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
X-List-Received-Date: Fri, 03 Nov 2017 03:16:57 -0000

With a '*' as a wildcard for the signature here we can also match a
portion of the task name with the result that we may match a sigdata
file for the wrong task. Luckily the signature is always the same
length - 32 characters - so we can simply use 32 '?' characters instead.
(A regex would have been another alternative, but the wildcard should be
effective and I felt like a regex would complicate the code more than
this solution).

Fixes [YOCTO #11763].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5a40932..3a8778e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -320,7 +320,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
 
     if not taskhashlist or (len(filedates) < 2 and not foundall):
         # That didn't work, look in sstate-cache
-        hashes = taskhashlist or ['*']
+        hashes = taskhashlist or ['?' * 32]
         localdata = bb.data.createCopy(d)
         for hashval in hashes:
             localdata.setVar('PACKAGE_ARCH', '*')
-- 
2.9.5


