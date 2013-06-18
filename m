Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 818AA607BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 04:48:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5I4mDxr001635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 21:48:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 21:48:13 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 12:48:17 +0800
Message-ID: <5cd1e9a5b095f5d6148af27f3e715c4acf185f46.1371530846.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371530846.git.Qi.Chen@windriver.com>
References: <cover.1371530846.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] udev-cache: fix to use udev-cache correctly
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
X-List-Received-Date: Tue, 18 Jun 2013 04:48:12 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previouly, the udev-cache has no real effect even if it's installed
into the system. The key problem here is that at first boot, the
/etc/dev.tar is not present, thus resulting /dev/shm/udev.cache not
created on first boot even if udev-cache is enabled.

This patch fixes this problem. The /dev/shm/udev.cache will be created
if necessary, that is, on first boot or when some part of the system is
changed. In the latter case, the udev cache may not be valid.

[YOCTO #4738]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd/init |    6 +++++-
 meta/recipes-core/udev/udev/init       |    6 +++++-
 meta/recipes-core/udev/udev/udev-cache |    4 +---
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index 7e67a50..e369110 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -59,8 +59,12 @@ case "$1" in
                     if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
                             (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
                             not_first_boot=1
+                            [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
+                            [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
+                    else
+                            echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
                     fi
-
+            else
                     echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 95f9c03..9b81700 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -68,8 +68,12 @@ case "$1" in
                     if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
                             (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
                             not_first_boot=1
+                            [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
+                            [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
+                    else
+                            echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
                     fi
-
+            else
                     echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
             fi
     fi
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 01fec6e..8a84fa9 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -17,12 +17,10 @@ export TZ=/etc/localtime
 
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
-if [ "$DEVCACHE" != "" ]; then
+if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
 	echo "Populating dev cache"
 	(cd /; tar cf "$DEVCACHE" dev)
 	mv /dev/shm/udev.cache /etc/udev/cache.data
-else
-	rm -f /dev/shm/udev.cache
 fi
 
 exit 0
-- 
1.7.9.5


