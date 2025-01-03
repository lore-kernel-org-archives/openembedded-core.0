Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AB3E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.27854.1735901132323203599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FlFq6Lpn;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436281c8a38so86913655e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901131; x=1736505931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T77+XNGIb6wZwH0pDsFatImhY1q2f1iyj3KDw4eBPLE=;
        b=FlFq6Lpn4mXuBgBrlhimnn8chY1WzWjvuQYYrHo3XxMsrEDydEKjA6faOsmFDmIQBG
         xe666nXLh0tOWRW7s1UjzFVG1Vzy9OagidBg9zXWWyBlb4S1uDBlwtxoqdcr+yOwnjlb
         a2SBTgWhyNbnPK02nqLYonOIzzSFCWwMV/dYuBXQc+q/6BJrtAieY9IqEMpd4hoHkAcX
         jr5sU5E9KkWKVpxcljzClI/3UjpTt0TH+861uqfRIxOnNv5PUXpfwmMu4T8grkJSI76H
         EtXMvglD4KRMqXwDA41T5yJ8okEOAVbw+B5ZfBP0aRdew0j6qL9EINXjN8+DMzlB/lYy
         UqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901131; x=1736505931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T77+XNGIb6wZwH0pDsFatImhY1q2f1iyj3KDw4eBPLE=;
        b=YbPgmWGsAgmSEo7tN149jHsxsZKB2A1IOCaBRCVCFufhpdpa0+YJtpN6WYJgfW6kqM
         k2WMUxMZZYTsagasIQRjDWIcp4GgoHXevtFzferncscmVLpd2isD5RWPlYaGCljfK0mW
         bObzUyBAGaOxnr5tMPkO7zdZ0XNed0bfsFuwAYEmrnIFQH1DJxmQ6hxYG/TTQEImn3EA
         zd7Gs5NX7G70l37uWOlbI3W8e0T94+ZgblfqC49/Sm4mahLEvZXYGrQ1TVm321SJ/nIc
         wUB89vdZTS61dTQ+3Aa+G8qEbmh8avgooNVdbnLO95MhKeJ5X62rbu3KptgdamSF+6KB
         5WOA==
X-Gm-Message-State: AOJu0Yy6IxvlXQseKWS04AVOPCldZUvcYZ4dDt0x9oL0ifhq7R4Ojiqr
	CDij69MdHtcSrEf6WJYMeosXo8Q1bQmM4Fa++kak3gdBGO9YV1gPKNtIGw==
X-Gm-Gg: ASbGncviEgnVM7Ud1H4yTyBT2yFeZPbthcKLD3IEETPrin5yQ1wmyUASKt3IwayR12U
	1KxUsX1aJHhk8kIdx2AjXWn1KNVFmCbpoyXjcoUerET3h6x5PSHhOsadYTMRoJc7Xn5IRMeRw2v
	p0KkV4+IMaLu3AJ+rSRSCICPSBoVKLWNALIoPTb4Pi/kcZkqkbRk7/yMuUNPGhj9tVdQth5ZvNY
	15TLsjXcznKIvAGUewEgpRYd+paSwip/48jxKXeSAUNYS7a/GiJX2xnzSoleTfB7mnbjLyAnZ1F
	7kfh7CsWsB2bo4dmPw==
X-Google-Smtp-Source: AGHT+IHqYxLzAoHoYyUmBCGdsn5jW6pvrhC0CIFmrz4ViqtE/MnIq8IH5w8C+sz7me/Mn7PLiMsVug==
X-Received: by 2002:a05:600c:350c:b0:434:a91e:c709 with SMTP id 5b1f17b1804b1-43668b78c11mr328958065e9.28.1735901130314;
        Fri, 03 Jan 2025 02:45:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/11] libxt: update 1.3.0 -> 1.3.1
Date: Fri,  3 Jan 2025 11:45:15 +0100
Message-Id: <20250103104524.4053846-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209333

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/libxt/libxt_fix_for_x32.patch          | 13 ++++++-------
 .../xorg-lib/{libxt_1.3.0.bb => libxt_1.3.1.bb}     |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.3.0.bb => libxt_1.3.1.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
index ff8c675dbdb..79ae929d08f 100644
--- a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
@@ -1,4 +1,4 @@
-From f069b0a430fe96f3ece2106d34375008833599d3 Mon Sep 17 00:00:00 2001
+From c2916117aa09b7110ab1883e4295330ca7675e88 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 2 Dec 2011 12:20:05 -0800
 Subject: [PATCH] libxt: fix compilatoin with x32 toolchain
@@ -9,21 +9,20 @@ This fixes compilation with x32 toolchain.
 
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
-
 ---
  include/X11/Xtos.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/X11/Xtos.h b/include/X11/Xtos.h
-index 64b2da8..44f52c2 100644
+index 599dbe2..1686063 100644
 --- a/include/X11/Xtos.h
 +++ b/include/X11/Xtos.h
-@@ -59,7 +59,7 @@ SOFTWARE.
+@@ -63,7 +63,7 @@ SOFTWARE.
      defined(__sparc64__) || \
      defined(__s390x__) || \
      (defined(__hppa__) && defined(__LP64__)) || \
 -    defined(__amd64__) || defined(amd64) || \
-+    ((defined(__amd64__) || defined(amd64)) && defined(__LP64__)) || \
-     defined(__powerpc64__) || \
-     (defined(sgi) && (_MIPS_SZLONG == 64))
++    defined(__amd64__) || defined(amd64) && defined(__LP64__)) || \
+     defined(__powerpc64__))
  #define LONG64
+ #endif
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb b/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
index 1805dae7722..97323ad282c 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb
@@ -25,7 +25,7 @@ XORG_EXT = "tar.xz"
 
 SRC_URI += "file://libxt_fix_for_x32.patch"
 
-SRC_URI[sha256sum] = "52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91"
+SRC_URI[sha256sum] = "e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


