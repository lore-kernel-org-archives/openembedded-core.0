Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CC0C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 13:03:08 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.73454.1674219778891860835
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 05:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=mglfMxDR;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674219780;
  x=1705755780;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5Rii+KunGePVfoEUKfNEUmXW8dpXVq9D0UwiZPdgSjM=;
  b=mglfMxDRaWV+v79YE2k+iHeWAS3s74sJTqkHb0QV1FqIDeegwsnIDuQi
   gLpkGuls48AjJHMkyvevHz7fmSC1Kq8PBmmG3gXBFDBGBP0uxyHGmceht
   CVme2tgFDLiWgWSOLRhJH9jMAjlLIPk2Q9r7zHY3ZiPX6APGkDC/KUSCV
   5y0POcxFGcWqmfKxYtTs4bp9atfr+rsDZUwOtuDi+bXHFVasTlJu15mWa
   G1b33qnfNAmhLVKv3EMbK+juJ6k4WEaFdihKR13Ipnt7scAx+G18WCRxA
   oKLg3BtEN1HmcU6h5GpziUirAM46Ndm00VeX+9cgblNqSlCPFBpu7eKz0
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] librsvg: Only enable the Vala bindings if GObject Introspection is enabled
Date: Fri, 20 Jan 2023 14:02:53 +0100
Message-ID: <20230120130253.31995-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 13:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176189

This avoids the following error:

  configure: error: Vala bindings require GObject Introspection

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Only enable the vala PACKAGECONFIG for target.

 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index b2e93a2684..59278d1b16 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -42,8 +42,6 @@ do_configure[postfuncs] += "cargo_common_do_configure"
 
 inherit rust-target-config
 
-EXTRA_OECONF:class-target = "--enable-vala"
-
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
 # the sysroot is. So copy the json to workdir, and patch in the path to wrapper from rust class
@@ -58,8 +56,10 @@ CVE_CHECK_IGNORE += "CVE-2018-1000041"
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 PACKAGECONFIG ??= "gdkpixbuf"
+PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
+PACKAGECONFIG[vala] = "--enable-vala,--disable-vala"
 
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux

