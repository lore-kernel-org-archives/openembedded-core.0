Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8A17C88C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x10so2017016wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2sU3r+ReKy3m+L7LJtHSPVRO66zespSq4Fc/Ck+ZNvA=;
	b=j80c19PazHNTqa/jbMcqbE2ea9Jt+kcayHV1dreQJs7gZBJi3JtW6mZkSmIh5vWObR
	TreTcVtqTlQMn9lnkCxPr7kKDRiAhBgsdSxKYyXGx5F6aI6GOfNwFAZO9/A0rZbSMhu4
	uuPYcZx43vKE4PeS93LknYlHR7Uycmwrl0ubKOqzTq2cOIXZ5VvalD6LcEyX9rCGXCX6
	dE56uAM94pUeg3C+IjS5F2UvUptEYMzbn7G09/ZB+9HvMFTCTaOPGF0yOKy+gKrlHnpV
	x9bw0zzuI8NKd/xyomvy1jqOY8/C00PSux4heF60A/l08i9Y55ViK9qyWBeuFWnI21Je
	Edyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2sU3r+ReKy3m+L7LJtHSPVRO66zespSq4Fc/Ck+ZNvA=;
	b=dG6W/cCMdRdUgzqle+yQ0HgxK/rFDB1b6beYiKY8D5eqER/FohVnh2OybnJRSkYcrH
	vFyOjsQSWQWKtFNsOEVKZvOCJSCAIJ1QiTR53pO6FYPaZHZ+kPSmCrG8a6OWZXfsjWFR
	DJw/HytzRIvgoLAta6kAGXJZMug9Fy/iN66ec16uEmI69Jsg3Eu5HOSWXrbTTmwcnGtw
	tW6bd5p3txAUmJROclRVWDTkoe/IPYMxqGG9DKOLBSvZtirYbbvunb0AqPPv6SsdU0lk
	xhceV9TKBVb4wCOI3XBKxvHZuFshCgswPs6/wPXz1iqvweavXcmIFQMdGgNBBWn58K/P
	WI8A==
X-Gm-Message-State: APjAAAXKULZ5Qa/tE4vsLoaZz+ScUBnfBF+SNNay9n6EEeQt7/6aejw3
	hygKFAuL+o6cQybSKAz2ELlB1noK
X-Google-Smtp-Source: AHgI3IYh9q1/mwTo8oibrCNKkefTDAhbXLj/3yQOkWhG2DbsDOUVwztvgpgJc73pHy2hcOuOVPz/1g==
X-Received: by 2002:a1c:5fc5:: with SMTP id t188mr8024728wmb.86.1551612481764; 
	Sun, 03 Mar 2019 03:28:01 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.28.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:46 +0100
Message-Id: <20190303112752.16353-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/9] qemu: enable virglrenderer and glx options for qemu-system-native and nativesdk-qemu
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:01 -0000

Note that to actually use accelerated GL passthrough, there are two options

1) a suitable frontend need to be also enabled - gtk+ seems to work well,
sdl was found to be buggy.

2) it is also possible to render off-screen with -display egl-headless option,
and see the output with a VNC viewer (for which, qemu needs to be started
with a VNC server):

$ runqemu kvm egl-headless publicvnc

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu_3.1.0.bb               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
index 5bf528bec12..95369d7f6a2 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 04d8bee99f2..3c404d408d0 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -17,6 +17,6 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
 
 
-- 
2.17.1


