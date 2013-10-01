Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 655A56B896
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 22:54:49 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Wed, 2 Oct 2013
	00:54:46 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id B420728C24E;
	Wed,  2 Oct 2013 00:54:46 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Oct 2013 00:54:40 +0200
Message-ID: <1380668080-52460-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1380490304-58258-1-git-send-email-tudor.florea@enea.com>
References: <1380490304-58258-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH v2] kmod: ptest fixes
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
X-List-Received-Date: Tue, 01 Oct 2013 22:54:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


 Make kmod-ptest able to compile with separated source and
 build dir. Since kmod test files contain kernel modules for
 many different architectures, strip and arch gets confused
 and throws errors.


Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-kernel/kmod/kmod/ptest.patch |    8 ++++----
 meta/recipes-kernel/kmod/kmod/run-ptest   |    4 +---
 meta/recipes-kernel/kmod/kmod_git.bb      |    6 ++++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod/ptest.patch b/meta/recipes-kerne=
l/kmod/kmod/ptest.patch
index c6479b2..831dbcb 100644
--- a/meta/recipes-kernel/kmod/kmod/ptest.patch
+++ b/meta/recipes-kernel/kmod/kmod/ptest.patch
@@ -15,10 +15,10 @@ diff -ruN a/Makefile.am b/Makefile.am
 +	@for file in $(TESTSUITE); do \
 +		install $$file $(DESTDIR)/testsuite; \
 +	done;
-+	@cp Makefile $(DESTDIR)
-+	@sed -i 's/^Makefile/_Makefile/'  ${DESTDIR}/Makefile
-+	@tar -czf $(DESTDIR)/tools.tgz $(noinst_SCRIPTS) $(noinst_PROGRAMS)
-+	@tar -C testsuite -czf $(DESTDIR)/testsuite.tgz rootfs-pristine .libs
++	@sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
++	@$(MKDIR_P) $(DESTDIR)/tools
++	@cp $(noinst_SCRIPTS) $(noinst_PROGRAMS) $(DESTDIR)/tools
++	@cp -r testsuite/rootfs testsuite/.libs $(DESTDIR)/testsuite
 +
  # -----------------------------------------------------------------------=
-------
  # custom release helpers
diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/=
kmod/kmod/run-ptest
index fac24fd..37adec3 100755
--- a/meta/recipes-kernel/kmod/kmod/run-ptest
+++ b/meta/recipes-kernel/kmod/kmod/run-ptest
@@ -1,5 +1,3 @@
 #!/bin/sh
-tar -xzf tools.tgz
-tar -C testsuite -xzf testsuite.tgz
-make rootfs
+touch testsuite/stamp-rootfs
 make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmo=
d/kmod_git.bb
index b07c06e..ebecbcc 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -41,10 +41,12 @@ do_compile_prepend() {
 }
=20
 do_compile_ptest () {
-        oe_runmake buildtest-TESTS
-        oe_runmake rootfs
+        oe_runmake buildtest-TESTS rootfs
 }
=20
+INHIBIT_PACKAGE_STRIP =3D "${@base_contains("DISTRO_FEATURES", "ptest", "1=
", "0", d)}"
+INSANE_SKIP_${PN}-ptest =3D "arch"
+
 inherit update-alternatives
=20
 ALTERNATIVE_PRIORITY =3D "60"
--=20
1.7.10.4


