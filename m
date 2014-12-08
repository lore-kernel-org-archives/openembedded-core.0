Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C60972478
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 05:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB85mqw3015985
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Dec 2014 21:48:53 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 7 Dec 2014 21:48:52 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 13:47:19 +0800
Message-ID: <43b14242b18fd7657ece8ecfd61354a9bf55ec90.1418017596.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418017596.git.Chong.Lu@windriver.com>
References: <cover.1418017596.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] syslinux.bbclass: use single variable to set baud rate
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


