Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f49.google.com (mail-qe0-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 37E9F62176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 18:05:34 +0000 (UTC)
Received: by mail-qe0-f49.google.com with SMTP id 1so641930qec.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P5TvfmG3OnM9N2AMwKAI821NFNJh3H4xd+8dFka/Qko=;
	b=P5Zv2CgmBdpwToaROsMhzlkKt9fTVxBJ3snLay7lEyGI/OnZUWUIG0n2jvlOj7ruNn
	UXz+wleCrn0qDS1scbEz9O0D6mSAx/a3f1otuiHTJo/+KkV0j+lmt5Kyvl3aT0JdcSL8
	H8+OxdOjPxa3/EN9/TrFAr7vKglZiDzJYPaIRwXivi645MjWMsSDOM2JtQq88ETEeP3A
	eWudpxI47Va5I7nhBJ0Edxwgb8DAOxcc0D1WmNUpL4UpprSEiVlcr4XYDp633KUXrsRn
	cewcLlPaJZPV0AZgD3wtpdeFeTU2t6OVwdNOiZgyfDHpv8yr1H+xRzv6BhaKPEK1sm9U
	AwXg==
X-Received: by 10.224.114.11 with SMTP id c11mr20483542qaq.37.1376589934467;
	Thu, 15 Aug 2013 11:05:34 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id a6sm245490qam.5.2013.08.15.11.05.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 11:05:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: poky@yoctoproject.org
Date: Thu, 15 Aug 2013 15:05:16 -0300
Message-Id: <1376589917-3040-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
In-Reply-To: <1376589917-3040-1-git-send-email-otavio@ossystems.com.br>
References: <1376589917-3040-1-git-send-email-otavio@ossystems.com.br>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] poky.conf: Don't force the addition of extra DISTRO_FEATURES
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
X-List-Received-Date: Thu, 15 Aug 2013 18:05:34 -0000

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


