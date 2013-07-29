Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB5860958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:02:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,766,1367942400"; 
   d="scan'208";a="8053391"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Jul 2013 11:59:16 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6T42GeF001572
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:02:17 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013072912000790-200783 ;
	Mon, 29 Jul 2013 12:00:07 +0800 
Message-ID: <51F5E948.4070107@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 12:02:16 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51F5E863.9010406@cn.fujitsu.com>
In-Reply-To: <51F5E863.9010406@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/29 12:00:07,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/29 12:00:08,
	Serialize complete at 2013/07/29 12:00:08
Subject: [RFC][PATCH 1/6]qemuarm.conf: provide a common qemuarm machine configuration
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
X-List-Received-Date: Mon, 29 Jul 2013 04:02:18 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

qemux86.conf: provide a common qemux86 machine configuration, 
so developer/distributor can customize their specific one.

Although, we can modify the meta/conf/machine/qemux86.conf to customize our 
configuration, but it's uncomfortable for developer/distributor maintaining
their branch.
After applying this patch, developer can tell poky using their machine
configuration by prepending their layer to BBPATH(Of course,
the bblayers.conf should be adapted to it).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/conf/machine/include/qemux86.inc |   24 ++++++++++++++++++++++++
 meta/conf/machine/qemux86.conf        |   25 ++-----------------------
 2 files changed, 26 insertions(+), 23 deletions(-)
 create mode 100644 meta/conf/machine/include/qemux86.inc

diff --git a/meta/conf/machine/include/qemux86.inc b/meta/conf/machine/include/qemux86.inc
new file mode 100644
index 0000000..a5ef314
--- /dev/null
+++ b/meta/conf/machine/include/qemux86.inc
@@ -0,0 +1,24 @@
+#@DESCRIPTION: Common x86 machine configuration.
+
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-i586.inc
+
+KERNEL_IMAGETYPE = "bzImage"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+XSERVER = "xserver-xorg \
+           mesa-driver-swrast \
+           xf86-input-vmmouse \
+           xf86-input-keyboard \
+           xf86-input-evdev \
+           xf86-video-vmware"
+
+MACHINE_FEATURES += "x86"
+
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 5f107be..fb183eb 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -1,26 +1,5 @@
 #@TYPE: Machine
 #@NAME: common_pc
 #@DESCRIPTION: Machine configuration for running a common x86
-
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-i586.inc
-
-KERNEL_IMAGETYPE = "bzImage"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
-XSERVER = "xserver-xorg \
-           mesa-driver-swrast \
-           xf86-input-vmmouse \
-           xf86-input-keyboard \
-           xf86-input-evdev \
-           xf86-video-vmware"
-
-MACHINE_FEATURES += "x86"
-
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
+#
+require conf/machine/include/qemux86.inc
-- 
1.7.7



