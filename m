Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A87C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.32051.1701870970148264360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wt4rBlVj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d0ccda19eeso11789245ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870969; x=1702475769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V0yHWQOrd7ybJ3NJBC0l9bzH7fj5dU32VERJVx+rfk=;
        b=wt4rBlVjaLAiikxag/fXZu7J6+1EovuX47ceiq3YQ41Xvwu6I2gRyi9Ruuq5/nkBG9
         cgWug5hmWqdvThgAnOrmexWLay/PShorn3wzkC4iu6Z8OJAkxIsgMfWDqOVkMGA3aoZz
         LVC3xtygzepArdTa722Tdk90/xcccIS8QKl0A+4Y4k3tNeECrQDfYTUCoKYj2umM980X
         NNgPtEdCXPWt4q+UToDz5OHQTesWodjkO4olgGulBa02Vccx84CcI68NFdl4whmogWdV
         VSPg5SHHKHrLTHM44B5zHix2bl4jtItigDyXxzvNen730yaIYGEZ5KsR0zBeNmDtiDJ1
         mVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870969; x=1702475769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V0yHWQOrd7ybJ3NJBC0l9bzH7fj5dU32VERJVx+rfk=;
        b=BJQosSJsVXSSQIJXjsLTkepGCzGmUFa3NiZLZgkcpbvETgVj73lAwt7pbXTQL3dUdi
         e/OMmLOwhM5nCFHeyt/EyQm5JM7I1q/K+lGN20jrJ03LPFcblCXArKEiQYLujfndnftq
         4t/1QFwXDvKN8l5CL8rCnQWXmhJYlG2mEQYqDS+pN6yhbD+xka72YUVLrqGwuowCmQHN
         lxGbZxgFMiRfUjsPfciZPvwiYZy1ECxtoG8+uSHXiXENs6M93ko+Kt3BWIormMEGkbkb
         y6enaL/1DPBPbq/EV4ur7jUBS6l4E6yQNJ7NCF6vYTL2vmCfYrabgBAYccixwOIs437J
         oR2w==
X-Gm-Message-State: AOJu0YxRpsznft9XlHqJKCSXL4KF7MNDmsPkFjwApumCmcZnvt/MSYPu
	2oi1YMh9806KXYfGzQfOJ1pbw6ctKuBhLePEpbo=
X-Google-Smtp-Source: AGHT+IGbtC0Cnsd2UT9HMi/xm38cx+1m6Z4jJvUr7KVwtqvddHmMB6hmwV9CgVNQg8zjTcnkHC3cbA==
X-Received: by 2002:a17:902:b20a:b0:1d0:8d57:482 with SMTP id t10-20020a170902b20a00b001d08d570482mr652794plr.50.1701870968800;
        Wed, 06 Dec 2023 05:56:08 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] epiphany: fix CVE-2022-29536
Date: Wed,  6 Dec 2023 03:55:48 -1000
Message-Id: <eaf965fec36810014ce2e8a4a270a9348660e3d8.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191891

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-gnome/epiphany/epiphany_3.34.4.bb |  1 +
 .../epiphany/files/CVE-2022-29536.patch       | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
index e2afb29c12..f43bfd6a67 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
@@ -16,6 +16,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://CVE-2022-29536.patch \
            "
 SRC_URI[archive.md5sum] = "a559f164bb7d6cbeceb348648076830b"
 SRC_URI[archive.sha256sum] = "60e190fc07ec7e33472e60c7e633e04004f7e277a0ffc5e9cd413706881e598d"
diff --git a/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
new file mode 100644
index 0000000000..7b8adeafcc
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/CVE-2022-29536.patch
@@ -0,0 +1,46 @@
+VE: CVE-2022-29536
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/epiphany/-/commit/486da133569ebfc436c959a7419565ab102e8525 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 486da133569ebfc436c959a7419565ab102e8525 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 15 Apr 2022 18:09:46 -0500
+Subject: [PATCH] Fix memory corruption in ephy_string_shorten()
+
+This fixes a regression that I introduced in 232c613472b38ff0d0d97338f366024ddb9cd228.
+
+I got my browser stuck in a crash loop today while visiting a website
+with a page title greater than ephy-embed.c's MAX_TITLE_LENGTH, the only
+condition in which ephy_string_shorten() is ever used. Turns out this
+commit is wrong: an ellipses is a multibyte character (three bytes in
+UTF-8) and so we're writing past the end of the buffer when calling
+strcat() here. Ooops.
+
+Shame it took nearly four years to notice and correct this.
+
+Part-of: <https://gitlab.gnome.org/GNOME/epiphany/-/merge_requests/1106>
+---
+ lib/ephy-string.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/ephy-string.c b/lib/ephy-string.c
+index 35a148ab32..8e524d52ca 100644
+--- a/lib/ephy-string.c
++++ b/lib/ephy-string.c
+@@ -114,11 +114,10 @@ ephy_string_shorten (char  *str,
+   /* create string */
+   bytes = GPOINTER_TO_UINT (g_utf8_offset_to_pointer (str, target_length - 1) - str);
+ 
+-  /* +1 for ellipsis, +1 for trailing NUL */
+-  new_str = g_new (gchar, bytes + 1 + 1);
++  new_str = g_new (gchar, bytes + strlen ("…") + 1);
+ 
+   strncpy (new_str, str, bytes);
+-  strcat (new_str, "…");
++  strncpy (new_str + bytes, "…", strlen ("…") + 1);
+ 
+   g_free (str);
+ 
+-- 
+GitLab
+
-- 
2.34.1


