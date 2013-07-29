Return-Path: <biannm@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id A12B06A3ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 04:09:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,766,1367942400"; 
   d="scan'208";a="8053457"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 29 Jul 2013 12:06:46 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r6T49kaJ001976
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 12:09:47 +0800
Received: from [127.0.0.1] ([10.167.226.190])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013072912073780-200941 ;
	Mon, 29 Jul 2013 12:07:37 +0800 
Message-ID: <51F5EB0C.3010507@cn.fujitsu.com>
Date: Mon, 29 Jul 2013 12:09:48 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN;
	rv:1.9.2.28) Gecko/20120306 Lightning/1.0b2 Thunderbird/3.1.20
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51F5E863.9010406@cn.fujitsu.com>
In-Reply-To: <51F5E863.9010406@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/07/29 12:07:37,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/07/29 12:07:38,
	Serialize complete at 2013/07/29 12:07:38
Subject: [RFC][PATCH 6/6]qemuarm.conf: provide a common qemuarm machine configuration
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
X-List-Received-Date: Mon, 29 Jul 2013 04:09:48 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

qemuarm.conf: provide a common qemuarm machine configuration,
so developer/distributor can customize their specific one.

Although, we can modify the meta/conf/machine/qemuarm.conf to customize our
configuration,but it's uncomfortable for developer/distributor maintaining
their branch.
After applying this patch, developer can tell poky using their machine
configuration by prepending their layer to BBPATH(Of course,
the bblayers.conf should be adapted to it).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>

---
 meta/conf/machine/include/qemuarm.inc |   10 ++++++++++
 meta/conf/machine/qemuarm.conf        |   10 ++--------
 2 files changed, 12 insertions(+), 8 deletions(-)
 create mode 100644 meta/conf/machine/include/qemuarm.inc

diff --git a/meta/conf/machine/include/qemuarm.inc b/meta/conf/machine/include/qemuarm.inc
new file mode 100644
index 0000000..366a52a
--- /dev/null
+++ b/meta/conf/machine/include/qemuarm.inc
@@ -0,0 +1,10 @@
+#@DESCRIPTION: Common machine configuration for versatile 926ejs.
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-arm926ejs.inc
+#require conf/machine/include/tune-arm1136jf-s.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+SERIAL_CONSOLE = "115200 ttyAMA0"
+
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index d07084b..bc6287a 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -1,12 +1,6 @@
 #@TYPE: Machine
 #@NAME: arm_versatile_926ejs
-#@DESCRIPTION: arm_versatile_926ejs
+#@DESCRIPTION: Machine configuration for versatile 926ejs.
 
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-arm926ejs.inc
-#require conf/machine/include/tune-arm1136jf-s.inc
-
-KERNEL_IMAGETYPE = "zImage"
-
-SERIAL_CONSOLE = "115200 ttyAMA0"
+require conf/machine/include/qemuarm.inc
 
-- 
1.7.7




