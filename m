Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC6BB724F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:45:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBA5jfTr021345
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 21:45:41 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Dec 2014 21:45:41 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Dec 2014 13:43:57 +0800
Message-ID: <6c89bc8005ce4d16fb4cf0faaf9eee40aca6b293.1418190010.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418190010.git.Chong.Lu@windriver.com>
References: <cover.1418190010.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 3/3] grub-efi.bbclass: use single variable to set baud rate
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
X-List-Received-Date: Wed, 10 Dec 2014 05:45:41 -0000
Content-Type: text/plain

Use SERIAL_CONSOLE to set baud rate in grub.cfg file.

[YOCTO #6331]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/grub-efi.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..18ae261 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -18,11 +18,12 @@
 do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
-GRUB_SERIAL ?= "console=ttyS0,115200"
+inherit console
+GRUB_SERIAL ?= "console=${@console_tty(d)},${@console_baudrate(d)}"
 GRUBCFG = "${S}/grub.cfg"
 GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
-GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
+GRUB_OPTS ?= "serial --unit=${@console_port(d)} --speed=${@console_baudrate(d)} --word=8 --parity=no --stop=1"
 
 EFIDIR = "/EFI/BOOT"
 
-- 
1.9.1


