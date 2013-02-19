Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIG-0000Kd-22
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:38 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:18 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id D46A8291D4E;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:13:59 +0100
Message-ID: <1361279644-17675-4-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: jack zhang <jack.zhang@enea.com>
Subject: [PATCH 3/8] udev: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: jack zhang <jack.zhang@enea.com>


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/udev/udev.inc                    |   19 ++++++-
 .../recipes-core/udev/udev/add-install-ptest.patch |   60 ++++++++++++++++=
++++
 meta/recipes-core/udev/udev/run-ptest              |    3 +
 3 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
 create mode 100755 meta/recipes-core/udev/udev/run-ptest

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.=
inc
index facad0c..8c26eee 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -27,9 +27,12 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotp=
lug/udev-${PV}.tar.gz \
            file://local.rules \
            file://udev-cache \
            file://udev-cache.default \
-           file://init"
+           file://init \
+           file://add-install-ptest.patch \
+           file://run-ptest \
+          "
=20
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig update-rc.d ptest
=20
 # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
 sbindir =3D "${base_sbindir}"
@@ -105,3 +108,15 @@ python () {
     if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
 }
+
+do_compile_append() {
+    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+        oe_runmake test-udev
+    fi
+}
+
+do_install_append() {
+    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+        ptest_do_install
+    fi
+}
diff --git a/meta/recipes-core/udev/udev/add-install-ptest.patch b/meta/rec=
ipes-core/udev/udev/add-install-ptest.patch
new file mode 100644
index 0000000..db6cf17
--- /dev/null
+++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
@@ -0,0 +1,60 @@
+Adjustements for ptest:
+
+- Add 'install-ptest' rule.
+- Print a standard result line for each test.
+- Replace the use of "tree" with "find".
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
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
++	install $(TESTS) $(DESTDIR)/test
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
diff --git a/meta/recipes-core/udev/udev/run-ptest b/meta/recipes-core/udev=
/udev/run-ptest
new file mode 100755
index 0000000..6817ef7
--- /dev/null
+++ b/meta/recipes-core/udev/udev/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -k check-TESTS
\ No newline at end of file
--=20
1.7.5.4



