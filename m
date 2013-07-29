Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4786AB80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:05:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,766,1367942400"; 
   d="scan'208";a="8053425"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Jul 2013 12:02:56 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6T45uJj001779
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:05:57 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013072912034788-200861 ;
	Mon, 29 Jul 2013 12:03:47 +0800 
Message-ID: <51F5EA27.6010106@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 12:05:59 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51F5E863.9010406@cn.fujitsu.com>
In-Reply-To: <51F5E863.9010406@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/29 12:03:47,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/29 12:03:48,
	Serialize complete at 2013/07/29 12:03:48
Subject: [RFC][PATCH 3/6]qemuppc.conf: provide a common qemuppc machine configuration
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
X-List-Received-Date: Mon, 29 Jul 2013 04:05:58 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

qemuppc.conf: provide a common qemuppc machine configuration,
so developer/distributor can customize their specific one.

Although, we can modify the meta/conf/machine/qemuppc.conf to customize our
configuration, but it's uncomfortable for developer/distributor maintaining
their branch.
After applying this patch, developer can tell poky using their machine
configuration by prepending their layer to BBPATH(Of course,
the bblayers.conf should be adapted to it).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/conf/machine/include/qemuppc.inc |    9 +++++++++
 meta/conf/machine/qemuppc.conf        |    8 +-------
 2 files changed, 10 insertions(+), 7 deletions(-)
 create mode 100644 meta/conf/machine/include/qemuppc.inc

diff --git a/meta/conf/machine/include/qemuppc.inc b/meta/conf/machine/include/qemuppc.inc
new file mode 100644
index 0000000..4e6e16e
--- /dev/null
+++ b/meta/conf/machine/include/qemuppc.inc
@@ -0,0 +1,9 @@
+#@DESCRIPTION: Common machine configuration for running an PPC system under qemu emulation
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-ppc603e.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 48eecb7..0752aa7 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -2,10 +2,4 @@
 #@NAME: qemu PPC Emulator setup
 #@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
 
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-ppc603e.inc
-
-KERNEL_IMAGETYPE = "vmlinux"
-
-SERIAL_CONSOLE = "115200 ttyS0"
-
+require conf/machine/include/qemuppc.inc
-- 
1.7.7




