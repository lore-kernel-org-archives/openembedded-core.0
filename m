Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB38A6A5A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 07:12:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A7D1FE014562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 00:13:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 00:13:00 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 15:12:59 +0800
Message-ID: <afc49ee69b585666f57d826e2e5f526335f62835.1373440331.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373440331.git.Qi.Chen@windriver.com>
References: <cover.1373440331.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] init-live.sh: allow users to choose the boot action
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
X-List-Received-Date: Wed, 10 Jul 2013 07:13:00 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, the boot action for live images was totally determined
by the LABEL value in the boot parameters (/proc/cmdline).

This behavior is not very convenient for users. The user may just want
to drop to a shell for troubleshooting the live image, or the user may
want to try to install the live image while the LABEL value is 'boot'.

We should provide the users a chance to choose the boot action when
the live image starts up.

This patch starts to implement this behavior by providing three choices
at boot time, 'boot', 'install' and 'shell'.

[YOCTO #4784]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 890c562..2300381 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -73,6 +73,39 @@ read_args() {
     done
 }
 
+get_choice_from_user () {
+    # get the choice from user, determine the value of label
+    echo ""
+    echo "Boot options [6 seconds timeout]:"
+    echo "[1] boot: boot the live image"
+    echo "[2] install: install the live image to a local disk"
+    echo "[3] shell: drop to a shell"
+    while true; do
+       echo -n "Please enter your choice number [default action is $label]: "
+       read -t 6 choice
+       case "$choice" in
+           "")
+               break
+               ;;
+           "1")
+               label="boot"
+               break
+               ;;
+           "2")
+               label="install"
+               break
+               ;;
+           "3")
+               label="shell"
+               break
+               ;;
+           *)
+               echo "Invalid input"
+               ;;
+       esac
+    done
+}
+
 boot_live_root() {
     # Watches the udev event queue, and exits if all current events are handled
     udevadm settle --timeout=3 --quiet
@@ -192,6 +225,9 @@ mount_and_boot() {
     boot_live_root
 }
 
+# Get choice from user
+get_choice_from_user
+
 case $label in
     boot)
 	mount_and_boot
@@ -206,4 +242,7 @@ case $label in
 	# If we're getting here, we failed...
 	fatal "Installation image failed"
 	;;
+    shell)
+	exec sh
+	;;
 esac
-- 
1.7.9.5


