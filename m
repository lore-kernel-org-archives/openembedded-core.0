Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B60FFD5F75
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 06:41:22 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100482.1775630475788491724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 23:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ePSfYsNi;
 spf=pass (domain: mvista.com, ip: 74.125.82.47, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12732165d1eso8175185c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 23:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775630475; x=1776235275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz5h+1wDERXIqqt7XFtH1pG1yVWMDy5poZ61r8g22Gs=;
        b=ePSfYsNikF0BzTz/zmniKXGO1VVq9MB1WuR8ayjSx/9Te3sn/qWyM+lVH/AN+jPXDi
         6+5AAgarVTRaK5uy+FP0VbSUaqv4wWEKvfd2Ol3+Q6aZxswXFhabuh6DiZ9ZLtwWFqXG
         eLKOGbOAKZGUKCbNWgkFJAjypGOoEQmzuBjO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775630475; x=1776235275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz5h+1wDERXIqqt7XFtH1pG1yVWMDy5poZ61r8g22Gs=;
        b=dfBstoEo3m4qyxgGPUXWSzj+VOyjBr/FHaS3ffSL6ymOoyNQgbccPDgSS/LtaPIFiE
         w2u3QVZyTY6iXLKZ3oMevV3dEd9oNv4MEGemx4w3ewzHeXjGfh9yffHQjnkBMYCqUcjx
         ZL0lIN+5vXR+EsboTvJFwGXPVxeWg7qqInZ9CKRjwUhHPaOoGu8QH7BV8+4Q2MjguGty
         EjCTXctG+4bENeMBtDXv7oAkJlvWRkks5S7ZbwykUOlVOWYqtcX79H8wz2kkZdMgMg0k
         A1os6mMaAbzxAiT3nkCD2Xl2PoTU/QNniA0tgdLQ2dH7N185U7L3gIH5yg0ipmSF2NWj
         Ei6w==
X-Gm-Message-State: AOJu0Yz3kuzTip7vCLSUYLfYfzbtA8WN41g3B/i+ogjsF3zocNx530e2
	oNo1SwesDKFxBEbMJVQeSEryq5+HO0Nl8npSx7HB0Dp2Flr6ua4mcBIMyKYKNGvszbcSFiQJqkH
	g3v5Oxwg=
X-Gm-Gg: AeBDietUGNtQPUuRk0nHlzSr+9HO/eSif6mNXxWpkocsKXDiyY8/jTu2KXdvdsqovxu
	6D7FC2hJVOMN+p1L1Rugz7sNADmJxnvTsqnLob4jvx4SJHes+72wIh4OrdQFixzoZhrLSdJof4q
	rU60Ry17G/mfTFQAiJchMIhqT9V3DXDQ3VAS0lOmTGK2OwMPh+8Vsfa3gBODaDf70M3KL4tK8ot
	rc5KGywwSZJjqUrRcAeoEPfPcQ8TwmXyNHYmu9k/53unf6BeYNdazZj31VCy6q2Gs2MpZBq1HEv
	iE7wyo+XMmFgMd6OzpbnCpAq/AvMl3ya3EHwfmLFQl8keudtBciSlAjtK95bo16hUWou50iOQyV
	ltnUyAWelf44bYbdOScaXL+h2pJo2o6lH2JjYw/V1e4Z8dpnTkK2W57uctGbv2bvh9G5mFhFwwl
	W7XFkikXfPICaUWQtSPHj4cN151rkikQL7ykY=
X-Received: by 2002:a05:7022:4a4:b0:119:e56b:98b9 with SMTP id a92af1059eb24-12bfb767886mr9533575c88.32.1775630474845;
        Tue, 07 Apr 2026 23:41:14 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm23799021c88.0.2026.04.07.23.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:41:14 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] ncurses: fix for CVE-2025-69720
Date: Wed,  8 Apr 2026 12:10:47 +0530
Message-ID: <20260408064047.331300-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 06:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234811

Pick relevant part of snapshot commit 20251213, see [1].

That has:
add a limit-check in infocmp -i option (report/example by Yixuan Cao).

[1] https://invisible-island.net/ncurses/NEWS.html#index-t20251213

References:
1. https://github.com/Cao-Wuhui/CVE-2025-69720
2. https://nvd.nist.gov/vuln/detail/CVE-2025-69720
3. https://access.redhat.com/errata/RHSA-2026:5913

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ncurses/files/CVE-2025-69720.patch        | 42 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-69720.patch b/meta/recipes-core/ncurses/files/CVE-2025-69720.patch
new file mode 100644
index 0000000000..8ab6953c85
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
index d3b4106118..ac30a1a3c1 100644
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
-- 
2.50.1


