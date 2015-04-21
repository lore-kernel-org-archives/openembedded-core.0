Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F098473D37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:30:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3L9Uiu4019134
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 02:30:44 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 21 Apr 2015 02:30:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Apr 2015 17:30:46 +0800
Message-ID: <4dc3c26daf47ec52cc46ed0b46eccbbe834cc43b.1429608585.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429608585.git.Qi.Chen@windriver.com>
References: <cover.1429608585.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] shadow: fix `su' behaviour
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
X-List-Received-Date: Tue, 21 Apr 2015 09:30:43 -0000
Content-Type: text/plain

0001-su.c-fix-to-exec-command-correctly.patch is removed. Below is the reason.
This patch is introduced to solve the 'su: applet not found' problem when
executing `su -l xxx -c env'. The patch references codes of previous release
of shadow. However, this patch introduces bug#5359. So it's not correct.

Let's first look at the root cause of 'su: applet not found' problem.
This problem appears when /bin/sh is provided by busybox.
When executing `su -l xxx -c env' command, the following function is invoked.
    execve("/bin/sh", ["-su", "-c", "env"], [/* 6 vars */])
Note that the argv[0] provided to new executable file (/bin/sh) is "-su".
As /bin/sh is a symlink to /bin/busybox. It's /bin/busybox that is executed.
In busybox's appletlib.c, it would examine argv[0], try to find an applet
that has the same name, and then try to execute the main function of the
applet. This logic results in `su' applet from busybox to be executed.
However, we default to set 'BUSYBOX_SPLIT_SUID' to "1", so 'su' is not found.
Further more, even if we set 'BUSYBOX_SPLIT_SUID' to "0", so that 'su' applet
is found. The whole behaviour is still not correct. Because 'su' from shadow
takes higher priority than that from busybox, so 'su' from busybox should never
be executed on such system unless it's specified clearly by the end user.
The logic of busybox's appletlib.c is totally correct from the point of busybox
itself. It's an integration problem.

To solve the above problem, this patch comment out SU_NAME in /etc/login.defs
so that the final function executed in shadow's su is as below.
    execve("/bin/sh", ["-sh", "-c", "env"], [/* 6 vars */])

[YOCTO #5359]
[YOCTO #7137]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-su.c-fix-to-exec-command-correctly.patch  | 25 ----------------------
 meta/recipes-extended/shadow/shadow.inc            |  5 ++++-
 2 files changed, 4 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch

diff --git a/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch b/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
deleted file mode 100644
index 31337de..0000000
--- a/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-Subject: su.c: fix to exec command correctly
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/su.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/su.c b/src/su.c
-index 3704217..bc4f2ac 100644
---- a/src/su.c
-+++ b/src/su.c
-@@ -1156,7 +1156,7 @@ int main (int argc, char **argv)
- 		 * Use the shell and create an argv
- 		 * with the rest of the command line included.
- 		 */
--		argv[-1] = cp;
-+		argv[-1] = shellstr;
- 		execve_shell (shellstr, &argv[-1], environ);
- 		err = errno;
- 		(void) fprintf (stderr,
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7c63d88..5451718 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,7 +14,6 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://usermod-fix-compilation-failure-with-subids-disabled.patch \
            file://fix-installation-failure-with-subids-disabled.patch \
-           file://0001-su.c-fix-to-exec-command-correctly.patch \
            file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
@@ -108,6 +107,10 @@ do_install() {
 	# Disable checking emails.
 	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
 
+	# Comment out SU_NAME to work correctly with busybox
+	# See Bug#5359 and Bug#7173
+	sed -i 's:^SU_NAME:#SU_NAME:g' ${D}${sysconfdir}/login.defs
+
 	# Use proper encryption for passwords
 	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
 
-- 
1.9.1


