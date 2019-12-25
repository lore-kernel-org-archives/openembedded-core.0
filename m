Return-Path: <Yanfei.Xu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D9A597F7B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2019 07:44:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBP7iXnA000782
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 23:44:33 -0800 (PST)
Received: from pek-yxu2-d1.wrs.com (128.224.162.163) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 24 Dec 2019 23:44:26 -0800
From: <yanfei.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Dec 2019 15:44:25 +0800
Message-ID: <20191225074425.7258-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] libsdl2: fix failure appeared in bitbake libsdl2-native
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
X-List-Received-Date: Wed, 25 Dec 2019 07:44:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Yanfei Xu <yanfei.xu@windriver.com>

When you bitbake libsdl2-native and your host had installed fcitx
or ibus, it may cause you bitbake failed in do_compile.

Disable fcitx and ibus check with EXTRA_OECONF in bb file.

-------------snip---------------------
  CC     build/SDL_sysfilesystem.lo
  CC     build/SDL_syshaptic.lo
  CC     build/SDL_systimer.lo
/poky/build/tmp/work/x86_64-linux/libsdl2-native/2.0.10-r0/SDL2-2.0.10/src/core/linux/SDL_fcitx.c:52:5:
error: unknown type name ‘SDL_DBusContext’
     SDL_DBusContext *dbus;
     ^~~~~~~~~~~~~~~
/poky/build/tmp/work/x86_64-linux/libsdl2-native/2.0.10-r0/SDL2-2.0.10/src/core/linux/SDL_fcitx.c:121:8:
error: unknown type name ‘DBusHandlerResult’
 static DBusHandlerResult
        ^~~~~~~~~~~~~~~~~
/poky/build/tmp/work/x86_64-linux/libsdl2-native/2.0.10-r0/SDL2-2.0.10/src/core/linux/SDL_fcitx.c:122:20:
error: unknown type name ‘DBusConnection’;
------------snip----------------------

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index ac4a356043..413f53476a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -37,6 +37,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-sndio \
+                --disable-fcitx --disable-ibus \
                 "
 
 # opengl packageconfig factored out to make it easy for distros
-- 
2.17.1


