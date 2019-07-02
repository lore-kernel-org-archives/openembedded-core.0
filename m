Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 007DD7EAF0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:33:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x628WssH002223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:33:04 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Jul 2019 01:32:44 -0700
From: <kai.kang@windriver.com>
To: <chris_larson@mentor.com>
Date: Tue, 2 Jul 2019 04:32:40 -0400
Message-ID: <20190702083240.30395-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] rng-tools: fix rngd blocks system shutdown
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
X-List-Received-Date: Tue, 02 Jul 2019 08:33:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

fix-rngd-fail-to-stop.patch is added to fix rngd blocks system shutdown
issue. But it causes rngd doesn't release CPU and causes 100% CPU
usage, so drop it.

The block shutdown issue is caused by comit [7cb64b9fe1 rng-tools: start
earlier in the boot process] which updated rngd.service. Revert the
modification of rngd.service.

Update sed expressions in do_install as well which fails to replace
second match in one line.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../rng-tools/fix-rngd-fail-to-stop.patch     | 25 -------------------
 .../rng-tools/rng-tools/rngd.service          |  3 ---
 .../rng-tools/rng-tools_6.7.bb                |  5 ++--
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch b/meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch
deleted file mode 100644
index 58cf3f9d59..0000000000
--- a/meta/recipes-support/rng-tools/rng-tools/fix-rngd-fail-to-stop.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-It fails to stop rngd. It just shows warnings when stop rngd such as by:
-
-$ systemctl stop rngd.service
-
-but stalls shutdown untill daemon rngd is killed.
-
-Backport patch to fix the issue.
-
-Upstream-Status: Backport [https://bugzilla.redhat.com/show_bug.cgi?id=1690364#c8]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/rngd_jitter.c b/rngd_jitter.c
-index 54070ae..7a69bf9 100644
---- a/rngd_jitter.c
-+++ b/rngd_jitter.c
-@@ -280,7 +280,7 @@ static void *thread_entropy_task(void *data)
- 
- 		/* Write to pipe */
- 		written = 0;
--		while(written != me->buf_sz) {
-+		while(me->active && written != me->buf_sz) {
- 			message(LOG_DAEMON|LOG_DEBUG, "Writing to pipe\n");
- 			ret = write(me->pipe_fd, &tmpbuf[written], me->buf_sz - written);
- 			message(LOG_DAEMON|LOG_DEBUG, "DONE Writing to pipe with return %ld\n", ret);
diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index b1a78527be..49d5de294f 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -1,8 +1,5 @@
 [Unit]
 Description=Hardware RNG Entropy Gatherer Daemon
-DefaultDependencies=no
-After=systemd-udev-settle.service
-Before=sysinit.target
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.7.bb b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
index aeb558b2b7..b4e453f67f 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.7.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
@@ -10,7 +10,6 @@ DEPENDS = "sysfsutils"
 
 SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
-    file://fix-rngd-fail-to-stop.patch \
     file://init \
     file://default \
     file://rngd.service \
@@ -46,8 +45,8 @@ do_install_append() {
     install -Dm 0644 ${WORKDIR}/rngd.service \
                      ${D}${systemd_system_unitdir}/rngd.service
     sed -i \
-        -e 's,@SYSCONFDIR@,${sysconfdir},' \
-        -e 's,@SBINDIR@,${sbindir},' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
         ${D}${sysconfdir}/init.d/rng-tools \
         ${D}${systemd_system_unitdir}/rngd.service
 }
-- 
2.20.0


