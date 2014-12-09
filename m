Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F882724B2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 08:27:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB98RSXL005208
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 00:27:28 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Dec 2014 00:27:27 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 16:25:48 +0800
Message-ID: <eb72d6506995333ebe9b986d5e8826e3414a3fca.1418113325.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418113325.git.Chong.Lu@windriver.com>
References: <cover.1418113325.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] syslinux.bbclass: use single variable to set baud rate
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
X-List-Received-Date: Tue, 09 Dec 2014 08:27:31 -0000
Content-Type: text/plain

Use SERIAL_CONSOLE to set baud rate in syslinux.cfg file.

[YOCTO #6331]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/syslinux.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6498d9..b5eea07 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -27,8 +27,8 @@ SYSLINUXDIR = "/"
 # The kernel has an internal default console, which you can override with
 # a console=...some_tty...
 SYSLINUX_DEFAULT_CONSOLE ?= ""
-SYSLINUX_SERIAL ?= "0 115200"
-SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
+SYSLINUX_SERIAL ?= "${@filter(str.isdigit, d.getVar('SERIAL_CONSOLE', True).split()[1])} ${@d.getVar('SERIAL_CONSOLE', True).split()[0]}"
+SYSLINUX_SERIAL_TTY ?= "console=${@d.getVar('SERIAL_CONSOLE', True).split()[1]},${@d.getVar('SERIAL_CONSOLE', True).split()[0]}"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
-- 
1.9.1


