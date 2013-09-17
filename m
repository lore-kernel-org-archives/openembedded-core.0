Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F44D61589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 04:18:27 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z20so2493466yhz.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 21:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=zFr+1uMAJPsJInvlt84pJYhQLbFLZayUmeTlQaIrGbA=;
	b=OEMvD5ZFvsApoaJVv52YlajcDcKlVSeVv/Q+1/8ykABFyBsOmw8jrrREjJmCS69Ekb
	1gu0MGQSuhWiQP25QDl5CCNEr33Jqt/OdV6WHTfuvH4AGb5oYhXPxy4MbstXJrIj0DnY
	NHJik2XC/c8CC6ShP89J+Zp4RTGKcWpEj1SFlZ9N9f1ZmSB+Tbvtz3Y8ljlTaVtyTet3
	B0wHIKe8J2JBtPx5fj2YQ9yXoMgm9gB5CxXbyZlkd0NyGeotM9vkdLYYRUa9LjUPoFQa
	eObuH7QHW+7rnS4fly4IjlSXUyiJpEfMh6xKiLfh/2xfqFF9ptNW5xTJqjPPO3lMID83
	DEYw==
X-Received: by 10.236.91.109 with SMTP id g73mr18454947yhf.24.1379391508537;
	Mon, 16 Sep 2013 21:18:28 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id
	a21sm43323571yhc.23.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 21:18:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 01:18:20 -0300
Message-Id: <1379391500-22149-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] perf: Ensure we use CFLAGS and LDFLAGS settings from kernel build system
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
X-List-Received-Date: Tue, 17 Sep 2013 04:18:28 -0000

The kernel build system does the right thing here and we should stop
overriding it. This code has been added based on a change from
'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
without any information about what problem it fixes so I am reverting
it.

Using the CFLAGS and LDFLAGS makes it impossible for kernel build
system to append to it, thus making the build fail in various ways as:

|     CC /.../perf/1.0-r8/perf-1.0/perf.o
| In file included from builtin.h:4:0,
|                  from perf.c:9:
| util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
|  #include <lk/debugfs.h>
|                         ^
| compilation terminated.

The unset is done in do_compile and do_install otherwise it /rebuild/
perf as it detects the compiler options has change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- unset CFLAGS and LDFLAGS
- reword commit log

 meta/recipes-kernel/perf/perf.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d2c1048..4a815ff 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -60,7 +60,6 @@ B = "${WORKDIR}/${BPN}-${PV}"
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 
-export LDFLAGS = "-ldl -lutil"
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
 		O=${B} \
@@ -72,13 +71,7 @@ EXTRA_OEMAKE = \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
-# We already pass the correct arguments to our compiler for the CFLAGS (if we
-# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was failing
-# to find bfd symbols.
 EXTRA_OEMAKE += "\
-	'CFLAGS=${CFLAGS} -fPIC' \
-	'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
-	\
 	'prefix=${prefix}' \
 	'bindir=${bindir}' \
 	'sharedir=${datadir}' \
@@ -94,10 +87,14 @@ EXTRA_OEMAKE += "\
 PARALLEL_MAKE = ""
 
 do_compile() {
+	# Linux kernel build system is expected to do the right thing
+	unset CFLAGS LDFLAGS
 	oe_runmake all
 }
 
 do_install() {
+	# Linux kernel build system is expected to do the right thing
+	unset CFLAGS LDFLAGS
 	oe_runmake DESTDIR=${D} install
 	# we are checking for this make target to be compatible with older perf versions
 	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
-- 
1.8.4.rc3


