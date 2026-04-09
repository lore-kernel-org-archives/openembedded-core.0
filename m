Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6425BF36B93
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:42 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144837.1775776292441666458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SSfSB/sa;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b0046078so14823105e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776291; x=1776381091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dojgKuj1U3Ofmia7xnsKS6kU/Ct53OOxwo7dApi+roE=;
        b=SSfSB/saGQWAOFV2dnMhp6ZtDP718GR2pulIJSL/U3jRhBVSOG/Xwa3kdQ82jYr8DJ
         M7bUiEQtf8BmB4A5N3VfPyuoR4+QpUrQrXLm9t36CWq8UEfyhyVhO094d7BqRbfYdsG8
         lPl1jV3qK5GSPuCaqfogdKGi9qiNSpBzRwQ5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776291; x=1776381091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dojgKuj1U3Ofmia7xnsKS6kU/Ct53OOxwo7dApi+roE=;
        b=K7S8oMYBC4/Z3S0AsYeCIQq1jR/Jm4Ll+CZmSvVu/5URyjBwZRel4U/zrh2lJoteda
         XMvFIklgJ7dFgugLTV1KjAwjxWMgplZlp//o6rViI+dtQc2QkGewS/fpPap/eVUqNRB3
         zweWJJaa6kv6KwNvZw8M7ZlrPAsn2IWr3s9KHz9d5qh3V1/n2uu+16dgNVhGfPlymFIx
         dbz8lWehnkLFr8qvWYT4pr1Es4HC9IwY3vYYILP8kV9NuzP6uqVZE+3d/YfqqKq52pCI
         mlho8/RwX85uDHfjgOrpNbEOHfki0IZViejZi+gfkmNu9DCCiGkHeO5PQ3S2IlXYvT72
         vSaQ==
X-Gm-Message-State: AOJu0Yzp0b3j/XOrcJi1XKE9388QQRAHTk5Y/BiwTRkb1mT+lUJcbxP2
	OhFKN6TxU/0sdBrKsSmyLr+yjw8OKwZM+Z/WLZ7mt42cokUTLeT+wh6Nsr289vru1LNCtu3c7d6
	+gyQsvFZRxXaO
X-Gm-Gg: AeBDieu5P5uXbmfRjNtEIyePFKXHlHwy6Pk0OsTo83buOeR9wsROJMa2RdrzIdNjBeN
	E2qfUcr7jspRyYii6yeVjgqB6DIDai1cYAx/WCBI8aWfZPt9YnXDze5QV97ajz7cPh3r93F251x
	VL+v+QLVG/ytpRqLqYPkoWt9Habuq08PKNOmKYvfh7wjXbxet8xLmWc3tK93U+/83jAd5Lt68AQ
	h8a1yiFLCn/rCA2rk/ivcIar1i4gOlCaJSBMS9TsotuHtgB/m4kzz4GyQe+8GG9yJ7g69Dxfwap
	pDC2eSkqjUM2WtnW0fp+ZuS+oa369NFj1IUf9an5oNA1hoXt5auJhHGhPxO97FpUEhN9QP5JCK9
	DoD/zQUP+QREz3+TSNpxBoMxK2V+vmg4EJKmPn3W54ME7Isfk4yE1PAEFY0nejBXA4lCqqZRyDD
	ZLWM+WRaZJk2nHzOmv9MVmUCTHSd+2VNKwUpNmI76gJ1VZbRY6fQ9C8AY9Mpk28kY8z3XtKo/5k
	wyPVl15iXtQhNmlpd/24WPLvCEJ
X-Received: by 2002:a05:600c:8207:b0:488:a4d6:69ad with SMTP id 5b1f17b1804b1-488d688dd1bmr7392305e9.27.1775776290579;
        Thu, 09 Apr 2026 16:11:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 18/30] ncurses: fix for CVE-2025-69720
Date: Fri, 10 Apr 2026 01:10:18 +0200
Message-ID: <4a046b39185314ceafbc7846b9c00fb8984c71ce.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234977

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

