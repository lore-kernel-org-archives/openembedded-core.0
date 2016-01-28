Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5FA160746
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:46:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0S9kcUe023133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 01:46:38 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 01:46:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 01:46:35 -0800
Message-ID: <3754c0c2404f6c6ea9d995f3ae4e1f33fd191cbd.1453974352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453974352.git.liezhi.yang@windriver.com>
References: <cover.1453974352.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gdb-common.inc: add PACKAGECONFIG for readline
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
X-List-Received-Date: Thu, 28 Jan 2016 09:46:41 -0000
Content-Type: text/plain

When compile with readline 5.2:
completer.o: In function `gdb_display_match_list':
completer.c:(.text+0x1c13): undefined reference to `_rl_completion_prefix_display_length'
completer.c:(.text+0x1ce8): undefined reference to `rl_sort_completion_matches'
collect2: ld returned 1 exit status

The --without-system-readline will make it work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 166ba8e..6baeb0b 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE = "GPLv3+"
 SECTION = "devel"
-DEPENDS = "expat zlib ncurses readline ${LTTNGUST}"
+DEPENDS = "expat zlib ncurses ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
@@ -40,13 +40,17 @@ EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
 EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
-                --with-curses --disable-multilib --with-system-readline --disable-sim \
+                --with-curses --disable-multilib --disable-sim \
                 --without-lzma --without-guile \
                 ${GDBPROPREFIX} ${EXPAT} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                 --disable-rpath \
                "
 
+PACKAGECONFIG ??= "readline"
+# Use --without-system-readline to compile with readline 5.
+PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
+
 GDBPROPREFIX = "--program-prefix=''"
 
 do_configure () {
-- 
1.7.9.5


