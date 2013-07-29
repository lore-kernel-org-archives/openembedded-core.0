Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 756B76A3ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:08:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,766,1367942400"; 
   d="scan'208";a="8053442"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Jul 2013 12:05:25 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6T48NO5001890
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:08:25 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013072912061451-200884 ;
	Mon, 29 Jul 2013 12:06:14 +0800 
Message-ID: <51F5EAB9.1030007@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 12:08:25 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51F5E863.9010406@cn.fujitsu.com>
In-Reply-To: <51F5E863.9010406@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/29 12:06:14,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/29 12:06:16,
	Serialize complete at 2013/07/29 12:06:16
Subject: [RFC][PATCH 5/6]qemumips64.conf: provide a common qemumips64 machine configuration
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
X-List-Received-Date: Mon, 29 Jul 2013 04:08:27 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

qemuxmips64.conf: provide a common qemumips64 machine configuration, 
so developer/distributor can customize their specific one.

Although, we can modify the meta/conf/machine/qemuxmips64.conf to customize our
configuration, but it's uncomfortable for developer/distributor maintaining
their branch.
After applying this patch, developer can tell poky using their machine
configuration by prepending their layer to BBPATH(Of course,
the bblayers.conf should be adapted to it).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/conf/machine/include/qemumips64.inc |   11 +++++++++++
 meta/conf/machine/qemumips64.conf        |   12 ++----------
 2 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 meta/conf/machine/include/qemumips64.inc

diff --git a/meta/conf/machine/include/qemumips64.inc b/meta/conf/machine/include/qemumips64.inc
new file mode 100644
index 0000000..7ba2f94
--- /dev/null
+++ b/meta/conf/machine/include/qemumips64.inc
@@ -0,0 +1,11 @@
+#@DESCRIPTION: Common machine configuration for running an MIPS64 system under qemu emulation
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-mips64.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index b2c7998..1f2ee94 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -1,13 +1,5 @@
 #@TYPE: Machine
 #@NAME: mti-malta64-be MIPS64
-#@DESCRIPTION: mti-malta64-be
+#@DESCRIPTION: Machine configuration for running an MIPS64 system under qemu emulation
 
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips64.inc
-
-KERNEL_IMAGETYPE = "vmlinux"
-KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+require conf/machine/include/qemumips64.inc
-- 
1.7.7




