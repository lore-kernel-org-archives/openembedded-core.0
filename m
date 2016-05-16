Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFE3A606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:12:50 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e35so14529382qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=b+tausN9eySf73ISpR5eB874H91ZwaOo87cf/c1JYh4=;
	b=BqjBkF+XdCTefFFEmDvHuEORBc7ymBHhmevzQTn2WbLXSvHjnedwh2/IiuqoOjeyu2
	k2IbitdHo5aWvQS2xBHXcX19l9uCtCb0e4r6183XPFYtatDUm8Tgk2IhTH78LusWnHbz
	l4OLswhEzjJm8JDVQHrlCjAEfCdi5nfUzsRgVTdBvGqB94/C+1C35m7cZ1/wzEUMBgUw
	VDp5Au7NC7B7zcJjmoRwKifBxy2oFRqn4UdZdbXtWhXUQ5K3MJHwkC6zu2+aTU/VsK8D
	nYN9jiPPKED1T2pkm1/VekvxcH2pfgmFry94yWh91sRZ+spmHl2EAAt7sCKjn5OEIaoB
	sOOQ==
X-Gm-Message-State: AOPr4FW9gPtAtSbnLBfBwM7xACDfg8a/JaGMNylZAQmyOIg7WV/WJ9Mi6QXmqjfNMUFRvQ==
X-Received: by 10.140.181.70 with SMTP id c67mr32803050qha.20.1463425971201;
	Mon, 16 May 2016 12:12:51 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c68sm15411721qgc.12.2016.05.16.12.12.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:12:49 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:12:41 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:00 -0300
Message-Id: <1463425932-10080-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 02/14] weston: weston-launch: Handle invalid command line options
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
X-List-Received-Date: Mon, 16 May 2016 19:12:51 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

Exit the program if an unrecognized command line option is found.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
index fec1e9f..5885a7c 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Use-PKG_CONFIG_SYSROOT_DIR-for-protocol.patch \
+           file://make-weston-launch-exit-for-unrecognized-option.patch \
 "
 SRC_URI[md5sum] = "1cd17c54ecac6d9a3cd90bf12eaa3e20"
 SRC_URI[sha256sum] = "e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1"
-- 
2.8.2


