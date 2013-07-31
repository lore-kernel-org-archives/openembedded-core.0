Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAD326B428
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:09:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6V29gYx025549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 19:09:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 19:09:40 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 10:09:38 +0800
Message-ID: <6c6481bd695993c201470b36a7fcc2febe0183df.1375236274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375236274.git.Qi.Chen@windriver.com>
References: <cover.1375236274.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 4/9] populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
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
X-List-Received-Date: Wed, 31 Jul 2013 02:09:40 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

It's possible that a 'No such directory' error occurs when doing
check_requirement in populate-volatile.sh at rootfs time. This is
because the $ROOT_DIR/var/tmp might be a dead link.

Use $ROOT_DIR/var/volatile/tmp as the TMPDIR instead to avoid this
error.

[YOCTO #4883]
[YOCTO #4103]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index a760081..d8ae14e 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -23,7 +23,7 @@ ROOTFS_READ_ONLY=`is_rootfs_readonly`
 [ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
 
 CFGDIR="${ROOT_DIR}/etc/default/volatiles"
-TMPROOT="${ROOT_DIR}/var/tmp"
+TMPROOT="${ROOT_DIR}/var/volatile/tmp"
 COREDEF="00_core"
 
 [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
-- 
1.7.9.5


