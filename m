Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 72C716AB80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:07:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,766,1367942400"; 
   d="scan'208";a="8053432"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Jul 2013 12:04:08 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6T478ig001820
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:07:09 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013072912045975-200873 ;
	Mon, 29 Jul 2013 12:04:59 +0800 
Message-ID: <51F5EA6E.40406@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 12:07:10 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51F5E863.9010406@cn.fujitsu.com>
In-Reply-To: <51F5E863.9010406@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/29 12:04:59,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/29 12:05:00,
	Serialize complete at 2013/07/29 12:05:00
Subject: [RFC][PATCH 4/6]qemumips.conf: provide a common qemumips machine configuration
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
X-List-Received-Date: Mon, 29 Jul 2013 04:07:10 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

qemumips.conf: provide a common qemumips machine configuration,
so developer/distributor can customize their specific one.

Although, we can modify the meta/conf/machine/qemumips.conf to customize our
configuration, but it's uncomfortable for developer/distributor maintaining
their branch.
After applying this patch, developer can tell poky using their machine
configuration by prepending their layer to BBPATH(Of course,
the bblayers.conf should be adapted to it).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/conf/machine/include/qemumips.inc |   11 +++++++++++
 meta/conf/machine/qemumips.conf        |   12 ++----------
 2 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 meta/conf/machine/include/qemumips.inc

diff --git a/meta/conf/machine/include/qemumips.inc b/meta/conf/machine/include/qemumips.inc
new file mode 100644
index 0000000..9b884a5
--- /dev/null
+++ b/meta/conf/machine/include/qemumips.inc
@@ -0,0 +1,11 @@
+#@DESCRIPTION: Common machine configuration for running an MIPS system under qemu emulation
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-mips32.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index ce1c419..b874f7b 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -1,13 +1,5 @@
 #@TYPE: Machine
 #@NAME: mti_malta32_be MIPS
-#@DESCRIPTION: mti_malta32_be
+#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
 
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips32.inc
-
-KERNEL_IMAGETYPE = "vmlinux"
-KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+require conf/machine/include/qemumips.inc
-- 
1.7.7


