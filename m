Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DB8DC7C88C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:36:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d17so6035235wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2sU3r+ReKy3m+L7LJtHSPVRO66zespSq4Fc/Ck+ZNvA=;
	b=g7OZWWeYYdiuRMPlneUn81dnMtSsGR5KSDWUT9cCN63RzF5fh2Vf4AU58jvN0M2mA0
	mRtA1MXPzYr66xSxlw7AfvpyeprN6fUjO7610jchMnt9GVgrMqgP0+2cdIYoYlBIoV1V
	YYVzS4wczCmS28wZ2mct9PcD3uQ+hsULoLU6mdjUZe+4h1DLw0A0snvvAsHwx08xrgDL
	V/4YYvUZU/Ai2AHMXiyBXOYYUmhPUU3O5TpMKxoCwwZEF4+SL7rq9xt2JETUrQRw/uVm
	rbddyq4/0Utn5v/Uo/S6Ub01Kl51mXrLndvsyaY204uXL/vyGOcYH5+T+CGdVCUc0EFe
	p6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2sU3r+ReKy3m+L7LJtHSPVRO66zespSq4Fc/Ck+ZNvA=;
	b=guUqa60BB6aZkSik4T1YwZZt08Kuqp+PdzRF/ZGk0CZ85gCnnDHcntVpj05qRNjIFi
	kW4amCf/nZTpUTSjSZbzGc1hqRhKxusZGkg6Ee5+rhD6qNJiu6ISdJVJu8vQ58akUty1
	dGEBa3lOjuchTjkSJsJNurMSxb5IV5p0qfT2YHq8muuTFyeh0p+1kZn9uZ5Y3SGMr+Yu
	XyBRu6SEn2MmtsT9daHvqFdU0dcsrX3GunfDH9P2HHLDQ/aAoMuLPvYZRlUz53riWMfb
	TYJ6QLs3i98xeg/6vhMIxiBhGN9Wnb73bsRXEq/PTUnni6pjajsSLtfIiX7t6xF89ojQ
	NCTg==
X-Gm-Message-State: APjAAAUt9NQ4chP0cpfmQiqp29JD145iFJiwplTAIbx45yUKvA2qavkG
	v3lEk7MIh2tF8MrF5/K1tlX/HUeb
X-Google-Smtp-Source: APXvYqzVLkLLKjbOriO0Orfh+z5uHjQ0F1Uzhoup7NKu0P2MkCh7ULkWAAf+ornrIt54o4/pD9Kgxw==
X-Received: by 2002:adf:f846:: with SMTP id d6mr13743494wrq.53.1551713812322; 
	Mon, 04 Mar 2019 07:36:52 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s8sm5523414wrv.12.2019.03.04.07.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:36:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 16:36:41 +0100
Message-Id: <20190304153646.59135-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] qemu: enable virglrenderer and glx options for qemu-system-native and nativesdk-qemu
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
X-List-Received-Date: Mon, 04 Mar 2019 15:36:52 -0000

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


