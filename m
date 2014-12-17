Return-Path: <Liviu.Gheorghisan@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 37EF872669
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 14:13:55 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 17 Dec 2014 15:13:54 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4496)	id E89972800CB;
	Wed, 17 Dec 2014 15:13:54 +0100 (CET)
From: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Dec 2014 15:13:54 +0100
Message-ID: <1418825634-45461-1-git-send-email-liviu.gheorghisan@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: liviu.gheorghisan@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy][PATCH] Fixed openssh ptest
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
X-List-Received-Date: Wed, 17 Dec 2014 14:13:59 -0000
Content-Type: text/plain

ptests for openssh, apart from a lot of .sh scripts, also
require 2 executables to be cross-compiled for the target
and deployed there, that will be called from the test
scripts.

Those 2 files were not built when cross-compiling
(Makefile target all:), so I added them to the build,
under the target all_test.

This new make target is intended to be run from
do_compile_ptest(), that builds everything needed for
performing the ptests.

Because both these 2 executables required for ptest
are linked with libssh (LDFLAGS += -lssh), I also
added it as dependency for each of them.

Now we have 2 separate make targets:
all: builds all openssh, except for the ptest related files,
    that is invoked from do_compile().

all_test: builds only the files required for ptests, that is
    invoked from do_compile_ptest().

All this stuff fixes the following openssh ptest error:

/bin/sh: /usr/lib/openssh/ptest/regress/modpipe: No such file or directory
unexpected error mac chacha20-poly1305@openssh.com at 2909
test integrity: 10 errors: mac 0 padding 0 length 0
chacha20-poly1305@openssh.com: no mac errors
chacha20-poly1305@openssh.com: expected 10 mac errors, got 0
FAIL:  integrity
make: *** [t-exec] Error 1
Makefile:168: recipe for target 't-exec' failed
make: Target 'tests' not remade because of errors.

Signed-off-by: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
---
 .../openssh/openssh-ptest-fix-sshconnect.patch     | 57 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |  7 ++-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-ptest-fix-sshconnect.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-ptest-fix-sshconnect.patch b/meta/recipes-connectivity/openssh/openssh/openssh-ptest-fix-sshconnect.patch
new file mode 100644
index 0000000..0913701
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-ptest-fix-sshconnect.patch
@@ -0,0 +1,57 @@
+Fixed openssh ptest
+
+ptests for openssh, apart from a lot of .sh scripts, also
+require 2 executables to be cross-compiled for the target
+and deployed there, that will be called from the test
+scripts.
+
+Those 2 files were not built when cross-compiling
+(Makefile target all:), so I added them to the build,
+under the target all_test.
+
+This new make target is intended to be run from
+do_compile_ptest(), that builds everything needed for
+performing the ptests.
+
+Because both these 2 executables required for ptest
+are linked with libssh (LDFLAGS += -lssh), I also
+added it as dependency for each of them.
+
+Upstream-status: Inappropriate
+
+Signed-off-by: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
+---
+--- a/Makefile.in	2014-12-10 16:19:37.513373454 +0100
++++ b/Makefile.in	2014-12-10 16:25:23.262764227 +0100
+@@ -130,6 +130,8 @@ FIXALGORITHMSCMD= $(SHELL) $(srcdir)/fix
+ 
+ all: $(CONFIGFILES) $(MANPAGES) $(TARGETS)
+ 
++all_test: regress/modpipe$(EXEEXT) regress/setuid-allowed$(EXEEXT)
++
+ $(LIBSSH_OBJS): Makefile.in config.h
+ $(SSHOBJS): Makefile.in config.h
+ $(SSHDOBJS): Makefile.in config.h
+@@ -394,18 +396,18 @@ uninstall:
+ 	-rm -f $(DESTDIR)$(mandir)/$(mansubdir)8/ssh-pkcs11-helper.8
+ 	-rm -f $(DESTDIR)$(mandir)/$(mansubdir)1/slogin.1
+ 
+-regress/modpipe$(EXEEXT): $(srcdir)/regress/modpipe.c
++regress/modpipe$(EXEEXT): libssh.a
+ 	[ -d `pwd`/regress ]  ||  mkdir -p `pwd`/regress
+ 	[ -f `pwd`/regress/Makefile ]  || \
+ 	    ln -s `cd $(srcdir) && pwd`/regress/Makefile `pwd`/regress/Makefile
+-	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $? \
++	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $(srcdir)/regress/modpipe.c \
+ 	$(LDFLAGS) -lssh -lopenbsd-compat -lssh -lopenbsd-compat $(LIBS)
+ 
+-regress/setuid-allowed$(EXEEXT): $(srcdir)/regress/setuid-allowed.c
++regress/setuid-allowed$(EXEEXT): libssh.a
+ 	[ -d `pwd`/regress ]  ||  mkdir -p `pwd`/regress
+ 	[ -f `pwd`/regress/Makefile ]  || \
+ 	    ln -s `cd $(srcdir) && pwd`/regress/Makefile `pwd`/regress/Makefile
+-	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $? \
++	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $(srcdir)/regress/setuid-allowed.c \
+ 	$(LDFLAGS) -lssh -lopenbsd-compat -lssh -lopenbsd-compat $(LIBS)
+ 
+ tests interop-tests:	$(TARGETS) regress/modpipe$(EXEEXT) regress/setuid-allowed$(EXEEXT)
diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index 047a895..fe9ee02 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -25,7 +25,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://run-ptest \
            file://openssh-CVE-2014-2532.patch \
            file://openssh-CVE-2014-2653.patch \
-           file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch"
+           file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch \
+           file://openssh-ptest-fix-sshconnect.patch"
 
 PAM_SRC_URI = "file://sshd"
 
@@ -85,6 +86,10 @@ do_compile_append () {
 	install -m 0644 ${WORKDIR}/ssh_config ${S}/
 }
 
+do_compile_ptest() {
+    oe_runmake all_test
+}
+
 do_install_append () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-- 
1.9.1


