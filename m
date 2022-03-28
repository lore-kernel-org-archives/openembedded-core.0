Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D525BC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:53:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.9082.1648461191308080360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Arleyk7t;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461189; i=@fujitsu.com;
	bh=x1yKi0r6Xs8TNhBr8a4L48nOl6Z5gF42F1jo6leRqAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Arleyk7ttMYgtDNnUqboWnBj3Fzyd+ZUl0eqTEc4ht5561o5smst8GA/R5ffWHNdg
	 zq/fXu/x+XzTaEJQjIq5pBMXz2YhgaS1xPxBKXPuUfN5lksdOCUoKrI5fVzVdMkutk
	 hihw3oOPuLWviRq+11wD/v1UeJYlYZEf/+pFP54+xh6hPehgyjLxidwYsu+Jiw9iHe
	 MUB0O7RsTIXgXIL67ZeaCsbSvDLQu0LYqbXed1LBTR0NT3JmxwlrbCKyyc+f6pxuqg
	 8nw07fN15UZ7r/byYJZIkMqQjcZWN2pENQ4S1/mXyiaJk5k4cjX/g1xAkvUPiOWpw+
	 a9Ntm3evPXt9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxRbe11TH
  J4OI8Xos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePH2mnsBe/EKr4sbGBqYDwn0sXIxSEkMItJ
  oqGrlxnC2cMoMfH4ApYuRk4ONgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu4cdxBYWsJWY9
  aufFcRmEVCVePdwElicV8BJYvWJ48wgtoSAgsSUh+/BbE4BZ4nDn04xgdhCQDWzr19jgqgXlD
  g58wkLxHwJiYMvXkD1KkrMvtzMAmFXSMya1cY0gZF/FpKWWUhaFjAyrWK0SyrKTM8oyU3MzNE
  1NDDQNTQ01TU31DW0NNBLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfrFVfmJuek6OWllmxiBIZm
  SrH7vh2ML/p+6h1ilORgUhLlNcp0TBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXurGSgnWJSan
  lqRlpkDjBOYtAQHj5IIr2kTUJq3uCAxtzgzHSJ1ilGXY+eWy3uZhVjy8vNSpcR5g1uAigRAij
  JK8+BGwGL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXheQKTyZeSVwm14BHcEEdMTad7Y
  gR5QkIqSkGphE1n5LMPxonNsrUP5V/+m0l71qnkd27l1wV11PeSHnleyskOxfCrdyoiuiT//v
  W/i/+HjR7iUr9HzLmEMcZ5Us6VWJnShaXV3+xsG69Xf+Ytu1tru+/I4tPRM559+/sFdnDh04u
  nnL5wC2pRa/n5cFntuf4f51sdUC3eRXMpdazN8cXrOSX8wxg2khY0/J7PvOC6Sbt51VSO44aX
  30I7err6O7+8LjbzexTjuUV+9tai6tEfHydqQDS88pSaWLv61nqf29xHFi2stdrb+/b97ikyU
  ZMPnevj2LT78xNdbvXqUZ8UpIxfrQDLfl1S/yvt76vS3m66anmYkZn8x3sy9f224rJZgVtfmz
  +Cz/BffmKrEUZyQaajEXFScCAAGcFlxUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-545.messagelabs.com!1648461188!25558!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26851 invoked from network); 28 Mar 2022 09:53:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-23.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:53:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22S9r8Dk030916
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:08 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:53:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 5.16.0 -> 5.17.0
Date: Mon, 28 Mar 2022 17:52:50 +0800
Message-ID: <1648461173-15770-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
References: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:53:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163695

0001-lib-fix-ax25.h-include-for-musl.patch
removed since it's included in 5.17.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-lib-fix-ax25.h-include-for-musl.patch | 37 -------------------
 ...{iproute2_5.16.0.bb => iproute2_5.17.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.16.0.bb => iproute2_5.17.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
deleted file mode 100644
index e4c0cf4aa5..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Thu, 13 Jan 2022 08:14:13 +0000
-Subject: [PATCH] lib: fix ax25.h include for musl
-
-ax25.h isn't guaranteed to be avilable in netax25/*;
-it's dependent on our choice of libc (it's not available
-on musl at least) [0].
-
-Let's use the version from linux-headers.
-
-[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
-Bug: https://bugs.gentoo.org/831102
-
-Signed-off-by: Sam James <sam@gentoo.org>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=8bced38a941a181f1468fa39541e872e51b6022f]
----
- lib/ax25_ntop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
-index cfd0e04b..3a72a43e 100644
---- a/lib/ax25_ntop.c
-+++ b/lib/ax25_ntop.c
-@@ -2,7 +2,7 @@
-
- #include <errno.h>
- #include <sys/socket.h>
--#include <netax25/ax25.h>
-+#include <linux/ax25.h>
-
- #include "utils.h"
-
---
-2.32.0 (Apple Git-132)
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb
index 871f8d8fb7..becbaa9190 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.17.0.bb
@@ -2,10 +2,9 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-lib-fix-ax25.h-include-for-musl.patch \
            "
 
-SRC_URI[sha256sum] = "c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f"
+SRC_URI[sha256sum] = "6e384f1b42c75e1a9daac57866da37dcff909090ba86eb25a6e764da7893660e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.25.1


