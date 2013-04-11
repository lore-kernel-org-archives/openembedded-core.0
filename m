Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHnp-0005ZS-Br
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDRDT6014179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:13 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:27:05 -0700
Message-ID: <2a3f6772aadbe378259c87c05ab6f091866b63ef.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365686481.git.bruce.ashfield@windriver.com>
References: <cover.1365686481.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] linux-yocto/3.8: qemumips graphical boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
Content-Type: text/plain

Updating the meta SRCREV to fix and illegal instruction that is seen
when launching X with USB pointing devices.

    meta/qemumips: build USB_UHCI_HCD into the kernel

    When booting qemumips and USB_UHCI_HCD built as a module, the following
    trace is seen, and then prevents X from starting:

       qemumips user.warn kernel: Call Trace:
       qemumips user.warn kernel: [<c0028000>] uhci_check_bandwidth+0x0/0x160 [uhci_hcd]
       qemumips user.warn kernel: [<c002e08c>] uhci_urb_enqueue+0xba4/0xc48 [uhci_hcd]
       qemumips user.warn kernel: [<8058092c>] usb_hcd_submit_urb+0xdc/0x848
       qemumips user.warn kernel: [<805b8fbc>] wacom_open+0x44/0x8c
       qemumips user.warn kernel: [<805a1990>] input_open_device+0xac/0xec
       qemumips user.warn kernel: [<805a8cec>] evdev_open+0x188/0x1bc
       qemumips user.warn kernel: [<802331d8>] chrdev_open+0xc8/0x1c4
       qemumips user.warn kernel: [<8022b338>] do_dentry_open+0x248/0x2e4
       qemumips user.warn kernel: [<8022b418>] finish_open+0x44/0x68
       qemumips user.warn kernel: [<8023e51c>] do_last.isra.29+0x2c0/0xcbc
       qemumips user.warn kernel: [<8023efd8>] path_openat+0xc0/0x52c
       qemumips user.warn kernel: [<8023f840>] do_filp_open+0x4c/0xbc
       qemumips user.warn kernel: [<8022cc3c>] do_sys_open+0x128/0x20c
       qemumips user.warn kernel: [<8010c07c>] stack_done+0x20/0x44
       qemumips user.warn kernel: Code: (Bad address in epc)
       qemumips user.warn kernel: ---[ end trace 8a48c6046870f8c2 ]---

    Building the module into the kernel fixes the problem, but the root
    cause is still under investigation. The pipelines around jumps to
    module addresses seem to be triggering invalid instructions.

(From OE-Core rev: b7b7ebe57bd6fd248e80be0b7e517a3ceb7cfd11)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 1929796..05d497f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "0f7d294a9d07713059af345188f9cd4f549b4e77"
 SRCREV_machine_qemuppc ?= "82cdb00523b3f86219706d9f12dc80ff8d1c747a"
-SRCREV_meta ?= "4c567e02266ebe383abc6755b4f7908696ac099d"
+SRCREV_meta ?= "1b94482e3ab8f7e495ee4d6971e13cdad1990e8e"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index b6d112c..8bd4a0e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.8.4"
 KMETA = "meta"
 
 SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
-SRCREV_meta ?= "4c567e02266ebe383abc6755b4f7908696ac099d"
+SRCREV_meta ?= "1b94482e3ab8f7e495ee4d6971e13cdad1990e8e"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index ddafd26..c861b99 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "223428bbc1a355200bd9a8046fd272c1b9b13e67"
 SRCREV_machine_qemux86 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
 SRCREV_machine_qemux86-64 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
 SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
-SRCREV_meta ?= "4c567e02266ebe383abc6755b4f7908696ac099d"
+SRCREV_meta ?= "1b94482e3ab8f7e495ee4d6971e13cdad1990e8e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



