Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B69EF7CC0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e74so9128725wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2sU3r+ReKy3m+L7LJtHSPVRO66zespSq4Fc/Ck+ZNvA=;
	b=YAeg9Tc/8gd8b+sY6KJnpxODqw0uKOLukzG9vl45zCXiU/YwF0HiV+LGwtvNAFgzMu
	BpjZF6OZzi1nPSVEa723rIuqGWsTFpzOCHZE+Q1I0ZdVyNvPiANySy3D5ULUyBjrO1Bg
	mQWFrJubwd8VDzit3LET9sml02qx25zlCY+qnyoI1aEY9Znf/o87L+6WdKttqP295CNd
	/apCrYeaf1dzRGjg3exSRPTjEaOV99sgIZPDYdRZaTcFJWB4ykkJx3NnftO4Rsf1brQH
	+GuAuYu156dqOh1wcT1k3OLP87On9AW5pEo6p2abaM/3gdzqOm4sWgpsanDOiGtgS5ws
	FnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2sU3r+ReKy3m+L7LJtHSPVRO66zespSq4Fc/Ck+ZNvA=;
	b=p3y0J7RraXPOXiCOHglzMesmR8n7Mm8VDKAtho4I4Tis/X0Stvw6sMqt20K55gI/Cc
	E5ZJbC2b0cUC5uCK1JRy+hrJa6h7q8s3VclRgjiMk6GRDSP2eHLlObxwnWC7nO1F33JB
	m/S5j7Zk/KHt2lkwot5hCnP5KmS0O0OFtwsIa3PaJuucbvhEhbBqfEUXk90tdj+Pm2Vc
	Zv+MpWBp386lFCW4x0CI1JHMSyGr+Twt2YH1I/B8Y+wVWVx1kB9vpqwHEJIP2cqHS/AS
	1CbVrhkMVAm/Kbp7vXoBjTEdSKUsMtiP7mtrsWDFK09aZZTVfr2skskaGVvBhCl30Zll
	4ptg==
X-Gm-Message-State: AHQUAuZXvDaaKUYXSlvZtUeZ0Sd8FyLyWLuD/WKiHp+Su5CQ5zHCBeEx
	AorBfuBH+W6C4oPhF6KW8t6gTpdk
X-Google-Smtp-Source: AHgI3IbYX1RYAb2jJym8/T5h3H9HC/uObK0llY6Jmm+6MxaGVs+04GnwQ5jAyn3UtqhkXQMvprU1cQ==
X-Received: by 2002:a05:600c:210b:: with SMTP id
	u11mr2892361wml.11.1551359717049; 
	Thu, 28 Feb 2019 05:15:17 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:04 +0100
Message-Id: <20190228131510.43557-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190228131510.43557-1-alex.kanavin@gmail.com>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/8] qemu: enable virglrenderer and glx options for qemu-system-native and nativesdk-qemu
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:17 -0000

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


