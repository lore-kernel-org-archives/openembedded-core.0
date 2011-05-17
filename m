Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMSFt-0006LC-E5
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:56:41 +0200
Received: by pxi6 with SMTP id 6so733014pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=3Oy0Q/rBnI3IZkjm7GaDVW00KBbweHUMOnXkLb5Hp6U=;
	b=gwI0AH6yIHPOfzB1bgqoOpGl/Q54tADmgTXDfRSyost/TWFRDtqc1qxBlXTbedv3Vv
	DxSDcVlnPf1KmG+/ay8jV7OXp1MCwrQPczgkl/pa1DgeoggM3C0XxZOvOvKJTjVnYUy2
	rhxTHt6CObafT/KIKeNcwugl9PhSKImxlNgi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TMSop/1lLVDrANuSaDv/A6HjwSY3Dv4yFUCIiCXqPx4Y2MKZbdaf1dswidTipsy+Te
	OjgBhNyog4xsFGO3VKyWJ/oneov3pRTXHXIPVDt2VHQHIdYBOQXTCV+RJltrPTsz8sfi
	DCeRjerpg3dOF1WHyqg/bGj2RV/YenBB8Ch0I=
Received: by 10.142.44.5 with SMTP id r5mr652092wfr.300.1305669226423;
	Tue, 17 May 2011 14:53:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k6sm807551wfa.17.2011.05.17.14.53.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 14:53:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: koen@dominion.thruhere.net,
	OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2011 14:53:37 -0700
Message-Id: <69cc3dbe4f5d1158edfa9347356875abcbbead4d.1305668854.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305668854.git.raj.khem@gmail.com>
References: <cover.1305668854.git.raj.khem@gmail.com>
Subject: [PATCHv2 1/1] conf: Create distro overridable IMAGE varibales
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2011 21:56:41 -0000

With default-setup being pulled in via bitbake.conf and task-core-boot
being pulled into all images in distros, we need
to have some variables that distro's can override if need be
This is a backport from angstrom/OE. It will help distros which
e.g. would like to use busybox-mdev instead of udev and similarly
for login manager these variables can be defined in distro policies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass                      |    9 ++++++++-
 meta/conf/distro/include/default-distrovars.inc |   13 +++++++++++++
 meta/recipes-core/tasks/task-core-boot.bb       |    4 ----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2469442..d360a18 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,7 +5,14 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-RDEPENDS += "${IMAGE_INSTALL}"
+
+IMAGE_BOOT ?= "${IMAGE_INITSCRIPTS} \
+               ${IMAGE_DEV_MANAGER} \
+               ${IMAGE_INIT_MANAGER} \
+               ${IMAGE_LOGIN_MANAGER}"
+
+
+RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9b1d0ee..3b78d66 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -6,6 +6,19 @@ OEINCLUDELOGS ?= "yes"
 KERNEL_CONSOLE ?= "ttyS0"
 
 PCMCIA_MANAGER ?= "pcmciautils"
+#
+# udev, devfsd, busybox-mdev (from busybox) or none
+#
+IMAGE_DEV_MANAGER ?= "udev"
+#
+# sysvinit, upstart
+#
+IMAGE_INIT_MANAGER ?= "sysvinit"
+IMAGE_INITSCRIPTS ?= "initscripts"
+#
+# tinylogin, getty
+#
+IMAGE_LOGIN_MANAGER ?= "tinylogin"
 
 IMAGE_LINGUAS ?= "en-us en-gb"
 LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 5aea771..b575e4d 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -21,13 +21,9 @@ RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
     busybox \
-    initscripts \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-    sysvinit \
-    tinylogin \
-    udev \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-- 
1.7.4.1



