Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D41286B5C6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 08:08:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7788ueU016865
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 01:08:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 01:08:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2013 16:08:56 +0800
Message-ID: <3cfae481384c0c94d116273ba085dbacaf455c6d.1375862591.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375862591.git.Qi.Chen@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com, chen_q07@163.com
Subject: [PATCH V4 08/10] populate-volatile.sh: use 'cp -a' to avoid potential problem
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
X-List-Received-Date: Wed, 07 Aug 2013 08:08:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, dead links in target directory will not be copied.
This is incorrect as dead links are not uncommon in our rootfs.
So we use '-a' option instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 827fd7d..b1c0245 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -76,7 +76,8 @@ link_file() {
 	if [ -L \"$2\" ]; then
 		[ \"\$(readlink -f \"$2\")\" != \"\$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
 	elif [ -d \"$2\" ]; then
-		for f in $2/* $2/.[^.]*; do [ -e \$f ] && cp -rf \$f $1; done;
+		cp -a $2/* $1
+		cp -a $2/.[!.]* $1
 		rm -rf \"$2\";
 		ln -sf \"$1\" \"$2\";
 	else
-- 
1.7.9.5


