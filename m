Return-Path: <Alexandra.Safta@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E77656CEEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 12:39:21 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Mon, 2 Dec 2013
	13:39:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4436)	id 98FE628508B;
	Mon,  2 Dec 2013 13:39:14 +0100 (CET)
From: Alexandra Safta <alexandra.safta@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2013 13:39:12 +0100
Message-ID: <1385987952-50588-1-git-send-email-alexandra.safta@enea.com>
X-Mailer: git-send-email 1.7.10.4
Upstream-Status: Pending
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: alexandra.safta@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] udev: Add ptest
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
X-List-Received-Date: Mon, 02 Dec 2013 12:39:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Install udev test suite and run it as a ptest.

Signed-off-by: Alexandra Safta <alexandra.safta@enea.com>
---
 meta/recipes-core/udev/udev.inc                    |    8 ++-
 .../recipes-core/udev/udev/add-install-ptest.patch |   73 ++++++++++++++++=
++++
 meta/recipes-core/udev/udev/run-ptest              |    3 +
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
 create mode 100644 meta/recipes-core/udev/udev/run-ptest

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.=
inc
index db09c54..3190731 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -26,9 +26,12 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotp=
lug/udev-${PV}.tar.gz \
            file://local.rules \
            file://udev-cache \
            file://udev-cache.default \
+           file://add-install-ptest.patch \
+           file://run-ptest \
            file://init"
=20
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig update-rc.d ptest
++RDEPENDS_${PN}-ptest +=3D "make"
=20
 libexecdir =3D "${base_libdir}"
 EXTRA_OECONF =3D "--disable-introspection \
@@ -99,3 +102,6 @@ python () {
     if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
 }
+do_compile_ptest() {
+    oe_runmake test-udev
+}
diff --git a/meta/recipes-core/udev/udev/add-install-ptest.patch b/meta/rec=
ipes-core/udev/udev/add-install-ptest.patch
new file mode 100644
index 0000000..44365c6
--- /dev/null
+++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
@@ -0,0 +1,73 @@
+Adjustements for ptest:
+
+- Add 'install-ptest' rule.
+- Print a standard result line for each test.
+- Replace the use of "tree" with "find".
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Signed-off-by: Alexandra Safta <alst@enea.com>
+Upstream-status: Pending
+
+--- a/Makefile.am	2012-03-18 16:28:14.000000000 +0100
++++ b/Makefile.am	2013-02-18 10:03:36.531101244 +0100
+@@ -708,3 +708,11 @@
+ 	for i in src/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.si=
gn /pub/linux/utils/kernel/hotplug/libudev/; done
+ 	for i in src/gudev/docs/html/*.{html,css,png}; do rm -f $$i.sign; gpg --=
armor --detach-sign --output=3D$$i.sign $$i; done
+ 	for i in src/gudev/docs/html/*.{html,css,png}; do echo $$i; kup put $$i =
$$i.sign /pub/linux/utils/kernel/hotplug/gudev/; done
++
++install-ptest:
++	install test-udev $(DESTDIR)
++	cp Makefile $(DESTDIR)
++	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
++	$(MKDIR_P) $(DESTDIR)/test
++	(cd $(top_srcdir) && install $(TESTS) $(DESTDIR)/test)
++	tar -C $(DESTDIR)/test/ -xJf $(top_srcdir)/test/sys.tar.xz
+--- a/test/udev-test.pl	2012-03-18 16:43:36.000000000 +0100
++++ b/test/udev-test.pl	2013-02-18 10:31:29.706357321 +0100
+@@ -1459,11 +1459,13 @@
+                 print "add:         error";
+                 if ($rules->{exp_add_error}) {
+                         print " as expected\n";
++                        print "XFAIL: TEST $number: $rules->{desc}: add\n=
";
+                 } else {
+                         print "\n";
+-                        system("tree $udev_root");
++                        system("find $udev_root");
+                         print "\n";
+                         $error++;
++                        print "FAIL: TEST $number: $rules->{desc}: add\n"=
;
+                         sleep(1);
+                 }
+         }
+@@ -1479,15 +1481,18 @@
+                 print "remove:      error";
+                 if ($rules->{exp_rem_error}) {
+                         print " as expected\n";
++                        print "XFAIL: TEST $number: $rules->{desc}: remov=
e\n";
+                 } else {
+                         print "\n";
+-                        system("tree $udev_root");
++                        system("find $udev_root");
+                         print "\n";
+                         $error++;
++                        print "FAIL: TEST $number: $rules->{desc}: remove=
\n";
+                         sleep(1);
+                 }
+         } else {
+                 print "remove:      ok\n";
++                print "PASS: TEST $number: $rules->{desc}: remove\n";
+         }
+=20
+         print "\n";
+--- a/configure.ac      2013-11-28 09:14:02.814248826 +0100
++++ b/configure.ac      2013-11-28 09:14:34.260874296 +0100
+@@ -6,7 +6,7 @@
+        [http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html])
+ AC_CONFIG_SRCDIR([src/udevd.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+-AM_INIT_AUTOMAKE([check-news foreign 1.11 -Wall -Wno-portability silent-r=
ules tar-pax no-dist-gzip dist-xz subdir-objects])
++AM_INIT_AUTOMAKE([check-news foreign 1.11 -Wall -Wno-portability silent-r=
ules tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
+ AC_USE_SYSTEM_EXTENSIONS
+ AC_SYS_LARGEFILE
+ AC_CONFIG_MACRO_DIR([m4])
+
diff --git a/meta/recipes-core/udev/udev/run-ptest b/meta/recipes-core/udev=
/udev/run-ptest
new file mode 100644
index 0000000..6817ef7
--- /dev/null
+++ b/meta/recipes-core/udev/udev/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -k check-TESTS
\ No newline at end of file
--=20
1.7.10.4


