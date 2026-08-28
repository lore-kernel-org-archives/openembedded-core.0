Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBD5C61DDC
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2975.1787945888778878669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MoP4JC/9;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso16510065e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945887; x=1788550687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6JHpQre6z9LjkfZLXiX97XgpmvVlJ2NoYKh+ZcLnBU=;
        b=MoP4JC/92U4c7b6RqwoBH12KkEJdvzaYBCtto8RaZDw9KN92OSa2pncymd3jdn+tMR
         u+vxcwcrB9vH7Qeo8hfKqM8Hin3REuwNoE5h6YXAPefVQ42WGjJVefdKx6xGWcqGJH+O
         sVo3u2qPopidaH7jD3B87tVsa5zi5tKmsAC+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945887; x=1788550687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D6JHpQre6z9LjkfZLXiX97XgpmvVlJ2NoYKh+ZcLnBU=;
        b=KbtskBCq/KWWOrLrgnsBGRjwZE/MlStMfNktGw+I+cQD6NWKm5Sli2V3zWFRHCf8m3
         RkI4Ponb1wI4dERGjy9idoWZwWP17Z9xsd6s2j4KrgJWy4cdFu169xIFo/OKcz2WrcOO
         DwJbdZ68FfYtlGnScD3F5Iss70aefqiQlPKcwsyM0dVWSB//t11F5NDiqlO146HwbLZg
         Ypvgae39/kG0o3aCoyBKox6qrc506I/OG0gqTlfVhK9Ot7ZKeMV2lfz+murebh1mMeku
         gH8bXBicx1SgZjyasQJV3/R1pVy92vtGaIin+z5U7CxRuP48LlGqfDNSbqmq8WYpJiP/
         wq/g==
X-Gm-Message-State: AFuF++lQNHD6qVycryCS5oXae0reEZ/sHIxKFjHhPmRZFh2o1witEA8m
	UnOYBZEnB4iwJzB2grQV0SF6Y9FxkZb20jPqaQmbQXL1o32ig5hfRd+LyYiPcJftVoGYOHNgzQ+
	Oomq4TDI=
X-Gm-Gg: AR+sD12m8l6pMR+F6GOHfuda+xaOY8/VDAcWHgAWpQ8jAv+GwercvQaZgx8ocXkec1S
	5NWS5XRAlkWugnikWmD7v6qDsZW7VDeQ0Yjeq2dtVqMXQDSUhBOVO1PYD3luLFBM3YxR8hPOLit
	2K+s1wPGhZj7AQrsa16/XHNb82Alht6JM5fc2910y+zCmia3GuzwePeXz2+2goKMf1YOvGiheR9
	igiTs5+27Sg2JjLTKUBX2xMWDdPCUqemaY69qVcXopeCe6SqpAF0y57x8eh8KcvdfeX5suUyRMo
	I4APHp6tKGrcwxZVYzGPgkXl1BUMC07WEv+XNcERfDzbFa39Zfl/HpiV/Gil8MecfF620zKY/oO
	+luAZHZAb9kzt/uMfHRtLX6Yrh7BXjGM7EAbz5wxyhCD0p56QhHJzswfqiTwSu3qsjI6m31MUOs
	Tb2t6R+cWjZjy7YPv50ypMvsKPqTuLYcVveMc/fYM77CQ6Ay0/muobvzxZubexb4XNiAu/3s1mO
	06bV/ez5P0hY0h31OyKMcUVZZ3QYeFjgRshyb+Pms6HUyAnJ2OzsTjhU4oNAQ37
X-Received: by 2002:a05:600c:4443:b0:499:b3f0:ff05 with SMTP id 5b1f17b1804b1-49b91c56f41mr111986515e9.13.1787945886955;
        Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/56] wget: Fix CVE-2026-58469
Date: Fri, 28 Aug 2026 21:35:16 +0200
Message-ID: <8b1b7314f9cc4e1684b2b26b562a1c1ab237ab09.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244567

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

It also includes the upstream follow-up fixes referenced in [3]
and [4]. These correct the trailing whitespace check introduced
by the original fix and add the required <ctype.h> include for
isspace().

