Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64A3C6F09E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 02:34:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2R2YHCx014492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 19:34:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 19:34:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 10:34:41 +0800
Message-ID: <cacc3ff8e2b9248c542c5224ab8505a7673610e2.1395887644.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395887644.git.Qi.Chen@windriver.com>
References: <cover.1395887644.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 27 Mar 2014 02:34:16 -0000
Content-Type: text/plain

This patch adds support for read-only rootfs to the bind service.
Basically it just bind mounts several directories so that the bind
service could start correctly without reporting any error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../init.d-add-support-for-read-only-rootfs.patch  |   65 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    2 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch

diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
new file mode 100644
index 0000000..11db95e
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -0,0 +1,65 @@
+Subject: init.d: add support for read-only rootfs
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ init.d |   40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/init.d b/init.d
+index 0111ed4..24677c8 100644
+--- a/init.d
++++ b/init.d
+@@ -6,8 +6,48 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
+ # Don't modify this line, change or create /etc/default/bind9.
+ OPTIONS=""
+ 
++test -f /etc/default/rcS && . /etc/default/rcS
+ test -f /etc/default/bind9 && . /etc/default/bind9
+ 
++# This function is here because it's possible that /var and / are on different partitions.
++is_on_read_only_partition () {
++    DIRECTORY=$1
++    dir=`readlink -f $DIRECTORY`
++    while true; do
++	if [ ! -d "$dir" ]; then
++	    echo "ERROR: $dir is not a directory"
++	    exit 1
++	else
++	    for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
++		END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
++		[ "$flag" = "FOUND" ] && partition="read-write"
++		[ "$flag" = "ro" ] && { partition="read-only"; break; }
++	    done
++	    if [ "$dir" = "/" -o -n "$partition" ]; then
++		break
++	    else
++		dir=`dirname $dir`
++	    fi
++	fi
++    done
++    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
++}
++
++bind_mount () {
++    olddir=$1
++    newdir=$2
++    mkdir -p $olddir
++    cp -a $newdir/* $olddir
++    mount --bind $olddir $newdir
++}
++
++# Deal with read-only rootfs
++if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
++    [ "$VERBOSE" != "no" ] && echo "WARN: start bind service in read-only rootfs"
++    [ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
++    [ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
++fi
++
+ test -x /usr/sbin/rndc || exit 0
+ 
+ case "$1" in
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 604deb6..a190956 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://make-etc-initd-bind-stop-work.patch \
            file://mips1-not-support-opcode.diff \
            file://dont-test-on-host.patch \
+           file://init.d-add-support-for-read-only-rootfs.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
@@ -45,6 +46,7 @@ do_install_append() {
 	rm "${D}${mandir}/man1/nslookup.1"
 	rmdir "${D}${localstatedir}/run"
 	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+	install -d "${D}${localstatedir}/cache/bind"
 	install -d "${D}${sysconfdir}/bind"
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
-- 
1.7.9.5


