Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCFC76758
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:33:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 12 Aug 2015 02:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,659,1432623600"; d="scan'208";a="623973915"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2015 02:33:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id C3BA36A4005;
	Wed, 12 Aug 2015 02:32:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 12:33:31 +0300
Message-Id: <1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v4] create-pull-request: cleanup bashisms
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
X-List-Received-Date: Wed, 12 Aug 2015 09:33:40 -0000

Made create-pull-request POSIX compatible:
   - Replaced /bin/bash -> /bin/sh in shebang.
   - Replaced usage of pushd/popd with generic shell commands.
   - Tested on zsh and dash.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index be49379..19ba588 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 #
 # Copyright (c) 2010-2013,  Intel Corporation.
 # All Rights Reserved
@@ -177,14 +177,15 @@ mkdir $ODIR
 
 if [ -n "$RELDIR" ]; then
 	ODIR=$(realpath $ODIR)
-	pushd $RELDIR > /dev/null
+	pdir=$(pwd)
+	cd $RELDIR
 	extraopts="--relative"
 fi
 
 # Generate the patches and cover letter
 git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 
-[ -n "$RELDIR" ] && popd > /dev/null
+[ -n "$RELDIR" ] && cd $pdir
 
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
-- 
2.1.4


