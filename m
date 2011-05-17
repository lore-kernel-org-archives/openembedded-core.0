Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMRNh-0004tn-QF
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:00:42 +0200
Received: by pvc30 with SMTP id 30so427238pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 13:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=r/7ddPVBV6oXDFzOAPdmSO5alLnzX+TRgi4DrRapa+w=;
	b=xY/3ovFHrV6Np5gmQ3dTWJ0rGkv/lQGoCLke0AGazjsyrvVgJIvvQbr+00760ks6Eh
	4VzOT1Z/nELLfZk9QF5rKSfDh14kdV8eegEukZLwnOBV/5K8h/x3fUWhduvqAuyk//mC
	BWSwUjitlMNPLf+OKJeXyBBHIfmiTdVjozS4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lu/uMzvGcQkJ29zPMaituwtSEpY5YujlFm08oS4mZrbTYWnJGZ6Br4q4xDvOmCWvEh
	Jm2r7fptjkVZ7DxJzeXduugZMlW6tqp8NGX5FenwcyUn2HsDEoKuEJoas2i3FFHYOJIh
	LC4QhdZgIu7VzL7Xs3LMFCrZdEQ5/HaZ8Juw0=
Received: by 10.68.16.135 with SMTP id g7mr1731154pbd.486.1305665867275;
	Tue, 17 May 2011 13:57:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h4sm587849pbj.2.2011.05.17.13.57.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 13:57:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2011 13:57:37 -0700
Message-Id: <cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305665459.git.raj.khem@gmail.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Tue, 17 May 2011 21:00:42 -0000

With default-setup being pulled in via bitbake.conf and task-core-boot
being pulled into all images in distros, we need
to have some variables that distro's can override if need be
This is a backport from angstrom/OE. It will help distros which
e.g. would like to use busybox-mdev instead of udev and similarly
for login manager these variables can be defined in distro policies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc |   13 +++++++++++++
 meta/recipes-core/tasks/task-core-boot.bb       |    8 ++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

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
index 5aea771..af2c2ee 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -21,13 +21,13 @@ RDEPENDS_task-core-boot = "\
     base-files \
     base-passwd \
     busybox \
-    initscripts \
+    ${IMAGE_INITSCRIPTS} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-    sysvinit \
-    tinylogin \
-    udev \
+    ${IMAGE_INIT_MANAGER} \
+    ${IMAGE_LOGIN_MANAGER} \
+    ${IMAGE_DEV_MANAGER} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-- 
1.7.4.1



