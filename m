Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9779CC28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:32:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.13035.1741181569829754203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hJKegPQR;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224019ad9edso6791635ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181568; x=1741786368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTEuEBhJei1iViHf32h06QQ4HURSE6XxQS9INj2oris=;
        b=hJKegPQRGAfn8m+16JtJi7wMxfzUPSgnJBN2Htv1VanBIp4KNalBGOov6cg4qNsU8n
         eHwP+l137iUpSWTSBOkhK3zb5a99Op9xe9aydvpqGYcUQKKDGkCnGLY9SkVNQc/ONUPj
         +khatn5qOZVBfwxu+IX1q0gghAA1yWn6zzLJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181568; x=1741786368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTEuEBhJei1iViHf32h06QQ4HURSE6XxQS9INj2oris=;
        b=MkUPmw8PMBbnTQ/rafrV1gHjE+BQQyHFMxp7s9s1d7cUU+gLLa8h+aNrhs0NYKy97k
         ELujNxOffU99qCDLzRqHk5VN3JlVKJX1XLcHK13wpowh+MBeBUcmvT/sbb3jzph+DPxA
         N9mZELVSMXUsL17s/ZCOl88Af2w4Jw9vG3NRO+6M9UMXV9dcEbJlE0MXy9L9pD4TMgyT
         GzRvA/LDJss3TgDg62XEEUhmsb1P0JvTHmlpYKLe6z5hawMUppp4Dzwx9pXhnNaiYNIQ
         QZgUY9iev1vAbUdz7zwIgtyjYn71Nkgv+LqzADnV791JqCR5Ej6bTLXs3+KRQlm4tiDW
         mDWQ==
X-Gm-Message-State: AOJu0YxACTY98qU89SPb7wXAKJ9yRfa7A/XHuj5jfjGYyHqpPAJNv34F
	0YwF+5CrJThcXVHP0sP8MEsdopKGXMKBAHxk4nm/DvflwIaWYGR6tqjyeDMVV4k+5Z4QGH8cHSg
	kDEM=
X-Gm-Gg: ASbGnctd1lpbEtY45hRW6gZvC2jWrW3teS/h4OXcvVeUD2MQLWahY9T7KNK0ZI2T0Dv
	3M7hw/AdPANHVcwOd818x8uRiRZ1FXafsHAavPIIKTq4738SZSQ052OQKJYDifhRQYmzgdHUVpR
	MRkUAAVKuAiHi/i/99uK53s7RaTl+cyppzHwWj8P/RsCopv/W+i7jT494TnruW9rQdERF5aDMCC
	J08ejpKQDwAMfYWEPVoJFpa+xtJVGwMV7Z/7tkEc3NLSjrdMB6sszSyoSb7WoIoeCzuJweNNwUe
	106TB91qfrhfyZSVpNY7oVd2dF4Jxw/pUVzUF/bGnJe0UGUVw4sEelk=
X-Google-Smtp-Source: AGHT+IHjqzI7cSYNqj0e0z2eyQx2rCsat6szPqV4IiUXKwWHHrth+lN9kBYD5tzfnWV8ty+drVisng==
X-Received: by 2002:a05:6a00:928a:b0:736:5504:e8af with SMTP id d2e1a72fcca58-73682ca9b16mr5017401b3a.24.1741181568318;
        Wed, 05 Mar 2025 05:32:48 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:47 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 5/9] xwayland: Fix CVE-2025-26597
Date: Wed,  5 Mar 2025 19:02:10 +0530
Message-Id: <20250305133214.169364-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212311

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26597.patch    | 46 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
new file mode 100644
index 0000000000..b0735d0b46
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 63803a7a44..7f94c5e2e2 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
+           file://CVE-2025-26597.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


