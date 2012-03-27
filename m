Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SCMCN-0003FT-CX
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 04:31:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R2MoYS018161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 19:22:50 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 19:22:51 -0700
Message-ID: <1efeb61c61f7cc7643aeee0cca910d018e782685.1332814325.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Mar 2012 18:17:27 +0800
Date: Tue, 27 Mar 2012 10:24:08 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] src_distributelocal.bbclass: Remove src_distribute_local.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 02:31:52 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This bbclass has been merged into archiver.bbclass

[#YOCTO 1977]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/src_distribute_local.bbclass |   33 -----------------------------
 1 files changed, 0 insertions(+), 33 deletions(-)
 delete mode 100644 meta/classes/src_distribute_local.bbclass

diff --git a/meta/classes/src_distribute_local.bbclass b/meta/classes/src_distribute_local.bbclass
deleted file mode 100644
index 17b67e3..0000000
--- a/meta/classes/src_distribute_local.bbclass
+++ /dev/null
@@ -1,33 +0,0 @@
-inherit src_distribute
-
-# SRC_DIST_LOCAL possible values:
-# copy		copies the files to the distributedir
-# symlink	symlinks the files to the distributedir
-# move+symlink	moves the files into distributedir, and symlinks them back
-SRC_DIST_LOCAL ?= "move+symlink"
-SRC_DISTRIBUTEDIR ?= "${DEPLOY_DIR}/sources"
-SRC_DISTRIBUTECOMMAND () {
-	s="${SRC}"
-	d="${DEST}"
-
-	mkdir -p ${SRC_DISTRIBUTEDIR}
-
-	if echo $d | grep -q '/$'; then
-		mkdir -p ${SRC_DISTRIBUTEDIR}/$d
-	fi
-
-	case "${SRC_DIST_LOCAL}" in
-		copy)
-			test -e $s.md5 && cp -f $s.md5 ${SRC_DISTRIBUTEDIR}/$d.md5
-			cp -f $s ${SRC_DISTRIBUTEDIR}/$d
-			;;
-		symlink)
-			test -e $s.md5 && ln -sf $s.md5 ${SRC_DISTRIBUTEDIR}/$d.md5
-			ln -sf $s ${SRC_DISTRIBUTEDIR}/$d
-			;;
-		move+symlink)
-			mv $s ${SRC_DISTRIBUTEDIR}/$d
-			ln -sf ${SRC_DISTRIBUTEDIR}/$d $s
-			;;
-	esac
-}
-- 
1.7.0.4



