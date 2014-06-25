Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1840607FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 01:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P1vGGX029400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 18:57:16 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 24 Jun 2014 18:57:15 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jun 2014 09:57:12 +0800
Message-ID: <1403661432-26466-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V2] kernel.bbclass: add task dependency between bundle_initramfs and package
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
X-List-Received-Date: Wed, 25 Jun 2014 01:57:19 -0000
Content-Type: text/plain

To ensure the bundled image to be packaged into kernel-image, otherwise, If
bundle_initramfs runs after do_package, the bundled kernel and initramfs
will not be part of the kernel-image package. This can result in boot
failures and other issues when the kernel-image is deployed.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6ed1cb7..764a9ec 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -146,7 +146,7 @@ python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_install before do_deploy
+addtask bundle_initramfs after do_install before do_deploy do_package
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-- 
1.8.4.1


