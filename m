Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E8EE9A04E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 22:53:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2073.1771455229976494770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 14:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UVWUSMOO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260218225347948fd35d39000207ab-accnme@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260218225347948fd35d39000207ab
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Feb 2026 23:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DlZHwZXMIvavvccLIkfKtdikckm37AymWJgYOXpuM3M=;
 b=UVWUSMOOM2rJhIZ1cjGFb7kDBAPkJipGroZD7UEAyHtxvZ2PLk4n6DM+M3Lm1ClEBNbg8X
 /wt1Nb6sDSkm0HYRrZDhf2tt8eYvGqwl4SgNFBIMzsX8h1/CK00t5IWb0FhrfJWYWJOqFYx6
 yD2+KtRE0IZRpiY91RaiP4tF4mXY8KOyvGlrpQLp2P0LcpbqYY2LGNFiKhevpc3yYiWwVnx7
 92PD+t0nYNOpyYtfR/yqjfmcFqP6b2CsBNm5/EcSRxhR14nMwsC/KELJC5o5ZaFyBls1oeDJ
 QciCEf9tQZf1WKf0yPBfbzylCZyUgFf14x6V2EdAJqnziVpTjPaMPAJQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] glib-2.0: upgrade 2.86.3 -> 2.86.4
Date: Wed, 18 Feb 2026 23:53:45 +0100
Message-Id: <20260218225345.508065-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 22:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231415

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2026-1484, CVE-2026-1485 and CVE-2026-1489.

Release notes [1]:

Overview of changes in GLib 2.86.4, 2026-02-13
* Fix several security vulnerabilities of varying severity (see below
  for details)
* Bugs fixed:
  * #3858 (closed) glib-compile-resources: Incorrect compiler detection
    on Windows when building GTK causes a DoS (L. E. Segovia)
  * #3863 (closed) Iterating over a short (preallocated) GVariant
    bytestring invalidly refs a NULL GBytes (Christian Hergert)
  * #3870 (closed) (CVE-2026-1484) (YWH-PGM9867-168) Integer Overflow ->
    Buffer Underflow on Glib through glib/gbase64.c via
    g_base64_encode_close() leads to OOB Write (Marco Trevisan)
  * #3871 (closed) (CVE-2026-1485) (#YWH-PGM9867-169) Buffer underflow
    on Glib through gio/gcontenttype-fdo.c via parse_header() lead to
    OOB Read/Write (Marco Trevisan)
  * #3872 (closed) (CVE-2026-1489) (#YWH-PGM9867-171) Integer Overflow
    on Glib through glib/guniprop.c via output_marks() lead to OOB Write
    in glib/gutf8.c:g_unichar_to_utf8() (Marco Trevisan (Treviño))
  * !4946 (merged) Update Romanian translation glib-2-86
  * !4955 (merged) Backport !4954 (merged) “glib-compile-resources:
    Always assume MSVC compiler if VCINSTALLDIR is set” to glib-2-86
  * !4961 (merged) Backport !4960 (merged) “glib/gvariant: add failing
    test for bytestring and fix it” to glib-2-86
  * !4979 (merged) [glib-2-86] gbase64: Use gsize to prevent potential
    overflow
  * !4981 (merged) [glib-2-86] gio/gcontenttype-fdo: Do not overflow if
    header is longer than MAXINT
  * !4984 (merged) [glib-2-86] guniprop: Use size_t for output_marks
    length
  * !5010 (merged) Update Kazakh translation
* Translation updates:
  * Kazakh (Baurzhan Muftakhidinov)
  * Romanian (Antonio Marin)

[1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{glib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb}  | 0
 .../glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e15cc7675..d1f25ef8f2 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,7 +237,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "b3211d8d34b9df5dca05787ef0ad5d7ca75dec998b970e1aab0001d229977c65"
+SRC_URI[archive.sha256sum] = "d4e2b5d791d5015ffd8c6971ad8e975a0a55c1a14926cdb25cf843ff00682260"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

