Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD8878590
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 23:37:08 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id b5so5204208itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 15:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sKH8m6QPDCKV1Do2J1kB2GK/2OJEYnT56JI0nfAzDEs=;
	b=uYHatiMeZoP3ZNbWkv5kgdqyKnJRPrGTXJhKy8u/timzizlZ0i9ZMbHaFh8zqSpyzN
	BuYGmg5La6BV+9SCLKSR8vFQ91da4tJ6m5OdN1VqZLbysbKmMBO0LZZs3W17prR8umER
	oHX/sajaTPF/vOTXjeVoXY2gYQTxh/SpbeTq7upnLdCOFHCd3On02woDnkGTDMFAfQyP
	O1iBV6iHMazS+6jza+/7SKL6UDIhgt7cKiBYYz1vxHG3LQGtmScPKaveTUnWmB5JDwlV
	UFAjsWwtm87Dj4Qzjro5v/fYe17dCHdWBd/UXkhpL2DPow8PS5+jtzpQr0Od2jE7NSA0
	7DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sKH8m6QPDCKV1Do2J1kB2GK/2OJEYnT56JI0nfAzDEs=;
	b=gQPGSWSAm7JObcVDv2huWp95xv901SbqlKURJli3Pk4/6iMRfCT1iEGqI7hYl41JtR
	lDYQ/ZD1tKmRszdXTj8v+rcXSYnUYzL+ZKniYbzDH5iNrNuTa4yuXdoPBlOsY6q/Y2Kd
	rAyOftPz3fZMFTNLrbdeD/hlp2HkGjCMAxN/G1V6o1UpztzZaV8EQ9ngwlmVShuux7Ft
	3g12ltqXZQgMpUkMeT57khgAywqX2Ewlr7JhkkKyNNDXEMwhoXbwWb0RcW2cltDRNCxo
	/4qG2TsVYNdqWzHblmBl0vv62ju5dr0EJNb9qreycjyYDcRK9XVzpXdo7JXcHe7grx30
	X1HQ==
X-Gm-Message-State: AJaThX4M6ey1SOWmuTFlbt7r573Wc07bGXAq+VkXHDjaGCqK8Lm5WkSN
	qPu4csHKPukiyJO1z4lMNA5i
X-Google-Smtp-Source: AGs4zMYb1kQYquyAog0UV1kgqOMWNDJlllCg0+dnmdzyEMZx/oLeE+PUOgM1+wrnMPnqLNR32M2ZRg==
X-Received: by 10.36.58.85 with SMTP id m82mr853713itm.90.1510616230105;
	Mon, 13 Nov 2017 15:37:10 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	k19sm4836396itb.18.2017.11.13.15.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 15:37:09 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 17:36:35 -0600
Message-Id: <20171113233636.22474-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH 1/2] shadow: fix CVE-2017-2616
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
X-List-Received-Date: Mon, 13 Nov 2017 23:37:09 -0000

Apply backported patch that fixes CVE-2017-2616
Sending SIGKILL to other processes with root privileges via su

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../files/0001-su-properly-clear-child-PID.patch   | 70 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch

diff --git a/meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch b/meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch
new file mode 100644
index 0000000000..205a7af054
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-su-properly-clear-child-PID.patch
@@ -0,0 +1,70 @@
+From 26d94ff403df048fe4438a97959793610d6e7ea8 Mon Sep 17 00:00:00 2001
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


