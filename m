Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 84A02770A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:41:13 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n62so26977175qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=foxpZUeGAix5eG3zJ1hSPRUiwX1ZX0SqCR0XV672w34=;
	b=BbnpnORydRF6xTCQ/jtJfSQ52zahxGg+RVEbPDVFII3Em27WH1vMLVSJR45hH8gr3V
	rMXWa62zvxUNzdEWhBvN9+NsS4yKgklO7Yyqi2gf9Zc0ThzCfWQGvu4bptV1KCnV+/ru
	12xc8XOR8v7bj6K77qSpl4Hr2QXYXAiN4814x73vOMyP4wQWWWprvgjBL7xo5KGBWKss
	kLsC3Ua4DHGzOLEru2hbgajUrRN8+pTGT/tSSJfu8ATKcJuVZbs/S93/XrzhAtLD+t98
	kiHq37KX/aO/FtPMDguRZ8p0cl8gMsvqTR2XXmcaj/aUGmVIhsCfJ9CaxAXkay2OK8dw
	C++w==
X-Gm-Message-State: AOPr4FVIgjIGrLxU/TgLUZsCvrkUc8QJ+Nw1k6i3l8TaQ4HCFj07/JdB2XDBGocRweSwJw==
X-Received: by 10.55.77.12 with SMTP id a12mr8922963qkb.44.1463589673590;
	Wed, 18 May 2016 09:41:13 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id a5sm4524387qhb.26.2016.05.18.09.41.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:41:12 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:41:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:36 -0300
Message-Id: <1463589648-28641-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 01/13] weston: weston-launch: Handle invalid command line options
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
X-List-Received-Date: Wed, 18 May 2016 16:41:13 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

Exit the program if an unrecognized command line option is found.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7:
- Rebase on top of 1.10 v2 + fixup

Changes in v6:
- Rebase on top of 1.10

Changes in v5:
- New patch.

Changes in v4: None
Changes in v3: None
Changes in v2: None

 ...eston-launch-exit-for-unrecognized-option.patch | 33 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.10.0.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch

diff --git a/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch b/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
new file mode 100644
index 0000000..25c8683
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
@@ -0,0 +1,33 @@
+From e8b615250f700f7854b423aaaf0a0aeea92c05a9 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Sat, 7 May 2016 08:51:58 -0300
+Subject: [PATCH] weston-launch: Handle invalid command line options
+Organization: O.S. Systems Software LTDA.
+
+Exit the program if an unrecognized command line option is found.
+
+Upstream-Status: Submitted
+
+Signed-off-by; Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+
+ src/weston-launch.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/weston-launch.c b/src/weston-launch.c
+index b8dfb17..9987d8e 100644
+--- a/src/weston-launch.c
++++ b/src/weston-launch.c
+@@ -703,6 +703,8 @@ main(int argc, char *argv[])
+ 		case 'h':
+ 			help("weston-launch");
+ 			exit(EXIT_FAILURE);
++		default:
++			exit(EXIT_FAILURE);
+ 		}
+ 	}
+ 
+-- 
+2.8.2
+
diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index d8c9f9f..d3e2607 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Fix-wayland-protocols-path.patch \
+           file://make-weston-launch-exit-for-unrecognized-option.patch \
 "
 SRC_URI[md5sum] = "1cd17c54ecac6d9a3cd90bf12eaa3e20"
 SRC_URI[sha256sum] = "e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1"
-- 
2.8.2


