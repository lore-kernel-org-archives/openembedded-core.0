Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlLZL-0001OO-Ks
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:51:40 +0200
Received: by rex (Postfix, from userid 1000)
	id CF8422096F; Mon, 25 Jul 2011 14:47:22 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 14:47:19 +0100
Message-Id: <b7b6ab25887f5d5fcc541f44287942e1ccd150af.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] ncurses: Uncompress man pages
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
X-List-Received-Date: Mon, 25 Jul 2011 13:51:40 -0000

From: Mark Hatle <mark.hatle@windriver.com>

If the man pages are compressed, then they cause file conflicts between
the 32-bit and 64-bit versions of the package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 1e139a3..f588022 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r0"
+INC_PR = "r1"
 
-inherit autotools binconfig
+inherit autotools binconfig multilib_header
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
 SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
@@ -161,6 +161,17 @@ do_install() {
         f=${D}${libdir}/libtermcap.so
         echo '/* GNU ld script */' >$f
         echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
+
+	find ${D}${mandir} -type f -name "*.gz" | xargs gunzip
+	for each_link in `find ${D}${mandir} -type l -name "*.gz"` ; do
+		link_name=`echo $each_link | sed "s,\.gz$,,"`
+		target=`readlink -n $each_link | sed "s,\.gz$,,"`
+		echo "Changing $each_link to $link_name (-> $target)"
+		rm -f $each_link
+		ln -s $target $link_name
+	done
+
+	oe_multilib_header curses.h
 }
 
 python populate_packages_prepend () {
-- 
1.7.4.1



