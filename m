Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3392377BC5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 10:01:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v79A1KC8007566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Aug 2017 03:01:20 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 9 Aug 2017 03:01:19 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Aug 2017 18:00:48 +0800
Message-ID: <20170809100048.25300-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] qemu: apic: fallthrough to PIC
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
X-List-Received-Date: Wed, 09 Aug 2017 10:01:19 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a commit from qemu upstream to fix a protection fault

https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg00878.html

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../qemu/qemu/apic-fixup-fallthrough-to-PIC.patch  | 46 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch

diff --git a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
new file mode 100644
index 0000000000..9bbbc6f76d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
@@ -0,0 +1,46 @@
+From bef93bb81588b5323a52d2e1886f2a77b64a976b Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 26 Feb 2013 11:43:28 -0500
+Subject: [PATCH 03/18] apic: fixup fallthrough to PIC
+
+Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
+interrupts through the local APIC if the local APIC config says so.]
+missed a check to ensure the local APIC is enabled. Since if the local
+APIC is disabled it doesn't matter what the local APIC config says.
+
+If this check isn't done and the guest has disabled the local APIC the
+guest will receive a general protection fault, similar to what is seen
+here:
+
+https://lists.gnu.org/archive/html/qemu-devel/2012-12/msg02304.html
+
+The GPF is caused by an attempt to service interrupt 0xffffffff. This
+comes about since cpu_get_pic_interrupt() calls apic_accept_pic_intr()
+(with the local APIC disabled apic_get_interrupt() returns -1).
+apic_accept_pic_intr() returns 0 and thus the interrupt number which
+is returned from cpu_get_pic_interrupt(), and which is attempted to be
+serviced, is -1.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg00878.html]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ hw/intc/apic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/intc/apic.c b/hw/intc/apic.c
+index 45887d99..c5ae4087 100644
+--- a/hw/intc/apic.c
++++ b/hw/intc/apic.c
+@@ -587,7 +587,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+     APICCommonState *s = APIC_COMMON(dev);
+     uint32_t lvt0;
+ 
+-    if (!s)
++    if (!s || !(s->spurious_vec & APIC_SV_ENABLE))
+         return -1;
+ 
+     lvt0 = s->lvt[APIC_LVT_LINT0];
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
index a5dc70469d..a4ddb7f989 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://CVE-2016-9908.patch \
            file://CVE-2016-9912.patch \
            file://0001-replace-struct-ucontext-with-ucontext_t-type.patch \
+           file://apic-fixup-fallthrough-to-PIC.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.11.0


