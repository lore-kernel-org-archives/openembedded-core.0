Return-Path: <Li.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC9F360167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 10:20:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s89AKZnU010228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Sep 2014 03:20:35 -0700 (PDT)
Received: from lwang1-OptiPlex-9010.corp.ad.wrs.com (128.224.163.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Sep 2014 03:20:35 -0700
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 18:20:23 +0800
Message-ID: <1410258023-4285-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Tue, 09 Sep 2014 10:20:39 -0000
Content-Type: text/plain

make start-statd command to use nfscommon configure, too.

Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../files/nfs-utils-debianize-start-statd.patch    |   36 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.8.bb                   |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch

diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
new file mode 100644
index 0000000..a9894f9
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
@@ -0,0 +1,36 @@
+From aa7c38e728cffa33085991bb9b041793759fb9d9 Mon Sep 17 00:00:00 2001
+From: Li Wang <li.wang@windriver.com>
+Date: Fri, 5 Sep 2014 01:39:10 +0800
+Subject: [PATCH] nfs-utils: debianize start-statd
+
+make start-statd command to use nfscommon configure, too.
+
+Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ utils/statd/start-statd |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/utils/statd/start-statd b/utils/statd/start-statd
+index c7805ee..78a5525 100644
+--- a/utils/statd/start-statd
++++ b/utils/statd/start-statd
+@@ -4,6 +4,14 @@
+ # /var/run/rpc.statd.pid).
+ # It should run run statd with whatever flags are apropriate for this
+ # site.
++
++# Read config
++DEFAULTFILE=/etc/default/nfs-common
++NEED_IDMAPD=
++if [ -f $DEFAULTFILE ]; then
++    . $DEFAULTFILE
++fi
++
+ PATH=/sbin:/usr/sbin
+-exec rpc.statd --no-notify
++exec rpc.statd --no-notify $STATDOPTS
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index fde8776..1e89123 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -16,6 +16,7 @@ RRECOMMENDS_${PN} = "kernel-module-nfsd"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
+           file://nfs-utils-debianize-start-statd.patch \
            file://nfsserver \
            file://nfscommon \
            file://nfs-utils.conf \
-- 
1.7.9.5


