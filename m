Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC6DC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:37:09 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7357.1787729824900977036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=QaOr5m0H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1328017-20260826073702807d0c1cb6000207e1-pfz7zn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260826073702807d0c1cb6000207e1
        for <openembedded-core@lists.openembedded.org>;
        Wed, 26 Aug 2026 09:37:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dwQkhhE6ykVRVLhQf54bQ77ZUJ71kUM9N+hMGjuG8ds=;
 b=QaOr5m0H+IG0Ayw6TrgfDH1XsgvmVolN+BOoFmMKqdly/c9APD78YKc9mMbT9IB1Y7gjb9
 bjL3/YJoTNkBIKwDsWlbo2WlCAzxostchjMidn0HdIHUHEWudpMwxtAoDx9Q5qfkCrd3FkAu
 xRgx+elvi1VsVL5ejV5Rdr6yrkNHFymxFXymQmrpmkg1BeEibIIGf6T5nK8UdbZo8QEqBXTO
 6OZcjLMkIdXMxwRQ8s2oSHKeYX0Q3aLm1EpL1y9qjMO6wwAAn/16qMsO2x26lDu3v97W2JZb
 6TkjGVr+I7zbHB6x1Ncq+dX3/oH5tccy+CxM8So0HUZ++fGKemoNJojQ==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Wed, 26 Aug 2026 09:37:01 +0200
Message-Id: <20260826073701.367061-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244318

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
as 32-bit. Without -D_TIME_BITS=64 and -D_FILE_OFFSET_BITS=64, stat()
and time-related syscalls use 32-bit types, causing EOVERFLOW on
filesystems with large inode numbers (e.g. container overlay filesystems)
and Y2038 issues.

Add SDK_CC_ARCH appends for class-nativesdk:i686 and class-nativesdk:i586
using GLIBC_64BIT_TIME_FLAGS, mirroring how target architectures are
handled.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>"
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/conf/distro/include/time64.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index dd29105db4..7f02774839 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -32,6 +32,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 
+# Apply the same flags to nativesdk packages when building for a 32-bit SDK
+# host (i686, i586).
+SDK_CC_ARCH:append:class-nativesdk:i686 = "${GLIBC_64BIT_TIME_FLAGS}"
+SDK_CC_ARCH:append:class-nativesdk:i586 = "${GLIBC_64BIT_TIME_FLAGS}"
+
+# nativesdk-pseudo wraps both 32-bit and 64-bit libc calls; enabling LFS flags
+# causes duplicate symbol errors (e.g. creat64, fopen64) on i686 because glibc
+# aliases the non-LFS names to their 64-bit counterparts via macros.
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-pseudo = ""
+
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-- 
2.39.5


