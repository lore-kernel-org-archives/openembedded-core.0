Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56CC870436
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 02:32:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M2W7KJ023321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 19:32:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 21 Jul 2014 19:32:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 10:32:15 +0800
Message-ID: <3777fcb67381393b494ac5fcb042ba8bc9fa8acb.1405996037.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405996037.git.Qi.Chen@windriver.com>
References: <cover.1405996037.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] shadow: fix the behavior of su
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
X-List-Received-Date: Tue, 22 Jul 2014 02:32:07 -0000
Content-Type: text/plain

In systems where bash is not installed and /bin/sh is provided by
busybox. Commands like `su -l -c '/home/root/test' xuser' would fail
complaining the the 'su' applet could not be found.

This patch references the old version of shadow to keep the behaviour
the way it was in old version so that we would avoid the problem mentioned
above.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-su.c-fix-to-exec-command-correctly.patch  |   25 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch

diff --git a/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch b/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
new file mode 100644
index 0000000..31337de
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+Subject: su.c: fix to exec command correctly
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/su.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/su.c b/src/su.c
+index 3704217..bc4f2ac 100644
+--- a/src/su.c
++++ b/src/su.c
+@@ -1156,7 +1156,7 @@ int main (int argc, char **argv)
+ 		 * Use the shell and create an argv
+ 		 * with the rest of the command line included.
+ 		 */
+-		argv[-1] = cp;
++		argv[-1] = shellstr;
+ 		execve_shell (shellstr, &argv[-1], environ);
+ 		err = errno;
+ 		(void) fprintf (stderr,
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 66541f4..84d1f86 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://usermod-fix-compilation-failure-with-subids-disabled.patch \
            file://fix-installation-failure-with-subids-disabled.patch \
+           file://0001-su.c-fix-to-exec-command-correctly.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
1.7.9.5


