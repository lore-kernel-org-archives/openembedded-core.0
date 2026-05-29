Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB8DCD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 17:01:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57.1780074090911275950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 10:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=YiJEoU4Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1328017-202605291701278732bc648d000207e2-ch8ab6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202605291701278732bc648d000207e2
        for <openembedded-core@lists.openembedded.org>;
        Fri, 29 May 2026 19:01:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=++d95fBoP5tVlZDfPewDDXF/aAwRVCLVadoojzdGjsg=;
 b=YiJEoU4Zzv0vTZtH3i9hAGQ/jfhNVmpXefHKSCRYx1u20VLVzRK0hCENbqSVUVz5Lcd92B
 FkyyjPgKdUXDxS1k1M8chSAsi5iuHke7qcburimJIeKNoiZrE+FCDKf4BHoiYmt3mumqIdx4
 V2qXAClY2bQR81oA8Rk4B/6nAaI/qUrx4wDME+ubwGTW+Rh+qyN4OWdY5FBGOyc9bxXhj2oE
 t/VON5Ya0SnlYe2RpRDo9J83aLg+nLO0F7klE20JImaFTgZDhMETPRqW2zmxiGSY+9NMejrg
 Xs4r6jy5dLz00xNd5UjcQkll1lRu+VsIyRH41RSYzZI1oyolCZq8J+9A==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH v2] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Fri, 29 May 2026 19:01:17 +0200
Message-Id: <20260529170117.2241639-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
References: <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 17:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237768

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
---
v2: Set both _TIME_BITS=64 and _FILE_OFFSET_BITS=64 globally in
    time64.inc for all nativesdk packages on i686/i586, as suggested
    by Richard Purdie. Drop the ninja-specific fix.

 meta/conf/distro/include/time64.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 19177b1f3c..a2fe03354d 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -38,6 +38,16 @@ TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLI
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 
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
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
 
-- 
2.39.5


