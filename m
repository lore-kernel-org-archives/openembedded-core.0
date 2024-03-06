Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A021C54E71
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.15020.1709739731377913366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FeIksp1m;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a36126ee41eso1034055966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739730; x=1710344530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kov95d9q+doY/wFZNCiNDHPdpvhgxiqQzFkxeaQXfUo=;
        b=FeIksp1mYI927oIRPUHatJIrEmAkXzmMWS3nON0dr0Vu8OAOxeVRPNDpXTNR5tBB/J
         fmvkdYnvcsszJopwdIDjIi0I5D6rYNn1cLbBN4ezmEX7uwb44zQ5GbmVTHDpA+W0f8FF
         uSubSoVgp103GzOV60jmxcwUBs79aumavIZphVYviJH1rdYasLhRn/JuJqnnRaLgPY0L
         SVmBLJiZgwKhOX1oC3y9wwDBPxVq92fO3E+FSApRjPX06M5wHyppG2cz6pnTZNETVr5R
         kMWPlG5H/KRzJVkv9USULAPWZ0K3W5TtM8E3Y4qXY71mYfAuPQvpTrt8YrlpbiSaMlQN
         72TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739730; x=1710344530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kov95d9q+doY/wFZNCiNDHPdpvhgxiqQzFkxeaQXfUo=;
        b=iEXKy0Pka3/RLWs8qllgwnQ7x7g827f/kuOWbWEXBK1FG/76mdSFGUqYgUH0/Dq084
         cAmyId3zBjnyBwRfPX6eftQI2qEtVSdSkY6ZngZjETjerlOx1Y8BiEzsRj0iiQiyew9M
         KsWpT+lS7y3XpqNvKraCMp7E9gSVyaPXE5gfSXMzXjKeErvVX/iv3q5d5dhDTocus1mj
         K6kB5dNsIzF77eA0HEjyunqFGSb4cFxYJqspFkYu7BihF82F+9ZhB1ytU2u4+kO+I7Ml
         TCS3tcamLMdHqweX5FiYCyahqp434d851NNWm3YXD/P0WhQMx8vODCNkLhZuZiJgTgv/
         u2zA==
X-Gm-Message-State: AOJu0YzFFnkY/gAJIKFDKiP3LxgzvGfaZN/BckjCbGmzguQMqafXZ1bb
	rl58hWfVnL7QMqojvm/ywkS/gc5u308xQWMJ/oghRbUoEFJ+KYhOdJKf4/03
X-Google-Smtp-Source: AGHT+IFZJFPr48u/wS6vq6CL7qNwPni8B4BUVfZvbPqclfjmBVEICFuh1XQ2cR7TZa+35MJVY4dG2Q==
X-Received: by 2002:a17:906:80c:b0:a3e:cdae:7aa2 with SMTP id e12-20020a170906080c00b00a3ecdae7aa2mr11086322ejd.35.1709739729807;
        Wed, 06 Mar 2024 07:42:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/47] libpcre2: upgrade 10.42 -> 10.43
Date: Wed,  6 Mar 2024 16:41:22 +0100
Message-Id: <20240306154151.3741709-18-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196701

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glib-2.0/glib-2.0/fix-regex.patch         | 54 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb |  1 +
 .../{libpcre2_10.42.bb => libpcre2_10.43.bb}  |  4 +-
 3 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.42.bb => libpcre2_10.43.bb} (92%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
new file mode 100644
index 00000000000..bdfbd558999
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
@@ -0,0 +1,54 @@
+From cce3ae98a2c1966719daabff5a4ec6cf94a846f6 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Mon, 26 Feb 2024 16:55:44 +0000
+Subject: [PATCH] tests: Remove variable-length lookbehind tests for GRegex
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+PCRE2 10.43 has now introduced support for variable-length lookbehind,
+so these tests now fail if GLib is built against PCRE2 10.43 or higher.
+
+See
+https://github.com/PCRE2Project/pcre2/blob/e8db6fa7137f4c6f66cb87e0a3c9467252ec1ef7/ChangeLog#L94.
+
+Rather than making the tests conditional on the version of PCRE2 in use,
+just remove them. They are mostly testing the PCRE2 code rather than
+any code in GLib, so donâ€™t have much value.
+
+This should fix CI runs on msys2-mingw32, which updated to PCRE2 10.43 2
+days ago.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/cce3ae98a2c1966719daabff5a4ec6cf94a846f6]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ glib/tests/regex.c | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/glib/tests/regex.c b/glib/tests/regex.c
+index 1082526292..d7a698ec67 100644
+--- a/glib/tests/regex.c
++++ b/glib/tests/regex.c
+@@ -1885,16 +1885,6 @@ test_lookbehind (void)
+   g_match_info_free (match);
+   g_regex_unref (regex);
+ 
+-  regex = g_regex_new ("(?<!dogs?|cats?) x", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
+-  g_assert (regex == NULL);
+-  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND);
+-  g_clear_error (&error);
+-
+-  regex = g_regex_new ("(?<=ab(c|de)) foo", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
+-  g_assert (regex == NULL);
+-  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND);
+-  g_clear_error (&error);
+-
+   regex = g_regex_new ("(?<=abc|abde)foo", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
+   g_assert (regex);
+   g_assert_no_error (error);
+-- 
+GitLab
+
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
index 58df7bef8fb..f0fd057be70 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
            file://memory-monitor.patch \
+           file://fix-regex.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
diff --git a/meta/recipes-support/libpcre/libpcre2_10.42.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
similarity index 92%
rename from meta/recipes-support/libpcre/libpcre2_10.42.bb
rename to meta/recipes-support/libpcre/libpcre2_10.43.bb
index f471b3f90a3..fd0bd79212c 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.42.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840"
+SRC_URI[sha256sum] = "e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.39.2


