Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3F0C6B53B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 10:26:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r78AQR0T027598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2013 03:26:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 8 Aug 2013 03:26:27 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2013 18:26:47 +0800
Message-ID: <7666b33f8b5a263f4eaa3dfbd4dde70bc33235f6.1375957555.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375957555.git.Qi.Chen@windriver.com>
References: <cover.1375957555.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] checkroot.sh: respect the value of ENABLE_ROOTFS_FSCK
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
X-List-Received-Date: Thu, 08 Aug 2013 10:26:27 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, fsck is always disabled because the value of rootcheck in
the checkroot.sh script is always set to 'no'.

We should respect the value of ENABLE_ROOTFS_FSCK in /etc/default/rcS
to allow for filesystem check.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts/initscripts-1.0/checkroot.sh       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index ac21ee4..cf84cfa 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -22,7 +22,7 @@ test "$SULOGIN" = yes && sulogin -t 30 $CONSOLE
 exec 9< /etc/fstab
 rootmode=rw
 rootopts=rw
-rootcheck=no
+rootcheck=$ENABLE_ROOTFS_FSCK
 swap_on_md=no
 devfs=
 while read fs mnt type opts dump pass junk <&9
-- 
1.7.9.5


