Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 276F56A39D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 02:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6T2X4AD028143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 19:33:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 28 Jul 2013 19:33:03 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2013 10:33:01 +0800
Message-ID: <bab9f2d5e700cc6862fe566a0202f53050ae8326.1375065009.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375065009.git.Qi.Chen@windriver.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH V2 01/10] init-live.sh: make $ROOT_MOUNT/media writable when necessary
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
X-List-Received-Date: Mon, 29 Jul 2013 02:33:03 -0000
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


