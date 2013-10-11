Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BB85B6CF1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:03:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BM3Cde002221 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:03:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aoCjPrXmug9n
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:03:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9BM365v002216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 23:03:07 +0100
Message-ID: <1381528982.29912.190.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 23:03:02 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] toolchain-scripts: Fix TARGET_SYS reference
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
X-List-Received-Date: Fri, 11 Oct 2013 22:03:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was a fix missing from a previous commit:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=20a86e16bc54b74fbdb2a3a407d54210ea262925

since there was another section of toolchain-scripts needing updating.
This patch fixes the missing reference and unbreaks the ADT toolchain.

[YOCTO #5340]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 8bdb17d..614f1c0 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -103,7 +103,7 @@ toolchain_create_sdk_env_script_for_installer () {
 	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${multimach_target_sys}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/'"${multimach_target_sys}"':$PATH' >> $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
 	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script



