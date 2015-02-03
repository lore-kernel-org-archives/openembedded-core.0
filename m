Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0106E6C0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:35:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Feb 2015 10:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="672175801"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 10:34:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 10:34:32 -0800
Message-Id: <3d6992622b9394cfa38f2133b72c2ec8e791d7d6.1422988163.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
Subject: [PATCH 6/6] create-pull-request: Fix git request-pull
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
X-List-Received-Date: Tue, 03 Feb 2015 18:35:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/create-pull-request | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 503248b..d83362f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -178,7 +178,13 @@ git format-patch -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --
 # Customize the cover letter
 CL="$ODIR/0000-cover-letter.patch"
 PM="$ODIR/pull-msg"
-git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
+GIT_VERSION=$(`git --version` | tr -d '[:alpha:][:space:].')
+NEWER_GIT_VERSION=210
+if [ $GIT_VERSION -lt $NEWER_GIT_VERSION ]; then
+	git request-pull $RELATIVE_TO $REMOTE_URL $COMMIT_ID >> "$PM"
+else
+	git request-pull $RELATIVE_TO $REMOTE_URL :$BRANCH >> "$PM"
+fi
 if [ $? -ne 0 ]; then
 	echo "ERROR: git request-pull reported an error"
 	exit 1
-- 
2.1.0


