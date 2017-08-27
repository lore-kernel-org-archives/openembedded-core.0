Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7740C71C75
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 21:49:07 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q53so3857584qtq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 14:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=4OKkk/Ohc1LonI7qGMJvMWof/nh52XZwjMQ0V2vorKc=;
	b=fisRMc35HGRdgcBTBih2XW8a/9NWfZ3pPcbRE08dLF1tlyu5w6Vx83Cweb5HCnUPTz
	Zppf4BRLSyRb9xevHZjAgxcZU6PnHO1eMPV9B6ADxboLh3gJlC0UETIg2xxkA3WQFxlu
	gMU4M0R5W0BYb0T1qn9Z4ioSbkpH00tZwiiKWzYPeFmosqsdgNnoykL4da5ctW3DiyC3
	uEcDCwuC4+jP+f9Rx4vAVBa4PXixhu4YpQs+rWNQ+CcE3a1bWY9ttib2tJVxxjSAWvYi
	AdR9qfitmCUDzo5MCy4DX0odpkzk6tanpwQhPZVY9Bps4oVU8VA2nq7X7H+2r/BKoWyO
	gF5Q==
X-Gm-Message-State: AHYfb5gk3XZBXgKNJlZyfbWkhIVk0r4iBxS4PIFQR/mcW6aSrbTZCFDt
	JIPh1mMNfCsnRngD
X-Received: by 10.200.8.186 with SMTP id v55mr6975858qth.177.1503870548450;
	Sun, 27 Aug 2017 14:49:08 -0700 (PDT)
Received: from localhost.localdomain ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	g57sm8050673qtc.84.2017.08.27.14.49.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 27 Aug 2017 14:49:07 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 27 Aug 2017 18:48:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Aug 2017 18:48:58 -0300
Message-Id: <20170827214858.19410-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Sun, 27 Aug 2017 21:49:07 -0000

There is no COMPATIBLE_HOST in the recipe neither it makes sense for
this to be machine specific.

Possibly, initramfs-framework's based modules may be machine specific
but if there is the case they can just RDEPENDS on
initramfs-framework-base and provide the specific module as another
recipe.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- Add the new dependencies to the hash whitelist

 meta/conf/layer.conf                                       | 6 +++++-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 +++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

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
index 9d69a696f1..94bf1756e3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,12 +3,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-PR = "r2"
+PR = "r3"
+
+inherit allarch
 
-# While the packages maybe an allarch due to it being a
-# simple script, reality is that it is Host specific based
-# on the COMPATIBLE_HOST below, which needs to take precedence
-#inherit allarch
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://init \
-- 
2.14.1


