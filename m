Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRuuf-0000aM-SE
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:37:54 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so7381180pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qd3MraTaRAny2W2wZnPH86hHhZb6xNneACaEGaQdKaU=;
	b=KJnvyRixIXsoL3YPOGvtMfx4aZncs5NjTMx0MGdqopDMeivi4kKdXMPLZ7uV5ik/5k
	K+rq2tKBiIRaoWupnL+u/aH9L+62xbFjA91WUw9mv8m4oCRSP6CCLkzvrR1SjT/LLZBR
	iny1uBlYR5rdNrVJ44H/zpaembmPXvwcL/+67r0JqKoql4M4vzfE8RuQgRQ2vIUH16Qb
	Y86XRBQlgPe1QFwecIOZV64O4P9/bfYh8/hCw4jXTy0ndMG07YRK3FzPrzZgI7sSMXKP
	tOOPsD2b/lb4TJJltDXwry+j5gyMouauegQ/dioj9m3qrOx1m8QzhSuOmDGO60bPYGGy
	E4vQ==
Received: by 10.68.220.98 with SMTP id pv2mr2784141pbc.117.1336523283417;
	Tue, 08 May 2012 17:28:03 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qk5sm4002909pbc.45.2012.05.08.17.28.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:28:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:27:46 -0700
Message-Id: <2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336522880.git.raj.khem@gmail.com>
References: <cover.1336522880.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] qemumachines: Enable xserver-xorg as default xserver
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
X-List-Received-Date: Wed, 09 May 2012 00:37:54 -0000

For qemux86 and qemux86-64 include qemu.inc after defining XSERVER

XSERVER variable is also weakly defined in task-core-x11.bb
which means we can not use ??= otherwise when building any qemu image
that uses task-core-x11.bb will get the wrong definition

So we define the XSERVER common set for qemu in qemu.inc
and as we know x86 and x86-64 qemu overrides the default
we include qemu.inc after that definition which means that
qemux86 and qemux86-64 get their own definitions and other
qemus get the definitions from qemu.inc. other non-qemu machine
will get their defintion from task which points to kdrive
as of now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/qemu.inc |    9 ++++++++-
 meta/conf/machine/qemux86-64.conf  |    3 ++-
 meta/conf/machine/qemux86.conf     |    3 ++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 421a149..e384879 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,7 +1,14 @@
 PCMCIA_MANAGER = "pcmciautils"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 
+XSERVER ?= "xserver-xorg \
+            mesa-dri-driver-swrast \
+            xf86-input-evdev \
+            xf86-input-mouse \
+            xf86-video-fbdev \
+            xf86-input-keyboard"
+
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 IMAGE_FSTYPES += "tar.bz2 ext3"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 129fe9f..2e361a5 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -6,7 +6,6 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-x86_64.inc
-require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
 
@@ -23,6 +22,8 @@ XSERVER ?= "xserver-xorg \
            xf86-video-vmware \
            qemugl"
 
+require conf/machine/include/qemu.inc
+
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 246d5a0..ad840c0 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -6,7 +6,6 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
 
 require conf/machine/include/tune-i586.inc
-require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
 
@@ -23,6 +22,8 @@ XSERVER ?= "xserver-xorg \
            xf86-video-vmware \
            qemugl"
 
+require conf/machine/include/qemu.inc
+
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
 
-- 
1.7.5.4



