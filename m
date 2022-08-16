Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9096C25B08
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:30:15 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.11496.1660620612036479944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9/ATeje;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 12so8190155pga.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wbp+i9FxWZplj3M65vQ+HyogWfMrCQWAnbAvb2uJRr4=;
        b=a9/ATejealkv0CoHHHSJjc/RAVh7hVzNlPtbvbGD9UZeNOdk+gCCdLWB+jPNyQRzIn
         YFY3aEf5VX+ynUHKPfu3TKcaR70D0axCKaxECDOejIJhS+Dsv1eVokmZ7iZ4o/IlvZ/A
         2XHRDOVfCw8kUwCqQgkYG5T3yxbYndzbMJwX2DdEkdmVHJsp3W9M6siezbIs5o8kmjvo
         sYt0+y1WzcwX4j0kH+NmzwGXVVlpoB1lDLwu+NdDgQllHdcAYyCky6aOfBLIQZzk0Ayc
         QBXEvPgmeLXBbz5DMw2GsEb3WGNKY4qpowTjzNtSPrGJXoMJCG3+v7ZrfAuioeDGEhe7
         R5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wbp+i9FxWZplj3M65vQ+HyogWfMrCQWAnbAvb2uJRr4=;
        b=uNEQzH12gwAs1gReO5P/0bvUiSio8Z/A1YC5BZglbeThFz/LxSaVGUs+vVtBlRfO/K
         BDys7J/SUktjNfCc00VFTDvzYE9obE2a2M7NMVWdKEyceoVXe1RDNau8oycbjyspMuYN
         G7CowzNi2DwNtUH1ctFUQLKUBBCr7S5btMmNbeeQb6FJe947hZ4/8hBSCj9HU2aTFWXH
         NB0QrUggP2S+6FmA0saFo9YasJ3pdOmrEkC5cytxBK42NsPz/fRDbRrL0l25lU0szGx1
         4yJC6OtTrXSV76e/6Vs4k+XAbmriKViJX/NuD7rCj5sV8Us0tK2iWEy7AWTrb/6u+fLy
         /I0g==
X-Gm-Message-State: ACgBeo3nbCvNLjGKReYTjSDRvnUbZaqe9ZG+fJqqIgQY5s9mSvB+rT/w
	ksuh/Bzzdd65psGBJ5uWrExxL3+9gqSiPA==
X-Google-Smtp-Source: 
 AA6agR7EPwvXnpWDO8couRcl6XtfEv2gIEoKheS6bzoeHat9oYrOz7HzCMXqZuHQhYdEjVII+nml4Q==
X-Received: by 2002:a63:874a:0:b0:422:8585:2e3f with SMTP id
 i71-20020a63874a000000b0042285852e3fmr13902548pge.567.1660620611042;
        Mon, 15 Aug 2022 20:30:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0052d87b76d12sm7218807pfb.68.2022.08.15.20.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:30:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] setserial: Fix build with clang
Date: Mon, 15 Aug 2022 20:30:02 -0700
Message-Id: <20220816033005.2700801-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033005.2700801-1-raj.khem@gmail.com>
References: <20220816033005.2700801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169417

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...needed-system-headers-for-ioctl-and-.patch | 41 +++++++++++++++++++
 meta/recipes-bsp/setserial/setserial_2.17.bb  |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/setserial/setserial/0001-setserial.c-Add-needed-system-headers-for-ioctl-and-.patch

diff --git a/meta/recipes-bsp/setserial/setserial/0001-setserial.c-Add-needed-system-headers-for-ioctl-and-.patch b/meta/recipes-bsp/setserial/setserial/0001-setserial.c-Add-needed-system-headers-for-ioctl-and-.patch
new file mode 100644
index 00000000000..10c6ae881be
--- /dev/null
+++ b/meta/recipes-bsp/setserial/setserial/0001-setserial.c-Add-needed-system-headers-for-ioctl-and-.patch
@@ -0,0 +1,41 @@
+From 9bbb342f5d9ad5dc75486fd35ada8e287ba19299 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 13:03:17 -0700
+Subject: [PATCH] setserial.c: Add needed system headers for ioctl() and
+ close() calls
+
+Add int return type for main() function
+
+Fixes
+error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
+error: call to undeclared function 'close'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declarat
+ion]
+
+Upstream-Status: Submitted [https://sourceforge.net/p/setserial/discussion/7060/thread/95d874c12c/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setserial.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/setserial.c b/setserial.c
+index bfda8fd..6a95513 100644
+--- a/setserial.c
++++ b/setserial.c
+@@ -16,6 +16,8 @@
+ #include <termios.h>
+ #include <string.h>
+ #include <errno.h>
++#include <unistd.h>
++#include <sys/ioctl.h>
+ 
+ #ifdef HAVE_ASM_IOCTLS_H
+ #include <asm/ioctls.h>
+@@ -715,7 +717,7 @@ fprintf(stderr, "\t* port\t\tset the I/O port\n");
+ 	exit(1);
+ }
+ 
+-main(int argc, char **argv)
++int main(int argc, char **argv)
+ {
+ 	int	get_flag = 0, wild_intr_flag = 0;
+ 	int	c;
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 5b31cd183b5..e46aeb90cb7 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -15,7 +15,8 @@ inherit autotools-brokensep
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
            file://add_stdlib.patch \
            file://ldflags.patch \
-          "
+           file://0001-setserial.c-Add-needed-system-headers-for-ioctl-and-.patch \
+           "
 
 SRC_URI[md5sum] = "c4867d72c41564318e0107745eb7a0f2"
 SRC_URI[sha256sum] = "7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a"
-- 
2.37.2


