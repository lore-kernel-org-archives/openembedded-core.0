Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760E4C4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 05:36:42 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.176115.1672205797231859408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 21:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=WE+SmZV+;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yJg6Hh97W5pmuh1h7JKooCwn8W7GcRUKscUumBFoVY4=; b=WE+SmZV+jbfE4mx0IW+XCA4hYp
	Sv4UJPNd1nUEx8nWnvxp76KD8BSvoGig1txh6UW6jeL7brLgf226V2XRqvMS2F3l+m0OsJWdCI8oB
	RlX22G+LDKHUwXgxUOps45Oh2Xz6TccT8fOfyIrrH3hGLSZmfC1geSnZniAldyJ06ZQPlqmvK4MUE
	d4deoZaspgQcBcz7zTMMy8ZhbqMVAtI7xaIcWmxoKwM502p6QSRpSMeYbhVHBsW4VSjxsNjl24dyv
	gGTmZp3I7PL7dwtE76lECgsdqRS1RlCwEYvPjTWiAsBuW6Ho1eiNbY72wXtLMvZuBt0Moseu4hNfB
	lmSYS12w==;
Received: from [213.60.16.212] (helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1pAP7B-00BXfn-5a
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 06:36:33 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa-gl: gallium is required when enabling x11
Date: Wed, 28 Dec 2022 06:36:04 +0100
Message-Id: <20221228053604.2392-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 05:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175039

Otherwise Meson will fail wit this error:
  - meson.build:555:6: ERROR: Problem encountered: xlib based GLX requires at least one gallium driver

Related: https://github.com/agherzan/meta-raspberrypi/pull/1119
---
 meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
index f2bc8f6b5b..c7c7aa7ac3 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
@@ -8,6 +8,6 @@ S = "${WORKDIR}/mesa-${PV}"
 
 # At least one DRI rendering engine is required to build mesa.
 # When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
-PACKAGECONFIG:class-target = "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
+PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
 
-- 
2.30.2


