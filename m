Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC47C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:41:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.48312.1702500059630398601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iquGTDyO;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28694702c18so7211049a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702500059; x=1703104859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRgmtNfZ5muHysQmAIFLhDQFY5as9TazanwEFqSN6x0=;
        b=iquGTDyOyJ7wOgLb1NYVgrVpw7gF6JddxFPg+y3qmSjwqrckCOooF4lYclxuh9uZ1t
         lK/zrLXvsjvAHlcVJII54qsQgsRpC2oYQC9Q9fH1x1rn9hT6fIOz8gWINHFdUI3EKA1B
         b7APWOCFl8WUtT5jm40V2h4gbYvc95WYaog0RViOuL6b8laHSDtxmSzWyiiPx90iXBY+
         YK4y3RYMxEhhFNKyUSUtF3d37+4e5dl9lJ4Ru7hkkNESJGfaVvBFci1efqbFMa2qHVO0
         RQVRSOLkKz+dNDCuMvJp5r1AQqVVjI6R5uwJwE8PqODY9zFjkX4R6H8hJiaEYHvrfXRE
         jbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702500059; x=1703104859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRgmtNfZ5muHysQmAIFLhDQFY5as9TazanwEFqSN6x0=;
        b=P377ic4Gv3Wn3K0IHu/1JEUa9+jcUf1C4smr2BVU+UFSH6ShnGx58Bi5KO5roirq0v
         7vZONCMmYuAIqedJ1m675CLsYGru2lA2Cu/lqy3+1iDPV27i/h7WhJWKWRpwq0RFR9rw
         sw4b0rdQmox5QC7c+PgmFNe9KtJnFRGsjlwBYlO+QOK3nbqZtsPD0mz8gj5qXDFjzYHD
         7uuYPD6D3KOj8YI5TQRLpbPzJcjAtFt7cBJibzwz6nVEk9DeHzSYw8DaiVYcYXkxQhea
         f+2sxE0UuD6aR8YKhEanxjyAQpWq1kjrSR98u390In9au9LByxX3/++1qGRTmguuPolp
         K6rg==
X-Gm-Message-State: AOJu0YzoguYDjNp4hj+e743ElUDJL33bJAJCX5TPl9mvvGLeyR9kEoOY
	HE8g9+6/w3XPo8Jb1Ny/WtV1HEYP0Sw=
X-Google-Smtp-Source: AGHT+IEVhU6j+LAr9oJ1Xn0CHaDW/0AAio6S2sigTK+JsqL3w69wP6kVmScpoeDi52TocSMn3Wp4Sg==
X-Received: by 2002:a17:90b:394b:b0:286:a94a:867c with SMTP id oe11-20020a17090b394b00b00286a94a867cmr7034260pjb.79.1702500058690;
        Wed, 13 Dec 2023 12:40:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a018500b0028658657e9csm12497570pjc.46.2023.12.13.12.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:40:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] qemu: Fix build with latest musl
Date: Wed, 13 Dec 2023 12:40:54 -0800
Message-ID: <20231213204055.4183701-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213204055.4183701-1-raj.khem@gmail.com>
References: <20231213204055.4183701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192318

musl dropped basename() from string.h, adjust for that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...io-Include-libgen.h-for-basename-API.patch | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5ab2cb83b4d..cc508d961dd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://fixedmeson.patch \
            file://fixmips.patch \
+           file://0001-vfio-Include-libgen.h-for-basename-API.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch b/meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch
new file mode 100644
index 00000000000..5b8b638736a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-vfio-Include-libgen.h-for-basename-API.patch
@@ -0,0 +1,57 @@
+From e31c67ef65a4217f35f6cd40926251054094dff9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 Dec 2023 16:44:16 -0800
+Subject: [PATCH v2] vfio: Include libgen.h for basename API
+
+Glibc has two implementation one based on POSIX which is used when
+libgen.h is included and second implementation is GNU implementation
+which is used when string.h is included. The functions are no identical
+in behavior. Musl C library does not implement the GNU version, but it
+has provided a declaration in string.h but this has been corrected in
+latest musl [1] which exposes places where it was being used from
+string.h to error out especially when -Wimplicit-function-declaration is
+treated as error.
+
+| ../qemu-8.1.2/hw/vfio/pci.c:3030:18: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|  3030 |     group_name = basename(group_path);
+
+clang-17 treats this warning as error by default
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2023-12/msg01438.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+v2: Add missing link for [1]
+
+ hw/vfio/pci.c      | 1 +
+ hw/vfio/platform.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
+index c62c02f7b6..f043c93b9e 100644
+--- a/hw/vfio/pci.c
++++ b/hw/vfio/pci.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include "qemu/osdep.h"
++#include <libgen.h>
+ #include <linux/vfio.h>
+ #include <sys/ioctl.h>
+ 
+diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
+index 8e3d4ac458..a835ab03be 100644
+--- a/hw/vfio/platform.c
++++ b/hw/vfio/platform.c
+@@ -16,6 +16,7 @@
+ 
+ #include "qemu/osdep.h"
+ #include "qapi/error.h"
++#include <libgen.h>
+ #include <sys/ioctl.h>
+ #include <linux/vfio.h>
+ 
+-- 
+2.43.0
+
-- 
2.43.0


