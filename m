Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB6FFED3FF
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31961.1777064203583046120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0HMainQ1;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ad135063so74477925e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064202; x=1777669002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6hw1QO8xFNyYfIBMJbXy9KJji0ATuejEbaik00VuP0=;
        b=0HMainQ1z0PYe5cbKIoW7LlbLl02QHUqJWfX/zUiyTa7ZVopTNkB05CujBu1Pvqatb
         TzwgjBvCeGOVBxEnQ0tJts6QFo64shJ9uYD22GqlJW56dz3IPXobFYqtTYB/BDaXo9jd
         jo8QS0GxrumBmRbMwylVdGCRHsa1yd3BNFCWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064202; x=1777669002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P6hw1QO8xFNyYfIBMJbXy9KJji0ATuejEbaik00VuP0=;
        b=X6LMUCvgp4vQA1UX1d2/XEdUuFuS29xktcjIxJ4ljZ8tNrdltP3q6DUxT12pqn2jGL
         //+F15PBTuK+oSp6EAPFD6FQavKhxUK2Zqhp5t1UTDHiq6qpPbwKP7vi39N0lj46Z5wm
         5DediNHsv6A2QzYRMSc6ZASzc3NxK3bKSF9FBNVnEFb0RpvP8SeibJkA7zYfviHGSSkW
         QQnzo8/BN7tnIgiq+JzxbZGbtIT5UZKAzIcQpGGz6c/GVvtxCWt782Hq7hV8zrnsjxR4
         C96r0zN7or3RKAi9vZuEEfocGguHZs6PWy9r9jZi2w7/bIAGQGEtakA4MJdop2WOaxZB
         UbOA==
X-Gm-Message-State: AOJu0YwVYAxSIdUbXuVNbuc+xd06y6YywSIPclZz6ursaaAHXFJwlxJY
	Ub5vLyat3q1bS7yY+pAj8UEkVhNU+PbCtT/hEzAkrvl7CTDG7iv5t5UBwiTGVcWSjJKW7mSwYvu
	GdyGldWjIPJU/
X-Gm-Gg: AeBDiesLf7g7kGXr2AVb2k0A41TiHLrYCoDN/GoKy3kcK2eXV+mNbdwdZnBgJvRmkPi
	ACykTbbKGaMVj9Bd6ZzoGTlZ2KAb0ArkHtsliX/LIDI3XPK3NOVHfRvFeQ6cgpnpSF9htoO3RlA
	8mebo+ADnmMPSGne6SkrJqdS6J3yK8BYqBr3TQUlcCCI9LHbTKKAJbrd2LlhgXNaq64DQiJ5joF
	i4JY9THLLOIIfpExVKJVSboJN4y7WdmAolX631C0DFd14QYVjBh4ZwkCcp6q/dIN9WStQ2fNQGt
	Rt+KVSv44Ps89BxY/v9st05QuiOaA2yln8Vi7NmQG3+KeW4rNGoyyD3eyaOZikqD+tsRFSgez2q
	jahAFFrTlPUN58usERBj/Rv50UekvebMj5d2GqCj+CM1Uj9PrnZSy3J7conFKX+tJ6o1Y41eRN/
	MVv39HijICymLNY7nb4qe95+IDGN6E5krmqcWYS5XNTQwwukIBWxyiiOPK35I9+eNqcQ0fq1jDr
	EKHgW67etF4pnl6rnP8iPhk69efW0AmAcK3tg==
X-Received: by 2002:a05:600c:8b55:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a57e1d8d4mr251777665e9.9.1777064201719;
        Fri, 24 Apr 2026 13:56:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/66] ncurses: fix for CVE-2025-69720
Date: Fri, 24 Apr 2026 22:55:06 +0200
Message-ID: <a4364099e0593757bc848dc766843d7651550224.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235880

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick relevant part of snapshot commit 20251213, see [1].

That has:
add a limit-check in infocmp -i option (report/example by Yixuan Cao).

[1] https://invisible-island.net/ncurses/NEWS.html#index-t20251213

References:
1. https://github.com/Cao-Wuhui/CVE-2025-69720
2. https://nvd.nist.gov/vuln/detail/CVE-2025-69720
3. https://access.redhat.com/errata/RHSA-2026:5913

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ncurses/files/CVE-2025-69720.patch        | 42 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-69720.patch b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
new file mode 100644
index 00000000000..8ab6953c855
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
@@ -0,0 +1,42 @@
+From 6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 6 Apr 2026 18:08:09 +0530
+Subject: [PATCH] add limit-check in infocmp
+
+origin : https://invisible-island.net/archives/ncurses/6.5/ncurses-6.5-20251213.patch.gz
+Refer: https://github.com/Cao-Wuhui/CVE-2025-69720
+patch by : Thomas E. Dickey <dickey@invisible-island.net>
+
+CVE: CVE-2025-69720
+Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snapshots/commit/6f6db0e8fd14e40096a0ee6f8bdf32dedbd3fc9e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ progs/infocmp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/progs/infocmp.c b/progs/infocmp.c
+index 171d794d..2fc1f035 100644
+--- a/progs/infocmp.c
++++ b/progs/infocmp.c
+@@ -816,7 +816,7 @@ lookup_params(const assoc * table, char *dst, char *src)
+ static void
+ analyze_string(const char *name, const char *cap, TERMTYPE2 *tp)
+ {
+-    char buf2[MAX_TERMINFO_LENGTH];
++    char buf2[MAX_TERMINFO_LENGTH + 1];
+     const char *sp;
+     const assoc *ap;
+     int tp_lines = tp->Numbers[2];
+@@ -846,7 +846,8 @@ analyze_string(const char *name, const char *cap, TERMTYPE2 *tp)
+ 	    if (VALID_STRING(cp) &&
+ 		cp[0] != '\0' &&
+ 		cp != cap) {
+-		len = strlen(cp);
++		if ((len = strlen(cp)) > MAX_TERMINFO_LENGTH)
++		    len = MAX_TERMINFO_LENGTH;
+ 		_nc_STRNCPY(buf2, sp, len);
+ 		buf2[len] = '\0';
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index d3b41061183..ac30a1a3c1e 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2023-50495.patch \
            file://CVE-2023-45918.patch \
            file://CVE-2025-6141.patch \
+           file://CVE-2025-69720.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"

