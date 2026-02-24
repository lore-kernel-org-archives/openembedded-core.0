Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F6AF357AF
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21476.1771943116854267502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XWYOeUCA;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so53678205e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943115; x=1772547915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LK4YuR1X7K1U+JseODSQlpNvr6MbXqmhjNg5M5mdxY=;
        b=XWYOeUCALIZvHX9TBtSc5gdnCj7YTM8TEeJCLLfbNAU+qqWEvPtqXqOCGRaBG2Npor
         uBOPZiRk3LeTGM1MgpfUsZc9hm8GJvwlccNA5TBJpcRLWCscsvIOesJt2TfU/7LIiX+s
         L17P6bhY24s5qe1JF5oQijqxglCUlFIDGVGD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943115; x=1772547915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+LK4YuR1X7K1U+JseODSQlpNvr6MbXqmhjNg5M5mdxY=;
        b=kiDl8XAUN/r5CVQwlTdAgtax3sT9ySh121R49OpV0/gvkTiChltIXaj3UGRXxYpuWN
         WwFxMLBtPKVWetk2nU/LrZ401NySGVF4izk5xPhn+QzK2Gu+JpOpVgVQWW6XwV6Hhjwv
         lcTZH6T2OMk1SvAclQicQMdh8S1Kr+bRd3E2PkM/ek8HQ/p2zGQUioC3/MTGN2f6lDUz
         QNCKFSCi+AOTOgXMPnu+8jlTylSpV9bfe6rrhLjQy0ZCXkR6/R4yMzSbbv+xLl7wC9ss
         +HKb6f//Jrhjuon8PEA9Sp/kIBoEZFlRGMjtdco9l7EjUwtuPSs/4uUDxH8Q7Q0UG83h
         bHsQ==
X-Gm-Message-State: AOJu0YyDZaja1tPEf+6ybefou88YILLHa0EqxxCYMBdLdbqK/smbvkN8
	van64PxzbS18CDp4Tp8dQvbUtA55xTyKwecMU0fzf3nbj1h+G2wioO8OEyn3QMreSiL7VTd+Fxd
	Wyad0
X-Gm-Gg: AZuq6aKP2qJMMMoTeCAI7NTiqqkqcMLaPJkzt6/p2AY0LFf5mKy5URQZhMqjbr7o5Tp
	auxAvGwP8uh3fuRKq+UcUAwaJZow7/rlE9DAqhGpnnrZBEGf/DTLtWBlpXORliJCqWaK0ytPiPf
	uJsvnt7NttppovBXtZDMWXMvivgHqqiFMuy7JJhJRSqmP3DxEfT9v5XpxWdyeLwIdGEi1NgWKqz
	xr8drZYPp2GkIPCxcmCL5axQ6nMEYSxVpSM4RgPSXO+bpIx4TJY/JnWnsAUVeXDm/Yqwmqwpgbn
	DVeReb5XP4ML2BuGZOP7QjNlApQ1lGwTVHzgBOrentFnkyNzvVq0h6okze++g3kRsAP0j0JBg08
	ibxWP31+WLx39JNLxSRYuCHfkMgNQIEPs79YanD9uzhMgMfdPupTPr+L7rp36qVJPCmqMw/9tg3
	YVO3KMvLTrSE7Yb4iS2C0rE8Rimk7waqZ+Q8KjgXPTlL0ocPoJxpSWeAL5RnmDqD/gZpUH8sAVF
	jB8OtagZF+t/sohiwMPoL8DIxENxV1OQA==
X-Received: by 2002:a05:600c:468d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483a95c8f2dmr224587985e9.13.1771943114888;
        Tue, 24 Feb 2026 06:25:14 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/38] glib-2.0: patch CVE-2026-1484
Date: Tue, 24 Feb 2026 15:24:15 +0100
Message-ID: <ee0661ff1c44810c8dc7a107e04b86020468c344.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231789

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3870
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  | 48 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  | 45 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
new file mode 100644
index 00000000000..e3a232aa9f5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
@@ -0,0 +1,48 @@
+From 5ba0ed9ab2c28294713bdc56a8744ff0a446b59c Mon Sep 17 00:00:00 2001
+From: Marco Trevisan <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 18:48:30 +0100
+Subject: [PATCH] gbase64: Use gsize to prevent potential overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Both g_base64_encode_step() and g_base64_encode_close() return gsize
+values, but these are summed to an int value.
+
+If the sum of these returned values is bigger than MAXINT, we overflow
+while doing the null byte write.
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-168
+Closes: #3870
+
+
+(cherry picked from commit 6845f7776982849a2be1d8c9b0495e389092bff2)
+
+Co-authored-by: Marco Trevisan (Treviño) <mail@3v1n0.net>
+
+CVE: CVE-2026-1484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5ba0ed9ab2c28294713bdc56a8744ff0a446b59c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gbase64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gbase64.c b/glib/gbase64.c
+index 2ea4a4ef4..214b48911 100644
+--- a/glib/gbase64.c
++++ b/glib/gbase64.c
+@@ -262,8 +262,9 @@ g_base64_encode (const guchar *data,
+                  gsize         len)
+ {
+   gchar *out;
+-  gint state = 0, outlen;
++  gint state = 0;
+   gint save = 0;
++  gsize outlen;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
new file mode 100644
index 00000000000..d0956e62f8c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
@@ -0,0 +1,45 @@
+From 25429bd0b22222d6986d000d62b44eebf490837d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 20:09:44 +0100
+Subject: [PATCH] gbase64: Ensure that the out value is within allocated size
+
+We do not want to deference or write to it
+
+Related to: #3870
+
+CVE: CVE-2026-1484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/25429bd0b22222d6986d000d62b44eebf490837d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gbase64.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gbase64.c b/glib/gbase64.c
+index 214b48911..0141b3b07 100644
+--- a/glib/gbase64.c
++++ b/glib/gbase64.c
+@@ -265,6 +265,7 @@ g_base64_encode (const guchar *data,
+   gint state = 0;
+   gint save = 0;
+   gsize outlen;
++  gsize allocsize;
+ 
+   g_return_val_if_fail (data != NULL || len == 0, NULL);
+ 
+@@ -272,10 +273,15 @@ g_base64_encode (const guchar *data,
+      +1 is needed for trailing \0, also check for unlikely integer overflow */
+   g_return_val_if_fail (len < ((G_MAXSIZE - 1) / 4 - 1) * 3, NULL);
+ 
+-  out = g_malloc ((len / 3 + 1) * 4 + 1);
++  allocsize = (len / 3 + 1) * 4 + 1;
++  out = g_malloc (allocsize);
+ 
+   outlen = g_base64_encode_step (data, len, FALSE, out, &state, &save);
++  g_assert (outlen <= allocsize);
++
+   outlen += g_base64_encode_close (FALSE, out + outlen, &state, &save);
++  g_assert (outlen <= allocsize);
++
+   out[outlen] = '\0';
+ 
+   return (gchar *) out;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 7c0ed01f555..c6816f93fa8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -71,6 +71,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
            file://CVE-2026-0988.patch \
+           file://CVE-2026-1484-01.patch \
+           file://CVE-2026-1484-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

