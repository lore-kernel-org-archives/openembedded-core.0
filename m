Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED2BC61DB6
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15962.1787576457869716623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CJoUkrU3;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so17106795e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576456; x=1788181256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FWbEKmMADvDD95n53nMmEHBqFwyuViX0O14VlZE1DBI=;
        b=CJoUkrU33MDiEW2Z/7VEh8pYhAjNkyUvE+D2q+h6qQ2QhjlGQDJVCHUZ76IsoNBoY3
         HOG+oRELQVc7atEYMzGYdGzi1LH3e3d69x3pUNVZKCkPQmuUMpw+NVRu86Rw8IjHW1LV
         kOyt1v3Pn2I2W5/x/pVGUuMpAxJ6lgPZrVkSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576456; x=1788181256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FWbEKmMADvDD95n53nMmEHBqFwyuViX0O14VlZE1DBI=;
        b=YXRibbt8JPlF0cwyNhlcLvR70G4Qp+flO4HCBoJnQSxIal9NKUikuoFL14KPujPf/t
         Czv73X1h+IX07NnW6fkU3w8KgFdAqdqJMku4YxHU4S6fngjKkXn702g5U+GW9ld0lzw/
         IGN+pd37i2Z3tUDO5v3VVfvmmVpenzqP+eZwYvK1y/ii8iHXIU0Dv6QkqXym81rpI6Om
         fhFOJI+7GsCY2D36gnGQhJ7LkkXUsS+eIGV0NxWITvLx5Iz1MPYX1WGaDWwWMHQmkUSq
         NSUcui5RThTscKxvG8udYRPYjQv50ZFwn+F9/SgUSWCvyUkldou4jpKelmKXTBAzF8MN
         eaTA==
X-Gm-Message-State: AFuF++mC3Zf7LP+fkzfSGQ8XtmiM+oCivMq9slGxnupaCUblKyEELnhE
	Ued4u0obcAist8fbAMrfw6Gn/2nruiILJRbzhqvUCev2ReZj6rHxodZaDWq/4QUYZim2oPUFM5f
	jypLv1Yc=
X-Gm-Gg: AR+sD12fD3AOzYj9nXTGNB2fDfSO/YqXy24XHwMk8ctIDGR8zV+qHnmZVk956Tr2CKo
	UtQh4sHcRDSBgs0U2Uxh42budyduBzzT+nsAURaN4NSyYS4GkDkYGRGU5wZKGrvNA96VA+ULUPc
	XhJ5t2anCi2p41LVMnBJEPr3XXwL2xe2HMMmAeU6QAv+K2O9IAbVlMn5p/7uZzDGgSU+e0MDYk8
	NF1XoqFYcWI8OAZwu0OHXoh+wIjdFnDXYtvReQ45/nPVA3IAxs6ejD9jkl6gGVc53ah/rZJDzCt
	RZd1M3vATBDyIl/ZuUxBgDoFniERWIrEHGtGolQhHwMwTQI4PG4jRck6Ad5f33kF8tt0kBDQPTK
	hpApIDmTPSNCvpXKSVE4OH0SrS1ocjI67M5KCF9fJzlQaYTciZXgZLEnEiWHFcxxBFuLw95fEzR
	Uonhi/bSvkbSZ3g7qUhmZIfDBbaKvzsOdJN/8JaN9O4c3lisyAzmOgEXpfojl5aCkXG4Xf8HoWi
	av17KJ4Od5oPUd0oSyqsAPbE4KbAWw6HH4gUJXpxJGwGtuZc2c+imcQax4X3/iDyKD47FpUM7N+
	5QbLEg==
X-Received: by 2002:a05:600c:64c6:b0:499:afcb:24c1 with SMTP id 5b1f17b1804b1-499b82e8528mr353012965e9.5.1787576437879;
        Mon, 24 Aug 2026 06:00:37 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/19] busybox: patch CVE-2026-38754
Date: Mon, 24 Aug 2026 14:59:43 +0200
Message-ID: <2ba7a3bef0a1d4e4c687421acc7af82d542e82a9.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244113

From: Peter Marko <peter.marko@siemens.com>

Pick patch which fixes this CVE as discussed in [1].

[1] https://lists.busybox.net/pipermail/busybox/2026-July/092392.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../busybox/busybox/CVE-2026-38754.patch      | 155 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
new file mode 100644
index 00000000000..7c7b88f5de7
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
index a6abfa25984..b020c923be3 100644
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

