Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F31C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 05:57:06 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.4447.1721109417937893269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 22:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hscWx0wG;
 spf=pass (domain: mvista.com, ip: 209.85.128.182, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-65f9e25fffaso27135297b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 22:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721109417; x=1721714217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJvaa/5LMQly0hAhTQSJmAvVOtUOeOmnymDHFfFFkyI=;
        b=hscWx0wG1BnhvP4wndur9EufOSJVwAu+uowvBCu93Mb98uVWxX/R7Vup7jhAIysixS
         KuGOiNjwwOjV9mOScFhStIjY7n//FEQXjpZAQYhR8cTBYBkeahHAITj7UIOkNsRgKCz+
         bUlAvPibY0gW2NNHchwzHlo00wlGaiSzry6kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721109417; x=1721714217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJvaa/5LMQly0hAhTQSJmAvVOtUOeOmnymDHFfFFkyI=;
        b=m2wu++q8PmEO7yVYH6t2H/PFY4ABp2k5pea+XtCLaCzR/9w9hKqi1oLFt8SqPwwFpT
         cc3nP1L8tWSILEm2UQWT+7LfjzY0u7k185qqX6Bj10P04DgG1bFkbCdjUWOG5JlNGd1M
         faHdAIyUys86TWASNUAPq8NvBfaSo6M3mAiStq8IfFJxQ7omlN/uG08JPTiAgoaLfl7G
         nxtXymPbFSeXn808nDw+Z8L6LWHROzxgYFKEPbsH8IGGl3l2m5X1DA+kB1PRTILtvlMx
         bSS2mAPkSmVtxk1rbAO8HaOzguM9kdeJSSzJFU1+l4cHNWF86tMBE4xGiKgyoAC4HNp5
         co7Q==
X-Gm-Message-State: AOJu0YwY2YD9um/gYMLD06cXhlhNrD0hI9doyeiM0K2F3DWem4kTp4AD
	YRZmfhBu55oRQ2F4OpaVwGWrtrKSR8y+aLwLZ7aAYQkOPSQHyhsd9rI8WPRTChgHuwUkz554+WS
	Y
X-Google-Smtp-Source: AGHT+IHJjRBXlGO2X2Zi/IVikajlHhhcZ8w9cJG+0YD7DkOhhoptXnWz4gSyxhq/9Tod+QeYc7J+yw==
X-Received: by 2002:a81:8ac5:0:b0:64b:2a73:f050 with SMTP id 00721157ae682-6637f6a33dbmr10864967b3.23.1721109416849;
        Mon, 15 Jul 2024 22:56:56 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.135])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc445204csm10533317b3.127.2024.07.15.22.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 22:56:56 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] busybox: Fix CVE-2023-42363
Date: Tue, 16 Jul 2024 11:26:43 +0530
Message-Id: <20240716055643.37440-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 05:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202080

Upstream-Status: Backport from https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../busybox/busybox/CVE-2023-42363.patch      | 67 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
new file mode 100644
index 0000000000..b401a6e3e5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
@@ -0,0 +1,67 @@
+From fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 20 May 2024 17:55:28 +0200
+Subject: awk: fix use after free (CVE-2023-42363)
+
+function                                             old     new   delta
+evaluate                                            3377    3385      +8
+
+Fixes https://bugs.busybox.net/show_bug.cgi?id=15865
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
+CVE: CVE-2023-42363
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ editors/awk.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 654cbac..4fbc11d 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2889,19 +2889,14 @@ static var *evaluate(node *op, var *res)
+ 			if ((opinfo & OF_REQUIRED) && !op1)
+ 				syntax_error(EMSG_TOO_FEW_ARGS);
+ 			L.v = evaluate(op1, TMPVAR0);
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
+@@ -2914,6 +2909,16 @@ static var *evaluate(node *op, var *res)
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
+2.25.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 07a5137d2a..842562c4c4 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2022-30065.patch \
            file://0001-devmem-add-128-bit-width.patch \
 	   file://CVE-2022-48174.patch \
+           file://CVE-2023-42363.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


