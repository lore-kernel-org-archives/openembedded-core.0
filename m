Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZLic-00035w-Mn for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 14:40:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4TCTsUk012812
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:29:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11855-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:29:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4TCTjvq012805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:29:46 +0100
Message-ID: <1338294584.20169.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2012 13:29:44 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] ccache: Separate out into its own class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 12:40:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, ccache is used if it is present. When building from scratch it gives
no performance improvement and creates a ton of empty directories even when its
not in use.

This change moves ccache support to a bbclass file which the user can choose to
enable. This should make builds more determinstic and make it easier/clearer
to the end user when its being used and when it is not.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b166d62..17aa5e1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -271,7 +271,7 @@ python base_eventhandler() {
 }
 
 addtask configure after do_patch
-do_configure[dirs] = "${CCACHE_DIR} ${S} ${B}"
+do_configure[dirs] = "${S} ${B}"
 do_configure[deptask] = "do_populate_sysroot"
 base_do_configure() {
 	:
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
new file mode 100644
index 0000000..10f9b9f
--- a/dev/null
+++ b/meta/classes/ccache.bbclass
@@ -0,0 +1,5 @@
+CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
+export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+
+do_configure[dirs] =+ "${CCACHE_DIR}"
+do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index e931630..2a3373c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -161,7 +161,7 @@ do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_patch after do_unpack
 
-do_kernel_configme[dirs] = "${CCACHE_DIR} ${S} ${B}"
+do_kernel_configme[dirs] = "${S} ${B}"
 do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5fda36b..48287a7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -409,10 +409,9 @@ export PATH
 # Build utility info.
 ##################################################################
 
-CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
+CCACHE ??= ""
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
-export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 = "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
@@ -746,7 +745,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasic"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACHE_DIR EXTERNAL_TOOLCHAIN"
+BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY"
 
 MLPREFIX ??= ""




