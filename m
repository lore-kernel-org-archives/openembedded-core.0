Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7891F62176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 18:33:40 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id bq6so17908qab.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZSG6n1k3jP7uDa8J29LTYbR78tK8sVNwKmvOEhKeFqU=;
	b=ubL7Pis832YWasEg9hQj0qOZ+HWqV6zT70Iopb1WUvOS8iREQnk767zNyTlmFLhn2r
	4tx2ruZiGmljAJkoSVn5SeelGnDOS0g9ufXFvR9+rSoxq24XOB5oASlJ8xMUKhyXR/ua
	1kKpf7TgO2XYm1sNYXC/CIsHl6/o4FqN6UOO3Qhv4agQUSEijvnXUppbsTItQEUvbqtC
	uBezIikxF7hudI9pn9bC3va8DEBwK3sUvRy1URrI5RK140vjxCFpTgaqzZB+cyOWxpKW
	lsg7DWIqOHm/kccwMQntZJT/BK3bIhFx60yO6ndmN+vFEwz/pse6Q88MfTHGzODlCaGU
	nmRA==
X-Received: by 10.49.39.161 with SMTP id q1mr20473681qek.66.1376591620873;
	Thu, 15 Aug 2013 11:33:40 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id j11sm393719qaa.7.2013.08.15.11.33.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 11:33:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: poky@yoctoproject.org
Date: Thu, 15 Aug 2013 15:33:16 -0300
Message-Id: <1376591596-4299-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
In-Reply-To: <1376591596-4299-1-git-send-email-otavio@ossystems.com.br>
References: <1376591596-4299-1-git-send-email-otavio@ossystems.com.br>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 2/2] poky.conf: Don't force the addition of extra DISTRO_FEATURES
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
X-List-Received-Date: Thu, 15 Aug 2013 18:33:41 -0000

The DISTRO_FEATURES shouldn't unconditionally append items to it. This
makes it impossible to override it inside of local.conf or in a distro
based on Poky.

This moved the definition to poky.conf and created a new variable
(POKY_DEFAULT_DISTRO_FEATURES) which easy overriding of this, for Poky
based distros and used the 'DISTRO_FEATURES_DEFAULT' variable to avoid
duplication OE-Core default.

This makes the override of default DISTRO_FEATURES easier. User can now do:

,----[ Usage example for local.conf ]
| DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC} \
|                    largefile opengl multiarch"
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3: None
Changes in v2:
- Rework patch to use DISTRO_FEATURES_DEFAULT
- Send to the right mailing list
- Cc oe-core for completeness of patchset

 meta-yocto/conf/distro/poky.conf | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index 7be7d92..89abffd 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -12,7 +12,12 @@ TARGET_VENDOR = "-poky"
 LOCALCONF_VERSION = "1"
 LAYER_CONF_VERSION ?= "6"
 
-DISTRO_FEATURES_append = " largefile opengl multiarch wayland"
+# Override these in poky based distros
+POKY_DEFAULT_DISTRO_FEATURES = "largefile opengl multiarch wayland"
+POKY_DEFAULT_EXTRA_RDEPENDS = "packagegroup-core-boot"
+POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
+
+DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
 PREFERRED_VERSION_linux-yocto ?= "3.4%"
 PREFERRED_VERSION_linux-yocto_qemux86 ?= "3.8%"
@@ -27,10 +32,6 @@ SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
 
 EXTRAOPKGCONFIG = "poky-feed-config-opkg"
 
-# Override these in poky based distros to modify DISTRO_EXTRA_R*
-POKY_DEFAULT_EXTRA_RDEPENDS = "packagegroup-core-boot"
-POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
-
 DISTRO_EXTRA_RDEPENDS += " ${POKY_DEFAULT_EXTRA_RDEPENDS}"
 DISTRO_EXTRA_RRECOMMENDS += " ${POKY_DEFAULT_EXTRA_RRECOMMENDS}"
 
-- 
1.8.4.rc1


