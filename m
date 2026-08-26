Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C22C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:31:39 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7281.1787729494908288437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=U3p4uRLl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-2026082607312967609bdf75000207aa-jq1gpb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026082607312967609bdf75000207aa
        for <openembedded-core@lists.openembedded.org>;
        Wed, 26 Aug 2026 09:31:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YN+WDFMLWInw3mf0R/5ftkCWWXk6xkiFtJqzzCC+1iU=;
 b=U3p4uRLllPUfLo+m/hba7g9zJRPgouyWhkRc9pd3GMAddEEVi2V6bqZblwRsgHCf+JdmH5
 YNAW2a76nHqqQQH+o2adUNNAyP/7uv3i6p7z07zn0aT5sWRc0uNAYM1e7UWl27Mj7m3Aeipe
 NLnK51cE8h7954KSDZpuU3mKxH+nE/G9NiVnEj80D7hZ+6sIWvStiF/+CvYRo6j4aqShQyNW
 3T6l+wUua+majJdq/SWHqGAkl4hZTDY52DiFq/IaaHAsdQnivosnxnD/W33BIbw7sR5ZsymL
 NiOWtlLpMHCGjuK1YuXpgEjjay+yo0fp7+bsM3SKGEeTNRBNlTMtrQoA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [wrynose][PATCH] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Wed, 26 Aug 2026 09:31:29 +0200
Message-Id: <20260826073129.363385-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244317

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


