Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 499C460F54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2013 17:58:22 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so3801158eek.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Dec 2013 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=poYGZ508Mk8I2a6i6Rgn44GDNjtTN887HQ1xYKTvwrA=;
	b=ccM+v2NMcr4X9Z/d7bbnUB/7MsTk34tPYWVetThILOusHeZL4q+wssLZnCqGUEe3n0
	lDcSdWlr4MN6tTbRQskSSJoixiACz20RB2U/Wxzpok0qQzDl8kvQpIeSc4ilm0v/MIqq
	9IAqKBp7oLFIXib0xzBHfxCupazTBdBgN+jRhxhd4qfDU2eOy0AdZzLs2TTyk4tGWlmh
	l7jg89ZcpS+MLX8E0R3OTKLeMTJ8XmEaOlqJaJ8qO7fisd9rkvxMAwncpeAE3OKnnTEV
	7aiuSCBMTIzt+jPHsO2bywgKw11v1FGWqRHgyu6ozHMjsPtTvrvAy9M4RijADN8S3osA
	djEg==
X-Received: by 10.14.5.12 with SMTP id 12mr39345410eek.9.1388080702234;
	Thu, 26 Dec 2013 09:58:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm74743435eek.5.2013.12.26.09.58.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Dec 2013 09:58:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Dec 2013 18:59:00 +0100
Message-Id: <1388080740-21232-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] tcl: Fix ${bindir}/tclsh symlink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Dec 2013 17:58:23 -0000

* 8.6.1 version installs tclsh8.6 binary and tclsh symlink to tclsh${VER}
  (tclsh8.6.1) which doesn't exist
  lrwxrwxrwx 1 bitbake bitbake   12 Dec 26 16:19 sysroots/x86_64-linux/usr/bin/tclsh -> ./tclsh8.6.1
  -rwxr-xr-x 2 bitbake bitbake 8.8K Dec 26 16:19 sysroots/x86_64-linux/usr/bin/tclsh8.6
* add another symlinks tclsh8.6.1 -> tclsh8.6

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 0d6468a..7965568 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -48,6 +48,7 @@ do_compile_prepend() {
 do_install() {
 	autotools_do_install install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
+	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
 	sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
-- 
1.8.4.3


