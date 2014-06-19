Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E04A6FD8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:10:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5J2AHud027312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 19:10:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 18 Jun 2014 19:10:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 10:11:32 +0800
Message-ID: <c94a169e23f798b8cb640471079f670290bea8b7.1403143738.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403143738.git.Qi.Chen@windriver.com>
References: <cover.1403143738.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [dora][PATCH 1/2] populate-extfs.sh: fix to handle /var/lib/opkg/alternatives/[[ correctly
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
X-List-Received-Date: Thu, 19 Jun 2014 02:10:17 -0000
Content-Type: text/plain

There was a patch trying to fix this problem by using 'dirname', but it
caused some build failures, thus got reverted.

The problem is that $DIR might be empty and we should first do the check
before trying to use $(dirname $DIR).

[YOCTO #5712]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
index 7de720b..da3954e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
@@ -23,12 +23,13 @@ DEBUGFS="debugfs"
 	find $SRCDIR | while read FILE; do
                 TGT="${FILE##*/}"
                 DIR="${FILE#$SRCDIR}"
-                DIR="${DIR%$TGT}"
 
 		# Skip the root dir
 		[ ! -z "$DIR" ] || continue
 		[ ! -z "$TGT" ] || continue
 
+                DIR="$(dirname $DIR)"
+
 		if [ "$DIR" != "$CWD" ]; then
 			echo "cd $DIR"
 			CWD="$DIR"
-- 
1.7.9.5


