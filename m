Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7887F2A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 21:54:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jul 2019 14:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="174023920"
Received: from jsithir-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.189.107])
	by orsmga003.jf.intel.com with ESMTP; 29 Jul 2019 14:54:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 09:54:42 +1200
Message-Id: <1386aefe98db03a9b54ca065c41e63ffc96db489.1564437221.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564437221.git.paul.eggleton@linux.intel.com>
References: <cover.1564437221.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] scripts/create-pull-request: improve handling of non-SSH remote URLs
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
X-List-Received-Date: Mon, 29 Jul 2019 21:54:55 -0000
Content-Transfer-Encoding: 8bit

When attempting to create a pull request, we look at the remote URL in
order to extract information to include in the cover letter. However,
the assumption was that the remote is an SSH URL i.e. containing '@'
which is not always the case (the pull and push URLs might be different,
or we might be pushing via https) - if it wasn't the script just gave up
leaving you to manually edit the URLs in the email. With a few minor
tweaks to the regexes the script will work for these cases as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/create-pull-request | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 3ce03d6c1a0..762828fd9ad 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -123,20 +123,12 @@ fi
 
 # Rewrite private URLs to public URLs
 # Determine the repository name for use in the WEB_URL later
-case "$REMOTE_URL" in
-*@*)
-	USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
-	PROTO_RE="[a-z][a-z+]*://"
-	GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
-	REMOTE_URL=${REMOTE_URL%.git}
-	REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")
-	REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\3/\4#")
-	;;
-*)
-	echo "WARNING: Unrecognized remote URL: $REMOTE_URL"
-	echo "         The pull and browse URLs will likely be incorrect"
-	;;
-esac
+USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
+PROTO_RE="[a-z][a-z+]*://"
+GIT_RE="\(^\($PROTO_RE\)\?\)\($USER_RE@\)\?\([^:/]*\)[:/]\(.*\)"
+REMOTE_URL=${REMOTE_URL%.git}
+REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\5#")
+REMOTE_URL=$(echo $REMOTE_URL | sed "s#$GIT_RE#git://\4/\5#")
 
 if [ -z "$BRANCH" ]; then
 	BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
-- 
2.20.1


