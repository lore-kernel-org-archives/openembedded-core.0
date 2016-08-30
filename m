Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C705560797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:49:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UGnK6G009317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 30 Aug 2016 09:49:21 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 09:49:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Aug 2016 12:49:06 -0400
Message-ID: <41e88a439574c7eec5337b489d37402692a14d27.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] kernel-yocto: do_kernel_configme: Fix silent sysroot poisoning error
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
X-List-Received-Date: Tue, 30 Aug 2016 16:49:22 -0000
Content-Type: text/plain

From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>

do_kernel_configme calls merge_config.sh (installed in the sysroot by
the kern-tools-native recipe) which may invoke the compiler to complete
the configuration process.

Depending on the build (and dependencies), this may error due to sysroot poisoning [1].

The errors are similar to:

  make[1]: Entering directory '4.1+gitAUTOINC+a7e53ecc27-r0/linux-x64-standard-build' HOSTCC  scripts/basic/fixdep
  work-shared/x64/kernel-source/scripts/basic/fixdep.c:106:23: fatal error: sys/types.h: No such file or directory
  compilation terminated.
  make[2]: *** [work-shared/x64/kernel-source/scripts/basic/Makefile:22: scripts/basic/x86_64-nilrt-linux-fixdep] Error 1

Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh
fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and make
uses it to correctly compile & fill all missing kernel config options.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-October/098253.html

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 9b8bab63ca09..068378f06796 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -255,7 +255,7 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
-- 
2.5.0


