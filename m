Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44448D3B997
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:36:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.47422.1732631762283960127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DHt9/EzY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C9B6E0004;
	Tue, 26 Nov 2024 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732631760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=imP+TXUqDtgX68KREd+sT0y3KYbjHRjoMjTElkBwJwE=;
	b=DHt9/EzY309FhPyaam1Fg42/XYEeSKC239G4/XEYDe3u6Bs3RYT6sEBqeTdZEuWi24TKyr
	MDAw4+JnC5pBBJaXrJZeQZRRXn0Ci6xs/6UEI7LdkvKuopOVSMnXYOiQFR89O4SwadXMEX
	Z2U1m7+l+cLx90bvwHuevmM5RjgokBKyON5bPrMtCEHIajNkDglhZfso2pt2cWA8hEo1qf
	PiMvaexAX8/iJN5ggSv8DP12oJebJkmiM0aH+M3mSnrcsa+2dPrIlGWqwS9n3F3gba02p5
	SIbtBmomEIgWhp0zbB2yEeR7Mb6WFG1UYPw1Tui+i6tExY4gGEsOAGAlnKQFhw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v2] tcl: resolve conflicts with tcl8's man pages
Date: Tue, 26 Nov 2024 15:35:58 +0100
Message-ID: <20241126143558.461097-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207859

From: Thomas Perrot <thomas.perrot@bootlin.com>

Change the suffix from 'tcl' to 'tcl9' and from 'tcl8' to avoid
conflicts with the man pages provided by the tcl packages.

file /usr/share/man/mann/vwait.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/while.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/yield.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/yieldto.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/zlib.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
[...]

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-devtools/tcltk/tcl_9.0.0.bb    | 2 +-
 meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index a6e1dfbb5bef..46e8e7d5c526 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -35,7 +35,7 @@ VER = "${PV}"
 inherit autotools ptest binconfig
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
-EXTRA_OECONF = "--disable-rpath --enable-man-suffix"
+EXTRA_OECONF = "--disable-rpath --enable-man-suffix=tcl9"
 
 # Prevent installing copy of tzdata based on tzdata installation on the build host
 # It doesn't install tzdata if one of the following files exist on the host:
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
index 9d1c724d64bd..928124148ce1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
@@ -38,7 +38,7 @@ VER = "${PV}"
 inherit autotools ptest binconfig
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
-EXTRA_OECONF = "--enable-threads --disable-rpath --enable-man-suffix"
+EXTRA_OECONF = "--enable-threads --disable-rpath --enable-man-suffix=tcl8"
 
 # Prevent installing copy of tzdata based on tzdata installation on the build host
 # It doesn't install tzdata if one of the following files exist on the host:
-- 
2.47.0


