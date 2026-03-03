Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA51EC144C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18353.1772545032411233055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=TG2VfG81;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1334352-202603031337097304baba48000207ad-qpzwgh@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603031337097304baba48000207ad
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Mar 2026 14:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=S+QytYevJkCqyMMCPG62eL5eiyQ744PFxgY6X1Ux28A=;
 b=TG2VfG815SyEyvxQxxvlFfrpXyhh49rru+jx4zjcBPHOj09rD06Ie09a/ABVR1A+e7+qEM
 7Pp7BUlPZvTtJCd0AbSEzwwxNiFIXUMoT8bIdDXu+K+tNdqw2XRQpex4gjUdPFrLFwpg7EnU
 XZvI8jPl3hlCT+TzY8x9YHEJeK8BrwnCLMXxtqspzdGYBFWnDiGfxqwwcRALZ/Ay8oznDp3u
 aArwIO7KJcZwfkLTPBAB+/X5wQk0DTirgQN0dFRHI6Bn+SZ1+IJrJDCnNVd7fptuptMt2W4M
 nw4G7jxMKLqXANRvOdfqN6VCQKihKXoKNk5YoBHtYcEtYlo8G/dvuNaw==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 5/6] libunistring: upgrade 1.4.1 -> 1.4.2
Date: Tue,  3 Mar 2026 14:36:44 +0100
Message-ID: <20260303133645.1449-5-andrej.kozemcak@siemens.com>
In-Reply-To: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
References: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232314

  - prepare for 1.4.2 release.
    - version.sh: Bump version number, date, gnulib version.
    - README: Update version.
    - NEWS: Update.
  - sync with gnulib.
    - lib/unistring/cdefs.h: Update from gnulib/m4/gnulib-common.m4.
      (_GL_UNNAMED): New macro.
      (_UC_UNNAMED): Apply
    - new C macro _GL_UNNAMED
  - Make the generated <unistring/stdint.h> more usable in C++ mode.
  - lib/Makefile.am (unistring/stdint.h): In C++ 11 or newer mode, just use
    <cstdint>.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../{libunistring_1.4.1.bb => libunistring_1.4.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libunistring/{libunistring_1.4.1.bb => libunistring_1.4.2.bb} (93%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.4.1.bb b/meta/recipes-support/libunistring/libunistring_1.4.2.bb
similarity index 93%
rename from meta/recipes-support/libunistring/libunistring_1.4.1.bb
rename to meta/recipes-support/libunistring/libunistring_1.4.2.bb
index 791f4983ed..8f6cc27193 100644
--- a/meta/recipes-support/libunistring/libunistring_1.4.1.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.4.2.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "12542ad7619470efd95a623174dcd4b364f2483caf708c6bee837cb53a54cb9d"
+SRC_URI[sha256sum] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


