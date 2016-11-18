Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.43])
	by mail.openembedded.org (Postfix) with ESMTP id EEC336078D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 07:51:59 +0000 (UTC)
Received: from 1c7dxm-0008Ru-WA by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c7dxn-0008Sn-Ta
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2016 23:51:59 -0800
Received: by emcmailer; Thu, 17 Nov 2016 23:51:59 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c7dxm-0008Ru-WA
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2016 23:51:58 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 18 Nov 2016 08:51:58 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2016 08:51:55 +0100
Message-ID: <1479455515-11782-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][krogoth] Qemu: net: CVE-2016-4001
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
X-List-Received-Date: Fri, 18 Nov 2016 07:52:03 -0000
Content-Type: text/plain

buffer overflow in stellaris_enet emulator

Reference to upstream patch:
http://git.qemu.org/?p=qemu.git;a=patch;h=3a15cc0e1ee7168db0782133d2607a6bfa422d66

Reference:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-4001.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch
new file mode 100644
index 0000000..cfec8b8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-4001.patch
@@ -0,0 +1,51 @@
+From 3a15cc0e1ee7168db0782133d2607a6bfa422d66 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 8 Apr 2016 11:33:48 +0530
+Subject: [PATCH] net: stellaris_enet: check packet length against receive
+ buffer
+
+When receiving packets over Stellaris ethernet controller, it
+uses receive buffer of size 2048 bytes. In case the controller
+accepts large(MTU) packets, it could lead to memory corruption.
+Add check to avoid it.
+
+CVE: CVE-2016-4001
+Upstream-Status: Backport
+
+Reported-by: Oleksandr Bazhaniuk <oleksandr.bazhaniuk@intel.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 1460095428-22698-1-git-send-email-ppandit@redhat.com
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ hw/net/stellaris_enet.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
+index 84cf60b..6880894 100644
+--- a/hw/net/stellaris_enet.c
++++ b/hw/net/stellaris_enet.c
+@@ -236,8 +236,18 @@ static ssize_t stellaris_enet_receive(NetClientState *nc, const uint8_t *buf, si
+     n = s->next_packet + s->np;
+     if (n >= 31)
+         n -= 31;
+-    s->np++;
+ 
++    if (size >= sizeof(s->rx[n].data) - 6) {
++        /* If the packet won't fit into the
++         * emulated 2K RAM, this is reported
++         * as a FIFO overrun error.
++         */
++        s->ris |= SE_INT_FOV;
++        stellaris_enet_update(s);
++        return -1;
++    }
++
++    s->np++;
+     s->rx[n].len = size + 6;
+     p = s->rx[n].data;
+     *(p++) = (size + 6);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index b965f69..6823b62 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-5403.patch \
             file://CVE-2016-4441.patch \
             file://CVE-2016-4952.patch \
+            file://CVE-2016-4001.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
1.9.1


