Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 296F1781E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:43:18 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a77so3851087qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=iRhmi6c1uL4RZsEmN96yl1h40K+ua20RJdiwBqrWLuk=;
	b=G75zTIwHmvlN1erKqwAggfav4mfrnvRqVkBqkxF+prp/4fS4rcVsqvwwLr0hIAjsdM
	XFz7dLXAb2SumZQDaPLpKku7w5e75T0w9se/w2EqOYsUaWeaAlXy5sZDF/ogqs5TpbsK
	gQXfHbZBOyhZrmPjmsVqqKgOzGnkx73tjZ+UpoNofe6bA0ihRl47e6fsHpGJcq3vaYVF
	lNpp0w56JGmQjBV4/Qgi9WGL2a6vA8nU9ueuJuHWs2zTSmigQ2tWv/yP+Y8t9vy2iByl
	GLNLjYjcvRJYnbpgtk+G1yIYP90dJV26a7Pm8HPDbBUqRIV/qKvc6yULTDHAvBwQkgRh
	McQQ==
X-Gm-Message-State: AHYfb5hD4uyV7uu9wFqVyRZVFQLug+KZoUt2E09BfnxsXGIM74C9rua7
	ZcdeoPTKCRAQduAI
X-Received: by 10.55.161.140 with SMTP id k134mr7268461qke.314.1504039399789; 
	Tue, 29 Aug 2017 13:43:19 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	f189sm2479771qkj.10.2017.08.29.13.43.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Aug 2017 13:43:18 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 29 Aug 2017 17:43:10 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:43:09 -0300
Message-Id: <20170829204309.16139-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Tue, 29 Aug 2017 20:43:19 -0000

There is no COMPATIBLE_HOST in the recipe neither it makes sense for
this to be machine specific.

Possibly, initramfs-framework's based modules may be machine specific
but if there is the case they can just RDEPENDS on
initramfs-framework-base and provide the specific module as another
recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- Drop INHIBIT_DEFAULT_DEPS as allarch defines it

Changes in v3:
- Add the new dependencies to the hash whitelist

 meta/conf/layer.conf                                       | 6 +++++-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 ++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 38bec33197..04aa730160 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -50,8 +50,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   ca-certificates->openssl \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
-  initramfs-framework->systemd \
+  initramfs-framework->dosfstools \
+  initramfs-framework->e2fsprogs \
   initramfs-framework->eudev \
+  initramfs-framework->parted \
+  initramfs-framework->systemd \
+  initramfs-framework->util-linux \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9d69a696f1..77b2ff8959 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,13 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-PR = "r2"
+PR = "r3"
 
-# While the packages maybe an allarch due to it being a
-# simple script, reality is that it is Host specific based
-# on the COMPATIBLE_HOST below, which needs to take precedence
-#inherit allarch
-INHIBIT_DEFAULT_DEPS = "1"
+inherit allarch
 
 SRC_URI = "file://init \
            file://rootfs \
-- 
2.14.1


