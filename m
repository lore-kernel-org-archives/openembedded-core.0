Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92AC96FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:45:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J2jYwQ028728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:45:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 19:45:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 19:45:30 -0700
Message-ID: <e65a4e59689b4c095366e81bae3251a62e51e1e8.1461033288.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461033288.git.liezhi.yang@windriver.com>
References: <cover.1461033288.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] create-pull-request: create branch on remote if not found
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
X-List-Received-Date: Tue, 19 Apr 2016 02:45:34 -0000
Content-Type: text/plain

Before this patch, we need two steps to create PULL:
* Step 1, create branch:
  $ git push <contrib> <local_branch>:<remote_branch>
* Step 2, create PULL:
  $ create-pull-request -u <contrib> -l <local_branch> -b <remote_branch> -r <local_branch>~<n>

We can see that the args used in step 1 are in step 2, so we can use
create-pull-request to create the branch if not found to simplify the
steps.

[YOCTO #9408]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/create-pull-request | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 479ad6e..7dc9836 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -173,8 +173,8 @@ esac
 if [ -n "$WEB_URL" ]; then
 	wget --no-check-certificate -q $WEB_URL -O /dev/null
 	if [ $? -ne 0 ]; then
-		echo "WARNING: Branch '$BRANCH' was not found on the contrib git tree."
-		echo "         Please check your remote and branch parameter before sending."
+		echo "Branch '$BRANCH' not found on '$REMOTE', creating it..."
+		git push $REMOTE $L_BRANCH:$BRANCH
 		echo ""
 	fi
 fi
-- 
2.7.4


