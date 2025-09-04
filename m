Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C70BCAC585
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:01 +0000 (UTC)
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
 by mx.groups.io with SMTP id smtpd.web10.40454.1756994637218204947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6M6tK4zsCN;
	Thu,  4 Sep 2025 16:03:55 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6M3SJtzkP9;
	Thu,  4 Sep 2025 16:03:55 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 04 Sep 2025 16:03:35 +0200
Subject: [PATCH v7 06/13] mesa: assign S in include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mesa-libclc-panfrost-v7-6-e921a65412f7@cherry.de>
References: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
In-Reply-To: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 14:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222939

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 --
 meta/recipes-graphics/mesa/mesa.inc   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 4d71406b6dfbdd260ef61a7ab9427c70c47685f4..7b283415dd26a4dc73713a8bed1f794b02c979a9 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -4,8 +4,6 @@ SUMMARY += " (OpenGL only, no EGL/GLES)"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-S = "${UNPACKDIR}/mesa-${PV}"
-
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4c079fe0aba8125763f0a598d6e114082a8453ee..45499f6c421e7fb0b06ef95179168c6cb9fff1cf 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,6 +24,8 @@ PV = "25.2.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
+S = "${UNPACKDIR}/mesa-${PV}"
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {

-- 
2.51.0


