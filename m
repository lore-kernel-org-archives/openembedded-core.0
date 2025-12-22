Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F11E6916D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87666.1766434084519559317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W9K2a6zm;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8052725de4so272287566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434083; x=1767038883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riOcR9LzaSyg8mpyUuzIYX2fdlGfHIYyB8bPWyDXibE=;
        b=W9K2a6zmpK6W5uuT5K8kk5+iGsL9BbObPbb2qic9YG66LRKgP6kEhB5Xx/n2pwFz41
         jLTIMacbG7EqQgc7LJMnhTsEWaOzWf8Y1+zRJRPoMWzJjmCOJBuwysXhbbHEUZf0Tdqo
         Zx+X6eWWAdUQuiipX44KjNT1YnzDBotISR0dN0cgGKM32oLi975MeTeCRlWSjrJRbzbM
         OvGKiqfUbLo42URBwTcqXx5EUGtnKfj23slGW5b1bfNicybwjgNpo7vaHmNLEbqw3H02
         JcrMseWYjD4P1g0hDvKjNyt0ixspHuaPsxdC3JgVsasoqwTP2pz6JjYQaCxucKxBKVPP
         iwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434083; x=1767038883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=riOcR9LzaSyg8mpyUuzIYX2fdlGfHIYyB8bPWyDXibE=;
        b=XBJshl3ULQpwmkvO+NvgZn3CMJqatXM+492ARl+/z7OlBiAoqZiCKR0/A3oYEoZGbk
         DbNE6SiPg2FaHvQFOxR4W9+jWmFMN42dm9XiiVuj/FDZ0W2DUKKC3pgGgKuFjtCQZUhf
         wQewmYdrKRhnQ2+DA58vfT/XlcdQ/JO4FvHfWvRcul+yenEgg5iusO0KcLXsWWKVvdNl
         1Ne5WYffvFMKNuQsE3YWgVqBOe2QvuZUtCZ01ogsdgKwgGiT0bxdqEGdPhHvvuXYuG80
         YwY9ND3OjNSa3HTcqQl3eA50BJovx1MGFTseEEYxkQyLXXup8AvrnkKe/FPF1cQwZNWM
         6+3g==
X-Gm-Message-State: AOJu0YyErCy3+ZNqVEQBGPlNoDYHcSxkC9o0UhyW+Qnw8pi3shriNSuO
	j394uSrvh306QFtOc1koB0AcxQ93+zvSVOTMA0hUyTR+gUHUKhb14ID6iTU7lQ==
X-Gm-Gg: AY/fxX5oZyikWfdQPwice6XS8J86d0qgpd+l2JDpP9HVqs23qWzK+E6zGbzb3xlf0xF
	48UpBUpG6Ah2BBaMJwsrYtFi/nvPQYmx6z9PhKuN9rT09DNHQ5jGs1NqMiksYu5jG272QUWQaUz
	YkWmna3H1MtJ387NCkAbFr/vGLnFkmvKUHdm0+2cqaDbg1AwwIl3SBN0Krmgparv2vcvLZhFBOp
	DAwKplz4k97EY1WtTPMwbHv27lmgvzeA1Zdc1R09pI77mzyE0QpML4P2p9XkZ52UbdnBOxETjx5
	1dwECQIhRLXRShpyzzQ56G3hcjSC1ZloyufCFGMnY4LTnq4Q2uh/HmM61TdkFfLPF7B/78QMA8s
	EhSDJNPQIGB54RlJkyp6E7QYnHNZNpPQe7d6IiLrwWpQ+bzOMSRpu4h4rdNbRw1z8eayrC9oeMy
	7Owq/33PVKuqW9W6I0M/sRoV7SYb7GO4+aD3xODj5dIz75hi0=
X-Google-Smtp-Source: AGHT+IHnSuURlGy9ZRGeY2gnANzZAYG+p7+kUSgnQ8doDV+waMnOAWPEx7iQJOuRk4Fn6kiV1vNqgQ==
X-Received: by 2002:a17:907:7246:b0:b73:792c:6326 with SMTP id a640c23a62f3a-b8036ebbbc5mr1228170166b.11.1766434082748;
        Mon, 22 Dec 2025 12:08:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 023/114] iproute2: upgrade 6.17.0 -> 6.18.0
