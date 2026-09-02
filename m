Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C44C624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5540.1788326817423894572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NimucAO8;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso3756525e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326816; x=1788931616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ijr2+4i5F5EGY2mO7ySCDGKIHa5+0V/lhIkMiOXCXOw=;
        b=NimucAO8WigdvHEEulHiSJ1icVSsHM5a0VMOEcjYE/AVbca1+JAd+edY7s4gfsCKtR
         hhj+cTfokf0st+dqgesxqpU3Yk7LQx1PDyp3DC/xcrX3XCZPTtXRzfWUrnooObHFGz1g
         idAS9z/rdbP9ZyGxKbUn3Rw565pnlc3L05EBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326816; x=1788931616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ijr2+4i5F5EGY2mO7ySCDGKIHa5+0V/lhIkMiOXCXOw=;
        b=GLyqk/0Kf6RPmeLyVaiWHHQTXFS6knYmAyP0jjidTlihkX1MIRwp19J5rkekx2zpgI
         8S6Vy9glQjb+mnttBsNJi6rJeEhuijJ/pG7ykN/S1q54l+AtK1gCQUvbAij9RHJhIRgZ
         Lecrk0O0Y3CXXejJ1+g1LLj6y4+9rBilQvXqBNjGEXhSAf/58Xz+vUUP6n2tp5h7iyr/
         tF6GLw+Rx1ugXTzN2HkWhqXvQ9fJFSzqPCg72sBMwsbUfd133aT7G+bfVa7UG42e/Tsj
         RZUIppND5+QHlO91Kv9ZP+UhGhjrlLLcHaDKzjIpw29ElVJjI2cBrtpoMGPyMo5q0tjg
         iJ0w==
X-Gm-Message-State: AFuF++kns7CBJfiUuSjCtANdUmlKLP3EJCwb0Gn7tb/oAaMiW1v9rJTP
	s1KwWVtg+3KPLykQJsimRRONmsqOVJFb2sKPper0tkZHxCnFoCKXl2simuMkKbnAtgzVleDVPfL
	3EmEYy+0=
X-Gm-Gg: AR+sD103iVQG0/ummOgBDHK5CwpbW1yeCOEQlcffrScIUX9r8312HLBP0ISn84xCtEn
	a/63Y8bsaSw7E1oIa+k/h5wU87RLtz+lag8ViaaT7Xj/ijHHWerr1vuhMfLFtLOVUsZM7Sm4x/0
	rqnH7uMBzhYQdiyVNS+r960EoIjG8c9fhUzp/QU8EYij/Nss0S1bOCdB9DErm7BOPyV/7MsWBks
	qvjATgt+DWHVwnEz6Qq8cPf6K82jAiXrN+dFlANMGy/wbKsePF6Pq6ad2jt92N34KRQPzpTxoRw
	gDtIeSo5rHzBIcv+H7/42pFSv5F2T8q/xQhm5pa2kuPWZHo0NfplS8zJXn/Ie2xvrdE/fUD4s+b
	sNlLrgosLP4Wc61f3Gk9CSYPbtGm1zcvbh4l0UWt2Rl+rvuAAQL6OgFpyOlHhz0UBad/0Pk9W/n
	9TewHF4BprwxW+e/jCXxJKm/Cg6b5F+VcnzUCgvhkodI45qU5mIVfptHUuHQP2eVqsXXZC4EqzX
	YFQizixrKCScxAB7A==
X-Received: by 2002:a05:600c:3485:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49ce5842b7bmr45215135e9.13.1788326815661;
        Tue, 01 Sep 2026 22:26:55 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/27] wget: Fix CVE-2026-58469
Date: Wed,  2 Sep 2026 07:25:31 +0200
Message-ID: <9b76cb0b22f9a0ec2877ac69ab4007f2cd2178e5.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244865

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
 meta/recipes-extended/wget/wget_1.21.4.bb     |  3 ++
 4 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
new file mode 100644
index 00000000000..0f8e93c2d3c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
@@ -0,0 +1,39 @@
+From be4edfe6d30a9db8e51215f0232d31eb92d502ec Mon Sep 17 00:00:00 2001
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
+index 10d58cf7..9f969a60 100644
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
index 00000000000..940d63e00c7
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
@@ -0,0 +1,26 @@
+From aa412523158313619dd04d49b6f769d639e7dcc5 Mon Sep 17 00:00:00 2001
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
+index 9f969a60..16933be4 100644
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
index 00000000000..96bcb62df7c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58469.patch
@@ -0,0 +1,53 @@
+From 2442499cc090e6aa804b0295fe9f881b78df2940 Mon Sep 17 00:00:00 2001
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
+index eca839c2..10d58cf7 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index b5f50f6c841..cb05ff34f89 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -2,6 +2,9 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
            file://CVE-2024-38428.patch \
            file://CVE-2024-10524.patch \
+           file://CVE-2026-58469.patch \
+           file://CVE-2026-58469-regression_p1.patch \
+           file://CVE-2026-58469-regression_p2.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"

