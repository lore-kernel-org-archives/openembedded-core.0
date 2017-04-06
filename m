Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id BBB6D77C29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 17:40:17 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3vzVNL1M5jz1qrMj;
	Thu,  6 Apr 2017 19:40:18 +0200 (CEST)
X-Auth-Info: hsqSjW0TeBZ5I6mcVQQL+GZXjgCT6BXd6BGqRpsZays=
Received: from kurokawa.lan (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3vzVNK5rDRzvdWQ;
	Thu,  6 Apr 2017 19:40:17 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 19:40:04 +0200
Message-Id: <20170406174004.1895-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [RFC][PATCH] lsb: Remove bashisms from the rc.d functions
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
X-List-Received-Date: Thu, 06 Apr 2017 17:40:19 -0000

This bashism prevents functions from working on systems without bash,
ie. on systems with busybox shell or debian dash. Replace them with
bourne-compatible command instead.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
NOTE: Does this lsbscripts have upstream somewhere ?
---
 .../0002-rc.d-Remove-bashism-from-functions.patch  | 48 ++++++++++++++++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.68.bb   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-Remove-bashism-from-functions.patch

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-Remove-bashism-from-functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-Remove-bashism-from-functions.patch
new file mode 100644
index 0000000000..44eed1cc18
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-Remove-bashism-from-functions.patch
@@ -0,0 +1,48 @@
+From b7601dcd4663a9cb936a6d2d224665bea69fcc50 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 6 Apr 2017 19:15:56 +0200
+Subject: [PATCH] rc.d: Remove bashism from functions
+
+This bashism prevents functions from working on systems without bash,
+ie. on systems with busybox shell or debian dash. Replace them with
+bourne-compatible command instead.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ rc.d/init.d/functions | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
+index 746b37d..3ba21ef 100644
+--- a/rc.d/init.d/functions
++++ b/rc.d/init.d/functions
+@@ -115,15 +115,11 @@ __kill_pids_term_kill_checkpids() {
+     local pid=
+     local pids=$*
+     local remaining=
+-    local stat=
+     local stime=
+ 
+     for pid in $pids ; do
+         [ ! -e  "/proc/$pid" ] && continue
+-        read -r line < "/proc/$pid/stat" 2> /dev/null
+-
+-        stat=($line)
+-        stime=${stat[21]}
++        stime=`cut -d " " -f 22 < /proc/self/stat`
+ 
+         [ -n "$stime" ] && [ "$base_stime" -lt "$stime" ] && continue
+         remaining+="$pid "
+@@ -139,8 +135,7 @@ __kill_pids_term_kill() {
+     local try=0
+     local delay=3;
+     local pid=
+-    local stat=($(< /proc/self/stat))
+-    local base_stime=${stat[21]}
++    local base_stime=`cut -d " " -f 22 < /proc/self/stat`
+ 
+     if [ "$1" = "-d" ]; then
+         delay=$2
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
index 0c08fffcef..9ba0e01776 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
@@ -11,6 +11,7 @@ S="${WORKDIR}/initscripts-${PV}"
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/6a51a5af38e01445f53989ed0727c3e1/initscripts-${PV}.tar.bz2 \
            file://functions.patch \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
+	   file://0002-rc.d-Remove-bashism-from-functions.patch \
           " 
 
 SRC_URI[md5sum] = "6a51a5af38e01445f53989ed0727c3e1"
-- 
2.11.0


