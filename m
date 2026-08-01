Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AD0C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 20:38:13 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12613.1785616691695856101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 13:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=B1zaestF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260801203809e6591ee425000207af-njgz4h@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260801203809e6591ee425000207af
        for <openembedded-core@lists.openembedded.org>;
        Sat, 01 Aug 2026 22:38:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=E3LlUmaab9ehbTFMEEn4DM0lGZKpfkZIL4oyeWcjbNw=;
 b=B1zaestF3EmYG1buv/0ghAUBJ8K9utXk2Zck6aaurg9s/E06WjL21jbU/j43oA3+2LEk5O
 N1AKcGLcA+t88DmXSFAUzOilcGDF/rm7+SsQKdPO/A9rMKxCqpouBHfATgCacQmmUE4AXRVf
 HLTWmFI6zcCeaR2iBs5xxGleot0qnGIaxq66siNkhJ5C9D9Fj6wanr/o92KvUTENepcC4srH
 EOurJzAO34nXlkjEf+F3Ky1aNn5LqR8efXfu+E2OzCf2DZqKyw8pMk/64CCKz2Mhm1Dr52Fq
 gUK0a1kfLLfRPZcKOuU+ZJ1tHUmwlsioEBcwklxcNEBkq7iZZtNrTIMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] busybox: patch CVE-2026-38754
Date: Sat,  1 Aug 2026 22:37:55 +0200
Message-ID: <20260801203755.3751797-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 20:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242502

From: Peter Marko <peter.marko@siemens.com>

Pick patch which fixes this CVE as discussed in [1].

[1] https://lists.busybox.net/pipermail/busybox/2026-July/092392.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2026-38754.patch      | 155 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
new file mode 100644
index 0000000000..7c7b88f5de
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
@@ -0,0 +1,155 @@
+From a448b6d5b21e5b21249391389b6f0551d9bea136 Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Thu, 18 Jun 2026 17:04:20 +0900
+Subject: [PATCH] ash: fix out-of-bounds read in ifsbreakup()
+
+ifsfree() does not only release allocated ifsregion nodes; it also clears
+the global IFS region state used by ifsbreakup(). If argstr() raises an
+error while expanding an argument, ash longjmps out of expandarg() before
+that cleanup runs, leaving stale IFS split offsets behind.
+
+A later expansion can reuse the stack for a shorter string. ifsbreakup()
+then sees the stale IFS state, trusts the old offsets, and can walk past
+the current stack block before dereferencing p.
+
+Follow dash's root-cause fix: when an expansion-related handler catches
+EXERROR and continues, restore the handler and call ifsfree(). Apply
+the cleanup to redirectsafe(), expandstr(), and evaltree().
+
+Upstream commit:
+
+    Date:   Mon Dec 5 23:02:01 2022 +0800
+    expand: Add ifsfree to expand to fix a logic error that causes a buffer over-read
+
+    On Mon, Jun 20, 2022 at 02:27:10PM -0400, Alex Gorinson wrote:
+    > Due to a logic error in the ifsbreakup function in expand.c if a
+    > heredoc and normal command is run one after the other by means of a
+    > semi-colon, when the second command drops into ifsbreakup the command
+    > will be evaluated with the ifslastp/ifsfirst struct that was set when
+    > the here doc was evaluated. This results in a buffer over-read that
+    > can leak the program's heap, stack, and arena addresses which can be
+    > used to beat ASLR.
+    >
+    > Steps to Reproduce:
+    > First bug:
+    > cmd args: ~/exampleDir/example> dash
+    > $ M='AAAAAAAAAAAAAAAAA'    <note: 17 A's>
+    > $ q00(){
+    > $ <<000;echo
+    > $ ${D?$M$M$M$M$M$M}        <note: 6 $M's>
+    > $ 000
+    > $ }
+    > $ q00                      <note: After the q00 is typed in, the leak
+    > should be echo'd out; this works with ash, busybox ash, and dash and
+    > with all option args.>
+    >
+    > Patch:
+    > Adding the following to expand.c will fix both bugs in one go.
+    > (Thank you to Harald van Dijk and Michael Greenberg for doing the
+    > heavy lifting for this patch!)
+    > ==========================
+    > --- a/src/expand.c
+    > +++ b/src/expand.c
+    > @@ -859,6 +859,7 @@
+    > if (discard)
+    > return -1;
+    >
+    > +ifsfree();
+    > sh_error("Bad substitution");
+    > }
+    >
+    > @@ -1739,6 +1740,7 @@
+    > } else
+    > msg = umsg;
+    > }
+    > +ifsfree();
+    > sh_error("%.*s: %s%s", end - var - 1, var, msg, tail);
+    >  }
+    > ==========================
+
+    Thanks for the report!
+
+    I think it's better to add the ifsfree() call to the exception
+    handling path as other sh_error calls may trigger this too.
+
+function                                             old     new   delta
+restore_handler_expandarg                              -      33     +33
+evaltree                                             725     711     -14
+static.redirectsafe                                  141     124     -17
+expandstr                                            262     242     -20
+------------------------------------------------------------------------------
+(add/remove: 1/0 grow/shrink: 0/3 up/down: 36/-45)            Total: -18 bytes
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-38754
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/a448b6d5b21e5b21249391389b6f0551d9bea136]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ shell/ash.c | 24 +++++++++++++++---------
+ 1 file changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index fb887f31b..b8ff67b16 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -5472,6 +5472,7 @@ stoppedjobs(void)
+  */
+ /* openhere needs this forward reference */
+ static void expandhere(union node *arg);
++static void ifsfree(void);
+ static int
+ openhere(union node *redir)
+ {
+@@ -5913,6 +5914,17 @@ redirect(union node *redir, int flags)
+ 	//	preverrout_fd = copied_fd2;
+ }
+ 
++static void
++restore_handler_expandarg(struct jmploc *savehandler, int err)
++{
++	exception_handler = savehandler;
++	if (err) {
++		if (exception_type != EXERROR)
++			longjmp(exception_handler->loc, 1);
++		ifsfree();
++	}
++}
++
+ static int
+ redirectsafe(union node *redir, int flags)
+ {
+@@ -5928,9 +5940,7 @@ redirectsafe(union node *redir, int flags)
+ 		exception_handler = &jmploc;
+ 		redirect(redir, flags);
+ 	}
+-	exception_handler = savehandler;
+-	if (err && exception_type != EXERROR)
+-		longjmp(exception_handler->loc, 1);
++	restore_handler_expandarg(savehandler, err);
+ 	RESTORE_INT(saveint);
+ 	return err;
+ }
+@@ -9445,9 +9455,7 @@ evaltree(union node *n, int flags)
+ 			trap_depth--;
+ 			in_trap_ERR = 0;
+ 
+-			exception_handler = savehandler;
+-			if (err && exception_type != EXERROR)
+-				longjmp(exception_handler->loc, 1);
++			restore_handler_expandarg(savehandler, err);
+ 
+ 			exitstatus = savestatus;
+ 		}
+@@ -13487,9 +13495,7 @@ expandstr(const char *ps, int syntax_type)
+ 	result = stackblock();
+ 
+ out:
+-	exception_handler = savehandler;
+-	if (err && exception_type != EXERROR)
+-		longjmp(exception_handler->loc, 1);
++	restore_handler_expandarg(savehandler, err);
+ 
+ 	doprompt = saveprompt;
+ 	/* Try: PS1='`xxx(`' */
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index a6abfa2598..b020c923be 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2024-58251.patch \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
+           file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

