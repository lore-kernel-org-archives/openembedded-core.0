Return-Path: <Rui.Wang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3796C51A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 03:32:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB43W94e011285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2018 19:32:30 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 3 Dec 2018 19:32:22 -0800
From: Rui Wang <rui.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Dec 2018 19:32:21 -0800
Message-ID: <20181204033221.4378-1-rui.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] initscripts: fix missing chkconfig header in initscript
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
X-List-Received-Date: Tue, 04 Dec 2018 03:32:40 -0000
Content-Type: text/plain

chkconfig needs a specific header to work properly,
which indicates the initial start and stop order.
Or it will mess up the priority of init scripts while
enable or disable service. So it will be necessary to
add this header into init script which supports
chkconfig.

Signed-off-by: Rui Wang <rui.wang@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon    | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver    | 1 +
 meta/recipes-core/busybox/files/hwclock.sh                 | 1 +
 meta/recipes-core/busybox/files/syslog                     | 1 +
 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init     | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/halt         | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/reboot       | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh  | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/sendsigs     | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/umountfs     | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh | 1 +
 meta/recipes-core/initscripts/initscripts-1.0/urandom      | 1 +
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init          | 1 +
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init   | 1 +
 meta/recipes-extended/cronie/cronie/crond.init             | 1 +
 meta/recipes-extended/rpcbind/rpcbind/init.d               | 1 +
 17 files changed, 17 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index 992267d5a1..44f9e896ff 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: 2345 19 71
 ### BEGIN INIT INFO
 # Provides:          nfs-common
 # Required-Start:    $portmap hwclock
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index d5e9c38a9c..2772bb4b6c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: 2345 20 80
 ### BEGIN INIT INFO
 # Provides:          nfs-kernel-server
 # Required-Start:    $remote_fs nfs-common $portmap hwclock
diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
index be5f94d86c..706126db1d 100644
--- a/meta/recipes-core/busybox/files/hwclock.sh
+++ b/meta/recipes-core/busybox/files/hwclock.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: S 20 80
 ### BEGIN INIT INFO
 # Provides:          hwclock
 # Required-Start:    
diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 89c4d12e9c..083d07c994 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -1,4 +1,5 @@
 #! /bin/sh
+# chkconfig: 2345 20 80
 ### BEGIN INIT INFO
 # Provides:             sysklogd
 # Required-Start:       $remote_fs $time
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
index fb31c635be..1fc90bce98 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
@@ -1,4 +1,5 @@
 #!/bin/sh -e
+# chkconfig: S 10 90
 ### BEGIN INIT INFO
 # Provides:          networking
 # Required-Start:    mountvirtfs $local_fs
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/halt b/meta/recipes-core/initscripts/initscripts-1.0/halt
index a56f73421b..dd0a59f25c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/halt
+++ b/meta/recipes-core/initscripts/initscripts-1.0/halt
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: - 90 10
 ### BEGIN INIT INFO
 # Provides:          halt
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/reboot b/meta/recipes-core/initscripts/initscripts-1.0/reboot
index 087d8d5da4..6cf19f520b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/reboot
+++ b/meta/recipes-core/initscripts/initscripts-1.0/reboot
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: - 90 10
 ### BEGIN INIT INFO
 # Provides:          reboot
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh b/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
index 76de3418ac..a10139d44d 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/rmnologin.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: 2345 99 01
 ### BEGIN INIT INFO
 # Provides:          rmnologin
 # Required-Start:    $remote_fs $all
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index 1632a5f649..abcdf5db06 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: S 25 75
 ### BEGIN INIT INFO
 # Provides:          save-rtc
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sendsigs b/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
index 34e1b7714b..bae2bbba01 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sendsigs
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: - 20 80
 ### BEGIN INIT INFO
 # Provides:          sendsigs
 # Required-Start:    
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountfs b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
index 7fb5c58b3e..64d94019bd 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountfs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: - 40 60
 ### BEGIN INIT INFO
 # Provides:          umountfs
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
index af075407fd..8ccbfee0ae 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountnfs.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: - 31 69
 ### BEGIN INIT INFO
 # Provides:          umountnfs
 # Required-Start:
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom b/meta/recipes-core/initscripts/initscripts-1.0/urandom
index af1625b5fd..a295931b5b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
+++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: S 30 70
 ### BEGIN INIT INFO
 # Provides:          urandom
 # Required-Start:    $local_fs mountvirtfs
diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index df5aa430cf..cac04de77c 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -1,4 +1,5 @@
 #! /bin/sh
+# chkconfig: S 99 01
 ### BEGIN INIT INFO
 # Provides:          bootlogd
 # Required-Start:
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
index f90208555b..eb0d7cc428 100755
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: 35 99 01
 ### BEGIN INIT INFO
 # Provides:          tcf-agent
 # Default-Start:     3 5
diff --git a/meta/recipes-extended/cronie/cronie/crond.init b/meta/recipes-extended/cronie/cronie/crond.init
index 53b8514caa..6ac908eeea 100755
--- a/meta/recipes-extended/cronie/cronie/crond.init
+++ b/meta/recipes-extended/cronie/cronie/crond.init
@@ -1,4 +1,5 @@
 #!/bin/sh
+# chkconfig: 2345 90 10
 ### BEGIN INIT INFO
 # Provides: crond crontab
 # Default-Start:  2345
diff --git a/meta/recipes-extended/rpcbind/rpcbind/init.d b/meta/recipes-extended/rpcbind/rpcbind/init.d
index 67499aa828..63c5a5084e 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/init.d
+++ b/meta/recipes-extended/rpcbind/rpcbind/init.d
@@ -2,6 +2,7 @@
 #
 # start/stop rpcbind daemon.
 
+# chkconfig: S2345 12 88
 ### BEGIN INIT INFO
 # Provides:          rpcbind
 # Required-Start:    $network
-- 
2.17.1


