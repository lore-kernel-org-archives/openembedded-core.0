Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89E2C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 21:39:49 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.218.1720820387166854169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 14:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=mH+1oc5c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024071221394324f1274ec1dad91e6a-u__xzh@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024071221394324f1274ec1dad91e6a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Jul 2024 23:39:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UAVZ1X829OIAeqmUZM5X+toFKhV+CT1WHkNjXHk0s5Q=;
 b=mH+1oc5c2YM6w19OLCSNbJjyj7z1+8JyMypGLTQtLHjRvf9G4jeS2bCeQRwyuGh5911D8u
 3UufTznW13+6mE6+HWCWu4+tm8DWoT1cvr7FWFfMi5iNd6ecvPROftojalKK0wUPJeAD56C4
 LUbDlwNAZ5nnEB2cFNXpfVDT7QNGg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH 2/2] busybox: Patch CVE-2023-42363
Date: Fri, 12 Jul 2024 23:38:54 +0200
Message-Id: <20240712213854.2554353-2-peter.marko@siemens.com>
In-Reply-To: <20240712213854.2554353-1-peter.marko@siemens.com>
References: <20240712213854.2554353-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 21:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201852

From: Peter Marko <peter.marko@siemens.com>

Backport patch for CVE-2023-42363.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2023-42363.patch      | 67 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
new file mode 100644
index 0000000000..379f6f83b1
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
@@ -0,0 +1,67 @@
+From fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 20 May 2024 17:55:28 +0200
+Subject: [PATCH] awk: fix use after free (CVE-2023-42363)
+
+function                                             old     new   delta
+evaluate                                            3377    3385      +8
+
+Fixes https://bugs.busybox.net/show_bug.cgi?id=15865
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2023-42363
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ editors/awk.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 0981c6735..ff6d6350b 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2910,19 +2910,14 @@ static var *evaluate(node *op, var *res)
+ 				/* yes, remember where Fields[] is */
+ 				old_Fields_ptr = Fields;
+ 			}
+-			if (opinfo & OF_STR1) {
+-				L.s = getvar_s(L.v);
+-				debug_printf_eval("L.s:'%s'\n", L.s);
+-			}
+ 			if (opinfo & OF_NUM1) {
+ 				L_d = getvar_i(L.v);
+ 				debug_printf_eval("L_d:%f\n", L_d);
+ 			}
+ 		}
+-		/* NB: Must get string/numeric values of L (done above)
+-		 * _before_ evaluate()'ing R.v: if both L and R are $NNNs,
+-		 * and right one is large, then L.v points to Fields[NNN1],
+-		 * second evaluate() reallocates and moves (!) Fields[],
++		/* NB: if both L and R are $NNNs, and right one is large,
++		 * then at this pint L.v points to Fields[NNN1], second
++		 * evaluate() below reallocates and moves (!) Fields[],
+ 		 * R.v points to Fields[NNN2] but L.v now points to freed mem!
+ 		 * (Seen trying to evaluate "$444 $44444")
+ 		 */
+@@ -2942,6 +2937,16 @@ static var *evaluate(node *op, var *res)
+ 				debug_printf_eval("R.s:'%s'\n", R.s);
+ 			}
+ 		}
++		/* Get L.s _after_ R.v is evaluated: it may have realloc'd L.v
++		 * so we must get the string after "old_Fields_ptr" correction
++		 * above. Testcase: x = (v = "abc", gsub("b", "X", v));
++		 */
++		if (opinfo & OF_RES1) {
++			if (opinfo & OF_STR1) {
++				L.s = getvar_s(L.v);
++				debug_printf_eval("L.s:'%s'\n", L.s);
++			}
++		}
+ 
+ 		debug_printf_eval("switch(0x%x)\n", XC(opinfo & OPCLSMASK));
+ 		switch (XC(opinfo & OPCLSMASK)) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 46e719845a..7ce57bb0d0 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://start-stop-false.patch \
            file://CVE-2021-42380.patch \
            file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
+           file://CVE-2023-42363.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.30.2


