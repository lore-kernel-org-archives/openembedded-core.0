Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94983C28B23
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:32:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13033.1741181561268632438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dYVumk3E;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223cc017ef5so49323925ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181560; x=1741786360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgqpEcX0i9NAHqmB1xnjvMa50a9r/feAKoXm+zR7/dE=;
        b=dYVumk3EliQ3vtosJC3CxiT4Ew1gr1Pw3ATtp9jz7ik6gCx+lJ/yaYBAf3B88AojbI
         FTXyMpywjGakb1eZANYZrd7Rv/C07b01HLiizzfizO/HxgTTIYVrUWCTHtnTJVZit2Xu
         lSTnVMtQE89aAON6u6jCAj/5N77pgApPJjjWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181560; x=1741786360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgqpEcX0i9NAHqmB1xnjvMa50a9r/feAKoXm+zR7/dE=;
        b=g9w7Opv9UeC+a7br09Ft2FDNhXPb5UyPmFr/zEK6GZ2ZVoXZClS22w4Fm+OB2Vqhlx
         MCcwHqoljyb0zOCMlEJsJjY5zIXpl99YJJJqc20vofHHSJUtUtuVys2ROF9yMb6In8tz
         oAP1W2T9Di56tSn9tp7IL+hxJ7KmPFbgkXKmZCXBVvo4T2QlHf/4xulLX/T7jC2eBKuM
         fQG786phodUUzwEIT96ARCaOuZ/jQ0vjofAnCvUsMJLw1ViJTrBZGyWLjofJHGNbInAL
         I2WEyonArMd1/Xeq/f5VJx+ceEM2LQFQwd+/C5jjLOHLxcJQ8/Yj4EZEtGdNgNIGvyYC
         /h+Q==
X-Gm-Message-State: AOJu0YyGCRrXZMdmjBYynZPtobsZ/yArbQsnprm26JOBRaCcCgMEhBEG
	3cur1yxtKZ5MZO0ZTHkdtOF86nlKjr2TXX8JVELjs0MHaThpvqM/E5xjaLNb58vHPiVikucSYlW
	yGCs=
X-Gm-Gg: ASbGncuMk9HZlZc/JzI7GCuIXmhgWntgFqbNnHuKC1PmxmVTZ6gddPLLdWRj4tpIIjV
	cHs4QYjxLUrenNUK9XS9tinDappADmwzkt72x0UzB/ak3jxx83CxuhTIzlm9mIU/SSNHjxRW0kO
	Hw0C/AvA3KfQJWig1VFuAgPHn9ogKcWKzsequtuLeIdNso69ppdbM3cx9cxS8YqcKm0qrb4w31D
	Fouq7uHNAE8bjj1aeAJWI7ZqUNK7lan4J4OESaLSVavxJEA5MP2Mq4V+IDtOU6PHPkc4ZSflFUS
	Vf6HA28bJT3l7JFMKAOLd1QQb/z7zY5AUXokltxdnOoDT3Zj9CtrFvQ=
X-Google-Smtp-Source: AGHT+IEIYkHJAIuPJrj7hvY9GloP5PgBY6whFxOPrjJ/TQt3sLFBUtz3SA/GRaaRVhS5Aoj3h16Z8w==
X-Received: by 2002:a05:6a00:cd5:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-73682cc4027mr4831021b3a.18.1741181560264;
        Wed, 05 Mar 2025 05:32:40 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:39 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 3/9] xwayland: Fix CVE-2025-26595
Date: Wed,  5 Mar 2025 19:02:08 +0530
Message-Id: <20250305133214.169364-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212309

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26595.patch    | 65 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
new file mode 100644
index 0000000000..a7478d9e2a
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26595.patch
@@ -0,0 +1,65 @@
+From 11fcda8753e994e15eb915d28cf487660ec8e722 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 27 Nov 2024 14:41:45 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbVModMaskText()
+
+The code in XkbVModMaskText() allocates a fixed sized buffer on the
+stack and copies the virtual mod name.
+
+There's actually two issues in the code that can lead to a buffer
+overflow.
+
+First, the bound check mixes pointers and integers using misplaced
+parenthesis, defeating the bound check.
+
+But even though, if the check fails, the data is still copied, so the
+stack overflow will occur regardless.
+
+Change the logic to skip the copy entirely if the bound check fails.
+
+CVE-2025-26595, ZDI-CAN-25545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87]
+CVE: CVE-2025-26595
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkbtext.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/xkb/xkbtext.c b/xkb/xkbtext.c
+index 0184664207..93262528bb 100644
+--- a/xkb/xkbtext.c
++++ b/xkb/xkbtext.c
+@@ -173,14 +173,14 @@ XkbVModMaskText(XkbDescPtr xkb,
+                 len = strlen(tmp) + 1 + (str == buf ? 0 : 1);
+                 if (format == XkbCFile)
+                     len += 4;
+-                if ((str - (buf + len)) <= VMOD_BUFFER_SIZE) {
+-                    if (str != buf) {
+-                        if (format == XkbCFile)
+-                            *str++ = '|';
+-                        else
+-                            *str++ = '+';
+-                        len--;
+-                    }
++                if ((str - buf) + len > VMOD_BUFFER_SIZE)
++                    continue; /* Skip */
++                if (str != buf) {
++                    if (format == XkbCFile)
++                        *str++ = '|';
++                    else
++                        *str++ = '+';
++                    len--;
+                 }
+                 if (format == XkbCFile)
+                     sprintf(str, "%sMask", tmp);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 3af0bb9012..2215d2fe4d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-9632.patch \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
+           file://CVE-2025-26595.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


