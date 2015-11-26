Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB620601A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 09:29:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAQ9TTKY004764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 01:29:29 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 26 Nov 2015 01:29:28 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 17:29:26 +0800
Message-ID: <1448530166-6385-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [PATCH] libsdl2: add missing dependency on libxkbcommon for PACKAGECONFIG[wayland]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Nov 2015 09:29:31 -0000
Content-Type: text/plain

libsdl2 depends on libxkbcommon when enable wayland support.

Can verify it with the following steps:
bitbake libxkbcommon -c clean
bitbake libsdl2 -c cleansstate && bitbake libsdl2

config.log:
[snip]
configure:19347: checking for Wayland support
configure:19357: result: no
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
index f138f97..61d9c1e 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,vi
 PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
 PACKAGECONFIG[tslib]      = "--enable-input-tslib,--disable-input-tslib,tslib"
-PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland"
+PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland libxkbcommon"
 PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
-- 
1.7.9.5


