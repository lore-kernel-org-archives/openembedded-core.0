Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 801726D97A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 03:14:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD3ExnD001390
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 19:14:59 -0800 (PST)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 19:14:59 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 11:14:54 +0800
Message-ID: <1384312495-2504-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V2 1/2] kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux
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
X-List-Received-Date: Wed, 13 Nov 2013 03:14:58 -0000
Content-Type: text/plain

${KERNEL_OUTPUT} is being renamed/restored in bundle_initramfs task, so we
must ensure bundle_initramfs run after kernel_link_vmlinux where the link
of vmlinux is created as the bootable image.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a4db9f5..966066f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_compile before do_build
+addtask bundle_initramfs after do_kernel_link_vmlinux before do_build
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-- 
1.8.4.1


