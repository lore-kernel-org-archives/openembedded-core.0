Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U3qEh-0001RJ-Fi
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 16:51:35 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Fri, 8 Feb 2013
	16:35:41 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 12145291D4A;
	Fri,  8 Feb 2013 16:35:41 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Feb 2013 16:35:32 +0100
Message-ID: <1360337733-51730-2-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1360337733-51730-1-git-send-email-bjst@enea.com>
References: <1360337733-51730-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 1/2] glib-2.0: Fix ptest to build with uclibc.
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
X-List-Received-Date: Fri, 08 Feb 2013 15:51:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Only install eglibc-specific dependencies when building for eglibc.
Tweak a test case that won't build with uclibc.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../glib-2.0/glib-2.0/fix-conflicting-rand.patch   |   35 ++++++++++++++++=
++++
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   18 ++++++----
 2 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-ran=
d.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch=
 b/meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
new file mode 100644
index 0000000..1571112
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
@@ -0,0 +1,35 @@
+Rename 'rand' variable to avoid conflict with stdlib.h.
+
+Upstream-Status: pending
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+
+diff -u glib-2.34.3/tests/refcount/signals.c~ glib-2.34.3/tests/refcount/s=
ignals.c
+--- glib-2.34.3/tests/refcount/signals.c	2012-11-26 17:52:48.000000000 +01=
00
++++ glib-2.34.3/tests/refcount/signals.c	2013-02-08 14:24:10.052477546 +01=
00
+@@ -9,7 +9,7 @@
+ #define MY_IS_TEST_CLASS(tclass)   (G_TYPE_CHECK_CLASS_TYPE ((tclass), G_=
TYPE_TEST))
+ #define MY_TEST_GET_CLASS(test)    (G_TYPE_INSTANCE_GET_CLASS ((test), G_=
TYPE_TEST, GTestClass))
+=20
+-static GRand *rand;
++static GRand *grand;
+=20
+ typedef struct _GTest GTest;
+ typedef struct _GTestClass GTestClass;
+@@ -84,7 +84,7 @@
+       NULL
+     };
+=20
+-    rand =3D g_rand_new();
++    grand =3D g_rand_new();
+=20
+     test_type =3D g_type_register_static (G_TYPE_OBJECT, "GTest",
+         &test_info, 0);
+@@ -218,7 +218,7 @@
+ static void
+ my_test_do_prop (GTest * test)
+ {
+-  test->value =3D g_rand_int (rand);
++  test->value =3D g_rand_int (grand);
+   g_object_notify (G_OBJECT (test), "test-prop");
+ }
+=20
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.34.3.bb
index fe50220..d163030 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.=
tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
            file://obsolete_automake_macros.patch \
+           file://fix-conflicting-rand.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
           "
@@ -23,6 +24,16 @@ SRC_URI_append_class-native =3D " file://glib-gettextize=
-dir.patch"
 BBCLASSEXTEND =3D "native nativesdk"
=20
 RDEPENDS_${PN}-ptest +=3D "\
+            tzdata \
+            tzdata-americas \
+            tzdata-asia \
+            tzdata-europe \
+            tzdata-posix \
+            python-pygobject \
+            python-dbus \
+           "
+
+RDEPENDS_${PN}-ptest_libc-eglibc +=3D "\
             eglibc-gconv-utf-16 \
             eglibc-charmap-utf-8 \
             eglibc-gconv-cp1255 \
@@ -31,13 +42,6 @@ RDEPENDS_${PN}-ptest +=3D "\
             eglibc-gconv-utf-7 \
             eglibc-charmap-invariant \
             eglibc-localedata-translit-cjk-variants \
-            tzdata \
-            tzdata-americas \
-            tzdata-asia \
-            tzdata-europe \
-            tzdata-posix \
-            python-pygobject \
-            python-dbus \
            "
=20
 do_configure_prepend() {
--=20
1.7.5.4



