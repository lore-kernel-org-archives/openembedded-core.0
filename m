Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUqPG-0003S2-H8
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 02:53:18 +0100
Received: by mail-iy0-f175.google.com with SMTP id k25so8117917iah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2011 17:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cXrvudi1Uu5y4RXMMBm/9uruYb+Pz2KXZJ/+FdCu8ug=;
	b=qxd/Zz2egqo3EBx5TEdI3jZNtcexnSRZ69jjtlAP8GE5jf93lzoXKXVuoMJ9y6u/CZ
	BM4AFFE4m7UaXGfZ0ojsCnJD5ebCxD7jWMG6xl4ZxbAk0XDeCwfYo2s0XAG40liqeeNk
	Y6aIsKSFS3ZI3YTRbXJxLttTvimLdkyNviUm4=
Received: by 10.50.100.194 with SMTP id fa2mr48308092igb.49.1322444803345;
	Sun, 27 Nov 2011 17:46:43 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id eh34sm39080026ibb.5.2011.11.27.17.46.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 17:46:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Nov 2011 17:46:35 -0800
Message-Id: <036fc9612ef0e28835cfd739ab59e3953fb673b4.1322444142.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1b53350820cd64520aac5ad6d09f387001cd8716.1322444142.git.raj.khem@gmail.com>
References: <1b53350820cd64520aac5ad6d09f387001cd8716.1322444142.git.raj.khem@gmail.com>
In-Reply-To: <cover.1322444142.git.raj.khem@gmail.com>
References: <cover.1322444142.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] toolchain-scripts.bbclass: Make it work when TCLIBC=uclibc
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
X-List-Received-Date: Mon, 28 Nov 2011 01:53:18 -0000

This class currently only works with eglibc. Since
it adds dependencies explicitly on eglibc when using
uclibc this creates problems. So we make sure that
it checks for TCLIBC to determine system C library
in use

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain-scripts.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index c936a27..5fb6cd3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -104,7 +104,7 @@ toolchain_create_sdk_env_script_for_installer () {
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE := "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
-TOOLCHAIN_NEED_CONFIGSITE_CACHE = "eglibc ncurses"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
@@ -112,7 +112,9 @@ toolchain_create_sdk_siteconfig () {
 
 	rm -f $siteconfig
 	touch $siteconfig
-
+	if [ "${LIBC}" = "eglibc" ]; then
+		TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TOOLCHAIN_NEED_CONFIGSITE_CACHE} eglibc"
+	fi
 	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
 		cat $sitefile >> $siteconfig
 	done
@@ -140,5 +142,7 @@ python __anonymous () {
     deps = d.getVarFlag('do_configure', 'depends') or ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
+    if d.getVar('TCLIBC', True) is "uclibc":
+	deps += "uclibc:do_populate_sysroot"
     d.setVarFlag('do_configure', 'depends', deps)
 }
-- 
1.7.5.4



