Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19E176B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:09:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6V29ZGL017759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 19:09:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 19:09:34 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 10:09:35 +0800
Message-ID: <66d189e15a49f1253859121b3df3dcc13aa35e10.1375236274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375236274.git.Qi.Chen@windriver.com>
References: <cover.1375236274.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/9] init-live.sh: make $ROOT_MOUNT/media writable when necessary
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
X-List-Received-Date: Wed, 31 Jul 2013 02:09:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If the live image is mounted as read-only, we cannot make necessary
directories under $ROOT_MOUNT/media, so trying to move the mount points
lead to errors.

So in case that no unification filesystem mechanism is available in kernel
and the rootfs is mounted as read-only, we mount tmpfs on $ROOT_MOUNT/media
so that it's possible to make necessary directories under it.

[YOCTO #4881]
[YOCTO #4103]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 86ecebf..0e0cf8a 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -200,6 +200,8 @@ mount_and_boot() {
 	"")
 	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 		fatal "Could not mount rootfs image"
+	    else
+		mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOT_MOUNT/media
 	    fi
 	    ;;
     esac
-- 
1.7.9.5


