Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 681A3789B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053914"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:42 +0200
Message-Id: <20180308181804.31261-20-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/42] bash: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:12 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/bash/bash/execute_cmd.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/bash/bash/execute_cmd.patch b/meta/recipes-extended/bash/bash/execute_cmd.patch
index 81f8f0a9cd5..9970b4d8f93 100644
--- a/meta/recipes-extended/bash/bash/execute_cmd.patch
+++ b/meta/recipes-extended/bash/bash/execute_cmd.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Inappropriate [embedded specific]
 
---- execute_cmd.c.orig	Fri Jun  3 13:34:42 2011
-+++ execute_cmd.c	Fri Jun  3 13:36:41 2011
-@@ -2202,7 +2202,11 @@
+Index: execute_cmd.c
+===================================================================
+--- execute_cmd.c.orig
++++ execute_cmd.c
+@@ -2459,7 +2459,11 @@ execute_pipeline (command, asynchronous,
    /* If the `lastpipe' option is set with shopt, and job control is not
       enabled, execute the last element of non-async pipelines in the
       current shell environment. */
@@ -13,5 +15,5 @@ Upstream-Status: Inappropriate [embedded specific]
 +#endif
 +		asynchronous == 0 && pipe_out == NO_PIPE && prev > 0)
      {
-       lstdin = move_to_high_fd (0, 0, 255);
+       lstdin = move_to_high_fd (0, 1, -1);
        if (lstdin > 0)
-- 
2.16.1


