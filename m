Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846A9C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:14:02 +0000 (UTC)
Received: from mailrelay6-2.pub.mailoutpod2-cph3.one.com (mailrelay6-2.pub.mailoutpod2-cph3.one.com [46.30.211.187])
 by mx.groups.io with SMTP id smtpd.web10.12130.1742400836807683839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=lOCL5c3K;
 dkim=pass header.i=@berginkonsult.se header.s=ed2 header.b=cgx3ggPI;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.187, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1742400834; x=1743005634;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Eb0NUOwqc5B5cUDbCbfGIR9MkQTyvAolwSXlcsKM32U=;
	b=lOCL5c3K/lxB3khjCj+NEop3Euf1mrw6cp9GMKB4A36iw4cjjPCnsry2+XKqxrfBF/o4LbohH0kxh
	 Imv3/bL+Bqy8zWVhTDHM5YQdUmfUeN9lmzbgf1T9JZWQ3IHN/8MADRaFEvnm3jlEf3xdZyAErG15D5
	 WvS+i+x6u7A1MUP0Sqc9B6AQ7KN8DfP69V8ZwkE6yek0Onm+Gte65m1KU8VZdV9WIh1/yfBAB6qob8
	 +rJ5N9MEWmQev711EvI9KoZXLtW64g03Oxj8E/SI4HjozCD0fYQBErjHAbKmMMX+6NGIpLR63c6jRS
	 D/xYAdg8IrGJl9tlPK+JABY9Cj7pEPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1742400834; x=1743005634;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=Eb0NUOwqc5B5cUDbCbfGIR9MkQTyvAolwSXlcsKM32U=;
	b=cgx3ggPIsajmjkwIAG1n0a+nwxUdLQWshntmos68a/cgJQtfH6S2wiPwp62OuRwExKNCmWGCm4/s0
	 aDLPdoTDA==
X-HalOne-ID: 2433a87a-04dd-11f0-874c-15d104443858
Received: from pbkserver2.. (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 2433a87a-04dd-11f0-874c-15d104443858;
	Wed, 19 Mar 2025 16:13:54 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] pkg-config-native,librsvg-native: fix EXTRA_NATIVE_PKGCONFIG_PATH
Date: Wed, 19 Mar 2025 17:13:27 +0100
Message-ID: <20250319161327.2701095-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 16:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213343

When building librsvg-native the variable PKG_CONFIG_PATH
was incorrect in the bitbake environment but handled correct due
to the pkg-config-native wrapper. Commit [1] and [2]
introduced some inconsistens of EXTRA_NATIVE_PKGCONFIG_PATH
where it was prepended in pkg-config-native wrappers but
appended in native.bbclass.

  meta/classes-recipe/native.bbclass:
    PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"

This commit will try to resolve this to always append the
EXTRA_NATIVE_PKGCONFIG_PATH. It is tested by building
librsvg-native and also checking bitbake environment
before and after.

[1] https://git.openembedded.org/openembedded-core/commit?id=2bc050146d47b14d890a1b0db2b55f9057a08b65
[2] https://git.openembedded.org/openembedded-core/commit?id=ae4824f4f6234884a245bce314d6305ad8eb982d

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Cc: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in     | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 2 +-
 meta/recipes-gnome/librsvg/librsvg_2.59.2.bb                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index fd5ab6b1fa..0d736fe4d4 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-PKG_CONFIG_PATH="$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
+PKG_CONFIG_PATH="@PATH_NATIVE@$EXTRA_NATIVE_PKGCONFIG_PATH"
 unset PKG_CONFIG_SYSROOT_DIR
 
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index d4bb4f8c06..8addefbb80 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
 
-export PKG_CONFIG_PATH="$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
+export PKG_CONFIG_PATH="@PATH_NATIVE@$EXTRA_NATIVE_PKGCONFIG_PATH"
 export PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb
index 7718f2bb48..983fc75eed 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb
@@ -34,7 +34,7 @@ UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 # for cargo to be happy
 BASEDEPENDS:append = " cargo-native"
 
-export EXTRA_NATIVE_PKGCONFIG_PATH = "${B}/meson-uninstalled:"
+export EXTRA_NATIVE_PKGCONFIG_PATH = ":${B}/meson-uninstalled"
 export RUST_BACKTRACE = "full"
 export RUSTFLAGS
 

