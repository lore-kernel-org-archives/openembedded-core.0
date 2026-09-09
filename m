Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCECC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:43:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12398.1788961395987908305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=a1iU/exf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1328017-2026090913431247bde42c8e000207fa-_r3i2f@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026090913431247bde42c8e000207fa
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 15:43:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vZ5Ou+ne7tpLhFhvmwMV3HmVxGOtvx2hElWwLPjsN1o=;
 b=a1iU/exfNF3/GCFLmheBuCwe+1+Hkn2G8ZGjBWko9CIfYljG8m7gbCSfMnPd1jujDWSZNi
 CYquW8dMNWuNP1DfcgInTeZi5ki4plMtHgqxf09iq1wO/OZyKvZHrFzEw7rphoDSZDHRlIdb
 upWYELh8HNbnGAUgT4cSzKtX3HKsU9+ZPFy8h3Dr+9Tz/6frEj4iZVzDOhRze1ZEALwmH3NJ
 cumFCRLRT3Hy0oaoWRcvfzaOhjXVEgsa+0bqDvtdnQ0LKe4vRk4cGMEN+d51WmQFgbl4E2yp
 VRhlVN8bOAdwYYdh7KOw+/v+6dtscRehsQaSsm6puMIKRlb+Q+IGW5uw==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [OE-core][scarthgap][PATCH v3] time64: enable 64-bit time/file-offset flags for 32-bit nativesdk
Date: Wed,  9 Sep 2026 15:43:11 +0200
Message-Id: <20260909134311.1565410-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <DLANZ4P17648.3II74EWL42T08@smile.fr>
References: <DLANZ4P17648.3II74EWL42T08@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245473

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

Also exclude nativesdk-mingw-w64-runtime. The MinGW runtime provides the
Windows CRT rather than glibc, and _FILE_OFFSET_BITS=64 changes its
stat declarations. That causes conflicting declarations for wstat when
building the CRT itself.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
v3:
- Exclude nativesdk-mingw-w64-runtime from the flags. The MinGW CRT has
  its own stat declarations, and the flags caused conflicting wstat types
  in the meta-mingw autobuilder.

v2:
- Exclude nativesdk-glibc from the flags to fix the SDKMACHINE="i686"
  nativesdk-glibc build failure:
  "Error: symbol '__sigtimedwait64' is already defined"

 meta/conf/distro/include/time64.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index dd29105db4..c2a4feab24 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -32,6 +32,23 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
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
+# The MinGW runtime provides the Windows CRT rather than glibc. These flags
+# change its stat declarations and cause conflicting types in the CRT sources.
+GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-mingw-w64-runtime = ""
+
 # Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
-- 
2.39.5

