Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB55D6B8FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 02:07:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7R27gdK012525
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 19:07:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 26 Aug 2013 19:07:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 10:07:43 +0800
Message-ID: <9a1e4babc24eccfd1a41223095791cf0799b40f4.1377568883.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377568883.git.rongqing.li@windriver.com>
References: <cover.1377568883.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libnfsidmap: Add and modify idmapd.conf
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
X-List-Received-Date: Tue, 27 Aug 2013 02:07:42 -0000
Content-Type: text/plain

From: Zhang Xiao <xiao.zhang@windriver.com>

add configuration file to make rpc.idmapd to not report below error:
	rpc.idmapd: Skipping configuration file "/etc/idmapd.conf": No such file or directory
	rpc.idmapd: Could not find group "nobody"

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../nfs-utils/files/Set_nobody_user_group.patch      |   18 ++++++++++++++++++
 .../nfs-utils/libnfsidmap_0.25.bb                    |    7 +++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch

diff --git a/meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch b/meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch
new file mode 100644
index 0000000..4633da9
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch
@@ -0,0 +1,18 @@
+Set nobody user and group
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+--- a/idmapd.conf
++++ b/idmapd.conf
+@@ -17,8 +17,8 @@
+ 
+ [Mapping]
+ 
+-#Nobody-User = nobody
+-#Nobody-Group = nobody
++Nobody-User = nobody
++Nobody-Group = nogroup
+ 
+ [Translation]
+ 
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index 07ca229..77c4a00 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -9,6 +9,7 @@ PR = "r0"
 
 SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${PV}.tar.gz \
            file://fix-ac-prereq.patch \
+           file://Set_nobody_user_group.patch \
           "
 
 SRC_URI[md5sum] = "2ac4893c92716add1a1447ae01df77ab"
@@ -17,3 +18,9 @@ SRC_URI[sha256sum] = "656d245d84400e1030f8f40a5a27da76370690c4a932baf249110f047f
 inherit autotools
 
 EXTRA_OECONF = "--disable-ldap"
+
+do_install_append () {
+	install -d ${D}${sysconfdir}/
+	install -m 0644 ${WORKDIR}/${BPN}-${PV}/idmapd.conf ${D}${sysconfdir}/idmapd.conf
+}
+
-- 
1.7.10.4


