Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SmF8j-0003YN-D8
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 04:16:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6424q5V019845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jul 2012 19:04:52 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 3 Jul 2012 19:04:52 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jul 2012 10:03:13 +0800
Message-ID: <1341367393-1464-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <A0120681-E39C-44BA-9487-C3C2EAD91307@dominion.thruhere.net>
References: <A0120681-E39C-44BA-9487-C3C2EAD91307@dominion.thruhere.net>
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [PATCH v2] udev: don't mount with -o sync
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
X-List-Received-Date: Wed, 04 Jul 2012 02:16:30 -0000
Content-Type: text/plain

mount.sh mounts all partitions with -o sync, which is bad for system
performance.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---

Bump PR.

 meta/recipes-core/udev/udev/mount.sh |    2 +-
 meta/recipes-core/udev/udev_164.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/mount.sh b/meta/recipes-core/udev/udev/mount.sh
index 53fefa3..c13b8bb 100644
--- a/meta/recipes-core/udev/udev/mount.sh
+++ b/meta/recipes-core/udev/udev/mount.sh
@@ -23,7 +23,7 @@ automount() {
 
 	! test -d "/media/$name" && mkdir -p "/media/$name"
 	
-	if ! $MOUNT -t auto -o sync $DEVNAME "/media/$name"
+	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
 		rm_dir "/media/$name"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c5813ec..0462ff2 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.10.4



