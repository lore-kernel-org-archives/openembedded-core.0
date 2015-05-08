Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4965573DB5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 12:37:44 +0000 (UTC)
Received: by ieczm2 with SMTP id zm2so62078128iec.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 05:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KIb6CTUM/7cq5t8MAkXLAHlFU7/NbPAVucHVICK8RyA=;
	b=lA9fYQlynegXOMbk08Mkkzoj9dSaeBEJREnP8SFs5I4HshPAXHXOOCkfS+D0KVUGNh
	7FU8+DV2erWtMUNf7Nh6WeOEk7c1Xl1JgfLMsPZ84X0TiBWSA70Iy+k1sNFyGQ4dOqMt
	HBhyWdkwoeLP2cDDg4+hU+bplwrQn39WwAqi8adcoCSWhDndqvyXT9pthwifpaI/WhkF
	fj1J9IT//got0lJwbdJ71iB/TTmmxh6zjbVDy9gReam22eUfmymo9d7EdZmVZTG2oXgs
	n9n1up6NopLnH4KeSqmdkZr5Gv9hsa3KErwlkf+KTSbKO9YzZn0HWYMnZsL7NQZrEDlW
	xXwA==
X-Gm-Message-State: ALoCoQkAKL345fW+7Qz4WfnUJ2rAqpaayuTH+yN8jM4+tT0s/T3lKFi1GzUabaKzpPEfnN/obvNl
X-Received: by 10.107.3.17 with SMTP id 17mr4444056iod.60.1431088665331;
	Fri, 08 May 2015 05:37:45 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A57C49.dip0.t-ipconnect.de.
	[87.165.124.73])
	by mx.google.com with ESMTPSA id b2sm3658031igf.10.2015.05.08.05.37.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 05:37:44 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 14:37:30 +0200
Message-Id: <71b5199bb7d9b5291fe909afd7cf103785088669.1431088309.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1431088309.git.patrick.ohly@intel.com>
References: <cover.1431088309.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1431088309.git.patrick.ohly@intel.com>
References: <cover.1431088309.git.patrick.ohly@intel.com>
Subject: [PATCH 1/1] combo-layer: improve merge commit handling
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
X-List-Received-Date: Fri, 08 May 2015 12:37:44 -0000

When the head of a branch is a merge commit, combo-layer did not
record that commit as last_revision because it only considers applied
patches, and the merge commit never gets applied.

This causes problems when the merge commit leads to multiple patches
and the commit id that gets recorded only reaches some of these
patches. The next run then will try to re-apply the other patches.

This special case is now detected and dealt with by bumping
last_revision to the branch commit. The behavior where the head is a
normal commit is intentionally not changed, because some users might
prefer the traditional behavior.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 5d61fb1..b0b7c28 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -731,6 +731,10 @@ def apply_patchlist(conf, repos):
                     if line:
                         patchlist.append(line)
 
+        ldir = conf.repos[name]['local_repo_dir']
+        branch = conf.repos[name].get('branch', "master")
+        branchrev = runcmd("git rev-parse %s" % branch, ldir).strip()
+
         if patchlist:
             logger.info("Applying patches from %s..." % name)
             linecount = len(patchlist)
@@ -758,11 +762,28 @@ def apply_patchlist(conf, repos):
                             sys.exit(0)
                 prevrev = lastrev
                 i += 1
+            # Once all patches are applied, we should update
+            # last_revision to the branch head instead of the last
+            # applied patch. The two are not necessarily the same when
+            # the last commit is a merge commit or when the patches at
+            # the branch head were intentionally excluded.
+            #
+            # If we do not do that for a merge commit, the next
+            # combo-layer run will only exclude patches reachable from
+            # one of the merged branches and try to re-apply patches
+            # from other branches even though they were already
+            # copied.
+            #
+            # If patches were intentionally excluded, the next run will
+            # present them again instead of skipping over them. This
+            # may or may not be intended, so the code here is conservative
+            # and only addresses the "head is merge commit" case.
+            if lastrev != branchrev and \
+               len(runcmd("git show --pretty=format:%%P --no-patch %s" % branch, ldir).split()) > 1:
+                lastrev = branchrev
         else:
             logger.info("No patches to apply from %s" % name)
-            ldir = conf.repos[name]['local_repo_dir']
-            branch = conf.repos[name].get('branch', "master")
-            lastrev = runcmd("git rev-parse %s" % branch, ldir).strip()
+            lastrev = branchrev
 
         if lastrev != repo['last_revision']:
             conf.update(name, "last_revision", lastrev)
-- 
2.1.4


