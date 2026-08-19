Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC79C5DF8E
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10420.1787155078203004376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BXleB6Lb;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f84023916so1112878f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155076; x=1787759876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hqbh0iIuU7sAkAVoIISf8faeVCGLgeDwl7/FAumSiVw=;
        b=BXleB6LbJFVvjEPuFVK3m5mRHZnSiDuwMGgdCsAEuEKUUaC2V81+Q/1BaYGABdpNEp
         Znx3356VVpkO8dSfGK4MMr8YMCLyfE3q2uWY3nme14BmDRoLsSdXVpmAyfw1kP3Jnqlc
         IF3xFc7D21O8HWWHRcczoFQee73EHhnIZwKo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155076; x=1787759876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hqbh0iIuU7sAkAVoIISf8faeVCGLgeDwl7/FAumSiVw=;
        b=hLVtsxC2TmteBtV8L/ltK80a6MqElCu6Hf2QI3uUISXPFf+mdHnaocxEnqAyEkW47I
         bC6NfigDBE/irn0fflQf7qg58J1AlUTLX3Z7eDrvsfM9YKj9d7yiC2Lklpb5kB9Scp3y
         lmGx2Tz6Sx9qdCOsU+P2s7gVJKz8/pEN5DVEC1RCrrFN3J1Rx6K9vtg0ezQkP5H1YOHv
         SSPswWOdR8672tO/y3kkvPxPJcBpHqteHN7irvLrcy2KcR9ZzklPh1igSYjM0YvjX/S1
         DT6NKQYZX4lqK10WLoxunmRS8aJVwCMcTPUZXeho2nzY1NbfDUxG9/e6a5dP4FD9/bU3
         NG/A==
X-Gm-Message-State: AFuF++leTz0z4Ib8ungmQhyuIInMH3wJO463pkN/aW0KxbXqRF1GRAYr
	qz6Dt3PBlF5c/Vh+veP34VgtYeZifCHKCcHm21FE5AskDH9+YVbEkPU+MHwK1O6/M3pdlCAUMzF
	SL7nr6Kg=
X-Gm-Gg: AR+sD10BTo7JBsQk81tVRBfbEXaValpho8ytMMzqtJbmC8cG8z3F0O3coxZgaQV3E/9
	dPNvnLdLrhc9FP2QMane9IL2uvA2QIUxqHRi3t0UtnbsYMefj/dl64MHK0lPLNIUThQ7NigmS4H
	NRtsmT4C/I4+ehFZ79MF/fvtoYHscyW+LjyeNy7pZBT4u4+UHuhWOSA1xUMQwzAysjtDRgYGiDy
	WWYKTamJ/JPPOmonusHk/VKXsUz6QYwHkvl8rt30EsJrzR277OZcwpDRx1PJIJ1BEYnMg7/l+vk
	TGkeCx3n51CF1kZx3ZfxsnkbA6uMt5rZrXUefk7k5r07Uz/4JGYH7vZSMlYoQu7/l2ZoYaswuQp
	WvUeRksM3HlY/GMXBVyir1BpMMxG5Ub4OzXhUFolHwI45Az0M44rnntgd0kFJqg7VnsalKYD3KK
	5kdKRylK+dzZAl268ec2/tYOMjH1boZR3HnoDi4v5nc5C8C/PoUFD493FEyKHBeNnA2kb3hXEuu
	ad86Tsta7goEVobzQ2xwRtiXg6Yh7E/EI40gl+4txDYzH5hnrzzBlNRREHbvC0m2gwbN7ByL47l
	Ww97OwjK0F70RfJCCbBo/thxotXJkVR8Yw1TfuEK
X-Received: by 2002:a05:6000:2881:b0:47f:97e9:fe60 with SMTP id ffacd0b85a97d-482b1fd9579mr10146618f8f.15.1787155076277;
        Wed, 19 Aug 2026 08:57:56 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:55 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/37] busybox: patch CVE-2026-38754
Date: Wed, 19 Aug 2026 17:57:01 +0200
Message-ID: <4ee0e9afaf64cfe2db1fe4ccbd344493974ea65e.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243766

From: Peter Marko <peter.marko@siemens.com>

Pick patch which fixes this CVE as discussed in [1].

[1] https://lists.busybox.net/pipermail/busybox/2026-July/092392.html

(From OE-Core rev: 052fef5679987d726e40c8a87f0bf019f3833149)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../busybox/busybox/CVE-2026-38754.patch      | 155 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
new file mode 100644
index 00000000000..d263d72d9f3
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
+@@ -5480,6 +5480,7 @@ stoppedjobs(void)
+  */
+ /* openhere needs this forward reference */
+ static void expandhere(union node *arg);
++static void ifsfree(void);
+ static int
+ openhere(union node *redir)
+ {
+@@ -5909,6 +5910,17 @@ redirect(union node *redir, int flags)
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
+@@ -5924,9 +5936,7 @@ redirectsafe(union node *redir, int flags)
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
+@@ -9435,9 +9445,7 @@ evaltree(union node *n, int flags)
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
+@@ -13444,9 +13452,7 @@ expandstr(const char *ps, int syntax_type)
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
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 7929d396c85..60796de9ce2 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -66,6 +66,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2026-26157-CVE-2026-26158-02.patch \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
+           file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

