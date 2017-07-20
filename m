Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 580E578316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:55:24 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g13so12473755ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+WXzDZ91UzuYEh6/o8rLKzg0zAKYWN0Sg+fj+4KzrLs=;
	b=jVBbvP670wkWGi42TSuP70YJlW/GbiWOP50lpS/Fd/bUQJvTkDp1vl+75BD7r4xlu+
	8BDV3I1i/xarY3e+vkcgEK6/HnecW7O/pSo4JlADivLib3CqqBD1ZgBuXHL0cKoQM9Ks
	SpfAoa02dcDSu7yhYxnh/2bCydgKzl1MC2Vgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+WXzDZ91UzuYEh6/o8rLKzg0zAKYWN0Sg+fj+4KzrLs=;
	b=BfwGqmdJHA/OOCX/9qnOcikr1MGwT9zIPHFJIMT+GVZLBbR8v5cE/EjHcEHs6n+HU7
	EkdYApIrvivuSskbw0G3mbMWPugSTUy+CVwfB644zvGPiMZpgSdmDj5ao9cM16ha7bHS
	4q21e6rei4A6sgbNpbMyY7YjIA6VLF13VTzPTh81U+f3Eva9Hx/4xz+zufgBWfdBNfPj
	ZbQBJhWlfHCSnuH/uI9YU5slLPWvbmiQuWb26Kll5F8rdrq1OBi0ox0bJLv6sF+pz+wA
	lVirfR2PFTBOenbhZVQ8ILLCGKmqFqMlKw2FW00zxy70xVxBNqu7wS+2TlJguf2M5+EZ
	B8dQ==
X-Gm-Message-State: AIVw110QmYV/0+52YF0aTTkm8D2XusJRHOnbWDpa2yNYv5ZOIC1X14ss
	tLzThsbbLt6sz6NS5tc5hQ==
X-Received: by 10.107.169.130 with SMTP id f2mr3593591ioj.199.1500562525209;
	Thu, 20 Jul 2017 07:55:25 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	r125sm1140296itd.11.2017.07.20.07.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 07:55:23 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:55:11 +0200
Message-Id: <20170720145511.22753-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 14:55:24 -0000

in config.log we can see:
WARNING: aarch64-linaro-linux-pkg-config not found, library detection may fail.

ffmpeg configure script is not looking for pkg-config at the rigt place since it
is assuming cross compilation. let's force its value in the recipe.

This patches 'fixes' library detection, so it also adds:

--disable-libxcb
--disable-libxcb-shm
--disable-libxcb-xfixes
--disable-libxcb-shape

Which were dangling configure options, which started to be enabled after the
pkg-config fix, so they need now to be explicitely disabled. Follow up patch
will enable these options when DISTRO_FEATURES has x11.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
Changes in v2
* added the --disable-libxcbxxx flags to make sure the patch is a no-op
---
meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
index f4bb2ba1f5..30d918ea1a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
@@ -87,6 +87,10 @@ EXTRA_OECONF = " \
     --enable-pic \
     --enable-shared \
     --enable-pthreads \
+    --disable-libxcb \
+    --disable-libxcb-shm \
+    --disable-libxcb-xfixes \
+    --disable-libxcb-shape \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     \
     --cross-prefix=${TARGET_PREFIX} \
@@ -107,6 +111,7 @@ EXTRA_OECONF = " \
     --datadir=${datadir}/ffmpeg \
     ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
     --cpu=${@cpu(d)} \
+    --pkg-config=pkg-config \
 "
 
 EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
-- 
2.11.0