[1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b6f7826
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
[3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c3f3bcf
[4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24fe00a1

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/CVE-2026-58469-regression_p1.patch   | 39 ++++++++++++++
 .../wget/CVE-2026-58469-regression_p2.patch   | 26 +++++++++
 .../wget/wget/CVE-2026-58469.patch            | 53 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  3 ++
 4 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
new file mode 100644
index 00000000000..ecd8ea619ba
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
@@ -0,0 +1,39 @@
+From 151beaf2210968aa38d7db61e788b1e33baf77b4 Mon Sep 17 00:00:00 2001
+From: ChenYanpan <chenyanpan@xfusion.com>
+Date: Wed, 8 Jul 2026 12:09:55 +0800
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix inverted
+ trailing-space check
+
+37a40fcb added an `end > beg' bound guard to prevent a buffer
+underflow, but accidentally flipped the condition from `isspace' to
+`!isspace'. The loop therefore walked back over non-space characters
+instead of trailing whitespace, collapsing any string without a
+trailing newline to "". Every Metalink/HTTP resource URL was wiped,
+so wget could not follow any mirror and
+testenv/Test-metalink-http.py failed ("Expected file test.meta not
+found"). Restore the `isspace' condition.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c3f3bcf]
+
+(cherry picked from commit 7b1cdecc49bc77bde220fc575c8a00386c3f3bcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/metalink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index 2d6e5846..d1b8af0b 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1061,7 +1061,7 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end == '\0')
+-    while (end > beg && !isspace(*(end - 1)))
++    while (end > beg && isspace(*(end - 1)))
+       end--;
+ 
+   new = xmemdup0 (beg, end - beg);
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
new file mode 100644
index 00000000000..cbb23050c49
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
@@ -0,0 +1,26 @@
+From 2dba5e3dcd0546a6b06be58da56fbfd151015967 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 9 Jul 2026 14:50:40 +0200
+Subject: [PATCH] * src/metalink.c: Include ctype.h
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24fe00a1]
+
+(cherry picked from commit 82d945ff5dc9942b78b2bf736aac298c24fe00a1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/metalink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index d1b8af0b..9bea18f7 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -46,6 +46,7 @@ as that of the covered work.  */
+ #include "c-strcase.h"
+ #include <errno.h>
+ #include <unistd.h> /* For unlink.  */
++#include <ctype.h>
+ #include <metalink/metalink_parser.h>
+ #ifdef HAVE_GPGME
+ #include <gpgme.h>
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
new file mode 100644
index 00000000000..dd7eec0b08b
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,53 @@
+From 566d87c1202acb4c36bdec7404abcdd40f85bcad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:32:02 +0200
+Subject: [PATCH] * src/metalink.c (clean_metalink_string): Fix buffer
+ underflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58469
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b6f7826]
+
+(cherry picked from commit 37a40fcb450153f69537c7cbc2a7a4fb0b6f7826)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/metalink.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/src/metalink.c b/src/metalink.c
+index de2439c9..2d6e5846 100644
+--- a/src/metalink.c
++++ b/src/metalink.c
+@@ -1041,7 +1041,6 @@ void
+ clean_metalink_string (char **str)
+ {
+   int c;
+-  size_t len;
+   char *new, *beg, *end;
+ 
+   if (!str || !*str)
+@@ -1049,7 +1048,7 @@ clean_metalink_string (char **str)
+ 
+   beg = *str;
+ 
+-  while ((c = *beg) && (c == '\n' || c == '\r' || c == '\t' || c == ' '))
++  while (isspace(*beg))
+     beg++;
+ 
+   end = beg;
+@@ -1062,12 +1061,10 @@ clean_metalink_string (char **str)
+   /* If we are at the end of the string, search the first legit
+      character going backward.  */
+   if (*end == '\0')
+-    while ((c = *(end - 1)) && (c == '\n' || c == '\r' || c == '\t' || c == ' '))
++    while (end > beg && !isspace(*(end - 1)))
+       end--;
+ 
+-  len = end - beg;
+-
+-  new = xmemdup0 (beg, len);
++  new = xmemdup0 (beg, end - beg);
+   xfree (*str);
+   *str = new;
+ }
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index f0d3458462e..fb777549653 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -15,6 +15,9 @@ DEPENDS += "autoconf-archive-native pod2man-native"
 
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2026-58469.patch \
+           file://CVE-2026-58469-regression_p1.patch \
+           file://CVE-2026-58469-regression_p2.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"

