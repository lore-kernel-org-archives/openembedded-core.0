Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037BBC87FD9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:36:40 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.web11.3266.1753781796341935428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 02:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4brqwz0csszrR7;
	Tue, 29 Jul 2025 11:36:35 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4brqwy4Q0DzBX9;
	Tue, 29 Jul 2025 11:36:34 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 29 Jul 2025 11:36:25 +0200
Subject: [PATCH RFC v3 4/9] mesa: assign S in include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-mesa-libclc-panfrost-v3-4-42559ddc93ef@cherry.de>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
In-Reply-To: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 09:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221049

From: Ross Burton <ross.burton@arm.com>

Anything including mesa.inc will have the sources extracted in
${UNPACKDIR}/mesa-${PV}.

The default for S is ${UNPACKDIR}/${BP}. ${BP} is ${BPN}-${PV}. Because
mesa.bb is named mesa, BPN will be mesa and thus S wasn't required for
mesa.bb but only for mesa-gl.bb. This also explains why this change is
fine for mesa.bb as the value of S won't have changed, the ${BPN} part
is now just hardcoded to "mesa" for mesa.bb instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
[added commit log and title]
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 --
 meta/recipes-graphics/mesa/mesa.inc   | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 460e5e60c8dcee69d43885954c431b175c19394f..bdb4920572fa0777067b499dbe84152856538ed0 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -4,8 +4,6 @@ SUMMARY += " (OpenGL only, no EGL/GLES)"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-S = "${UNPACKDIR}/mesa-${PV}"
-
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 PACKAGECONFIG = " \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 55793baa8de5a190ae5eadb44662c1d11487c026..f3bae50ebb3cffa9b3c1123096190143e1972228 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,6 +25,8 @@ PV = "25.1.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
+S = "${UNPACKDIR}/mesa-${PV}"
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {

-- 
2.50.1


