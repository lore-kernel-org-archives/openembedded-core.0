Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA2B60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:36:47 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q184so1952521qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=AwocOsdtTbsDr6sWqwqUOq9PFj6Un/8FcZfj2lXkLB0=;
	b=LWj+RLh+Hfl58J59qCEZLZc8nua30AZzlNR/nyjI65N/QFuDaonfIHUmZrFr+4Fcqt
	ikEtwHIio+zSxs78RG7PiOcNLP4cYDpTheBNsNHgq/3W8Yda95QB5CKTTs74pqCObBTV
	JHQWU+qLJrmcULYNa0+YjMbk6zgu+QonInGgDeZoRWCmghwcMz3HRrF9GOusdxteshKR
	R7ue9vsFmhPFOJv7T8PWCH/Rkkb4UE7G93GwzNaK4OwHDDImjsIHpHegBTuNdx5qcCR5
	9ku1h2bR2ixRUngBiTrLgKyxkWeUNCb2bvvBtYsC3PutryCnfhwYagLqPQ1fDmI0lBOF
	oKAw==
X-Gm-Message-State: AOPr4FUM1OxFesPypebBOXQ0FcdMK31iYMXBEpD8PNoD9Kzh2qyrR/wMFk0bLsXrVoIasA==
X-Received: by 10.55.201.145 with SMTP id m17mr2595311qkl.85.1463503008338;
	Tue, 17 May 2016 09:36:48 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	141sm1726753qke.18.2016.05.17.09.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:36:47 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:36:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:13 -0300
Message-Id: <1463502985-5428-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 01/13] weston: weston-launch: Handle invalid command line options
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
X-List-Received-Date: Tue, 17 May 2016 16:36:49 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

Exit the program if an unrecognized command line option is found.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


