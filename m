Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SRoEh-0001Uf-EL
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 19:30:07 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D05614B00AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 19:20:13 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 19:19:54 +0200
Message-Id: <1336497594-19016-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] zlib: upgrade to 1.2.7
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
X-List-Received-Date: Tue, 08 May 2012 17:30:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

1.2.6 is no morre fetchable and 1.2.7 fix some bugs, full changelog is
available here : http://zlib.net/ChangeLog.txt

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../zlib/zlib-1.2.6/remove.ldconfig.call.patch     |   20 -------------
 .../zlib/zlib-1.2.7/remove.ldconfig.call.patch     |   20 +++++++++++++
 meta/recipes-core/zlib/zlib_1.2.6.bb               |   29 --------------=
------
 meta/recipes-core/zlib/zlib_1.2.7.bb               |   29 ++++++++++++++=
++++++
 4 files changed, 49 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.cal=
l.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.cal=
l.patch
 delete mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb
 create mode 100644 meta/recipes-core/zlib/zlib_1.2.7.bb

diff --git a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch=
 b/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
deleted file mode 100644
index 403b482..0000000
--- a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-When /etc/ld.so.cache is writeable by user running bitbake then it creat=
es invalid cache=20
-(in my case libstdc++.so cannot be found after building zlib(-native) an=
d I have to call=20
-touch */libstdc++.so && /sbin/ldconfig to fix it.
-
-So remove ldconfig call from make install-libs
-
-Upstream-Status: Inappropriate [disable feature]
-
-diff -uNr zlib-1.2.6.orig/Makefile.in zlib-1.2.6/Makefile.in
---- zlib-1.2.6.orig/Makefile.in	2012-01-28 23:48:50.000000000 +0100
-+++ zlib-1.2.6/Makefile.in	2012-02-13 15:38:20.577700723 +0100
-@@ -199,7 +199,6 @@
- 	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdi=
r)/$(SHAREDLIBM); \
- 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
- 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
--	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
- 	fi
- 	cp zlib.3 $(DESTDIR)$(man3dir)
- 	chmod 644 $(DESTDIR)$(man3dir)/zlib.3
diff --git a/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch=
 b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
new file mode 100644
index 0000000..403b482
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
@@ -0,0 +1,20 @@
+
+When /etc/ld.so.cache is writeable by user running bitbake then it creat=
es invalid cache=20
+(in my case libstdc++.so cannot be found after building zlib(-native) an=
d I have to call=20
+touch */libstdc++.so && /sbin/ldconfig to fix it.
+
+So remove ldconfig call from make install-libs
+
+Upstream-Status: Inappropriate [disable feature]
+
+diff -uNr zlib-1.2.6.orig/Makefile.in zlib-1.2.6/Makefile.in
+--- zlib-1.2.6.orig/Makefile.in	2012-01-28 23:48:50.000000000 +0100
++++ zlib-1.2.6/Makefile.in	2012-02-13 15:38:20.577700723 +0100
+@@ -199,7 +199,6 @@
+ 	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdi=
r)/$(SHAREDLIBM); \
+ 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
+ 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
+-	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
+ 	fi
+ 	cp zlib.3 $(DESTDIR)$(man3dir)
+ 	chmod 644 $(DESTDIR)$(man3dir)/zlib.3
diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zli=
b/zlib_1.2.6.bb
deleted file mode 100644
index 54f8abf..0000000
--- a/meta/recipes-core/zlib/zlib_1.2.6.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "Zlib Compression Library"
-DESCRIPTION =3D "Zlib is a general-purpose, patent-free, lossless data c=
ompression \
-library which is used by many different programs."
-HOMEPAGE =3D "http://zlib.net/"
-SECTION =3D "libs"
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3D94d=
1b5a40dadd127f3351471727e66a9"
-
-PR =3D "r1"
-
-SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
-           file://remove.ldconfig.call.patch \
-           "
-SRC_URI[md5sum] =3D "dc2cfa0d2313ca77224b4d932b2911e9"
-SRC_URI[sha256sum] =3D "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021=
c4bbb5db1b918c8e"
-
-do_configure (){
-	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
-}
-
-do_compile (){
-	oe_runmake
-}
-
-do_install() {
-	oe_runmake DESTDIR=3D${D} install
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zli=
b/zlib_1.2.7.bb
new file mode 100644
index 0000000..f37856e
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "Zlib Compression Library"
+DESCRIPTION =3D "Zlib is a general-purpose, patent-free, lossless data c=
ompression \
+library which is used by many different programs."
+HOMEPAGE =3D "http://zlib.net/"
+SECTION =3D "libs"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3D94d=
1b5a40dadd127f3351471727e66a9"
+
+PR =3D "r1"
+
+SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
+           file://remove.ldconfig.call.patch \
+           "
+SRC_URI[md5sum] =3D "2ab442d169156f34c379c968f3f482dd"
+SRC_URI[sha256sum] =3D "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d3=
78c79d52e9334934"
+
+do_configure (){
+	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
+}
+
+do_compile (){
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=3D${D} install
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
1.7.0.4



