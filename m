Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06A9C88CB9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 11:04:17 +0000 (UTC)
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
 by mx.groups.io with SMTP id smtpd.web11.84908.1754046250597103338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 04:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4btjkd1cjMzkfk;
	Fri,  1 Aug 2025 13:04:09 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4btjkc1DwtzZbs;
	Fri,  1 Aug 2025 13:04:08 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 01 Aug 2025 13:03:13 +0200
Subject: [PATCH RFC v4 5/9] mesa: assign S in include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mesa-libclc-panfrost-v4-5-101c6dcf564f@cherry.de>
References: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
In-Reply-To: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Otavio Salvador <otavio.salvador@ossystems.com.br>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 11:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221235

From: Ross Burton <ross.burton@arm.com>

Anything including mesa.inc will have the sources extracted in
${UNPACKDIR}/mesa-${PV}.

The default for S is ${UNPACKDIR}/${BP}. ${BP} is ${BPN}-${PV}. Because
mesa.bb is named mesa, BPN will be mesa and thus S wasn't required for
mesa.bb but only for mesa-gl.bb. This also explains why this change is
fine for mesa.bb as the value of S won't have changed, the ${BPN} part
is now just hardcoded to "mesa" for mesa.bb instead.

No intended change in behavior.

Signed-off-by: Ross Burton <ross.burton@arm.com>
[added commit log and title]
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 --
 meta/recipes-graphics/mesa/mesa.inc   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 1a594a52f8c6dabbc282af0769b27a755d0e7b22..979a6f97374741f5fd8716c87039af0a6ad37749 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -4,8 +4,6 @@ SUMMARY += " (OpenGL only, no EGL/GLES)"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-S = "${UNPACKDIR}/mesa-${PV}"
-
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0bacdbc89e96ca83b38ca6158cf22a282019beda..3b6551be62d83aee595632b711360dedfd5e8332 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -26,6 +26,8 @@ PV = "25.1.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
+S = "${UNPACKDIR}/mesa-${PV}"
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {

-- 
2.50.1


