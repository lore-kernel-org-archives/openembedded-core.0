Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A84406D46F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:26:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAB9Q5tp019104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 01:26:05 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 01:26:05 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 17:26:09 +0800
Message-ID: <4a6d151074df764b710a8f038dd6369f11284be4.1384161495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384161495.git.Qi.Chen@windriver.com>
References: <cover.1384161495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysvinit: fix problem in switching runlevels
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
X-List-Received-Date: Mon, 11 Nov 2013 09:26:05 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Previously, if we switch to runlevel 1 and then switch back to runlevel
5, the network interface will be brought down and the NFS service will
not be restarted correctly.

The problem is that the networking and rpcbind services are brought down
in runlevel 1 but not brought up in runlevel 5.

This patch fixes the above problem. It's based on the assumption that
in sysvinit-based system, runlevel 1 does not have networking support.

This patch adjusts some init script parameters used by update-rc.d. It
makes sure that networking starts before rpcbind which in turn starts
before mountnfs.sh. When switching to runlevel 0, 1 and 6, the umountnfs.sh
is run first before stopping rpcbind service, and the network is brought
down afterwards.

[YOCTO #5513]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../init-ifupdown/init-ifupdown_1.0.bb             |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    4 ++--
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 9d3af34..0f4290c 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -9,7 +9,7 @@ PR = "r3"
 inherit update-rc.d
 
 INITSCRIPT_NAME = "networking"
-INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
+INITSCRIPT_PARAMS = "start 10 2 3 4 5 . stop 80 0 6 1 ."
 
 SRC_URI = "file://copyright \
            file://init \
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 2d58266..d46ba67 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -108,7 +108,7 @@ do_install () {
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
 	update-rc.d -r ${D} sendsigs start 20 0 6 .
 	update-rc.d -r ${D} urandom start 30 S 0 6 .
-	update-rc.d -r ${D} umountnfs.sh start 31 0 6 .
+	update-rc.d -r ${D} umountnfs.sh start 31 0 1 6 .
 	update-rc.d -r ${D} umountfs start 40 0 6 .
 	update-rc.d -r ${D} reboot start 90 6 .
 	update-rc.d -r ${D} halt start 90 0 .
@@ -117,7 +117,7 @@ do_install () {
 	update-rc.d -r ${D} checkroot.sh start 06 S .
 	update-rc.d -r ${D} mountall.sh start 03 S .
 	update-rc.d -r ${D} hostname.sh start 39 S .
-	update-rc.d -r ${D} mountnfs.sh start 45 S .
+	update-rc.d -r ${D} mountnfs.sh start 15 2 3 4 5 .
 	update-rc.d -r ${D} bootmisc.sh start 55 S .
 	update-rc.d -r ${D} sysfs.sh start 02 S .
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index a75e4e1..16fb7b7 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 
 INITSCRIPT_NAME = "rpcbind"
-INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
+INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
 
 SYSTEMD_SERVICE_${PN} = "rpcbind.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.7.9.5


