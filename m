Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEB4E6AC01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 05:38:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9K5cCCx009572
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 22:38:12 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 19 Oct 2014 22:38:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Oct 2014 13:38:14 +0800
Message-ID: <1413783494-10269-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2] nfs-utils: fix start-statd
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
X-List-Received-Date: Mon, 20 Oct 2014 05:38:15 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. add /bin to PATH of start-statd, otherwise systemctl can not be found.
2. drop error when systemd fails to start statd.service; since if it failed,
rpc.statd will be called directly.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../nfs-utils/nfs-utils/fix-the-start-statd.patch  |   30 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
new file mode 100644
index 0000000..b7e835e
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-the-start-statd.patch
@@ -0,0 +1,30 @@
+[PATCH] fix the start-statd
+
+Upstream-Status: Pending
+
+1. add /bin/ to PATH, since systemctl is installed under /bin/
+2. redirect error to /dev/null
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ utils/statd/start-statd |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/utils/statd/start-statd b/utils/statd/start-statd
+index cde3583..098ce70 100644
+--- a/utils/statd/start-statd
++++ b/utils/statd/start-statd
+@@ -4,8 +4,8 @@
+ # /var/run/rpc.statd.pid).
+ # It should run statd with whatever flags are apropriate for this
+ # site.
+-PATH=/sbin:/usr/sbin
+-if systemctl start statd.service
++PATH=/sbin:/usr/sbin:/bin
++if systemctl start statd.service 2>/dev/null
+ then :
+ else
+     exec rpc.statd --no-notify
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index f1ef6d9..4933e10 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://0001-statd-fixed-the-with-statdpath-flag.patch \
            file://fix-a-Gcc-undefined-behavior.patch \
+           file://fix-the-start-statd.patch \
 "
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
-- 
1.7.10.4


