Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DED7724B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:45:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBA5jdFx021342
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 21:45:39 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Dec 2014 21:45:38 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Dec 2014 13:43:55 +0800
Message-ID: <d0427006b3064664ff56f761003749abcaa64843.1418190010.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418190010.git.Chong.Lu@windriver.com>
References: <cover.1418190010.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/3] console.bbclass: add class which can be used to set serial console and baud rate
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
X-List-Received-Date: Wed, 10 Dec 2014 05:45:39 -0000
Content-Type: text/plain

Use a single method set serial console and baud rate by SERIAL_CONSOLE variable.
Defind three function, we can get port, tty and baud rate of the console. they can
be used by syslinux, grub, qemu and so on.

[YOCTO #6331]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/console.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/classes/console.bbclass

diff --git a/meta/classes/console.bbclass b/meta/classes/console.bbclass
new file mode 100644
index 0000000..b01ffef
--- /dev/null
+++ b/meta/classes/console.bbclass
@@ -0,0 +1,23 @@
+def console_tty(d):
+    serial_console = d.getVar('SERIAL_CONSOLE', True).split()
+    if serial_console:
+        tty = d.getVar('SERIAL_CONSOLE', True).split()[1]
+    else:
+        tty = "ttyS0"
+    return tty
+
+def console_baudrate(d):
+    serial_console = d.getVar('SERIAL_CONSOLE', True).split()
+    if serial_console:
+        baudrate = d.getVar('SERIAL_CONSOLE', True).split()[0]
+    else:
+        baudrate = "115200"
+    return baudrate
+
+def console_port(d):
+    serial_console = d.getVar('SERIAL_CONSOLE', True).split()
+    if serial_console:
+        port = filter(str.isdigit, d.getVar('SERIAL_CONSOLE', True).split()[1])
+    else:
+        port = "0"
+    return port
-- 
1.9.1


