Return-Path: <nitin.a.kamble@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0625F72007
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 19:20:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2015 11:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,640,1418112000"; d="scan'208";a="532252753"
Received: from yocto-hm1.jf.intel.com ([10.23.232.131])
	by orsmga003.jf.intel.com with ESMTP; 24 Feb 2015 11:11:48 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com
Date: Tue, 24 Feb 2015 11:19:32 -0800
Message-Id: <fb86183da2859f31674dd618d5dd7a983359f34c.1424805430.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1424805430.git.nitin.a.kamble@intel.com>
References: <cover.1424805430.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] create-pull-request: fix failure with git version 1.8.1.4
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
X-List-Received-Date: Tue, 24 Feb 2015 19:20:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

As seen below, this script fails with git versions having more than 3 digit.

$> ../poky.git/scripts/create-pull-request -b nitin/misc -u contrib -r master.origin
fatal: No such ref: :nitin/misc
fatal: Needed a single revision
ERROR: git request-pull reported an error

Fix it by considering only the top 3 digits of the git version.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index d83362f..a85c83f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -178,7 +178,7 @@ git format-patch -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-GIT_VERSION=$(`git --version` | tr -d '[:alpha:][:space:].')
+GIT_VERSION=$(`git --version` | tr -d '[:alpha:][:space:].' | sed "s/\(...\)\(.*\)/\1/" )
 NEWER_GIT_VERSION=210
 if [ $GIT_VERSION -lt $NEWER_GIT_VERSION ]; then
 	git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
-- 
1.8.1.4


