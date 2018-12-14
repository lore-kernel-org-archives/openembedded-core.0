Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0D9879E32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 07:31:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBE7U9l4004987
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Dec 2018 23:30:20 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 13 Dec 2018 23:29:59 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>
Date: Fri, 14 Dec 2018 15:29:56 +0800
Message-ID: <1544772596-35320-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mdadm: fix gcc-8 format-truncation warning
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
X-List-Received-Date: Fri, 14 Dec 2018 07:31:03 -0000
Content-Type: text/plain

While compiling with `-Werror=format-truncation=', it failed
[snip]
|super0.c:236:32: error: 'snprintf' output may be truncated
before the last format character [-Werror=format-truncation=]
|   snprintf(nb, sizeof(nb), "%4d", d);
|                                ^
|super0.c:236:3: note: 'snprintf' output between 5 and 12 bytes
into a destination of size 11
|   snprintf(nb, sizeof(nb), "%4d", d);
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-gcc-8-format-truncation-warning.patch | 39 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch b/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
new file mode 100644
index 0000000..fa9c8cc
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
@@ -0,0 +1,39 @@
+From 3158d3788c2e0fb75ace2c89840bd8a977fb4cb0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 14 Dec 2018 15:12:31 +0800
+Subject: [PATCH] fix gcc-8 format-truncation warning
+
+While compiling with `-Werror=format-truncation=', it failed
+[snip]
+|super0.c:236:32: error: 'snprintf' output may be truncated
+before the last format character [-Werror=format-truncation=]
+|   snprintf(nb, sizeof(nb), "%4d", d);
+|                                ^
+|super0.c:236:3: note: 'snprintf' output between 5 and 12 bytes
+into a destination of size 11
+|   snprintf(nb, sizeof(nb), "%4d", d);
+[snip]
+
+Upstream-Status: Submitted [https://github.com/neilbrown/mdadm/pull/34]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ super0.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super0.c b/super0.c
+index 756cab5..12c28da 100644
+--- a/super0.c
++++ b/super0.c
+@@ -229,7 +229,7 @@ static void examine_super0(struct supertype *st, char *homehost)
+ 	     d++) {
+ 		mdp_disk_t *dp;
+ 		char *dv;
+-		char nb[11];
++		char nb[12];
+ 		int wonly, failfast;
+ 		if (d>=0) dp = &sb->disks[d];
+ 		else dp = &sb->this_disk;
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 9118baa..7663a6b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
+           file://0001-fix-gcc-8-format-truncation-warning.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
-- 
2.7.4


