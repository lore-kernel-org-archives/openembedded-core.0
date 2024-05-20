Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F729C25B7A
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:46 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.61049.1716212023136393011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=acmaiNlV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ed96772f92so72914935ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212022; x=1716816822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsxANYXeHYagCtJ3FEzulfLkxTUVvfPdgH7n8WJ4vG4=;
        b=acmaiNlVq7vd+LkoxKQeViCFuK+WIRm38eCwTFLqaFFSXWl8pwZe/Zrrk0JffNDLuj
         3fVcCQ4pu92NYBntxYIamIi0RX5VarvJh2mf4FYJPuHU89CrAKyrOrKsbAzm9ZTcw+ZX
         ckkozOEVGc+HefAFMDwfRAYonhv+6dL9odBDGKwLSAIihpwXuFz6c8H2/dvoimhkXTyx
         4I6vrQ4CGKcY6Kn2IUPEkP73Wi57IbsDLq3uM7ac7VsQzZGHGR/dndH+Zz6GdCqGeUip
         LdQ1ld+St36rcfrJ0MByrCSiPYtnH1OGAn1eh8E4E0+mR3/DXy3LHKODqY8ecOCvdu8G
         Lcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212022; x=1716816822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsxANYXeHYagCtJ3FEzulfLkxTUVvfPdgH7n8WJ4vG4=;
        b=VTD76yUWrG6Z0O3YgBd2gql9loCVGfV2JnjpSl0uTLSgjzSlXpE9/eEp2Cr+5KYuuO
         R+RTEWEeZgmH+C8zhJURCigHH3E4olF0gGaMXpHEdd9f0fagN1Pj4bPdLFzsoy7SF85C
         VXTaocUgaiBpgVlSXRFhV9sYFtNmFEHdKoGBCNeaE2go7HbmiDc3oAxgUrBPKZOnQ9Xd
         jYhkBe6Ff/qmiIzgpucnHcr5HemKOf3xgcmf/Zg5X6TEmYGbEgJDjaGrDtm2Q3tUq8Cs
         NuRbA0C3N3ItQcBpMO1mIL0p5I8a9uBkBHfpEl1TvZXwEULit2N0Z6kGm2uzYczZQM7Q
         dmoQ==
X-Gm-Message-State: AOJu0Yxgv31P73iC19dc7S1veF1X613uHA9UvjLczjV8NUwh8bqktzbz
	Edq6L3TM7w90C1K8YGRLAJ/eKgQeUv1eVaFByNPWjUfvB4h28ZUOoSqN3sIxDeL2PSbJUCsGi1x
	0
X-Google-Smtp-Source: AGHT+IHn7JdXPMkuNf1XYdwOKdNm9TzbJrtkrL+QdpI3CU7DPJIr18gqeantn2jaAQgk1Pqqm5t3Xw==
X-Received: by 2002:a05:6a20:914f:b0:1af:af89:ed71 with SMTP id adf61e73a8af0-1afde0d3affmr31154892637.19.1716212022224;
        Mon, 20 May 2024 06:33:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/21] glib-2.0: Upgrade 2.78.4 -> 2.78.5
Date: Mon, 20 May 2024 06:33:14 -0700
Message-Id: <14de0c10f6b65eac758220d95e6d31066649a214.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199574

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2024-34397

Remove backported patch included in this release.

News (https://gitlab.gnome.org/GNOME/glib/-/commit/d18807b5ffc6dedc2db5225b044063f65720bf56):
Overview of changes in GLib 2.78.5, 2024-05-07
==============================================
* Fix CVE-2024-34397: GDBus signal subscriptions for well-known names are
  vulnerable to unicast spoofing (#3268, work by Simon McVittie, reported by
  Alicia Boya García)
* Bugs fixed:
  - #3168 gvfs-udisks2-volume-monitor SIGSEGV in g_content_type_guess_for_tree()
    due to filename with bad encoding (Ondrej Holy)
  - #3268 CVE-2024-34397: GDBus signal subscriptions for well-known names are
    vulnerable to unicast spoofing (Simon McVittie)
  - !3825 glib-2-78: ci: Drop FreeBSD 12 CI runner as it’s EOL
  - !3960 gcontenttype: Make filename valid utf-8 string before processing
  - !4040 Backport !4038 “gdbusconnection: Don't deliver signals if the sender
    doesn't match” to glib-2-78
  - !4043 CI: Ignore MSYS2 CI failures for this older stable-branch
* Translation updates:
  - English (United Kingdom) (Andi Chandler)
  - Georgian (Ekaterine Papava)
  - Portuguese (Brazil) (Juliano de Souza Camargo)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/fix-regex.patch         | 54 -------------------
 ...{glib-2.0_2.78.4.bb => glib-2.0_2.78.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.4.bb => glib-2.0_2.78.5.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
deleted file mode 100644
index bdfbd55899..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cce3ae98a2c1966719daabff5a4ec6cf94a846f6 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 26 Feb 2024 16:55:44 +0000
-Subject: [PATCH] tests: Remove variable-length lookbehind tests for GRegex
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-PCRE2 10.43 has now introduced support for variable-length lookbehind,
-so these tests now fail if GLib is built against PCRE2 10.43 or higher.
-
-See
-https://github.com/PCRE2Project/pcre2/blob/e8db6fa7137f4c6f66cb87e0a3c9467252ec1ef7/ChangeLog#L94.
-
-Rather than making the tests conditional on the version of PCRE2 in use,
-just remove them. They are mostly testing the PCRE2 code rather than
-any code in GLib, so donâ€™t have much value.
-
-This should fix CI runs on msys2-mingw32, which updated to PCRE2 10.43 2
-days ago.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/cce3ae98a2c1966719daabff5a4ec6cf94a846f6]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glib/tests/regex.c | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/glib/tests/regex.c b/glib/tests/regex.c
-index 1082526292..d7a698ec67 100644
---- a/glib/tests/regex.c
-+++ b/glib/tests/regex.c
-@@ -1885,16 +1885,6 @@ test_lookbehind (void)
-   g_match_info_free (match);
-   g_regex_unref (regex);
- 
--  regex = g_regex_new ("(?<!dogs?|cats?) x", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
--  g_assert (regex == NULL);
--  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND);
--  g_clear_error (&error);
--
--  regex = g_regex_new ("(?<=ab(c|de)) foo", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
--  g_assert (regex == NULL);
--  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND);
--  g_clear_error (&error);
--
-   regex = g_regex_new ("(?<=abc|abde)foo", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
-   g_assert (regex);
-   g_assert_no_error (error);
--- 
-GitLab
-
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
index b1669ead75..d0aac737f7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.5.bb
@@ -16,14 +16,13 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
            file://memory-monitor.patch \
-           file://fix-regex.patch \
            file://skip-timeout.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb0573b2dbc7548f63"
+SRC_URI[sha256sum] = "39b26044bd44dc30f427202add4997f554723c30017e92ff36da4197a2c916aa"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.34.1


