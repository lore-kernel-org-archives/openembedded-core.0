Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F74DC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9468.1740659551539623758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T51YvL9D;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2211acda7f6so17709875ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659550; x=1741264350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngZEeeSUgK70VPLU4Zo/taV2ga8C3KZS38PLzaJ/thI=;
        b=T51YvL9Ds3IRIaTvp44rwlIDoWXmhui2ErLcJvg3LhSWlYBxD29tbyqrJ/DrLvMNM3
         7BWpKJ0JRzePcQP3JPOPkXpj4wvvXpSRsiNlwUTED0Wv9hV+KFZqyuBU7QRi1No6y5Pv
         iozqaAVhZWDHsrz7zG5Lh96j+jdklqpRmOpsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659550; x=1741264350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngZEeeSUgK70VPLU4Zo/taV2ga8C3KZS38PLzaJ/thI=;
        b=a451nSBC36uFOFFZlWnBmDEqNZkBql5SVnMNLLW9hqdSpQJ6yMs0AeQvhic/HA+48L
         DwR8oD5Fv7rNv6rdNjxbccgNt+tRXT4xEMUwqE2ZK/PX9Ba6+mJfu2EG/CtxUfTjUNYY
         lf5etWr9ZKOAN7o5OPgzoSIaBiYlk16hPQltG8+2QPYssjBQUjC5oFtXFNmQFporWof/
         DstSGd9EQCsXBbdb6fj0/PbUXbs0sbKHQSLSz9DldeHyOHt6OKHp75Z4+5Kev0poizZH
         AHs+sUdQ47FKEgSukCMC8Wkr2c9B9Zko8bRAquoxBLmVeuU1vc7rltTmx8i4Grn/g8CQ
         kDow==
X-Gm-Message-State: AOJu0YyTkN3KUUI5hXVr67k7IkGNsZQT0ukLna339aNKYWs/tXLsVXcW
	VNK/ZeAYVq6xz2uMyy7y1+JA99BgiCJsN7Q5aASDHzwlJKmUKVBVE/BwSezyPNqyQ5j7v15jqwO
	akLA=
X-Gm-Gg: ASbGncvTktJ/j/65IRXHOmmpm9co3VNK6Xpt8o2/IWzXkutb6u/evbFTH1XNHcos9ac
	nFyOurASEANz3JvieYE04TST15oaBcSf2BIvnTPv3DrFvE/FvOHPEKAH1bY4Lv80voRaVrOUjaG
	O8ix6BZD/oz2+51b1NRIIZWib817cfWwjNDSIImQutRax5kyiFYME1HfcMM9B0mUL/AUAE0cPrc
	Nkz3RRjv/Jt9/gIYBKuHPcyny3YEpwox9/aDte++oWjfDsCCvIAfNqmiWufNjIjrP6ZRCpe5aNf
	xaKRNQCiDugYafGKaIiRC2q8Q2BYIgDel7o=
X-Google-Smtp-Source: AGHT+IGjNdqGCVYju3QABMB56CS4s9Bn40RSJYsf71O9ywXx7t+STn5bg22SoYaiXjf/Go8M+oN6QQ==
X-Received: by 2002:a17:902:dac5:b0:21f:8453:7484 with SMTP id d9443c01a7336-223200b52d7mr99321495ad.30.1740659550531;
        Thu, 27 Feb 2025 04:32:30 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:29 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/9] xserver-xorg: Fix for CVE-2025-26597
Date: Thu, 27 Feb 2025 18:02:02 +0530
Message-Id: <20250227123207.270978-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211995

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26597.patch         | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch
new file mode 100644
index 0000000000..b0735d0b46
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26597.patch
@@ -0,0 +1,46 @@
+From 0e4ed94952b255c04fe910f6a1d9c852878dcd64 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 14:09:04 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbChangeTypesOfKey()
+
+If XkbChangeTypesOfKey() is called with nGroups == 0, it will resize the
+key syms to 0 but leave the key actions unchanged.
+
+If later, the same function is called with a non-zero value for nGroups,
+this will cause a buffer overflow because the key actions are of the wrong
+size.
+
+To avoid the issue, make sure to resize both the key syms and key actions
+when nGroups is 0.
+
+CVE-2025-26597, ZDI-CAN-25683
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949]
+CVE: CVE-2025-26597
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/XKBMisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/XKBMisc.c b/xkb/XKBMisc.c
+index abbfed90eb..fd180fad2c 100644
+--- a/xkb/XKBMisc.c
++++ b/xkb/XKBMisc.c
+@@ -553,6 +553,7 @@ XkbChangeTypesOfKey(XkbDescPtr xkb,
+         i = XkbSetNumGroups(i, 0);
+         xkb->map->key_sym_map[key].group_info = i;
+         XkbResizeKeySyms(xkb, key, 0);
++        XkbResizeKeyActions(xkb, key, 0);
+         return Success;
+     }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index ec6550e545..7c963e9fdf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
+           file://CVE-2025-26597.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


