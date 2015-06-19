Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF04373772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 10:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5JAOqEH012293 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:24:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3Rn5bdg7TziF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:24:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5JAOdOa012288
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:24:50 +0100
Message-ID: <1434709479.14710.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jun 2015 11:24:39 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] toolchain-scrpts: Fix sitecache issues with multilib
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
X-List-Received-Date: Fri, 19 Jun 2015 10:24:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The use of TCLIBC in TOOLCHAIN_NEED_CONFIGSITE_CACHE is problematic
since a multilib may have both uclibc and glibc for different multilibs
yet switching between them doesn't change TCLIBC. This would result
in "lib32-glibc" being attempted when lib32 was actually uclibc.

The fix here is to use the virtual providers which bitbake switches
to point correctly at the right things.

This does mean we need to resolve virtual providers but we can do this using
sysroot-providers.

[YCOTO #7607]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 59a122f..16db511 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -98,7 +98,7 @@ EOF
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
-TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "${TCLIBC} ncurses"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/libc ncurses"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
@@ -113,6 +113,12 @@ toolchain_create_sdk_siteconfig () {
 
 	#get cached site config
 	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
+		# Resolve virtual/* names to the real recipe name using sysroot-providers info
+		case $sitefile in virtual/*)
+			sitefile=`echo $sitefile | tr / _`
+			sitefile=`cat ${STAGING_DIR_TARGET}/sysroot-providers/$sitefile`
+		esac
+
 		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
 			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
 		fi



