Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C2AC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:52:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.147208.1673808716618346669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Du1VqgAO;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id bj3so23916906pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eajfo8R5ogrPRPSYGNd0ytoUyGMFARBm8GA7qlWCEBE=;
        b=Du1VqgAOf0QATxPAfeHmwYugY0pvZqCeWL85zI9ovyBYK74kSOpM2jqQE1TaXmmO/3
         oRIs9SZvYAauoWqeBKaqBkUl0E+Y4WzeBmR56NIZ1TZAfgCM8pIbKNUhY2rzQzrv/xhx
         qMFboV15JkaZpXzXjOUBqgUhssKF72abM/0K7egXvu+HRFesG3kddl4v6rhV+U2W5tBA
         G2NTpxiWkxgG9WnKr8pnGNQZ8NzBipQI3lJm/2zU44x/11mvpZKdgm0mypHuqri4qWMv
         zj7tsYIzMzR+vNcrqYdEeGBNXgsNfZoo4pGWTLfeugQbZ+O+4t2HxKRQYesixzW6b/AF
         zXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eajfo8R5ogrPRPSYGNd0ytoUyGMFARBm8GA7qlWCEBE=;
        b=XWbVIZw+K+Ieq486eEV56iQpumvcuOH0azl+TnFsyXO0BGC4UpodfwnJuMGXWlwQcO
         MJi5vHUhBd0CQ22nrnpm/Qp0oVXuAmtbiAfdpvHlKnEt1rsykbfHlujWug9/j9Iutq3q
         NQLu6DXxKfyWwEW3tVTDOmd8VvuXb/X0nJowB6EJkH/8huLTPKCtM2c7DPGt/U3yPJ4s
         7GJ7qGHpjBBlAnUtydI41c/UDx+pVdEnu2z4sLBghG6092h7MwyLGRuYnj4tdzYyMQdx
         Rsj8i/HX1cXazyZb8a9KFPgKa4/PtOGEdy3ssK6vVKhaPND4ZVpeXxgum5YxSBcmWciz
         dt8g==
X-Gm-Message-State: AFqh2koReK+uvnVd3FcD2p7+U13WI6/Oc5KFpsnJUqrZVXHynrXBqy1S
	UfmNF384U03ZPijXnnKTpHvOmQqMkQVNCA==
X-Google-Smtp-Source: AMrXdXswqYS/8JvK9qHznlmal/G99OOVho+f3yzZDNElyk1zQ6HXuIT61wzj4Wc2qYFsQ5c61Rki3Q==
X-Received: by 2002:a17:902:9898:b0:193:1aa5:573 with SMTP id s24-20020a170902989800b001931aa50573mr18394595plp.13.1673808715675;
        Sun, 15 Jan 2023 10:51:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019468fe44d3sm5417127pll.25.2023.01.15.10.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:51:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] libxcb: Fixed c2x standard undefined behaviour
Date: Sun, 15 Jan 2023 10:51:48 -0800
Message-Id: <20230115185153.2277534-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175950

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch | 45 +++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxcb_1.15.bb |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch b/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch
new file mode 100644
index 0000000000..5b159d646d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb/0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch
@@ -0,0 +1,45 @@
+From d55b6b1fa87700f3eae3a29522972d2e7be7d53e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jan 2023 10:11:35 -0800
+Subject: [PATCH] use _Alignof to avoid UB in ALIGNOF
+
+WG14 N2350 clearly says that it is an UB having type definitions
+within "offsetof" [1]. Clang 16+ has started diagnosing it [2].
+This patch changes the implementation of macro
+"ALIGNOF" to builtin "_Alignof" to avoid undefined behavior.
+
+_Alignof() return the ABI required minimum alignment.
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+[2] https://reviews.llvm.org/D133574
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libxcb/-/merge_requests/42]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/c_client.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/c_client.py b/src/c_client.py
+index fd256f0..4e48f13 100644
+--- a/src/c_client.py
++++ b/src/c_client.py
+@@ -288,7 +288,6 @@ def c_open(self):
+     _c('#include "%s.h"', _ns.header)
+ 
+     _c('')
+-    _c('#define ALIGNOF(type) offsetof(struct { char dummy; type member; }, member)')
+ 
+     if _ns.is_ext:
+         for (n, h) in self.direct_imports:
+@@ -1266,7 +1265,7 @@ def _c_serialize_helper_fields(context, self,
+             count += 1
+ 
+         code_lines.append(
+-            '%s    xcb_align_to = ALIGNOF(%s);'
++            '%s    xcb_align_to = _Alignof(%s);'
+              % (space,
+                  'char'
+                   if field.c_field_type == 'void' or field.type.is_switch
+-- 
+2.39.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
index 839577326e..411f51ac39 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
@@ -9,7 +9,8 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz"
+SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
+           file://0001-use-_Alignof-to-avoid-UB-in-ALIGNOF.patch"
 
 SRC_URI[sha256sum] = "cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059"
 
-- 
2.39.0


