Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SlzHT-0007iW-I8
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 11:20:23 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:57693 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Slz6k-0003fg-4J for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 05:09:18 -0400
Date: Tue, 3 Jul 2012 05:09:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207030503530.28720@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: pcmcia-cs: Remove references to long-deprecated pcmcia-cs.
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
X-List-Received-Date: Tue, 03 Jul 2012 09:20:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


pcmciautils is the appropriate PCMCIA package these days.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  the only reference left to pcmcia-cs is this acceptable historical
reference:

$ grep -r pcmcia-cs *
meta/recipes-core/udev/udev/network.sh:# Code taken from pcmcia-cs:/etc/pcmcia/network
$

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f6d6f7d..005f7bc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -690,7 +690,7 @@ DL_DIR ?= "${TOPDIR}/downloads"
 SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
 INITRAMFS_FSTYPES ?= "cpio.gz"
-PCMCIA_MANAGER ?= "pcmcia-cs"
+PCMCIA_MANAGER ?= "pcmciautils"
 DEFAULT_TASK_PROVIDER ?= "task-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 24b307b..e8a1811 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -109,7 +109,7 @@ T[doc]       = "Temporary directory within the WORKDIR."
 GROUP_locale[doc] = "Locale generation of the GNU libc implementation"
 ENABLE_BINARY_LOCALE_GENERATION[doc] = "Enable the use of qemu to generate locale information during build time on the host instead of runtime on the target. If you have trouble with qemu-native you should make this an empty var. @group locale"

-PCMCIA_MANAGER[doc] = "Specify which package(s) to install to handle PCMCIA slots (usually pcmcia-cs or pcmciautils)."
+PCMCIA_MANAGER[doc] = "Specify which package(s) to install to handle PCMCIA slots (currently, pcmciautils)."

 SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the default is 1"

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index c0c1d0c..fa35daf 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

 DEPENDS = "sysfsutils flex-native"
 RDEPENDS_${PN} = "udev module-init-tools"
-RCONFLICTS_${PN} += "pcmcia-cs"

 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/pcmciautils-${PV}.tar.bz2"

diff --git a/meta/recipes-core/udev/udev/network.sh b/meta/recipes-core/udev/udev/network.sh
index 5016328..bccd422 100644
--- a/meta/recipes-core/udev/udev/network.sh
+++ b/meta/recipes-core/udev/udev/network.sh
@@ -1,8 +1,5 @@
 #!/bin/sh

-# Do not run when pcmcia-cs is installed
-test -x /sbin/cardctl && exit 0
-
 # We get two "add" events for hostap cards due to wifi0
 echo "$INTERFACE" | grep -q wifi && exit 0


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


