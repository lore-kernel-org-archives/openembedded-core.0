Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE27CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:09 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.6598.1756330204812585060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kT6M9jbJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3254abaf13dso250920a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330204; x=1756935004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xCS94keCkephpoc9GPSICCCxB+eHjHMTH73+LJnLOg=;
        b=kT6M9jbJEB01KGG4ZN6g+eYZX6ZzNcGZX2MNhnUg83q8xUqKjufQbDfvKxibGtIjen
         Ei1FjZ1T3a3Nlj5IlDwam7oFpsVH+bCEuSpI96re+bsgzkthqFiz/VlGKD6EuoO95jBT
         BnzYHX7mXb2BreKQCg21i+WUzOonYeCBr0t0Sill4RKnZdcKv/AoVaSP+uIzQePpdZhk
         4UD5wQQ/tWHfQeqp3GVF2npvGwZI87id2E7+tfTWbLSlChz1NbX88Ouy8OYH+FPApbuG
         nO2l+ypl1Qi6Assv9WzrUDQiOn9XhMBMG6oh6kh0KaUT2oxBec/m60b8zfHUsE5w+eXq
         NTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330204; x=1756935004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xCS94keCkephpoc9GPSICCCxB+eHjHMTH73+LJnLOg=;
        b=TsjLLQXgR/Z/9ZKP8jF5j/xDioqS5gyRqDuiDZW09lEp2qKIhA2sRTCLigkf5Jh3gw
         FHnAMKHhYpBIbfmJcjLIHIoEnIwsrutUuwLXHs3N1u03cnGjQXbFJv5HyudER3PV2Hbo
         fQz+OYXhUVHY0JkhQdIzs/M8pJE5VF0w4epBsg6/jOm+GDzZKAFgBMDugRc9IipNcJzx
         9lUZSBjr+IRJ0LJCkk2/Ppoz4J91M0G2+72bfbkTCSnQsyGUjWwJ+PeDGcnlM0Xwnq3b
         r1V+GN0wCOeOiuAmmz9l3H+bZXvcNu2qqAscfIhcKu8oXzcYBR5EZokdSUSOomFiYAtz
         PBAA==
X-Gm-Message-State: AOJu0YylypSA0QmZ6o1S+1u6vzixXGdAX5S1SvQ0c5V1gfc56VmL6Lwy
	yUjcMrlUpS8wenOITeaFPXTNmrwsJs8Q7Aaz3S61gD5PTG/yg5FU1J45W4x9kkR7R5fo5BFikpy
	qDGJQ
X-Gm-Gg: ASbGncvH5A93utEsnBIi1xEJko9X5wUooqJNZ+8C+InWOwWJz7mGxnd65hTmSEr1dO5
	7RWX9jo2nMloQBEse/3cGMFjRrg1EBl0PYv1fAbSOtUbDEHZjR3tAg+wtEKRwHRo6I2aAw1PqWL
	ABjUxNmGLEw0GjwvyUACABIE0179Zq0hJXptu1gGwvhECDn3uzdcPf0990faohLbzKkj4wFWNbm
	MygPgIyE/qesGBMv6Q+VoqNo6ikgoEeCopfTFtIIpdseOB4tVaK1limEir0cLaATqyGqF9GpA73
	Fc5Fln537K7Arfq+9knFeURMdn6AyyS+JC+K9MOGYwOAGbsXyC4R7j5bqFuKKiQOq4N0pf/l/ly
	OsLcnU8fEZ2XnXg==
X-Google-Smtp-Source: AGHT+IFZ9Mmbb4+hUViZVGQ+A3bfd/rrmHG5jYhnQjkt71acOggYRHWMCCVCnzVvjKM345WmjDaQ7A==
X-Received: by 2002:a17:90b:5703:b0:327:7c8e:8720 with SMTP id 98e67ed59e1d1-3277c8eb549mr3121544a91.34.1756330203921;
        Wed, 27 Aug 2025 14:30:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/33] glib-2.0: patch CVE-2025-7039
Date: Wed, 27 Aug 2025 14:29:16 -0700
Message-ID: <36402f219bc6fc03970e5277d449f2717199cf44.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222517

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-7039

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-7039.patch     | 43 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch
new file mode 100644
index 0000000000..6e03700880
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-7039.patch
@@ -0,0 +1,43 @@
+From 61e963284889ddb4544e6f1d5261c16120f6fcc3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Tue, 1 Jul 2025 10:58:07 -0500
+Subject: [PATCH] gfileutils: fix computation of temporary file name
+
+We need to ensure that the value we use to index into the letters array
+is always positive.
+
+Fixes #3716
+
+CVE: CVE-2025-7039
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/61e963284889ddb4544e6f1d5261c16120f6fcc3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gfileutils.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index c7d3339d1..286b1b154 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1532,9 +1532,9 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  gint64 value;
+-  gint64 now_us;
+-  static int counter = 0;
++  guint64 value;
++  guint64 now_us;
++  static guint counter = 0;
+ 
+   g_return_val_if_fail (tmpl != NULL, -1);
+ 
+@@ -1553,7 +1553,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      gint64 v = value;
++      guint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 53e0543045..c129be1328 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-06.patch \
            file://CVE-2025-4373-01.patch \
            file://CVE-2025-4373-02.patch \
+           file://CVE-2025-7039.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.43.0


