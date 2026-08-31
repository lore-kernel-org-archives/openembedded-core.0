Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6299BC624A5
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 14:40:31 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31148.1788187227244827385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=RBtn894R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1328017-202608311440248aebd4e01d00020797-ojcgyv@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608311440248aebd4e01d00020797
        for <openembedded-core@lists.openembedded.org>;
        Mon, 31 Aug 2026 16:40:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vEMt9alJ6w52jtWQFmxh272KDGvZW9P30szrtKbZ/xc=;
 b=RBtn894RMiLVOOpVwa0TRrHRVFOLUuWUfY1YZ6NAalD5/scZcu/MZE0NoySiKsFVPWT5sD
 LfrSx6CgY+ZcK08n13pRLSIetUwKUnhrqwAlsW9spoKXT7ne7Oxg7zE9PGv6JxZfR0f4bKoE
 55J/CsIl7Voacw51ugf6QPkosRHx8/Mz2skhqYhEucaCReZm359L+USeN6LBdXvJE4vj4kxv
 AixInf//vgu4FZZop4hksCXQAjhReJSCAuU3aaJlSRnWZxRGGUFkgSQsWwcrFWqqBs0dWSV/
 Z3rTgzKAKJT8LWfcR5mkkZTHI5xJc5fp5yINsopxoQwpYAKheYC1wQog==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH v2] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Mon, 31 Aug 2026 16:40:26 +0200
Message-Id: <20260831144026.3048020-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
References: <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244767

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
as 32-bit. Without -D_TIME_BITS=64 and -D_FILE_OFFSET_BITS=64, stat()
and time-related syscalls use 32-bit types, causing EOVERFLOW on
filesystems with large inode numbers (e.g. container overlay filesystems)
and Y2038 issues.

Add SDK_CC_ARCH appends for class-nativesdk:i686 and class-nativesdk:i586
using GLIBC_64BIT_TIME_FLAGS, mirroring how target architectures are
handled.

The existing GLIBC_64BIT_TIME_FLAGS:pn-glibc override only matches the
target recipe, not the class extended nativesdk-glibc, so an additional
pn-nativesdk-glibc override is needed here. This is required on
scarthgap but not on master/wrynose, because scarthgap carries glibc
2.39, which predates glibc commit a4ed0471d717 ("Always define
__USE_TIME_BITS64 when 64 bit time_t is used"). In 2.39 the header
redirect turns sigtimedwait into an alias of __sigtimedwait64, which
then collides with glibc's own weak_alias() and fails to assemble:

  Error: symbol '__sigtimedwait64' is already defined

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
v2: Add GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-glibc = "" to fix the
    nativesdk-glibc build failure reported on the autobuilder
    ("Error: symbol '__sigtimedwait64' is already defined") with
    SDKMACHINE="i686". Verified with "bitbake nativesdk-glibc" for
    SDKMACHINE="i686" on scarthgap. Master and wrynose do not need this
    (glibc 2.43/2.44 are unaffected).

 meta/conf/distro/include/time64.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index dd29105db4..242d5bac8e 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -32,6 +32,20 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 
+# Apply the same flags to nativesdk packages when building for a 32-bit SDK
+# host (i686, i586).
+SDK_CC_ARCH:append:class-nativesdk:i686 = "${GLIBC_64BIT_TIME_FLAGS}"
+SDK_CC_ARCH:append:class-nativesdk:i586 = "${GLIBC_64BIT_TIME_FLAGS}"
+
+# Recipes which implement or wrap the libc APIs themselves must not be built
+# with these flags, as the redirections glibc performs would collide with the
+# symbols the recipes define (e.g. "symbol '__sigtimedwait64' is already
+# defined" in nativesdk-glibc, or duplicate creat64/fopen64 in
+# nativesdk-pseudo). The pn- overrides above only match the target recipes, so
+# the class extended variants have to be listed separately.
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-glibc = ""
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-pseudo = ""
+
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-- 
2.39.5


