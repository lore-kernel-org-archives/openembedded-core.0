Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C66EC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 11:28:13 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.13005.1674041287661465334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 03:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YJ+l5Eas;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674041288;
  x=1705577288;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FavU9jmfimGcghBe78a4jNCmAqzSRLET5JA+54UEsdU=;
  b=YJ+l5Eas4kWoN/86QwxpKa3OQL3vbYXlbaugv28hkqe42R129NpDVj1f
   61SHAsXU7lRyTDu5rqPGRUSSB2rLm9WZPpWaZdbxivdNkali52uNiVRSX
   +htinTPkmmKHg2a7PDf6gU8syQ8hwkAUGJ3OAofVDx9yyLPT6EHoi1GpP
   mSmdNjgJZPzd1j1Nkhrn8NSClnbFCJ12vOkbXrBhxK8piiSdSkHdj5s39
   2qE93dIF4RFI2xLSG0iNtwXOLv0i2Mr1zoggysGd41ejW7KgPpTcDN/GO
   HQnQFIQCL/gZqXrQfF//GAazRmlwokB1yorSZTzwyJOgAHDscQniUwXYl
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] librsvg: Only enable the Vala bindings if GObject Introspection is enabled
Date: Wed, 18 Jan 2023 12:27:59 +0100
Message-ID: <20230118112759.3909741-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 11:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176086

This avoids the following error:

  configure: error: Vala bindings require GObject Introspection

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index b2e93a2684..c55aa250e9 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -42,8 +42,6 @@ do_configure[postfuncs] += "cargo_common_do_configure"
 
 inherit rust-target-config
 
-EXTRA_OECONF:class-target = "--enable-vala"
-
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
 # the sysroot is. So copy the json to workdir, and patch in the path to wrapper from rust class
@@ -57,9 +55,10 @@ CVE_CHECK_IGNORE += "CVE-2018-1000041"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-PACKAGECONFIG ??= "gdkpixbuf"
+PACKAGECONFIG ??= "gdkpixbuf ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
+PACKAGECONFIG[vala] = "--enable-vala,--disable-vala"
 
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux

