Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4A3C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 18:41:15 +0000 (UTC)
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
 by mx.groups.io with SMTP id smtpd.web11.14051.1634409673899163311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 11:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 194.138.37.40, mailfrom: andrej.valek@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 19GIfAf8014815
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 16 Oct 2021 20:41:10 +0200
Received: from md3hr6tc.ad001.com ([167.87.32.51])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 19GIf9Lx017949;
	Sat, 16 Oct 2021 20:41:09 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: sakoman@gmail.com, richard.purdie@linuxfoundation.org, raj.khem@gmail.com,
        Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][dunfell][PATCH] libpsl: Add config knobs for
 runtime/builtin conversion choices
Date: Sat, 16 Oct 2021 20:40:48 +0200
Message-Id: <20211016184048.1106260-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: 
 <CAGDS+nky--RnYWkRAEhtAmqD2VenaMY+0TERHAPtdcYvjTxpGw@mail.gmail.com>
References: 
 <CAGDS+nky--RnYWkRAEhtAmqD2VenaMY+0TERHAPtdcYvjTxpGw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 18:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157016

Based on d22d87b9c4ac85ffb3506e2acaf2a8a627f55e8e, but kept idn2
as default.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/libpsl/libpsl_0.21.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.0.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
index b2dda191ce..66e64f785c 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
@@ -19,11 +19,10 @@ SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd6
 
 UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-DEPENDS = "libidn2"
-
 inherit autotools gettext gtk-doc manpages pkgconfig lib_package
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ?= "idn2"
 PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
-
+PACKAGECONFIG[icu] = "--enable-runtime=libicu --enable-builtin=libicu,,icu"
+PACKAGECONFIG[idn2] = "--enable-runtime=libidn2 --enable-builtin=libidn2,,libidn2 libunistring"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1


