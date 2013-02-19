Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIN-0000Kd-Dg
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:45 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:49 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id E0214291D50;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:14:01 +0100
Message-ID: <1361279644-17675-6-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 5/8] bzip2: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../recipes-extended/bzip2/bzip2-1.0.6/Makefile.am |   32 ++++++++++++++++=
++++
 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest  |    2 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |   10 +++++-
 3 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am b/meta/rec=
ipes-extended/bzip2/bzip2-1.0.6/Makefile.am
index 070d57b..96cc309 100644
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
@@ -26,6 +26,38 @@ bin_SCRIPTS =3D bzgrep bzmore bzdiff
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
+	mkdir -p $(PTESTDIR)/
+	install -m 0755 $(WDIR)/run-ptest	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/Makefile	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/sample1.ref	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/sample2.ref	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/sample3.ref	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/sample1.bz2	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/sample2.bz2	$(PTESTDIR)/
+	install -m 0755 $(BDIR)/sample3.bz2	$(PTESTDIR)/
+	ln -s $(bindir)/bzip2			$(PTESTDIR)/bzip2
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
index 6e160cd..e58e3c5 100644
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
@@ -32,6 +33,13 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
 }
=20
+do_install_append () {
+	if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+		make PTESTDIR=3D${D}${PTEST_PATH} WDIR=3D${WORKDIR} BDIR=3D${B} install-=
ptest
+                sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Mak=
efile
+	fi
+}
+
 FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
=20
 FILES_libbz2-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV}"
--=20
1.7.5.4



