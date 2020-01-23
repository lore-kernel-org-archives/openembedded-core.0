Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 886D57FD64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:34:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00NMYpmG024163
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:34:51 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 23 Jan 2020 14:34:51 -0800
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 4A01BC601A6;
	Thu, 23 Jan 2020 14:34:51 -0800 (PST)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2020 14:34:49 -0800
Message-ID: <20200123223449.90548-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] module.bbclass: swap AR and LD order
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
X-List-Received-Date: Thu, 23 Jan 2020 22:34:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The 5.x kernels seem to have made a change to the linker command line processing.

When trying to build out of tree kernel modules, such as the
virtualbox guest additions, the following error is printed:

| make[1]: Entering directory '/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo'
| make[3]: Entering directory '/opt/build-x86-64/tmp/work-shared/qemux86-64/kernel-build-artifacts'
| make V= CONFIG_MODULE_SIG= CONFIG_MODULE_SIG_ALL= -C /opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/5.2.28-yocto-standard/build M=/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest SRCROOT=/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest modules
| make[3]: Entering directory '/opt/build-x86-64/tmp/work-shared/qemux86-64/kernel-build-artifacts'
|   LD [M]  /opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo/vboxvideo.o
| x86_64-poky-linux-ld.bfd: cannot find AR=x86_64-poky-linux-ar: No such file or directory

The AR arguments passed to the make command are being processed as
command line arguments to the linker due to some changes in the
kernel's Makefile.  For now the easiest fix is to just swap the
arguments in the module.bbclass.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/module.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index c0dfa35061..e1e5fdaa72 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -38,8 +38,7 @@ module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
 		   KERNEL_VERSION=${KERNEL_VERSION}    \
-		   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-		   AR="${KERNEL_AR}" \
+		   CC="${KERNEL_CC}" AR="${KERNEL_AR}" LD="${KERNEL_LD}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
 		   KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
 		   ${MAKE_TARGETS}
-- 
2.23.0


