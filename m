Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A80FB6CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 12:24:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0KCOZTa014360
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 04:24:35 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 04:24:35 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 20:24:43 +0800
Message-ID: <0fbf5062299128b4b654de870a54f22a7cf8633a.1390220655.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1390220655.git.liezhi.yang@windriver.com>
References: <cover.1390220655.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs/populate-extfs.sh: fix a problem on dash
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
X-List-Received-Date: Mon, 20 Jan 2014 12:24:34 -0000
Content-Type: text/plain

The dash can't handle the or [[ in parameter expansion, for example:

A=/usr/bin/[[
B=[[
C="${A%$B}"

The C should be "/usr/bin" in common, but it will be /usr/bin/[[ on
dash, use dirname to fix it.

NOTE:
There are 3 lines about parameter expansion, only fix the
DIR="${DIR%$TGT}" since the other 2 works will and are very useful in
this case.

[YOCTO #5712]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
index 7de720b..9b55a4b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
@@ -23,7 +23,7 @@ DEBUGFS="debugfs"
 	find $SRCDIR | while read FILE; do
                 TGT="${FILE##*/}"
                 DIR="${FILE#$SRCDIR}"
-                DIR="${DIR%$TGT}"
+                DIR="$(dirname $DIR)"
 
 		# Skip the root dir
 		[ ! -z "$DIR" ] || continue
-- 
1.8.3.1


