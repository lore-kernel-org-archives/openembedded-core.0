Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpHF-0007Hw-0o
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUgIg028068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:08 -0500
Message-ID: <5eeeedb564b91817ce1f81f9267187b6f52b1b70.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v2 PATCH 7/8] ncurses: Resolve header and man page multilib conflicts
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
X-List-Received-Date: Tue, 26 Jul 2011 21:34:57 -0000
Content-Type: text/plain

By default man pages are compressed, the way ncurses compresses
them causes differences (timestamp and name) to be embedded into
the gziped file.  So each build will end up with a slightly
different file.  Avoid this, by not compressing the man pages.

Avoid header conflict with curses.h using the multilib header
helper.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 1e139a3..be7d387 100644
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
@@ -61,6 +61,7 @@ do_configure() {
                         --enable-sigwinch \
                         --enable-pc-files \
                         --disable-rpath-hack \
+                        --with-manpage-format=normal \
                         "$@"
                 cd ..
         done
@@ -161,6 +162,8 @@ do_install() {
         f=${D}${libdir}/libtermcap.so
         echo '/* GNU ld script */' >$f
         echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
+
+	oe_multilib_header curses.h
 }
 
 python populate_packages_prepend () {
-- 
1.7.3.4



