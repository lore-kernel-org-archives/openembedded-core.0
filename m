Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id E70196FFD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 11:08:36 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w6OB8amm030467
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 13:08:36 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w6OB8Z8Y021126;
	Tue, 24 Jul 2018 13:08:36 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 967BB969B09;
	Tue, 24 Jul 2018 13:08:35 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 13:08:29 +0200
Message-Id: <20180724110829.17338-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] shadow: fix CVE-2017-2616
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
X-List-Received-Date: Tue, 24 Jul 2018 11:08:37 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../shadow/files/CVE-2017-2616.patch               | 64 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2017-2616.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2017-2616.patch b/meta/recipes-extended/shadow/files/CVE-2017-2616.patch
new file mode 100644
index 0000000000..ee728f0952
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2017-2616.patch
@@ -0,0 +1,64 @@
+shadow-4.2.1: Fix CVE-2017-2616
+
+[No upstream tracking] -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=855943
+
+su: properly clear child PID
+
+If su is compiled with PAM support, it is possible for any local user
+to send SIGKILL to other processes with root privileges. There are
+only two conditions. First, the user must be able to perform su with
+a successful login. This does NOT have to be the root user, even using
+su with the same id is enough, e.g. "su $(whoami)". Second, SIGKILL
+can only be sent to processes which were executed after the su process.
+It is not possible to send SIGKILL to processes which were already
+running. I consider this as a security vulnerability, because I was
+able to write a proof of concept which unlocked a screen saver of
+another user this way.
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/08fd4b69e84364677a10e519ccb25b71710ee686]
+CVE: CVE-2017-2616
+bug: 855943
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/src/su.c b/src/su.c
+index 3704217..1efcd61 100644
+--- a/src/su.c
++++ b/src/su.c
+@@ -363,20 +363,35 @@ static void prepare_pam_close_session (void)
+ 				/* wake child when resumed */
+ 				kill (pid, SIGCONT);
+ 				stop = false;
++			} else {
++				pid_child = 0;
+ 			}
+ 		} while (!stop);
+ 	}
+ 
+-	if (0 != caught) {
++	if (0 != caught && 0 != pid_child) {
+ 		(void) fputs ("\n", stderr);
+ 		(void) fputs (_("Session terminated, terminating shell..."),
+ 		              stderr);
+ 		(void) kill (-pid_child, caught);
+ 
+ 		(void) signal (SIGALRM, kill_child);
++		(void) signal (SIGCHLD, catch_signals);
+ 		(void) alarm (2);
+ 
+-		(void) wait (&status);
++		sigemptyset (&ourset);
++		if ((sigaddset (&ourset, SIGALRM) != 0)
++		    || (sigprocmask (SIG_BLOCK, &ourset, NULL) != 0)) {
++			fprintf (stderr, _("%s: signal masking malfunction\n"), Prog);
++			kill_child (0);
++		} else {
++			while (0 == waitpid (pid_child, &status, WNOHANG)) {
++				sigsuspend (&ourset);
++			}
++			pid_child = 0;
++			(void) sigprocmask (SIG_UNBLOCK, &ourset, NULL);
++		}
++
+ 		(void) fputs (_(" ...terminated.\n"), stderr);
+ 	}
+ 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 9a08918818..6efe4a9119 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.xz \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
            file://0001-shadow-CVE-2017-12424 \
+           file://CVE-2017-2616.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.11.0


