Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C93216CF3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 08:15:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD8FoGp006272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 00:15:50 -0800 (PST)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 00:15:50 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 16:15:47 +0800
Message-ID: <1384330547-1638-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] qemu: explicitly disable xen support
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
X-List-Received-Date: Wed, 13 Nov 2013 08:15:50 -0000
Content-Type: text/plain

We don't make use of xen and when building on Ubuntu 13.04 when
libxen-dev is installed on the build host you will get errors like the
following:

| /usr/include/x86_64-linux-gnu/bits/string3.h:81: warning: memset used with constant zero length parameter; this could be due to transposed parameters
| /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_alone_decoder@XZ_5.0'
| /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_code@XZ_5.0'
| /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_stream_decoder@XZ_5.0'
| /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_end@XZ_5.0'

This change disables xen for both -native and target packages but
since it is a PACKAGECONFIG a user could tune this to have xen support
in the target package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 702fe01..95a3aa3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -79,6 +79,7 @@ do_install_append() {
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
+PACKAGECONFIG[xen] = "--enable-xen, --disable-xen,,"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
-- 
1.8.4.1


