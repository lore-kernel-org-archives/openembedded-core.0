Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98480CD4F3D
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 09:07:07 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31212.1778836015162277220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=jfYnuPb3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-20260515090649dd05b99e0c00020760-geagfo@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260515090649dd05b99e0c00020760
        for <openembedded-core@lists.openembedded.org>;
        Fri, 15 May 2026 11:06:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6BJils0Vk3vN58hkoxki1HLmu0A20f74dvgmgbWwqHQ=;
 b=jfYnuPb3kM/dK018oGQuliZ0FLXDh8KXU+/5Qt3e9+I7r118RFJ/Fbr6tC2pXL5eIbNZhy
 sub3LExAvbncgUPqJcED89k8+dSRrrN0J1xpvY4m26HJwCim1FD2aF6/3dwUIQIcIki2Enz7
 YyLv4zWYHrv0y3yUP/kwsK8fkxvBgQ6xAMm/q9bQ/8BfRNyOdMW91f+v0MUIl8iTY///6C7v
 pSUNE5Ub0cvW7TofA9u2SGj0RxR0swzAgJvXmen/oiK91VPzolaPzIG+kI1Y+9GKUWj9V0gn
 S9zG1qLVbhNP/P0LOCWzgjRRIAoIcqZloP4lfAroYbxK2iuNc1dZLLww==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] ninja: enable large file support for nativesdk builds
Date: Fri, 15 May 2026 11:06:45 +0200
Message-Id: <20260515090645.1053312-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237071

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When SDKMACHINE is set to "i686", nativesdk-ninja is compiled as a
32-bit binary. Without large file support (LFS), ninja's internal stat()
call uses a 32-bit struct stat, which results in EOVERFLOW on filesystems
that report inode numbers larger than 2^32 (e.g. container overlay
filesystems).

Add -D_FILE_OFFSET_BITS=64 to CXXFLAGS for nativesdk builds to enable
LFS, ensuring stat() uses 64-bit types regardless of host word size.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/recipes-devtools/ninja/ninja_1.13.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.2.bb b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
index e750c78c46..4fd048efa6 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
@@ -30,6 +30,11 @@ do_install() {
 	install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
 }
 
+# Enable large file support to avoid EOVERFLOW when stat() is called on files
+# with large inode numbers (e.g. on overlay filesystems). This is critical when
+# building nativesdk for a 32-bit SDKMACHINE (e.g. i686).
+CXXFLAGS:append:class-nativesdk = " -D_FILE_OFFSET_BITS=64"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2021-4336] = "cpe-incorrect: This is a different Ninja"
-- 
2.39.5