Date: Mon, 22 Dec 2025 21:06:05 +0100
Message-ID: <20251222200739.2278706-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228348

From: Alexander Kanavin <alex@linutronix.de>

Backport a musl fix.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nk.h-add-missing-include-for-htobe64.patch |  2 +-
 ...ridge-avoid-redefinition-of-in6_addr.patch | 34 ---------------
 .../iproute2/iproute2/fix-musl.patch          | 43 +++++++++++++++++++
 ...{iproute2_6.17.0.bb => iproute2_6.18.0.bb} |  4 +-
 4 files changed, 46 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.17.0.bb => iproute2_6.18.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index c4dea39676..614cd00499 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 9e427aa1c647f741b08a1f0c44483ea974c7fc61 Mon Sep 17 00:00:00 2001
+From 228a051a53a4e6b1ca2640932cb78a23e44454a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
deleted file mode 100644
index 5315358024..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ad944bd173cacc098f224e7db7248d7210821fca Mon Sep 17 00:00:00 2001
-From: Yureka <yureka@cyberchaos.dev>
-Date: Sun, 12 Oct 2025 14:39:47 +0200
-Subject: [PATCH] lib: bridge: avoid redefinition of in6_addr
-
-On musl libc, which does not use the kernel definitions of in6_addr, including
-the libc headers after the kernel (UAPI) headers would cause a redefinition
-error. The opposite order avoids the redefinition.
-
-Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
-Signed-off-by: Yureka <yureka@cyberchaos.dev>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=25b2834cc974729229afcd308f127995405f85c5]
-(cherry picked from commit 25b2834cc974729229afcd308f127995405f85c5)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- lib/bridge.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/bridge.c b/lib/bridge.c
-index 5386aa01..104f5858 100644
---- a/lib/bridge.c
-+++ b/lib/bridge.c
-@@ -2,8 +2,8 @@
- 
- #include <net/if.h>
- 
--#include "bridge.h"
- #include "utils.h"
-+#include "bridge.h"
- 
- void bridge_print_vlan_flags(__u16 flags)
- {
diff --git a/meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
new file mode 100644
index 0000000000..20907dad50
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/fix-musl.patch
@@ -0,0 +1,43 @@
+From 6c1113633fde51b0e60f02243cfad1b3d09762cc Mon Sep 17 00:00:00 2001
+From: Akhilesh Nema <nemaakhilesh@gmail.com>
+Date: Tue, 2 Dec 2025 18:11:24 -0800
+Subject: fix 'UINT_MAX' undeclared with build with musl libc
+
+- utils_math.c:136:20: error: 'UINT_MAX' undeclared (first use in this function)
+- tc_core.c:51:22: error: 'UINT_MAX' undeclared (first use in this function)
+
+Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6c1113633fde51b0e60f02243cfad1b3d09762cc]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/utils_math.c | 1 +
+ tc/tc_core.c     | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/lib/utils_math.c b/lib/utils_math.c
+index a7e747440..fd2ddc7c7 100644
+--- a/lib/utils_math.c
++++ b/lib/utils_math.c
+@@ -4,6 +4,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <math.h>
++#include <limits.h>
+ #include <asm/types.h>
+ 
+ #include "utils.h"
+diff --git a/tc/tc_core.c b/tc/tc_core.c
+index a422e02c8..b13b7d78a 100644
+--- a/tc/tc_core.c
++++ b/tc/tc_core.c
+@@ -11,6 +11,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <math.h>
++#include <limits.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-- 
+cgit 1.2.3-korg
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
index 8840e4ba89..e078bcf3a9 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.17.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.18.0.bb
@@ -13,10 +13,10 @@ DEPENDS = "flex-native bison-native libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
-           file://0002-lib-bridge-avoid-redefinition-of-in6_addr.patch \
+           file://fix-musl.patch \
            "
 
-SRC_URI[sha256sum] = "9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec"
+SRC_URI[sha256sum] = "6ba520e1975e4c50dc931eeae91ea37c198b8a173744885f8895b84325f9d456"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.3


