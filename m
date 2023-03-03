Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D199C6FA8E
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 02:11:43 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web10.13143.1677809497488911733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 18:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=pd9COkPI;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=t86jJ4jIDvc6/XwORDetRBGXWWOr99H/yVgsOqs/dTw=; b=pd9COkPIzW9Q86NEoc2ejr3zdk
	BBevHpKOFL7JjCv5tM4G4qqlk1AKyj9ruUfzf1mbGczR7LQf+3gHMVXABSGxcKal02FkghvMRFuxI
	rscvgrEDy66gZuXd3lwAxyqgfQHenj3K+iDsEX+CtFF6sbJKM0ReTGF1To5Ib/nM96v1uJSflZyQg
	MFcoF831leNj26K1GpYxuBHBHPNhzITZPpgPWQQmopNgWzfC2LbOntw4Lv78Jebx9XO8TRHAv/IkT
	9n7WUphmxi3H4aa5I7Ls5wT+T2txylUOAJmqgzJckV0LaUFUhZtvhCxV1rdtT8AGsFSJasf6C7ALA
	kKVEs4OA==;
Received: from bl13-97-106.dsl.telepac.pt ([85.246.97.106] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1pXutS-003EVU-Dz
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 03:11:34 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa-demos: packageconfig weston should have a dependency on wayland-protocols
Date: Fri,  3 Mar 2023 03:11:17 +0100
Message-Id: <20230303021117.16564-1-clopez@igalia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 02:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177973

wayland-protocols is a required depency of mesa-demos when the 'wayland'
packageconfig option is enabled. Usually this doesn't lead to a build
failure because mesa itself depends on wayland-protocols, but when using
other graphics drivers this can cause the following build falure:

| ../mesa-demos-8.5.0/meson.build:69:2: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig
| ERROR: meson failed

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
index 6e9b95e1e2..12f41d75a5 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
 PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
 PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
 PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols"
 PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu"
 
 do_install:append() {
-- 
2.30.2


