Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2F35560939
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:22:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2016 02:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1060910470"
Received: from yleow-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.155.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2016 02:22:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 21:22:10 +1200
Message-Id: <42dd61c0fa1abac03b6439ab4a2a28bf08bd0a33.1474622468.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474622468.git.paul.eggleton@linux.intel.com>
References: <cover.1474622468.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474622468.git.paul.eggleton@linux.intel.com>
References: <cover.1474622468.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] lib/oe/patch: exclude "From <hash>" from commit message when PATCHTOOL is "git"
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
X-List-Received-Date: Fri, 23 Sep 2016 09:22:18 -0000

If you leave "From <hash>" lines in the commit message it can actually
break git rebase because it tries to interpret the line in the context
of the current repository, and if the hash is invalid then a rebase
will blow up with:

  fatal: git cat-file: could not get object info

or in newer git versions:

  error: unable to find <hash>
  fatal: git cat-file <hash>: bad file

(I hit this when I tried to do a devtool upgrade on openssl to 1.0.2i
the first time I did "git rebase --skip")

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 05e0faa..c04f098 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -317,6 +317,7 @@ class GitApplyTree(PatchTree):
     def interpretPatchHeader(headerlines):
         import re
         author_re = re.compile('[\S ]+ <\S+@\S+\.\S+>')
+        from_commit_re = re.compile('^From [a-z0-9]{40} .*')
         outlines = []
         author = None
         date = None
@@ -346,6 +347,9 @@ class GitApplyTree(PatchTree):
                 # git is fussy about author formatting i.e. it must be Name <email@domain>
                 if author_re.match(authorval):
                     author = authorval
+            elif from_commit_re.match(line):
+                # We don't want the From <commit> line - if it's present it will break rebasing
+                continue
             outlines.append(line)
         return outlines, author, date, subject
 
-- 
2.5.5


