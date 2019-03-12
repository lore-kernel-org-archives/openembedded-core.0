Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB097C70C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 09:42:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2C9g6sZ024153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 02:42:06 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 12 Mar 2019 02:42:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2019 17:41:58 +0800
Message-ID: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
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
X-List-Received-Date: Tue, 12 Mar 2019 09:42:05 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
it failed

[snip]
| Incremental.c: In function 'Incremental_container':
| Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
| close(mdfd);
| ^~~~~~~~~~~

[snip]
super-intel.c: In function 'apply_takeover_update':
| super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
| " MISSING_%d", du->index);
| ^~

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...maybe-uninitialized-format-overflow-warni.patch | 60 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch
new file mode 100644
index 0000000..237f83a
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch
@@ -0,0 +1,60 @@
+From bf457a83834932ba06de3528b8779a023e73fa7b Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 12 Mar 2019 16:17:29 +0800
+Subject: [PATCH] mdadm: gcc8 maybe-uninitialized/format-overflow warning
+
+while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
+it failed
+
+[snip]
+| Incremental.c: In function 'Incremental_container':
+| Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+| close(mdfd);
+| ^~~~~~~~~~~
+
+[snip]
+super-intel.c: In function 'apply_takeover_update':
+| super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
+| " MISSING_%d", du->index);
+| ^~
+
+Upstream-Status: Submitted [https://github.com/neilbrown/mdadm/pull/36]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Incremental.c | 2 +-
+ super-intel.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Incremental.c b/Incremental.c
+index a4ff7d4..b667868 100644
+--- a/Incremental.c
++++ b/Incremental.c
+@@ -1500,7 +1500,7 @@ static int Incremental_container(struct supertype *st, char *devname,
+ 		return 0;
+ 	}
+ 	for (ra = list ; ra ; ra = ra->next) {
+-		int mdfd;
++		int mdfd = 0;
+ 		char chosen_name[1024];
+ 		struct map_ent *mp;
+ 		struct mddev_ident *match = NULL;
+diff --git a/super-intel.c b/super-intel.c
+index 10d7218..c3741ea 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -9612,9 +9612,9 @@ static int apply_takeover_update(struct imsm_update_takeover *u,
+ 			du->major = 0;
+ 			du->index = (i * 2) + 1;
+ 			sprintf((char *)du->disk.serial,
+-				" MISSING_%d", du->index);
++				" MISSING_%hu", du->index);
+ 			sprintf((char *)du->serial,
+-				"MISSING_%d", du->index);
++				"MISSING_%hu", du->index);
+ 			du->next = super->missing;
+ 			super->missing = du;
+ 		}
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 2d7ade6..d79c533 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
 	   file://mdadm.init \
 	   file://mdmonitor.service \
+           file://0001-mdadm-gcc8-maybe-uninitialized-format-overflow-warni.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
-- 
2.7.4


