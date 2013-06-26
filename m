Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 012346A4E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 09:44:05 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 26 Jun 2013 11:44:01 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 5F0E1288FAC;
	Wed, 26 Jun 2013 11:44:01 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 11:43:59 +0200
Message-ID: <1372239839-24831-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH] bzip2: Add ptest
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
X-List-Received-Date: Wed, 26 Jun 2013 09:44:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Bj=C3=B6rn Stenberg <bjst@enea.com>

The existing bzip2 tests in the upstream Makefile are copied to Makefile.am=
=20
(yocto's) and modified to adopt to the ptest format.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
Signed-off-by: Anders Roxell <anders.roxell@enea.com>
Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../recipes-extended/bzip2/bzip2-1.0.6/Makefile.am |   30 ++++++++++++++++=
++++
 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest  |    2 ++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    7 ++++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am b/meta/rec=
ipes-extended/bzip2/bzip2-1.0.6/Makefile.am
index 070d57b..1d163b6 100644
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
@@ -26,6 +26,36 @@ bin_SCRIPTS =3D bzgrep bzmore bzdiff
 man_MANS =3D bzip2.1 bzgrep.1 bzmore.1 bzdiff.1
 EXTRA_DIST =3D $(man_MANS)
=20
+runtest:
+	./bzip2 -1  < sample1.ref > sample1.rb2
+	./bzip2 -2  < sample2.ref > sample2.rb2
+	./bzip2 -3  < sample3.ref > sample3.rb2
+	./bzip2 -d  < sample1.bz2 > sample1.tst
+	./bzip2 -d  < sample2.bz2 > sample2.tst
+	./bzip2 -ds < sample3.bz2 > sample3.tst
+	@if cmp sample1.bz2 sample1.rb2; then echo "PASS: sample1 compress";\
+	else echo "FAIL: sample1 compress"; fi
+	@if cmp sample2.bz2 sample2.rb2; then echo "PASS: sample2 compress";\
+	else echo "FAIL: sample2 compress"; fi
+	@if cmp sample3.bz2 sample3.rb2; then echo "PASS: sample3 compress";\
+	else echo "FAIL: sample3 compress"; fi
+	@if cmp sample1.tst sample1.ref; then echo "PASS: sample1 decompress";\
+	else echo "FAIL: sample1 decompress"; fi
+	@if cmp sample2.tst sample2.ref; then echo "PASS: sample2 decompress";\
+	else echo "FAIL: sample2 decompress"; fi
+	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
+	else echo "FAIL: sample3 decompress"; fi
+
+install-ptest:
+	cp $(srcdir)/Makefile		$(DESTDIR)/
+	cp $(srcdir)/sample1.ref	$(DESTDIR)/
+	cp $(srcdir)/sample2.ref	$(DESTDIR)/
+	cp $(srcdir)/sample3.ref	$(DESTDIR)/
+	cp $(srcdir)/sample1.bz2	$(DESTDIR)/
+	cp $(srcdir)/sample2.bz2	$(DESTDIR)/
+	cp $(srcdir)/sample3.bz2	$(DESTDIR)/
+	ln -s $(bindir)/bzip2		$(DESTDIR)/bzip2
+
 install-exec-hook:
 	ln -s $(bindir)/bzip2$(EXEEXT) $(DESTDIR)$(bindir)/bunzip2$(EXEEXT)
 	ln -s $(bindir)/bzip2$(EXEEXT) $(DESTDIR)$(bindir)/bzcat$(EXEEXT)
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest b/meta/recip=
es-extended/bzip2/bzip2-1.0.6/run-ptest
new file mode 100644
index 0000000..3b20fce
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.6.bb
index 6e160cd..4189f78 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -10,6 +10,7 @@ PR =3D "r5"
=20
 SRC_URI =3D "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
            file://configure.ac \
+           file://run-ptest \
 	   file://Makefile.am"
=20
 SRC_URI[md5sum] =3D "00b516f4704d4a7cb50a1d97e6e8e15b"
@@ -19,7 +20,7 @@ PACKAGES =3D+ "libbz2 libbz2-dev libbz2-staticdev"
=20
 CFLAGS_append =3D " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFS=
ET_BITS=3D64"
=20
-inherit autotools update-alternatives
+inherit autotools update-alternatives ptest
=20
 ALTERNATIVE_PRIORITY =3D "100"
 ALTERNATIVE_${PN} =3D "bunzip2 bzcat"
@@ -32,6 +33,10 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
 }
=20
+do_install_ptest () {
+	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
+}
+
 FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
=20
 FILES_libbz2-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV}"
--=20
1.7.10.4


