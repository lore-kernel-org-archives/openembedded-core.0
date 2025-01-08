Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002F2E7719C
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:50 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.14223.1736325762810952429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XW3d3dJe;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf8f0ea963so220670966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325761; x=1736930561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1s1BvdSyA5ZxTDrlqjED6+TL2HQWqOBxGVp0dKNjKs=;
        b=XW3d3dJeOWo2EkjaHNyE0NDDSjrngPHGpawYGnN/Sr0PuklJWCopgx0mu3UEi+dD85
         7PE+KwPI6Jz+ZOgDSjBP6Fd1jJjB3/bVf2vvwLcu4+uP6xJb6pXt3WIbw0EemJRT+NeT
         nAHbqc9rj/vaZ/3tOMMab1fG4yV6b07tA2XB3JAOCj/N14zi25HWgGRYwB9Ci7IJuGQq
         mr4Hxd/N1n/O8S5nQbba1miZ8v2O76Q/RfB5ZLtCXq8ccYZVm1c0E0nKXTSM70upVhlD
         la7h7OVCx38HHL/1dHcT24nMf/CwVYv45QXqmGdAvSnVA1Q8Ha4PZU4xScmfPoXDM5E3
         SEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325761; x=1736930561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1s1BvdSyA5ZxTDrlqjED6+TL2HQWqOBxGVp0dKNjKs=;
        b=OoJA1ADed+oTEYespOcAiGmnb4vzQuZdYE/wTtltMiwiK5RDuJwWKhNZ0rd5PecfyT
         ynjGISDmxzJM1g+yqRBsoBu93X5R4KrPxrMTS11rtgcbGCAhBCoyIMcvKVf0YEApRvUT
         nO7Pk2jSQZ/U7Zkgux9w32FGUy8Rj7Wc/M5+UY0dcwsxLrWUnA6IiTNSBkCEJSGDNoLA
         5oIeq4Qu+XDjYbWkPX9hDZr/Rr5aR3YL5BfLsGzy9GLexQCmIVJ7tCLRiwKe0lzAeT36
         GhiSItbpvuQmTQYUuTqOirNQU7Amtf1aNSm1n1ucYQ7Uuc+6xR8dNqvs/ykCMa3y2XMX
         zniQ==
X-Gm-Message-State: AOJu0Ywel+TAPytL51zV8ucw6/zg64jC2GisRy+KlIwNZX/qTGDpfZmv
	XxdpG/Er0GtSXp9/HHrMb2XXlUbK8vy9V8dootv/NnFp7u69qIvtII5HAQ==
X-Gm-Gg: ASbGncshlAORzXcWhTRGlhqBLos1eeSN6GGwf/dUZlq+9FHAAFFYiZKEGscod2p8/vS
	VTnODdg29QzPHGRqZQL+n+TP8NPt+DvUevGOLi9FQhwQGbm2w/q7kow++x8oVLNzhh8W3nwGlTo
	hXFIYeB+juRFNn04egu7Zp3Zhsr00xh+/RwMd2dc+5/srCkdw+0pTB8AWLFBndJGH6f+BPAc/nR
	I/dxI1BBtogsIzgBLNhPxpGWy36weSwZmmv3OLx8nDE6cshX8avifvBZZzpKW+Z/Qf0LVEnAVM4
	q0kyEQwwsdLia19E1Q==
X-Google-Smtp-Source: AGHT+IEP16jjmnloqTpKzK5vssnB2DgLz1BT8ZM5B7eiPAeMDC38Td0eBrFeQAABJwXGWftRyBEjYg==
X-Received: by 2002:a17:907:944a:b0:aab:c78c:a705 with SMTP id a640c23a62f3a-ab2abc8f081mr156730666b.52.1736325761030;
        Wed, 08 Jan 2025 00:42:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/20] shadow: update 4.16.0 -> 4.17.1
Date: Wed,  8 Jan 2025 09:42:22 +0100
Message-Id: <20250108084226.117178-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209538

From: Alexander Kanavin <alex@linutronix.de>

Remove groups entries, as that has been removed in favor of the coreutils implementation.

Add a patch to support older host compilers.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-use-C23-attributes-only-with-gcc-10.patch | 29 +++++++++++++++++++
 ...nexpected-open-failure-in-chroot-env.patch |  6 ++--
 .../shadow/files/shadow-update-pam-conf.patch |  2 +-
 .../{shadow_4.16.0.bb => shadow_4.17.1.bb}    |  9 +++---
 4 files changed, 37 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch
 rename meta/recipes-extended/shadow/{shadow_4.16.0.bb => shadow_4.17.1.bb} (96%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch b/meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch
new file mode 100644
index 00000000000..4e2d3a89c34
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch
@@ -0,0 +1,29 @@
+From f2d8d96e8586772becd68593a5bd9e14632841af Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 7 Jan 2025 17:03:32 +0100
+Subject: [PATCH] lib/attr.h: use C23 attributes only with gcc >= 10
+
+These are not available on earlier versions and builds break there.
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1172]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/attr.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/attr.h b/lib/attr.h
+index 02c7e252..290514d8 100644
+--- a/lib/attr.h
++++ b/lib/attr.h
+@@ -5,7 +5,7 @@
+ #include "config.h"
+ 
+ 
+-#if defined(__GNUC__)
++#if defined(__GNUC__) && (__GNUC__ >= 10)
+ # define MAYBE_UNUSED                [[gnu::unused]]
+ # define NORETURN                    [[gnu::__noreturn__]]
+ # define format_attr(type, fmt, va)  [[gnu::format(type, fmt, va)]]
+-- 
+2.45.2
+
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135c..699269ed643 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 01a26c9..82b2868 100644
+index 4d83e83..9ee0e13 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -601,10 +601,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53fe..cb3baf450c4 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
diff --git a/meta/recipes-extended/shadow/shadow_4.16.0.bb b/meta/recipes-extended/shadow/shadow_4.17.1.bb
similarity index 96%
rename from meta/recipes-extended/shadow/shadow_4.16.0.bb
rename to meta/recipes-extended/shadow/shadow_4.17.1.bb
index b7282d7933f..a70ecea1f2e 100644
--- a/meta/recipes-extended/shadow/shadow_4.16.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.1.bb
@@ -14,6 +14,7 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://0001-lib-attr.h-use-C23-attributes-only-with-gcc-10.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +25,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
+SRC_URI[sha256sum] = "51a946bbce141c5de14b6d47cab167206cd685d2307e917611dbc1be46c84a18"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
@@ -182,7 +183,6 @@ FILES:${PN}-base = "\
     ${base_bindir}/su.shadow \
     ${bindir}/sg \
     ${bindir}/newgrp.shadow \
-    ${bindir}/groups.shadow \
     ${sysconfdir}/pam.d/login \
     ${sysconfdir}/pam.d/su \
     ${sysconfdir}/login.defs \
@@ -201,14 +201,13 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1 su.1 nologin.8"
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 su.1 nologin.8"
 ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
 ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
-ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
 ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
-ALTERNATIVE:${PN}-base = "newgrp groups login su"
+ALTERNATIVE:${PN}-base = "newgrp login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
-- 
2.39.5


