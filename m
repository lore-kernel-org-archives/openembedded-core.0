Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A24F26041E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:48:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7mGHs019346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:48:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 00:48:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 15:48:36 +0800
Message-ID: <046be676719830bf994889ee23db12db1a0ce287.1372386599.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372386599.git.Qi.Chen@windriver.com>
References: <cover.1372386599.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] base-files: remove the unnecessary /media/xxx directories
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
X-List-Received-Date: Fri, 28 Jun 2013 07:48:15 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

A few directories under /media were created by default, /media/card,
/media/ram, /media/realroot, etc.

These directories actually have no real usage now, thus removing them.

The /media/ram entry in the fstab is also removed, as mounting a tmpfs
over /media/ram in our system brings no benefit.

Note that a duplicate '/mnt' entry in dirs755 are also removed.

[Yocto #4774]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/base-files/base-files/fstab     |    1 -
 meta/recipes-core/base-files/base-files_3.0.14.bb |    7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index dd613a1..e625ebc 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -6,7 +6,6 @@ devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults              0  0
-tmpfs                /media/ram           tmpfs      defaults              0  0
 
 # uncomment this if your device has a SD/MMC/Transflash slot
 #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 88d1ac9..054fefa 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -43,9 +43,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
            ${localstatedir}/volatile/log \
-           /mnt /media /media/card /media/cf /media/net /media/ram \
-           /media/union /media/realroot /media/hdd \
-           /media/mmc1"
+           /media"
 dirs3755 = "/srv  \
             ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
             ${prefix}/local/include ${prefix}/local/lib ${prefix}/local/sbin \
@@ -79,9 +77,6 @@ do_install () {
 	for d in ${volatiles}; do
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
-	for d in card cf net ram; do
-		ln -sf /media/$d ${D}/mnt/$d
-	done
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
-- 
1.7.9.5


