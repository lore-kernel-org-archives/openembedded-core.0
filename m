Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C524C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 16:52:11 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.28713.1669308729047688193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 08:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FKUG95FX;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669308729;
  x=1700844729;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jaDV2bCxiE3o29Khmma/ZmsiEDNr4a6Zl0iApm0MOVA=;
  b=FKUG95FXOX6gg95yyKuPzX7SEZLAGZhm1ix4VREGLcq6+2o8aEzV0PZE
   tt9sf6xqx6q8iA0760PgZRV6xKFQ8o+rV3MXOiQFNCLW2lnQtMnDOTS33
   pMMyA2uK0yjTNWKu6aWPwSzHjUbDr0z1VoBOWzaqYqYEOMqIqZq8rgym2
   hApNgSwwcNnNxoVoeUsGIAAoImFQeo5lpaodt6xWdRbn565yIx11y6uf9
   hfYobSh3ct0tvsFAeTaSK/pOsjWxthj/Y1HUxhNb6HtO167EiA49bpShO
   WifwOOSdxtplt8zzmv+6VZnHlvq+ot2b0621WFAg7qgGkk7Ct4Uf5Fant
   A==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kbd: DEPEND on bison-native and don't build tests
Date: Thu, 24 Nov 2022 17:52:06 +0100
Message-ID: <20221124165206.1020295-1-olani@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 16:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173754

bison-native is required if any .y-file is changed, by patch or in
devtool.  Otherwise the build will fail with

/bin/bash ..../config/ylwrap ..../src/libkeymap/parser.y y.tab.c parser.c y.tab.h `echo parser.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output parser.output -- yacc
..../kbd/config/ylwrap: line 175: yacc: command not found

All c-files generated from y-files are included in the distribution
tarball, which is why bison has not been needed so far.

Add --disable-tests to EXTRA_OECONF as the tests are not usable in
ptest - they can only run in-situ - and fails when building with
-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-core/kbd/kbd_2.5.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index aa3ab6e121..75b3c2765a 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit autotools gettext pkgconfig
 
-DEPENDS += "flex-native"
+DEPENDS += "bison-native flex-native"
 
 RREPLACES:${PN} = "console-tools"
 RPROVIDES:${PN} = "console-tools"
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
 
+EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
 
-- 
2.30.2


