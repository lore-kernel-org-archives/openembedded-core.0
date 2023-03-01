Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E57C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 05:03:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.15263.1677646987540223062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 21:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iEFRjapS;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso10768996pjs.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 21:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1677646987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kpjfYtRZ9z3yGoIQ9A9A8NzTiVBC0zN6bSt2YP8fhQ=;
        b=iEFRjapST064GQm7BLfgaJYlefpx95t7d+cUIwcm18c3DRQTgD0fk3NysJzrSk2M8b
         b8cyAeazmrzPAizmwOP/5D4PVDjb/Liqli5vanFy9pUmdV3FU5DXG4JxrrI2w/6wkeu6
         E1cbpRzvkrZ9LFeg7DQiWYpsCxDmwl9dUF9sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677646987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kpjfYtRZ9z3yGoIQ9A9A8NzTiVBC0zN6bSt2YP8fhQ=;
        b=ngKFMXt6tXVC9ZjaqChgfHLiWh1rl7leMp0DU1GWcq2ZKzSXTpMhCDFwVO4/c3KoSK
         7mN8xfnWqrx4oE0CqBStKFqeTpPhESHIdtK3O47NTgypXiem74wMUwHau3fcsxBIMxyH
         sJD5cYsthTHoLmkUskNtMuK/HvDX/JQ7CML/O3Q6yTTX9MuwHCyh1DODTsfqXWTxK8WZ
         fx6OBsPBAOHeAOgNWJud/UAPYpPZM4i7oiF1GQZGiX7ixKV47tMpCMP+7KFNVc2ExoE7
         cY2woKwyTR+2Va2CsrEQ6Tp3YKq0sGVF3STtiq5HCIL/BoXwF41uaXM5b74JN2RdCq7F
         Y/eg==
X-Gm-Message-State: AO0yUKVjiQUHuCQhWdyxE+GSpqfPQ7g81xweZFtn+Qa20cTg+vm+5u/6
	nQP2ZRApeURHajw8AOKuK8cvp53cO3PrdKKX
X-Google-Smtp-Source: AK7set8sPLhz3wmeBbwooHdk4VyH9h5qHaa07uP3yMwHJpzpsozQmxEnjnqiybLMT7ivlVlDqW3eTQ==
X-Received: by 2002:a17:902:b107:b0:197:9184:34c6 with SMTP id q7-20020a170902b10700b00197918434c6mr4045719plr.55.1677646986776;
        Tue, 28 Feb 2023 21:03:06 -0800 (PST)
Received: from MVIN00024 ([103.250.136.168])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b0019a82ff8c38sm7374212plb.29.2023.02.28.21.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 21:03:06 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 01 Mar 2023 10:33:01 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] less: backport the fix for CVE-2022-46663
Date: Wed,  1 Mar 2023 10:32:58 +0530
Message-Id: <20230301050258.14818-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 05:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177864

Upstream-Status: Backport from https://github.com/gwsw/less/commit/a78e1351113cef564d790a730d657a321624d79c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../less/less/CVE-2022-46663.patch            | 31 +++++++++++++++++++
 meta/recipes-extended/less/less_600.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/less/less/CVE-2022-46663.patch

diff --git a/meta/recipes-extended/less/less/CVE-2022-46663.patch b/meta/recipes-extended/less/less/CVE-2022-46663.patch
new file mode 100644
index 0000000000..4d61a52fa6
--- /dev/null
+++ b/meta/recipes-extended/less/less/CVE-2022-46663.patch
@@ -0,0 +1,31 @@
+From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Fri, 7 Oct 2022 19:25:46 -0700
+Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
+
+
+CVE: CVE-2022-46663
+Upstream-Status: Backport [https://github.com/gwsw/less/commit/a78e1351113cef564d790a730d657a321624d79c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ line.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/line.c b/line.c
+index 0ef9b07..9d49cf8 100644
+--- a/line.c
++++ b/line.c
+@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
+ 		/* Hyperlink ends with \7 or ESC-backslash. */
+ 		if (ch == '\7')
+ 			return ANSI_END;
+-		if (pansi->prev_esc && ch == '\\')
+-			return ANSI_END;
++		if (pansi->prev_esc)
++            return (ch == '\\') ? ANSI_END : ANSI_ERR;
+ 		pansi->prev_esc = (ch == ESC);
+ 		return ANSI_MID;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index 9ebe39daab..f68281ac93 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+           file://CVE-2022-46663.patch \
 	  "
 
 SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
-- 
2.25.1


