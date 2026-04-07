Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31270FF511F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85475.1775578590975995459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CfKKTG5b;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0046078so23861955e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578589; x=1776183389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dojgKuj1U3Ofmia7xnsKS6kU/Ct53OOxwo7dApi+roE=;
        b=CfKKTG5bdXC97+c9Adboj3w6av9cixrZeZdDKBNiNCeVYPuu0PJ7XDQt48DbdIVo8G
         jYSkIf7L+YanzVZi26S85R728OCf2dND2WHZfydpoXMXhwBIsjLbEYBUJ9lcRQjlVycb
         MFVdQcspFWgA4q9ZxT2vGqikpST053AzlY8AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578589; x=1776183389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dojgKuj1U3Ofmia7xnsKS6kU/Ct53OOxwo7dApi+roE=;
        b=kirhb2NjIYUoFnI8S8lGeddNkvfBOKruSUrGmh3rvBdO3WNI60fxUvAslk9rwI+G4N
         lfJNniPHJbUyfI59KPsaW0JU9RLLcvwUeuzfQanY7a3wvH8D9UPLA8Hwqn2vHxcPuN17
         cJ9n4yWOaKT4OuDFV1/vbpyUKiAajlKza2vt+HG1r6+c7HOw9apko7i+2YXR4hlsATDR
         /nfTnxF2oRDQ38TwBJvortt3MoScAnZE9x/PPh6Yq/ChIXq6lg6txVzo8N1CGWn95/B6
         oWY3XUFxuSfsLr3QIw+Iae6raDN74VdU/LzTmDhMz5RA4J877sk8Aueee4NE4J5GEDyL
         xBJA==
X-Gm-Message-State: AOJu0YxzXHY140wvjvkG+29bEoM+k2WYzEAHwrReMH6FnmKuXUI9s7ph
	pOylMEf9Rm4Maw8FflPEN243QrIRZ66jNiZG4SwMhrFAXWQOJTaQfgiP99RxccAB54nON2xPHMQ
	IddDMdoQ=
X-Gm-Gg: AeBDiesGO7Ls+gHUN6XVCHeDAhCZCH2X4mQkkjT655s6C8wnXqVGegOvTU27teYamHg
	M6nCvKSiAR8iBtb6Vif1old6xsZOUVX2eVMje38lp4jlHLKe8RIHUbPFboggXmaig64Z4E1zq4C
	VGrD2oidaUw6Rp/3aiNPs/qTx7NY8qPG5cBLx5M6Tmg5+CmBYyS4wP3Rt9Q8Yxk1/yw03eeL7rh
	wxSyMzsJUQgedQwvrSprLkXOm1l4CN9XZB20Qx9THEU72q1umYpZQpY9mth2Ev9oVJhdVBsuYHz
	tDNxWMfkoYEzGkzi8i8bmYJzfU4bQ0ca2mWGfzE1ZC7N2LdPdSgmUyyM9o/0TBQnmgD3/n2Pl8e
	3YvdzRXs2/X7qzWfxw1aXaCPUBkpiuClKRsUXaMz1lqqdX7mXYal5b6c87AE/G1ehqpinB153R6
	yG0mbsUeBh+fzwA20MECdadsWtaeI4OOJ3CVQtPWwvl+133k4v9p2e96UtnB8F6LiDWbrVrQPLF
	4hPUPTn1zjRAVvlUmmmVyoK37ifjnY87othVY4=
X-Received: by 2002:a05:600c:3b23:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488996ecd50mr231851245e9.10.1775578588914;
        Tue, 07 Apr 2026 09:16:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 18/19] ncurses: fix for CVE-2025-69720
Date: Tue,  7 Apr 2026 18:15:55 +0200
Message-ID: <4a046b39185314ceafbc7846b9c00fb8984c71ce.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234771

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
 .../ncurses/ncurses_6.3+20220423.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-69720.patch b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
new file mode 100644
index 00000000000..d570b2007a7
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
+index 0ee0b958..538aca5a 100644
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
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index 68a845f27c8..15ea2756cdb 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2023-50495.patch \
            file://CVE-2023-45918.patch \
            file://CVE-2025-6141.patch \
+           file://CVE-2025-69720.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"

