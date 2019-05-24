Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B53347E46F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 06:06:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4O66rYH013819
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 23:06:53 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 23 May 2019 23:06:53 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 May 2019 13:49:14 +0800
Message-ID: <20190524054915.49751-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH] make-mod-scripts: Add nostamp flag on configure task
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
X-List-Received-Date: Fri, 24 May 2019 06:06:53 -0000
Content-Type: text/plain

Error appears while building out of tree kernel module
after recompiling the kernel:
bitbake -c cleanall/cleansstate virtual/kernel
bitbake -c cleanall/cleansstate hello-mod
bitbake virtual/kernel
bitbake hello-mod

ERROR: Kernel configuration is invalid.
       include/generated/autoconf.h or include/config/auto.conf are missing.
       Run 'make oldconfig && make prepare' on kernel src to fix it.
error: 'struct pt_regs' has no member named 'ds'; did you mean 'dx'?

make-mod-scripts must be forced to rebuild in this case to generate
config data in 'kernel-build-artifacts/include/config'

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 97c58c5233..f55104070d 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}"
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
+do_configure[nostamp] = "1"
+
 DEPENDS += "bc-native"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-- 
2.13.3


