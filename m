Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE8BE60169
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 18:14:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7JIEuLY004892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:14:57 -0700 (PDT)
Received: from yshi-Precision-T5600.corp.ad.wrs.com (147.11.216.82) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 11:14:56 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 11:13:45 -0700
Message-ID: <1408472025-4777-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 2.0.2
MIME-Version: 1.0
Subject: [PATCH] kernel: Prevent from installing so files into source dir
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
X-List-Received-Date: Tue, 19 Aug 2014 18:15:04 -0000
Content-Type: text/plain

vdso build could generate so files, avoid installing such so files into kernel
source dir.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 819c302..435b6f0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -253,7 +253,7 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -name "*.so" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
 		pwd="$PWD"
-- 
2.0.2


