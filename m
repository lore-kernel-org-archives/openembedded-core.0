Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1932D6D9AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 08:54:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBE8sdcX001477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Dec 2018 00:54:39 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 14 Dec 2018 00:54:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Fri, 14 Dec 2018 16:54:36 +0800
Message-ID: <1544777676-38812-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] linux-libc-headers: workaround do_install failure while host gcc version < 4.5
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
X-List-Received-Date: Fri, 14 Dec 2018 08:54:42 -0000
Content-Type: text/plain

Since kernel commit [e501ce9 x86: Force asm-goto], running
`make menuconfig (bitbake linux-yocto -cmenuconfig)' requires
host gcc support asm-goto which gcc version >= 4.5

It broke linux-libc-headers do_install even though there is no
relation with `make menuconfig'

Set CC_HAVE_ASM_GOTO="1" to workaround the checking

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e501ce957a786ecd076ea0cfb10b114e6e4d0f40
https://unix.stackexchange.com/questions/456767/make-menuconfig-error-while-trying-to-build-kernel

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index be215af..766322e 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -51,7 +51,7 @@ UPSTREAM_CHECK_URI = "https://www.kernel.org/"
 
 S = "${WORKDIR}/linux-${PV}"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}" CC_HAVE_ASM_GOTO="1""
 
 do_configure[noexec] = "1"
 
-- 
2.7.4


