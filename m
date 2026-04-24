Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F76FF884C
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31974.1777064213903389665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3N+CR50g;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso82268675e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064212; x=1777669012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxuFQGMXJ2OPiHHoSfyjByy5s/UCFEyYbvXhsGBjbOM=;
        b=3N+CR50gXz0aH0mmYyRY4/LEILIButepO6Wgi9owesG/CSGaoPLLNEPuLCia/SJUqb
         ELdYWJ1HTEQ3CAlbiIQzdbDCchLFdVaBjGGrPijtG6JxdxnL1qqxXRS5MuEW74q7WqgV
         AmaNn02SM45HMU6zg3/iInqtSEIB2T83cqkrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064212; x=1777669012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxuFQGMXJ2OPiHHoSfyjByy5s/UCFEyYbvXhsGBjbOM=;
        b=oV7CWT29pupBlcs63xk70ws53+UMC5Vv3PFiCQLcjvvmMjj3JNl51qzHMBa2FwyBhl
         eG30qyg5bXunfXtjwgJTZo2dMRF/+6j/6eecosdCL7VrwPe5UYU3iawVUFI4PiSSgev9
         GRJqHLepJKpnICBe5rjOL6lms6+BgggsFSZ237eNdOJmGPerDX2fJWLqXUYlmQnyaECI
         e0gngHMlpKBQZNsLIWWlBsQ56aiMnCKn7l2CmsDzbLKSxf+YrscqHbuQypSL5pZLlLCX
         kfSsP3/Uneb16/FiDgS/LC1X8wYq2ygGEm5I4uvLlN5eIelfcuZ549jLD82pVyjB+3VV
         8ueA==
X-Gm-Message-State: AOJu0YzB4gM7P7K5Fj75zy2uun8++pDjzM5otILDX/tWoQ0b3FiJ/yDB
	N1crdrk25sShyZm5gQDgtNx4HYudAxbkGyiZzr6VXSaaZ7QhTJRE29XTiCWWULKLkQwct6Qi5C2
	m2g6XFuCo70ng
X-Gm-Gg: AeBDiesiF8bjzCacKZTAHV8wVwvWDlBnHbz68nNbPiP5Z6lmJGA+TJBPJYK4bF1vkC8
	d+1vjpCfiIB0JWVJnvDA3ozt3GRB/8A0KXi/cbjwDLZtLFtcEtoO4+14ZaGj5BmsUfEF9B8D6gH
	2Fc4QaWA5YxCCaMi/6zsD2qq2as6iGU2ai9v0WON19HMP1M8gbA/PH9zlC8o4CHdxVegeazSOta
	g5Q9hUnYIoa4u6kqnXk9W3E74pSukuoOoyJ2hJBrahBQu42VshCuXu2skrHMHEaDJjtoFcV/9RK
	EHpvvv0mF/1CG0BrLDPKffy09MaJs6p/0ZYj5yt4c4zbyKkoSWCD66h1Qog1atmQD/9peY+fiN6
	fl+55B53DXRJ/vzyYlewZxGGp9skqQd8P+ABuHztC3Y/XGu9GOmzH3UvkRvslFoyPa6OWHI0erx
	TnpTd6+x67JrhAiZDElMeDRjEH3T5LfN9ZUYFFXxoXde4EzZKB5PB//r9ipSIh83brvA2PHiTx5
	2tBiW0x2sv/XZdrv/oz+/wZgYwwsERDd75JIQ==
X-Received: by 2002:a05:600c:a416:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488fb73a9fcmr387360395e9.5.1777064211919;
        Fri, 24 Apr 2026 13:56:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/66] libxml2: Fix CVE-2026-1757
Date: Fri, 24 Apr 2026 22:55:25 +0200
Message-ID: <decc9acf5aaa569e75f1e4986fb72530ad84c887.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235899

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2026-1757.

The shell is refactored [2], so backport the related code from shell.c
to debugXML.c.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/160c8a43
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1341deac

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
[YC: see https://security-tracker.debian.org/tracker/CVE-2026-1757 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-1757.patch        | 49 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch
new file mode 100644
index 00000000000..b6e6373ab0c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch
@@ -0,0 +1,49 @@
+From bbe186902eddca01cc2049780a1d1a37937d3862 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 25 Feb 2026 16:16:14 +0800
+Subject: [PATCH] shell: free cmdline before continue
+
+This patch frees the cmdline when it's not empty but it doesn't contain
+any actual character.
+
+If the cmdline is just whitespaces or \r and \n, the loop continues
+without freeing the cmdline string, so it's a leak.
+
+Fix #1009
+
+Reference https://gitlab.gnome.org/GNOME/libxml2/-/commit/160c8a43
+
+CVE: CVE-2026-1757
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/160c8a43]
+
+The shell is refactored [1], so backport the related code from shell.c
+to debugXML.c.
+
+[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1341deac
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ debugXML.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/debugXML.c b/debugXML.c
+index 9d9618f..2d5c99d 100644
+--- a/debugXML.c
++++ b/debugXML.c
+@@ -2866,8 +2866,11 @@ xmlShell(xmlDocPtr doc, char *filename, xmlShellReadlineFunc input,
+             command[i++] = *cur++;
+         }
+         command[i] = 0;
+-        if (i == 0)
++        if (i == 0) {
++            free(cmdline);
++            cmdline = NULL;
+             continue;
++        }
+ 
+         /*
+          * Parse the argument
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 25da11bd2d3..2bfa78324f6 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -30,6 +30,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-01.patch \
            file://CVE-2026-0992-02.patch \
            file://CVE-2026-0992-03.patch \
+           file://CVE-2026-1757.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

