Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 945F27EF02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 12:24:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.62,474,1554760800"; 
   d="scan'208";a="8148632"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 10 Jul 2019 14:14:26 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Wed, 10 Jul 2019 14:14:26 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 10 Jul 2019 14:14:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1562760866; x=1594296866;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=bA9zg/MTa378i+y5xDIbTPktd2MPI0Y4dteTnZ5NH2w=;
	b=aQqqFPyKLAu4z9uppyM+TJPMVUJQVCRQupW6Vs2bkfQ08J7a8VWDssVs
	ieyugEbRngd7TvsR8Rniv7D8l7/y61yX39DIYuWZHXdijYt1Gnz8b7StX
	a3Q4Cuqejv3T0ZsCB8/QPtUiHuaC+8CGc0sNyjAFrDrLADmdiB1nAnXOP
	IvQu6nefxDWDMfjgT/imjMGrvPleVoT4QeuGcYPBaPGtr2pzc3qRJgo6Z
	yTl+PrH1n3r/5VgDUQX0s5ltL6TFAYwBnFgHhWBsVj5tod+0UGqnRvTQh
	2G3iEOP38Bwk5lBx6grf5HJ+2eYeygZO4RlUYNiFz9NFLfzWm5one3z92 A==;
X-IronPort-AV: E=Sophos;i="5.62,474,1554760800"; 
   d="scan'208";a="8148631"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 10 Jul 2019 14:14:26 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 7D277280074;
	Wed, 10 Jul 2019 14:15:01 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 14:14:20 +0200
Message-Id: <20190710121420.398-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH warrior] systemd: backport patch to fix sysctl warning on boot
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
X-List-Received-Date: Wed, 10 Jul 2019 12:24:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to improved validation of sysctl settings in recent kernels (5.2+, but
also stable kernels like 4.19.53), systemd will log an error message like

    systemd[1]: Failed to bump fs.file-max, ignoring: Invalid argument

during boot. Backport the bugfix from the systemd master.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 ...-max-sysctl-to-LONG_MAX-rather-than-.patch | 39 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch b/meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch
new file mode 100644
index 0000000000..ff64f58c9c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch
@@ -0,0 +1,39 @@
+From 6e2f78948403a4cce45b9e34311c9577c624f066 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 17 Jun 2019 10:51:25 +0200
+Subject: [PATCH] core: set fs.file-max sysctl to LONG_MAX rather than
+ ULONG_MAX
+
+Since kernel 5.2 the kernel thankfully returns proper errors when we
+write a value out of range to the sysctl. Which however breaks writing
+ULONG_MAX to request the maximum value. Hence let's write the new
+maximum value instead, LONG_MAX.
+
+/cc @brauner
+
+Fixes: #12803
+
+Upstream-Status: Backport
+
+Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
+---
+ src/core/main.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/core/main.c b/src/core/main.c
+index b33ea1b5b5..e7f51815f0 100644
+--- a/src/core/main.c
++++ b/src/core/main.c
+@@ -1245,9 +1245,9 @@ static void bump_file_max_and_nr_open(void) {
+ #endif
+ 
+ #if BUMP_PROC_SYS_FS_FILE_MAX
+-        /* I so wanted to use STRINGIFY(ULONG_MAX) here, but alas we can't as glibc/gcc define that as
+-         * "(0x7fffffffffffffffL * 2UL + 1UL)". Seriously. 😢 */
+-        if (asprintf(&t, "%lu\n", ULONG_MAX) < 0) {
++        /* The maximum the kernel allows for this since 5.2 is LONG_MAX, use that. (Previously thing where
++         * different but the operation would fail silently.) */
++        if (asprintf(&t, "%li\n", LONG_MAX) < 0) {
+                 log_oom();
+                 return;
+         }
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index eb3242d624..17d3bc1864 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
            file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
+           file://0001-core-set-fs.file-max-sysctl-to-LONG_MAX-rather-than-.patch \
            "
 
 # patches needed by musl
-- 
2.17.1


