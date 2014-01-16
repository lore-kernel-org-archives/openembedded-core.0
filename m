Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB166002A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 18:09:54 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so1317648ead.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 10:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=aBS40s7u//sycoKh56gNyvEQ7kqDbrTRIxNVVk4xzrM=;
	b=qp6s7o+aZ4vN+dClySKI5GqCEPUoL/6euxUxUIqNEinrV8xk10sO0N6ZdPzOYkVjw+
	iUETjHZ70ZX+5zlZPXbo5fBJ4R+Ldzm9/0XJOkXmqOtaDXPVWZXxwDYqc84AkzUsVYs3
	l7DJ6wRt+S6gM7zlQi6j+ZEbdGasOrz6ccyTM+tIiB/r/iM2IZ83rRD09rQnSdI57PBI
	nhmGuyxDjMsMyD/9P/Zs6q1on3CdI6RYhvGiz592NSWRbu3bmWtcal+qzxptt/y65m6i
	r77zxnwsO3vuTPrU3q4brKdTEvZ0i5j+kTGKefh/raorm/nNffAfWTHYD1RPYx315/NX
	SsvA==
X-Received: by 10.14.172.69 with SMTP id s45mr14115660eel.9.1389895795190;
	Thu, 16 Jan 2014 10:09:55 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id n7sm20175147eef.5.2014.01.16.10.09.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 10:09:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 19:09:44 +0100
Message-Id: <1389895784-13844-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] weston: depend on drm for 'launch' packageconfig enabled
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
X-List-Received-Date: Thu, 16 Jan 2014 18:09:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure fails with:

| configure:15654: checking for WESTON_LAUNCH
| configure:15661: $PKG_CONFIG --exists --print-errors "libdrm"
| Package libdrm was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libdrm.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libdrm' found
| configure:15664: $? = 1
| configure:15678: $PKG_CONFIG --exists --print-errors "libdrm"
| Package libdrm was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libdrm.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'libdrm' found
| configure:15681: $? = 1
| configure:15695: result: no
| No package 'libdrm' found
| configure:15711: error: Package requirements (libdrm) were not met:
|
| No package 'libdrm' found

and configure.ac says:

| if test x$enable_weston_launch == xyes; then
|  PKG_CHECK_MODULES(WESTON_LAUNCH, [libdrm])

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/wayland/weston_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.3.1.bb
index 8e555ee..585de66 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compo
 # Weston on framebuffer
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
 # weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
+PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
 # VA-API desktop recorder
 PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
 
-- 
1.8.3.1


