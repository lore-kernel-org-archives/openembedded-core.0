Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 199E66D350
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 12:40:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA7CeLGo008108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 04:40:21 -0800 (PST)
Received: from PKE-CLU1-D1.wrs.com (128.224.162.203) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 04:40:21 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2013 20:40:18 +0800
Message-ID: <1383828018-8432-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] avahi: fix avahi status command error prompt
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
X-List-Received-Date: Thu, 07 Nov 2013 12:40:20 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

service --status-all command will display wrong status for avahi-daemon.
This commit fix this error prompt and make service display right status
for avahi-daemon.

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    1 +
 ...ahi-fix-avahi-status-command-error-prompt.patch |   52 ++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index cf063db..00622f3 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -25,6 +25,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://avahi_fix_install_issue.patch \
           file://fix_for_automake_1.12.x.patch \
           file://out-of-tree.patch \
+          file://0001-avahi-fix-avahi-status-command-error-prompt.patch \
           "
 
 USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
diff --git a/meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch b/meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch
new file mode 100644
index 0000000..7590df7
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch
@@ -0,0 +1,52 @@
+From f774ac25f436a782ccccc4dbe68378a684596799 Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Thu, 7 Nov 2013 14:36:28 +0800
+Subject: [PATCH] avahi: fix avahi status command error prompt
+
+service --status-all command will display wrong status for avahi-daemon.
+This commit fix this error prompt and make service display right status
+for avahi-daemon.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+---
+ initscript/debian/avahi-daemon.in |   14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/initscript/debian/avahi-daemon.in b/initscript/debian/avahi-daemon.in
+index 4793b46..49ec358 100755
+--- a/initscript/debian/avahi-daemon.in
++++ b/initscript/debian/avahi-daemon.in
+@@ -153,7 +153,15 @@ d_reload() {
+ #       Function that check the status of the daemon/service.
+ #
+ d_status() {
+-    $DAEMON -c && echo "$DESC is running" || echo "$DESC is not running"
++    $DAEMON -c
++    status=$?
++    if [ $status = 0 ]; then
++        echo "$DESC is running"
++        return 0
++    else
++        echo "$DESC is not running"
++        return 3
++    fi
+ }
+ 
+ case "$1" in
+@@ -182,9 +190,9 @@ case "$1" in
+         d_status
+ 	;;
+     *)
+-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|reload}" >&2
++        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|reload|status}" >&2
+         exit 1
+         ;;
+ esac
+ 
+-exit 0
++exit $?
+-- 
+1.7.9.5
+
-- 
1.7.9.5


