Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 809EA6E268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:15:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N9FLQi026124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 02:15:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 02:15:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Apr 2015 02:15:20 -0700
Message-ID: <4c7b16912ab32ebe6c8b9080a91e317bca91f2e2.1429780485.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429780485.git.liezhi.yang@windriver.com>
References: <cover.1429780485.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] kernel-devsrc: depends on virtual/kernel:do_install
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
X-List-Received-Date: Thu, 23 Apr 2015 09:15:20 -0000
Content-Type: text/plain

The linux-yocto.inc may remove the meta dir:
do_install_append(){
	if [ -n "${KMETA}" ]; then
		rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
	fi
}

Which may cause the error:
[snip]
find: `./meta/cfg/kernel-cache/bsp/altera-socfpga/0073-FogBugz-116676-Align-clk.c-with-kernel.org.patch': No such file or directory
find: `./meta/cfg/kernel-cache/bsp/altera-socfpga/0047-FogBugz-90657-Fix-SD-MMC-driver-for-VT.patch': No such file or directory
find: `./meta/cfg/kernel-cache/bsp/altera-socfpga/0006-spi-qspi-cadence-Add-spi-and-qspi-driver.patch': No such file or directory
[snip]
cpio: ./meta/scripts/kgit-config-cleaner: Cannot stat: No such file or directory
cpio: ./meta/scripts/kgit-s2q: Cannot stat: No such file or directory
cpio: ./meta/scripts/kgit-clean: Cannot stat: No such file or directory
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index dd65788..196c8c7 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -18,7 +18,7 @@ inherit module-base
 # ${B} not to change while we install, so virtual/kernel must finish do_compile.
 do_install[depends] += "virtual/kernel:do_shared_workdir"
 # Need the source, not just the output of populate_sysroot
-do_install[depends] += "virtual/kernel:do_compile"
+do_install[depends] += "virtual/kernel:do_install"
 
 # There's nothing to do here, except install the source where we can package it
 do_fetch[noexec] = "1"
-- 
1.7.9.5


