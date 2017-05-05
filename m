Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [5.9.234.182])
	by mail.openembedded.org (Postfix) with ESMTP id B464477E10
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 15:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id F3A33E015C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 17:01:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id symJxm7AVAKi; Fri,  5 May 2017 17:01:32 +0200 (CEST)
Received: from beutel.mle (p4FE1E831.dip0.t-ipconnect.de [79.225.232.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 24FE2E005A;
	Fri,  5 May 2017 17:01:28 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 17:01:06 +0200
Message-Id: <1493996466-26026-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJ86T=ULob-3w572btu9UuVxDU1TxNc=jYNkfY7kewVCirxx8w@mail.gmail.com>
References: <CAJ86T=ULob-3w572btu9UuVxDU1TxNc=jYNkfY7kewVCirxx8w@mail.gmail.com>
Subject: [PATCH] module.bbclass: Add devshell support
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
X-List-Received-Date: Fri, 05 May 2017 15:01:33 -0000

Adds development shell support for out-of-tree kernel modules by reproducing
the build environment of the compile task.

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---

Change: Remove devshell task dependency

 meta/classes/module.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 802476b..391776d 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -18,6 +18,26 @@ python __anonymous () {
     d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
 }
 
+python do_devshell_prepend () {
+    os.environ['CFLAGS'] = ''
+    os.environ['CPPFLAGS'] = ''
+    os.environ['CXXFLAGS'] = ''
+    os.environ['LDFLAGS'] = ''
+
+    os.environ['KERNEL_PATH'] = d.getVar('STAGING_KERNEL_DIR')
+    os.environ['KERNEL_SRC'] = d.getVar('STAGING_KERNEL_DIR')
+    os.environ['KERNEL_VERSION'] = d.getVar('KERNEL_VERSION')
+    os.environ['CC'] = d.getVar('KERNEL_CC')
+    os.environ['LD'] = d.getVar('KERNEL_LD')
+    os.environ['AR'] = d.getVar('KERNEL_AR')
+    os.environ['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
+    kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
+    if kbuild_extra_symbols:
+        os.environ['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
+    else:
+        os.environ['KBUILD_EXTRA_SYMBOLS'] = ''
+}
+
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
-- 
1.9.1


