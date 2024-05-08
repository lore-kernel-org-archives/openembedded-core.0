Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF17C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 11:47:22 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.10100.1715168840665628913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 04:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ekz4cTKB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024050811471725901352a1414eda3c-qrqeub@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024050811471725901352a1414eda3c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 May 2024 13:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mDcw4jymop+V6wxk/PprEgn0COZUmOvJeVSKysOU5/M=;
 b=Ekz4cTKBcHjXeylQ0SbOAT1yrzZ8WTz/myPgNZIYeqt4EhYUmlj25ol0/oqa10/wGw2s1x
 DIVlKRy5PHFmd0ql0gk5o3Lqw6E2pTOcYlwWz2ljiCiDFbji8iMmjcwavruxGpmSInsDfkaW
 k2EZVHkDf2ypxPEdQd89zVL5TOoSM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glib-2.0: Upgrade 2.78.4 -> 2.78.5
Date: Wed,  8 May 2024 13:46:36 +0200
Message-Id: <20240508114636.628107-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 11:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199116

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
2.30.2


