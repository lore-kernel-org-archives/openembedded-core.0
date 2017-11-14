Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1342784CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:08:09 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id d66so24703351ioe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qulj2j4SN6Q19TQgQW57xyZTZ8E/eiVmzb1GKbxKdqw=;
	b=mc58sRjnK5096VLwReUJXfAqb7XTC3bYl7XM6zOZDXKQl9ASaYRFpQDnQcjNbh3pbV
	oiGGQVpWpZIp6x1aN5tdtldGi8YZ6JkOuetxol/GBUq/rYj4v4C/Mnj/hq9eI7mwl+I2
	ch4+voJm2QC40giDWcuSepb24IIKJXRHMb/W4psT0fu7eakLccDsAIc3zk0nFNKGYotE
	KHo275YHEmJiyeFMFUxebaQJ3DzNeO7LHWAQIdS2y6UtCy/tyc2u3iwQmrbAxkdV2QoE
	vX8cplTfwUXGPx/RBqabXSUm19rTkw2kD8kEcERsT4l+iLllH1O1B5qoVa+oMERuclDi
	sf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qulj2j4SN6Q19TQgQW57xyZTZ8E/eiVmzb1GKbxKdqw=;
	b=INekm/xxIVtEWTaSEsaja7U6dJmzGxL4/Xcm24pKxLQzBLMFLFzxKDr7hRTs5ta2Az
	wndtuJ3wMqO4C4R6pwysRDGfwxLm4bXWxQUQRHV1TWpLmMGm5gx5bMYUCQEXwVXl9QnA
	KuySeGeZx8AHaKC6AAa3wOaqwK6ogIpfY3IR+w0IrFHKrDMcwePzqqFMshioLa9R5AzY
	KNimxSS7jfQTIe4p92Ls+kqXTkej6BovRqF0rZzg5fTOGdC/Aji68JwyVbkmuxSIr/0F
	2PD8ndkoJbFHIJhN2omAG3oV7McGfARrI7+GEIB5/FktMHpptkasqBzoorDetz93W8y5
	dZog==
X-Gm-Message-State: AJaThX6jTZmq7TaqwB6CaW+l60hIWE5LD3LIR+rl865PhvJ3jWqQUyR3
	0EB4c5ZtUB43+yP5WqHQwj//
X-Google-Smtp-Source: AGs4zMasJeGfSvwrkZH3IQ1xk7D37yxp5OFELj6rWz5RgXPQcDORbc+3Sp8f5S/XL4Nv92yCcx+mlw==
X-Received: by 10.107.131.147 with SMTP id n19mr13595463ioi.87.1510672090053; 
	Tue, 14 Nov 2017 07:08:10 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	u140sm5408285itc.41.2017.11.14.07.08.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 07:08:09 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 09:07:26 -0600
Message-Id: <20171114150727.17897-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH v2 1/2] shadow: fix CVE-2017-2616
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
X-List-Received-Date: Tue, 14 Nov 2017 15:08:09 -0000

Apply backported patch that fixes CVE-2017-2616
Sending SIGKILL to other processes with root privileges via su

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---

Changes in v2:
 - Add SOB to patch file.

 .../files/0001-su-properly-clear-child-PID.patch   | 72 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch

diff --git a/meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch b/meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch
new file mode 100644
index 0000000000..9fefd9e599
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch
@@ -0,0 +1,72 @@
+From 3ed6ba2105c7a35d6dc7e8b805202d0235df1fb1 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Thu, 23 Feb 2017 09:47:29 -0600
+Subject: [PATCH] su: properly clear child PID
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
+Upstream-Status: Backport
+https://anonscm.debian.org/cgit/pkg-shadow/shadow.git/plain/debian/patches/301-CVE-2017-2616-su-properly-clear-child-PID.patch?h=jessie
+https://github.com/shadow-maint/shadow/commit/08fd4b69e84364677a10e519ccb25b71710ee686
+
+CVE: CVE-2017-2616
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+---
+ src/su.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
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
+-- 
+2.15.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index cc189649b2..031e880630 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
            file://0001-shadow-CVE-2017-12424 \
+           file://0001-su-properly-clear-child-PID.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.15.0


