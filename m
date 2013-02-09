Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U4Ip2-0005U7-Lr
	for Openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 23:23:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r19M7378012533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 9 Feb 2013 14:07:04 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 9 Feb 2013 14:07:03 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Sat, 9 Feb 2013 16:06:57 -0600
Message-ID: <1360447617-26341-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] ncurses.inc: Fix display corruption and add fallback for sstate compiled paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2013 22:23:12 -0000
Content-Type: text/plain

CQID: WIND00402979

Display corruption was occurring on 64 bit hosts using menuconfig for
the kernel and busybox with the ncurses-native or ncurses-nativesdk
because the configure arguments were not sufficient vs the expected
use from the upstream source.

Also changed in this commit is to provide a fallback to the hard
compiled paths for the terminfo and termcap.  Eventually this needs to
be fixed another way if we want a truly portable SDK because any SDK
that is relocated or native binaries pulled out of the sstate can end
up referencing terminfo files that no longer are in the same location.
Because the host system has terminfo files that ncurses will happily
use we might as well have a fall back to buy some time for a better
fix, vs having thing just not work occasionally when using sstate.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   32 +++++++++++++++++++++++++++++---
 1 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 5fdd994..9250e9d 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
-INC_PR = "r13"
+INC_PR = "r14"
 
 inherit autotools binconfig multilib_header
 
@@ -29,6 +29,31 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 # natives don't generally look in base_libdir
 base_libdir_class-native = "${libdir}"
 
+# Display corruption occurs on 64 bit hosts without these settings
+# This was derrived from the upstream debian ncurses which uses
+# these settings for 32 and 64 bit hosts.
+EXCONFIG_ARGS = ""
+EXCONFIG_ARGS_virtclass-native = " \
+		--disable-lp64 \
+		--with-chtype='long' \
+		--with-mmask-t='long'"
+EXCONFIG_ARGS_virtclass-nativesdk = " \
+		--disable-lp64 \
+		--with-chtype='long' \
+		--with-mmask-t='long'"
+
+# Fall back to the host termcap / terminfo for -nativesdk and -native
+# The reality is a work around for strange problems with things like
+# "bitbake -c menuconfig busybox" where it cannot find the terminfo
+# because the sstate had a hard coded search path.  Until this is fixed
+# another way this is deemed good enough.
+EX_TERMCAP = ""
+EX_TERMCAP_virtclass-native = ":/etc/termcap:/usr/share/misc/termcap"
+EX_TERMCAP_virtclass-nativesdk = ":/etc/termcap:/usr/share/misc/termcap"
+EX_TERMINFO = ""
+EX_TERMINFO_virtclass-native = ":/etc/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+EX_TERMINFO_virtclass-nativesdk = ":/etc/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
 # $@ the arguments to pass to configure
@@ -44,8 +69,8 @@ ncurses_configure() {
 	        --enable-hard-tabs \
 	        --enable-xmc-glitch \
 	        --enable-colorfgbg \
-	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
-	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
+	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap${EX_TERMCAP}' \
+	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo${EX_TERMINFO}' \
 	        --with-shared \
 	        --disable-big-core \
 	        --program-prefix= \
@@ -54,6 +79,7 @@ ncurses_configure() {
 	        --enable-sigwinch \
 	        --enable-pc-files \
 	        --disable-rpath-hack \
+		${EXCONFIG_ARGS} \
 	        --with-manpage-format=normal \
 	        "$@" || return 1
 	cd ..
-- 
1.7.1



