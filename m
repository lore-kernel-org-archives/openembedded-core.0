Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 878CC72D64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 06:27:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T6RU5d001090
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 23:27:30 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 28 Jun 2015 23:27:29 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 14:22:35 +0800
Message-ID: <1435558955-30612-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] nfs-utils: debianize start-statd
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
X-List-Received-Date: Mon, 29 Jun 2015 06:27:31 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

make start-statd command to use nfscommon configure, too.

Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../files/nfs-utils-debianize-start-statd.patch    | 41 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch

diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
new file mode 100644
index 0000000..5a2d5c8
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
@@ -0,0 +1,41 @@
+[PATCH] nfs-utils: debianize start-statd
+
+Upstream-status: Pending
+
+make start-statd command to use nfscommon configure, too.
+
+Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ utils/statd/start-statd | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/utils/statd/start-statd b/utils/statd/start-statd
+index ec9383b..3969b8c 100755
+--- a/utils/statd/start-statd
++++ b/utils/statd/start-statd
+@@ -6,6 +6,13 @@
+ # site.
+ PATH="/sbin:/usr/sbin:/bin:/usr/bin"
+ 
++# Read config
++DEFAULTFILE=/etc/default/nfs-common
++NEED_IDMAPD=
++if [ -f $DEFAULTFILE ]; then
++    . $DEFAULTFILE
++fi
++
+ # First try systemd if it's installed.
+ if systemctl --help >/dev/null 2>&1; then
+     # Quit only if the call worked.
+@@ -13,4 +20,4 @@ if systemctl --help >/dev/null 2>&1; then
+ fi
+ 
+ # Fall back to launching it ourselves.
+-exec rpc.statd --no-notify
++exec rpc.statd --no-notify $STATDOPTS
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index 6f64e9d..0bcd65e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-mountd.service \
            file://nfs-statd.service \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
+           file://nfs-utils-debianize-start-statd.patch \
 "
 
 SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
-- 
1.9.1


