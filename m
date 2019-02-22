Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D9DFC7CBF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d17so2587247wre.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0AIBBsPro2FIh8y2V01m4uHZGRWSOSmpuNGlvOqGBgM=;
	b=gfzxCsiOkl4ZruJxVKV/adsxjp6uuyhRwi3YAvT03itpkZb+1c1QE+F1tuy0xl1lsT
	CJRJSFRs5ee5S2lnDTGst7BZUf76zMDONVXpJbg7RP/bIGO9lXpFVw/UXUFXiHtLif/h
	yl7OuBjwYwJbicWbUVznPCVFatXw0T+ysAeMBbj5o/eJF+oSqiaRGOjMV+UNcgAwRRX+
	ULuQFom2BqzFDF3Tnh51JljCjU1zFy+Ityf9fbLYCBz0HMuZ11cMYCm8tomPgmXvSwBg
	CvmzYApkwOcDJad/sf5T9PdIMW6xjKsvn6MWXTTvLLSlB9fIUh7BLFW1t4dbJ4Oni4as
	sEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0AIBBsPro2FIh8y2V01m4uHZGRWSOSmpuNGlvOqGBgM=;
	b=M2DgZYQeW2VaLTM8wVSzmx8Id1h64lk1AvQXHVDIykBzGXUPed5E+LoRE42Gyw1ua+
	aTasVYH8rJ85jhpXCvQrT589XuGkJcyOzU5vCOBmiTQV7Ni6SxWYRZORAuQUSVMJfHoe
	rzx5kxVmCbNerQkjVTqTSz2Uy0tqLWey+ly+KKP5OvK3V91UfFFzjbullrFlpQKTJx0U
	XUmtgStGX1p9YBlMpRrbsVJQBxIGW36WdPcqONg8QE93cHA0mCIgp+ggC4CE+FkWoNYO
	myxOdGQeX4nz7ldDfMrokdVhuLA3LgVurgO9fe8tPuVq22kWN7oCjA7YygiZUjAvx6ND
	BfzA==
X-Gm-Message-State: AHQUAuY8h+qEDe3FiGQrwxtri7L22CN6oaxpkXWnERJC+dBef1Bzq4Ru
	9wgvScNL0fjfJrWsReREDAjTDnOP
X-Google-Smtp-Source: AHgI3IZjmIJ5YA1Ofu7s/DMcmXG+BxKGXIfePKb8DbXPDuhpSxZbHxmysCfogYMkzkKXUgOMtSV25Q==
X-Received: by 2002:adf:ba8e:: with SMTP id p14mr3127124wrg.230.1550846037336; 
	Fri, 22 Feb 2019 06:33:57 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:38 +0100
Message-Id: <820ad4f7ce0ab3656a9468463d37b03496080f16.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 03/12] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Fri, 22 Feb 2019 14:33:57 -0000

As sdl is deprecated in favor of gtk+, it should not be the default.

For native/nativesdk builds the decision to build with gtk+ frontend
is done via local.conf template from poky distro. (previously
it was done from there, and from the recipe, which created confusion)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95e9e0ede77..07f78058e7b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,11 +71,11 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


