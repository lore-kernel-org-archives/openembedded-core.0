Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F24DB71FC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:43:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sACAhoDE008115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:43:50 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 02:43:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 18:45:46 +0800
Message-ID: <a44b261f0031a4d82f8fae0e968522139f607f90.1415789100.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415789100.git.Qi.Chen@windriver.com>
References: <cover.1415789100.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: add option for valgrind header checking
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
X-List-Received-Date: Wed, 12 Nov 2014 10:43:52 -0000
Content-Type: text/plain

Add option so that valgrind header checking is controlled. Otherwise,
we would get the following error.

   src/libsystemd/sd-bus/bus-control.c: fatal error: valgrind/mencheck.h: No such file or directory

The above error could be reproduced by the following command.

bitbake valgrind && bitbake systemd -ccleansstate && bitbake systemd -cconfigure
&& bitbake valgrind -ccleansstate && bitbake systemd -ccompile

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...re.ac-add-valgrind-header-checking-option.patch | 28 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-configure.ac-add-valgrind-header-checking-option.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-configure.ac-add-valgrind-header-checking-option.patch b/meta/recipes-core/systemd/systemd/0001-configure.ac-add-valgrind-header-checking-option.patch
new file mode 100644
index 0000000..89f3348
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-configure.ac-add-valgrind-header-checking-option.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Subject: configure.ac: add valgrind header checking option
+
+Signed-off-by: Chen qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 945adfc..dd4d7b2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1141,7 +1141,10 @@ AC_DEFINE_UNQUOTED(TELINIT, ["$TELINIT"], [Path to telinit])
+ 
+ AC_SUBST(TELINIT)
+ 
+-AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h valgrind/valgrind.h])
++AC_ARG_ENABLE(valgrindheader, AS_HELP_STRING([--disable-valgrindheader], [disable valgrind header checking]))
++if test "x$enable_valgrindheader" != "xno"; then
++        AC_CHECK_HEADERS_ONCE([valgrind/memcheck.h valgrind/valgrind.h])
++fi
+ 
+ # ------------------------------------------------------------------------------
+ have_myhostname=no
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 27a5d92..abef45d 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://init \
            file://run-ptest \
            ${@bb.utils.contains('PACKAGECONFIG', 'resolved', '', 'file://0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch', d)} \
+           file://0001-configure.ac-add-valgrind-header-checking-option.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -64,6 +65,7 @@ PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
+PACKAGECONFIG[valgrindheader] = "--enable-valgrindheader,--disable-valgrindheader"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.9.1


