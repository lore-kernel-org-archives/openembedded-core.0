Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RY2QS-00045j-PD for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 22:19:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6LCtKJ007380
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 21:12:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06756-07 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 21:12:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6LCni1007374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 21:12:50 GMT
Message-ID: <1323205980.19363.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 21:13:00 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] conf/machine: Don't poke around providers which aren't machine specific/safe
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
X-List-Received-Date: Tue, 06 Dec 2011 21:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Machines shouldn't be poking around PREFERRED_PROVIDERS which aren't
machine specific or at least machine safe. Kernels are machine specific
and the xserver is selectable. libx11 and mesa are now really a distro choice
and machine configurations shouldn't be poking around them as it just leads
to corruption, conflicts and confusion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 9ef242f..3cebfab 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -12,6 +12,5 @@ RDEPENDS_kernel-base = ""
 
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-#PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers-yocto"
 
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index dacc802..bcc408f 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -2,8 +2,6 @@
 #@NAME: qemu PPC Emulator setup
 #@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
 
-PREFERRED_PROVIDER_virtual/libgl  = "mesa-xlib"
-
 require conf/machine/include/qemu.inc
 require conf/machine/include/tune-ppc603e.inc
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index f28cf08..73a4043 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -2,10 +2,7 @@
 #@NAME: common_pc
 #@DESCRIPTION: Machine configuration for running a common x86
 
-PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 
 require conf/machine/include/tune-x86_64.inc
 require conf/machine/include/qemu.inc
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index bcfc9d6..b8826e7 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -2,10 +2,7 @@
 #@NAME: common_pc
 #@DESCRIPTION: Machine configuration for running a common x86
 
-PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
-PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 
 require conf/machine/include/tune-i586.inc
 require conf/machine/include/qemu.inc




