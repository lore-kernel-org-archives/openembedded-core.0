Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26806C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 21:08:27 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.57444.1669928895917719879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 13:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=Kkz4Yx1X;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=laY71Hococvo22H7FW4HaC0gvNE88FZzh3vuO+hfDDQ=; b=Kkz4Yx1XYWyEcT3QdKCzrbDLRS
	6HNJF2aMj2raJzoyQ/r7bAvKs1VPUSGe9l+W2bOC+j46N2m82FPYycMkWyBDiaPjUoIg8gaHNhhKq
	lIHczctlwkErkQoGjfpJWAurTU+hWyi6NDByXhLhqrllu+ONZdZBm/JA26GLGPDesHv/olGQXIbwC
	X92sRYsdbCid4w5LT4S7FUXvf9fTE//b3QfUOwfnWZ0RxkvE8j9W/m9hXGrwIaCqDdwxLPkhv9tNl
	HLwO4MtXB/b4c+IdajX16q4pqhaH50WibAgbCE/uHEPUijdLFAdHbzWyYAMXX79CMxgRC7hbQgrPm
	7ZQcAHEg==;
Received: from bl9-126-48.dsl.telepac.pt ([85.242.126.48] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1p0qmy-00CLVJ-9p
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 22:08:12 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xwayland: libxshmfence is needed when dri3 is enabled
Date: Thu,  1 Dec 2022 22:07:50 +0100
Message-Id: <20221201210750.3393-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 21:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174212

* The build error happens already at configure time:

| meson.build: ERROR: Problem encountered: DRI3 requested, but xshmfence not found

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-graphics/xwayland/xwayland_22.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
index c1c5407dee..51d847a093 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
@@ -23,7 +23,7 @@ OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
 "
-PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
+PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false,libxshmfence"
 PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
 PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
-- 
2.30.2


