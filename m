Return-Path: <f.suligoi@asem.it>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Apr 2019 14:01:10 UTC
Received: from smtp.asem.it (smtp.asem.it [151.1.184.197])
	by mail.openembedded.org (Postfix) with ESMTP id A69187DBB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:01:10 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 5.5.0) with ESMTP id SG003839685.MSG 
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:56:06 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
	(172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 29 Apr 2019 15:56:05 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
	(172.16.16.44) with Microsoft SMTP Server id 15.1.1261.35 via Frontend
	Transport; Mon, 29 Apr 2019 15:56:05 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2019 15:56:03 +0200
Message-ID: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0202.5CC70276.002B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
Subject: [PATCH 1/2] kernel: redirect merge_config.sh error output to file
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
X-List-Received-Date: Mon, 29 Apr 2019 14:01:11 -0000
Content-Type: text/plain

In the task:

do_kernel_configme

the errors during execution of the "merge_config.sh" script are
currently lost.
But these errors are very useful for debugging, when there are
problems during the kernel configuration fragments assembly.

This is the reason to save also the error log, in addition to the
existing log.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ed9bcfa..243f8d6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -330,7 +330,7 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
-	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
+	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2> ${meta_dir}/cfg/merge_config_build-errors.log
 	if [ $? -ne 0 ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
-- 
2.7.4


