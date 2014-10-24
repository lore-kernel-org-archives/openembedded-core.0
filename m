Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1C3965C9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 05:32:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O5Wlbq006010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 22:32:47 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 22:32:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 13:32:46 +0800
Message-ID: <1414128766-13586-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 2/2] nfs-utils: debianize start-statd
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
X-List-Received-Date: Fri, 24 Oct 2014 05:33:00 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

make start-statd command to use nfscommon configure, too.

Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../files/nfs-utils-debianize-start-statd.patch    | 39 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch

diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
new file mode 100644
index 0000000..78e5eed
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
@@ -0,0 +1,39 @@
+[PATCH] nfs-utils: debianize start-statd
+
+Upstream-status: Pending
+
+make start-statd command to use nfscommon configure, too.
+
+Signed-off-by: Henrik Riomar <henrik.riomar@ericsson.com>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ utils/statd/start-statd |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/utils/statd/start-statd b/utils/statd/start-statd
+index 803aeba..7d3c07b 100644
+--- a/utils/statd/start-statd
++++ b/utils/statd/start-statd
+@@ -4,9 +4,17 @@
+ # /var/run/rpc.statd.pid).
+ # It should run statd with whatever flags are apropriate for this
+ # site.
++
+ PATH=/bin:/usr/sbin:/sbin
++# Read config
++DEFAULTFILE=/etc/default/nfs-common
++NEED_IDMAPD=
++if [ -f $DEFAULTFILE ]; then
++    . $DEFAULTFILE
++fi
++
+ if systemctl start statd.service 2>/dev/null
+ then :
+ else
+-    exec rpc.statd --no-notify
++    exec rpc.statd --no-notify $STATDOPTS
+ fi
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 4933e10..8ead5d0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-statd-fixed-the-with-statdpath-flag.patch \
            file://fix-a-Gcc-undefined-behavior.patch \
            file://fix-the-start-statd.patch \
+           file://nfs-utils-debianize-start-statd.patch \
 "
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
-- 
1.9.1


