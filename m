Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55365C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.9463.1740659547714429973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ScbhGoWK;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2feae68f835so525519a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659547; x=1741264347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4p7D7SXiZW3e748wBmm47AB0TdqyY5+Nl2hxk+t1Aw=;
        b=ScbhGoWKSPXbvd+RyBMQek0a3xuAddN21k1lynNaDlrXhyuGY5iISvtJLBDJ2aObid
         IH33A0xSkfWz4UPqk5yQHfojK7Nxf5wnQZp5zuGq0OkwFEFAa9NkfMII1rEWi9LnPbIm
         Lr4lppar3NosccrBuQUWj4e50XhdPBK4QqXtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659547; x=1741264347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4p7D7SXiZW3e748wBmm47AB0TdqyY5+Nl2hxk+t1Aw=;
        b=p6k87juaLrQg48/x8bFKSkoqVOW99mUHGV4P8hDjBr2RHLn+GrBXXpKDh5KY9L++XZ
         MXEQ0eSPCYymhYmLhYWSFlpqyPj1YpqHkUuQoIWMgAV0GLOVGP3wb0prrOpbI/c1MMEH
         7RfAUFzp+R0NU2fojcF4W3PPey9xNDUrth1zfF0FafIN9M/R4IFlurv5dXCDhC4Ft4Xh
         vwOaQMwgjC/VppszLCMFNLkoN+zGbav7VoiES1U771Q8dyPFltGR3Wk9NsIrZJqrzlgV
         5e8/oKE02Uxexc6SIGpjGJYzWql8mlKPjCQlwdWIR0SMoFEWCZRbVtD8S4O6rd//4GkP
         yyzg==
X-Gm-Message-State: AOJu0Yzr+HoCsdsvtyNC2/eIVCBCo4PlCq6Qf7IKTUmcr4fxTIq/zbuD
	EHH5r5wlbmS6OTZYuqq88/BoYq27EL96j/n745RyRjDrt6P2JyFRyRpw5yeXthoRP2e+yxusYmm
	25IA=
X-Gm-Gg: ASbGncvyySQyorQUFitjBDucgXc9ISiWGiZM2oKPGmAkw0bWQX8LBSsNQjVIkjOeGIp
	VnyrSuOal4IeaFNOtjPKbJ3MPt8BTMp1BH4BCkYx0ZoR+XUzakdhBUz8Q4Jc7sEsYEYN/qs4nP1
	T7f6wKixJsv5TH+oG2R9IQXm+TP6BrX4P2mLpZ5lzNXPm+HL8qey6jy3uxV6SMFurZzw8MeMxW+
	8KTOIko6h9XVazjDi8u1JG4JD116fjTuNei5S3ERoR5MMHdan6X9Odj2SSUaBu8aWGvar4DXUd0
	Mj4EcTlMaW++y2VtRfaz8nSGQYDUhFYzbbA=
X-Google-Smtp-Source: AGHT+IEqciIq0FG9ngki1+g+w5s5aGE+ecPptXwqbqZzYin/sAaRUYP8aIZ8bQh9SR33Aomj9+3Rkg==
X-Received: by 2002:a17:90b:570f:b0:2fe:ac01:8016 with SMTP id 98e67ed59e1d1-2feac01813cmr1836645a91.34.1740659546596;
        Thu, 27 Feb 2025 04:32:26 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:26 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/9] xserver-xorg: Fix for CVE-2025-26596
Date: Thu, 27 Feb 2025 18:02:01 +0530
Message-Id: <20250227123207.270978-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211994

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26596.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch
new file mode 100644
index 0000000000..f9df8d75ea
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26596.patch
@@ -0,0 +1,49 @@
+From 80d69f01423fc065c950e1ff4e8ddf9f675df773 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 11:49:34 +0100
+Subject: [PATCH] xkb: Fix computation of XkbSizeKeySyms
+
+The computation of the length in XkbSizeKeySyms() differs from what is
+actually written in XkbWriteKeySyms(), leading to a heap overflow.
+
+Fix the calculation in XkbSizeKeySyms() to match what kbWriteKeySyms()
+does.
+
+CVE-2025-26596, ZDI-CAN-25543
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01]
+CVE: CVE-2025-26596
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 85659382da..744dba63d7 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1095,10 +1095,10 @@ XkbSizeKeySyms(XkbDescPtr xkb, xkbGetMapReply * rep)
+     len = rep->nKeySyms * SIZEOF(xkbSymMapWireDesc);
+     symMap = &xkb->map->key_sym_map[rep->firstKeySym];
+     for (i = nSyms = 0; i < rep->nKeySyms; i++, symMap++) {
+-        if (symMap->offset != 0) {
+-            nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
+-            nSyms += nSymsThisKey;
+-        }
++        nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
++        if (nSymsThisKey == 0)
++            continue;
++        nSyms += nSymsThisKey;
+     }
+     len += nSyms * 4;
+     rep->totalSyms = nSyms;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 94381a1a16..ec6550e545 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
+           file://CVE-2025-26596.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


