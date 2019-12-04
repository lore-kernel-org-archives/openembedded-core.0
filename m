Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id E05DC7F7A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 22:48:55 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id h13so354299plr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 14:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qMJoUMPg/CEZuT7A1It7iDzh4fnakSrYBOaT+t3eT2c=;
	b=ZuvYY47ou//JsPFGDy59GxOKpq3Il7MQ5nLETqMvjBTToAALG0CzNSAd/2Eiid6G6q
	JY7n8pqeM2iOLqpmLbxKpEmoI2ikRgchwMYK/KuK5HWlG1m3EDggpWkyT6MupCB9tp/E
	MqMvbhj8PWKHXIlutN+NMna//s4SvZ8XMTgwU1iwdtEduf7188C1Zwj07h69IQbgAbBa
	QIvFOkisGmDhAoLJ/dtAuR+Q6tLafw3w5Yzcy46ppcdEgXNl82jUSHxl06al/dT+2gNK
	cDJLVlv8n/lJk6ZZedHLqya2UCEL7aMk98k3tOEfh8GZe1yVgszjMt9XY7oVWnqrOQ+W
	BVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qMJoUMPg/CEZuT7A1It7iDzh4fnakSrYBOaT+t3eT2c=;
	b=oKE3t416H59VUBZwheH4cJhvpBfHygIIpcbrORLZ2XXtne2Cn8BSS7q5IK3GkTN89D
	jUrZdkVMrCNSVMgcGYiEtA5AJf11DAFQk7lSLKGg1PCZJk0FFg8a6gS/+Cyo8v1h4IU9
	5zDe10UxoXYwYahK3f5xdJ3ytqk/oki6rwABbP2YPX3usfMmp0AwWRJXdKhIQDtBHOtu
	CTiKBc/ss0QNmBepgFtW6YDI6MBGOlCCAlKyQ534q5aSTh97xKX3b8w0Kb5QoYryEk5E
	AIdBU405WZINBj+NMAWoUXj+tE8Gz4YYkxQ6vAD8Zhk8IKRovADl1eA1gscB+EGR8L6r
	bmrQ==
X-Gm-Message-State: APjAAAVqsFO4JOfaZ9xdlbq0NBEfTE0erI6aQ/eRBjaDBbK3FsxeW1jp
	QZqWYumLgFXPf3fCDhU5QHkTQtqvmz0=
X-Google-Smtp-Source: APXvYqxcY/4GUnPEJRS5qvBXjTzQoACCceZvXPaIlV9z8zVMnitZ9ecT1tDhSFOxwdJrHN4VIF9gyQ==
X-Received: by 2002:a17:90a:3702:: with SMTP id
	u2mr5571642pjb.112.1575499736349; 
	Wed, 04 Dec 2019 14:48:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id
	g191sm9325851pfb.19.2019.12.04.14.48.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 14:48:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 14:48:45 -0800
Message-Id: <20191204224845.2937981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Fix vc4 build for 64bit time_t changes on 32bit arches
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
X-List-Received-Date: Wed, 04 Dec 2019 22:48:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-for-formatted-output-of-timespec-me.patch | 53 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_19.2.4.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch

diff --git a/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch b/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
new file mode 100644
index 0000000000..901feca556
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
@@ -0,0 +1,53 @@
+From 38a313474e127d61e749866423e708fc86ed9ec5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Dec 2019 14:15:28 -0800
+Subject: [PATCH] vc4: use intmax_t for formatted output of timespec members
+
+32bit architectures which have 64bit time_t does not fit the assumption
+of time_t being same as system long int
+
+Fixes
+error: format specifies type 'long' but the argument has type 'time_t' (aka 'long long') [-Werror,-Wformat]
+                        time.tv_sec);
+                        ^~~~~~~~~~~
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2966]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gallium/drivers/v3d/v3d_bufmgr.c | 4 ++--
+ src/gallium/drivers/vc4/vc4_bufmgr.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/gallium/drivers/v3d/v3d_bufmgr.c b/src/gallium/drivers/v3d/v3d_bufmgr.c
+index b3e4d053cc0..c514bf00bf0 100644
+--- a/src/gallium/drivers/v3d/v3d_bufmgr.c
++++ b/src/gallium/drivers/v3d/v3d_bufmgr.c
+@@ -80,8 +80,8 @@ v3d_bo_dump_stats(struct v3d_screen *screen)
+ 
+                 struct timespec time;
+                 clock_gettime(CLOCK_MONOTONIC, &time);
+-                fprintf(stderr, "  now:               %ld\n",
+-                        time.tv_sec);
++                fprintf(stderr, "  now:               %jd\n",
++                        (intmax_t)time.tv_sec);
+         }
+ }
+ 
+diff --git a/src/gallium/drivers/vc4/vc4_bufmgr.c b/src/gallium/drivers/vc4/vc4_bufmgr.c
+index 5ec360934c0..bf05f6cadd6 100644
+--- a/src/gallium/drivers/vc4/vc4_bufmgr.c
++++ b/src/gallium/drivers/vc4/vc4_bufmgr.c
+@@ -107,8 +107,8 @@ vc4_bo_dump_stats(struct vc4_screen *screen)
+ 
+                 struct timespec time;
+                 clock_gettime(CLOCK_MONOTONIC, &time);
+-                fprintf(stderr, "  now:               %ld\n",
+-                        time.tv_sec);
++                fprintf(stderr, "  now:               %jd\n",
++                        (intmax_t)time.tv_sec);
+         }
+ }
+ 
+-- 
+2.24.0
+
diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb b/meta/recipes-graphics/mesa/mesa_19.2.4.bb
index f4b33df227..46ecee3a73 100644
--- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.2.4.bb
@@ -5,6 +5,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
+           file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            "
 
 SRC_URI[md5sum] = "5c047732b81651ddb341597528b4b096"
-- 
2.24.0


