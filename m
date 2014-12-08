Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E83472456
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 05:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB85msxS020050
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Dec 2014 21:48:54 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 7 Dec 2014 21:48:54 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 13:47:20 +0800
Message-ID: <54406976349f7616869c708a8dda02232f3b544a.1418017596.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418017596.git.Chong.Lu@windriver.com>
References: <cover.1418017596.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] grub-efi.bbclass: use single variable to set baud rate
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
X-List-Received-Date: Mon, 08 Dec 2014 05:48:54 -0000
Content-Type: text/plain

Use SERIAL_CONSOLE to set baud rate in grub.cfg file.

[YOCTO #6331]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/grub-efi.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..37c21f9 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -18,11 +18,12 @@
 do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
-GRUB_SERIAL ?= "console=ttyS0,115200"
+GRUB_SERIAL ?= "console=${@d.getVar('SERIAL_CONSOLE', True).split()[1]},${@d.getVar('SERIAL_CONSOLE', True).split()[0]}"
 GRUBCFG = "${S}/grub.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
-GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
+GRUB_OPTS ?= "serial --unit=${@filter(str.isdigit, d.getVar('SERIAL_CONSOLE', True).split()[1])} \
+--speed=${@d.getVar('SERIAL_CONSOLE', True).split()[0]} --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
 
-- 
1.9.1


