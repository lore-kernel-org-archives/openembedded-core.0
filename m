Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01A906B5CC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 08:08:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7788txs016862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 01:08:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 01:08:52 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2013 16:08:55 +0800
Message-ID: <d110df04f817c3a1c7786a2ce943fe40ebd4e1c5.1375862591.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375862591.git.Qi.Chen@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com, chen_q07@163.com
Subject: [PATCH V4 07/10] initscripts: use a uniform way to handle directories in read-only rootfs
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
X-List-Received-Date: Wed, 07 Aug 2013 08:08:56 -0000
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
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   44 ++++++++++++++++++--
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    5 +++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index d523924..eb89e18 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -1,15 +1,51 @@
 #!/bin/sh
 
 . /etc/init.d/functions
+READONLY_CFGDIR="/etc/default/readonly"
 
 ROOTFS_READ_ONLY=`is_rootfs_readonly`
 
 [ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
 
+is_on_read_only_partition () {
+    DIRECTORY=$1
+    dir=`readlink -f $DIRECTORY`
+    while true; do
+	if [ ! -d "$dir" ]; then
+	    echo "ERROR: $dir is not a directory"
+	    exit 1
+	else
+	    for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
+		[ "$flag" = "FOUND" ] && partition="read-write"
+		[ "$flag" = "ro" ] && { partition="read-only"; break; }
+	    done
+	fi
+	if [ "$dir" = "/" -o -n "$partition" ]; then
+	    break
+	else
+	    dir=`dirname $dir`
+	fi
+    done
+    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
+}
+
+apply_conf () {
+    cfgfile=$1
+    cat $cfgfile | while read line; do
+	eval `echo "$line" | sed -n "s/\(.*\)\ \(.*\)/DIR_READONLY=\1; DIR_VOLATILE=\2;/p"`
+	if [ `is_on_read_only_partition $DIR_READONLY` = "yes" ]; then
+	    mkdir -p $DIR_VOLATILE
+	    cp -a $DIR_READONLY/* $DIR_VOLATILE 2>/dev/null
+	    cp -a $DIR_READONLY/.[!.]* $DIR_VOLATILE 2>/dev/null
+	    mount --bind $DIR_VOLATILE $DIR_READONLY
+	fi
+    done
+}
+
 if [ "$1" = "start" ] ; then
-	grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
-	mkdir -p /var/volatile/lib
-	cp -a /var/lib/* /var/volatile/lib
-	mount --bind /var/volatile/lib /var/lib
+    grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
+    for file in `ls -1 "$READONLY_CFGDIR"`; do
+	apply_conf "$READONLY_CFGDIR/$file"
+    done
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


