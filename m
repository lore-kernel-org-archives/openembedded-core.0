Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2036B1A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:39:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q7diDu002884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:39:44 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 00:39:43 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 15:39:33 +0800
Message-ID: <32e18c31ae6edea8ff2fe6ccea04add5006b5978.1374642547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374642547.git.Qi.Chen@windriver.com>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 6/9] initscripts: use a uniform way to handle directories in read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 07:39:43 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Packages in our system may need to write to some directories to function
correctly. In read-only rootfs, these directories should be made writable.

This patch uses a convenient and uniform way to handle such situations.
The read-only-rootfs-hook.sh script searches the /etc/default/readonly
diretory for config files and then apply them one by one.

The config files simply have the following format.
<original diretory> <corresponding directory in volatile story>

For example, /etc/default/readonly/initscripts have the following content.
/var/lib /var/volatile/lib

This patch only has effect for systems with read-only rootfs.

[YOCTO #4103]
[YOCTO #4888]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   17 ++++++++++++++---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    5 +++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index d523924..b61f420 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -1,15 +1,26 @@
 #!/bin/sh
 
 . /etc/init.d/functions
+READONLY_CFGDIR="/etc/default/readonly"
 
 ROOTFS_READ_ONLY=`is_rootfs_readonly`
 
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
+apply_conf () {
+	cfgfile=$1
+	cat $cfgfile | while read line; do
+		eval `echo "$line" | sed -n "s/\(.*\)\ \(.*\)/DIR_READONLY=\1; DIR_VOLATILE=\2;/p"`
+		mkdir -p $DIR_VOLATILE
+		cp -a $DIR_READONLY/* $DIR_VOLATILE
+		mount --bind $DIR_VOLATILE $DIR_READONLY
+	done
+}
+
 if [ "$1" = "start" ] ; then
 	grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
-	mkdir -p /var/volatile/lib
-	cp -a /var/lib/* /var/volatile/lib
-	mount --bind /var/volatile/lib /var/lib
+	for file in `ls -1 "$READONLY_CFGDIR"`; do
+		apply_conf "$READONLY_CFGDIR/$file"
+	done
 fi
 
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 52e1c9c..46c4c99 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -105,6 +105,11 @@ do_install () {
 	install -m 0755 ${WORKDIR}/umountfs	${D}${sysconfdir}/init.d/umountfs
 	install -m 0755		${WORKDIR}/device_table.txt		${D}${sysconfdir}/device_table
 #
+# Create config files for read-only rootfs
+#
+	install -d ${D}${sysconfdir}/default/readonly
+	echo "/var/lib /var/volatile/lib" > ${D}${sysconfdir}/default/readonly/initscripts
+#
 # Create runlevel links
 #
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
-- 
1.7.9.5


