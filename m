Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8539D6D183
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 04:25:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA14PPWX018804
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 21:25:25 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 31 Oct 2013 21:25:24 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Nov 2013 12:25:17 +0800
Message-ID: <1383279917-22210-1-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.8.3.3
MIME-Version: 1.0
Subject: [V2 PATCH] kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
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
X-List-Received-Date: Fri, 01 Nov 2013 04:25:25 -0000
Content-Type: text/plain

Since kernel will build twice when we are trying to bundle kernel
and initramfs together after commit 609d5a9ab("kernel.bbclass,
image.bbclass: Implement kernel INITRAMFS dependency and bundling"),
thus, the second building for kernel would fail if rm_work is done
previously.

To fix this problem, we need to make do_bundle_initramfs task run
before do_rm_work task.

[YOCTO #5416]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dedfab7..a4db9f5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_compile
+addtask bundle_initramfs after do_compile before do_build
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-- 
1.8.3.3


