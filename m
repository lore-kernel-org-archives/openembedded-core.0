Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85F7E6AE9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 05:00:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5S509OX021953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 22:00:10 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 27 Jun 2013 22:00:08 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 13:00:27 +0800
Message-ID: <a09510a0b0b388029c673ff1725a09e6ae99856d.1372389991.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372389991.git.Qi.Chen@windriver.com>
References: <cover.1372389991.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] udev-cache: take a read-only rootfs into consideration
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
X-List-Received-Date: Fri, 28 Jun 2013 05:00:07 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

In case of a read-only rootfs, no matter the /etc is read-only or
it's bind mounted with tmpfs, the udev cache handling should be
skipped, as the data cannot be persisted between reboots.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev/init       |    5 +++--
 meta/recipes-core/udev/udev/udev-cache |    6 ++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 9b81700..38ea666 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -18,6 +18,7 @@ export TZ=/etc/localtime
 [ -x @UDEVD@ ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 
 readfile () {
    filename=$1
@@ -52,8 +53,8 @@ case "$1" in
     mount -a -t tmpfs 2>/dev/null
     mkdir -p /var/volatile/tmp
 
-    # cache handling
-    if [ "$DEVCACHE" != "" ]; then
+    # Cache handling. Skip cache handling in case of a read-only rootfs.
+    if [ "$ROOTFS_READ_ONLY" = "no" -a "$DEVCACHE" != "" ]; then
             readfile /proc/version
             VERSION="$READDATA"
             readfile /proc/cmdline
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 8a84fa9..3e0eff6 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -15,8 +15,14 @@ export TZ=/etc/localtime
 [ -x @UDEVD@ ] || exit 1
 [ -d /sys/class ] || exit 1
 
+[ -f /etc/default/rcS ] && . /etc/default/rcS
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
+if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
+    [ "$VERBOSE" != "no" ] && echo "read-only rootfs, skip udev-cache"
+    exit 0
+fi
+
 if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
 	echo "Populating dev cache"
 	(cd /; tar cf "$DEVCACHE" dev)
-- 
1.7.9.5


