Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DDFE365CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:30:58 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l68so3183498qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=oucPqrKSoxrjBSQ6TbPuVx0Sl/Yhl3YFTmnCV2zPTBk=;
	b=GKgSyv3IPXkOYdQAxGYiYY+ILK1YLwh2Ks7IQpHxZiWCqFNc/B7kPJyt0OzP1GlRL7
	lrXNpUG2FT6PAihEIfwn6UfXxEAoYfq7+ypiX9cR/xWB+UYmLcfHcQNPLI5Qp20qkOuB
	6hy4+eM/j3vouATfbMuR2yUEBi91iFE36RIMJi7DTJfirGUhwPbucoO0GyZJ97fyX8Hc
	qSpzOiVLftWzYcADRjKVgeZVOt+kv2828Vk2D1UbQCk35oRzpPpJGUF+373sbP3ugPnD
	YrU0szj8DeDVWecAV+p1rddhGdF7orAlW+oQHR6X+OoqdOnWh5jB1Dzse7v//+Dvca3s
	vfkw==
X-Gm-Message-State: AOPr4FV48dEouz1gCg0ltQ22OT96vWcq9pr2fuW1b4DCe2LgQmvpNeGbObHAgHi0bBprRA==
X-Received: by 10.55.40.38 with SMTP id o38mr2242831qkh.156.1462977059256;
	Wed, 11 May 2016 07:30:59 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id o37sm2500969qgd.5.2016.05.11.07.30.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:30:58 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:30:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:32 -0300
Message-Id: <1462977042-7436-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 01/11] weston: weston-launch: Handle invalid command line options
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
X-List-Received-Date: Wed, 11 May 2016 14:30:59 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

Exit the program if an unrecognized command line option is found.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- New patch.

Changes in v4: None
Changes in v3: None
Changes in v2: None

 ...eston-launch-exit-for-unrecognized-option.patch | 33 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      |  1 +
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
diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 16a788d..c87f053 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://libsystemd.patch \
            file://explicit-enable-disable-systemd.patch \
+           file://make-weston-launch-exit-for-unrecognized-option.patch \
 "
 SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
 SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
-- 
2.8.2


