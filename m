Return-Path: <f.suligoi@asem.it>
Received: from smtp.asem.it (smtp.asem.it [151.1.184.197])
	by mail.openembedded.org (Postfix) with ESMTP id AB4907DBB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:01:11 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 5.5.0) with ESMTP id SG003839686.MSG 
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
Date: Mon, 29 Apr 2019 15:56:04 +0200
Message-ID: <1556546164-28522-2-git-send-email-f.suligoi@asem.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
References: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0202.5CC70276.0035, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
Subject: [PATCH 2/2] kernel: check for empty .config file after merge_config.sh
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
X-List-Received-Date: Mon, 29 Apr 2019 14:01:12 -0000
Content-Type: text/plain

Sometimes, for example in case of missed dependecies, after the
execution of:

merge_config.sh

the resulting file ".config" can be empty.
This is the reason why is necessary test it and, in case, display
the "Could not configure ..." error message.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 243f8d6..895966b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -331,7 +331,7 @@ do_kernel_configme() {
 	fi
 
 	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"	HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2> ${meta_dir}/cfg/merge_config_build-errors.log
-	if [ $? -ne 0 ]; then
+	if [ $? -ne 0 ] || [ ! -s ${B}/.config ]; then
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 
-- 
2.7.4


