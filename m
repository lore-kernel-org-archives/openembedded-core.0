Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5498B601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 09:47:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9L9lqVk007347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 02:47:53 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.244) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 02:47:52 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 17:47:44 +0800
Message-ID: <1413884864-10615-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: Create modules directory even if there is no modules installed
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
X-List-Received-Date: Tue, 21 Oct 2014 09:47:55 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

During kernel_do_install it needs to make symbol link at
${D}/lib/modules/${KERNEL_VERSION}/build, but there will not be
${D}/lib/modules/${KERNEL_VERSION} if there is no modules installed for current
image, which will result in a build failure.
Add "mkdir -p ${D}/lib/modules/${KERNEL_VERSION}" here to avoid this failure
and the need of similar changes in other scripts that also expect it to exist.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e958f90..e342ed1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -233,6 +233,7 @@ kernel_do_install() {
 	#
 	kerneldir=${D}${KERNEL_SRC_PATH}
 	install -d $kerneldir
+	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}
 	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
 
 	#
-- 
1.8.2.1


