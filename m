Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 94F0B73D13
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 11:54:23 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Thu, 3 Sep 2015
	13:54:23 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Sep 2015 13:54:21 +0200
Message-ID: <1441281261-31970-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][fido] gnutls: CVE-2015-3308
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
X-List-Received-Date: Thu, 03 Sep 2015 11:54:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes use-after-free flaw in CRL distribution points parsing

Reference:
https://gitlab.com/gnutls/gnutls/commit/d6972be33264ecc49a86cd0958209cd7363=
af1e9
https://gitlab.com/gnutls/gnutls/commit/053ae65403216acdb0a4e78b25ad66ee9f4=
44f02

http://www.openwall.com/lists/oss-security/2015/04/15/6

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../better-fix-for-double-free-CVE-2015-3308.patch | 65 ++++++++++++++++++=
++++
 .../eliminated-double-free-CVE-2015-3308.patch     | 33 +++++++++++
 meta/recipes-support/gnutls/gnutls_3.3.12.bb       |  2 +
 3 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/better-fix-for-doubl=
e-free-CVE-2015-3308.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/eliminated-double-fr=
ee-CVE-2015-3308.patch

diff --git a/meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-=
CVE-2015-3308.patch b/meta/recipes-support/gnutls/gnutls/better-fix-for-dou=
ble-free-CVE-2015-3308.patch
new file mode 100644
index 0000000..8824729
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-CVE-201=
5-3308.patch
@@ -0,0 +1,65 @@
+From 053ae65403216acdb0a4e78b25ad66ee9f444f02 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
+Date: Sat, 28 Mar 2015 22:41:03 +0100
+Subject: [PATCH] Better fix for the double free in dist point parsing
+
+Fixes CVE-2015-3308
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/x509/x509_ext.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
+index 2e69ed0..f974b02 100644
+--- a/lib/x509/x509_ext.c
++++ b/lib/x509/x509_ext.c
+@@ -2287,7 +2287,7 @@ int gnutls_x509_ext_import_crl_dist_points(const gnu=
tls_datum_t * ext,
+ 	int len, ret;
+ 	uint8_t reasons[2];
+ 	unsigned i, type, rflags, j;
+-	gnutls_datum_t san;
++	gnutls_datum_t san =3D {NULL, 0};
+=20
+ 	result =3D asn1_create_element
+ 	    (_gnutls_get_pkix(), "PKIX1.CRLDistributionPoints", &c2);
+@@ -2310,9 +2310,6 @@ int gnutls_x509_ext_import_crl_dist_points(const gnu=
tls_datum_t * ext,
+=20
+ 	i =3D 0;
+ 	do {
+-		san.data =3D NULL;
+-		san.size =3D 0;
+-
+ 		snprintf(name, sizeof(name), "?%u.reasons", (unsigned)i + 1);
+=20
+ 		len =3D sizeof(reasons);
+@@ -2337,6 +2334,9 @@ int gnutls_x509_ext_import_crl_dist_points(const gnu=
tls_datum_t * ext,
+=20
+ 		j =3D 0;
+ 		do {
++			san.data =3D NULL;
++			san.size =3D 0;
++
+ 			ret =3D
+ 			    _gnutls_parse_general_name2(c2, name, j, &san,
+ 							&type, 0);
+@@ -2351,6 +2351,7 @@ int gnutls_x509_ext_import_crl_dist_points(const gnu=
tls_datum_t * ext,
+ 			ret =3D crl_dist_points_set(cdp, type, &san, rflags);
+ 			if (ret < 0)
+ 				break;
++			san.data =3D NULL; /* it is now in cdp */
+=20
+ 			j++;
+ 		} while (ret >=3D 0);
+@@ -2360,6 +2361,7 @@ int gnutls_x509_ext_import_crl_dist_points(const gnu=
tls_datum_t * ext,
+=20
+ 	if (ret < 0 && ret !=3D GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
+ 		gnutls_assert();
++		gnutls_free(san.data);
+ 		goto cleanup;
+ 	}
+=20
+--=20
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-=
2015-3308.patch b/meta/recipes-support/gnutls/gnutls/eliminated-double-free=
-CVE-2015-3308.patch
new file mode 100644
index 0000000..628103f
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-2015-33=
08.patch
@@ -0,0 +1,33 @@
+From d6972be33264ecc49a86cd0958209cd7363af1e9 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
+Date: Mon, 23 Mar 2015 22:55:29 +0100
+Subject: [PATCH] eliminated double-free in the parsing of dist points
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Reported by Robert =C5=9Awi=C4=99cki.
+
+Fixes CVE-2015-3308
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/x509/x509_ext.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
+index c8d5867..6f09438 100644
+--- a/lib/x509/x509_ext.c
++++ b/lib/x509/x509_ext.c
+@@ -2360,7 +2360,6 @@ int gnutls_x509_ext_import_crl_dist_points(const gnu=
tls_datum_t * ext,
+=20
+ 	if (ret < 0 && ret !=3D GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE) {
+ 		gnutls_assert();
+-		gnutls_free(san.data);
+ 		goto cleanup;
+ 	}
+=20
+--=20
+1.9.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.3.12.bb
index b310be0..62cd2d0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.3.12.bb
@@ -3,6 +3,8 @@ require gnutls.inc
 SRC_URI +=3D "file://correct_rpl_gettimeofday_signature.patch \
             file://configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
+            file://eliminated-double-free-CVE-2015-3308.patch \
+            file://better-fix-for-double-free-CVE-2015-3308.patch \
            "
 SRC_URI[md5sum] =3D "a37b20b4352a5f542367ded904729c90"
 SRC_URI[sha256sum] =3D "67ab3e92c5d48f3323b897d7c1aa0bb2af6f3a84f5bd9931cd=
a163a7ff32299b"
--=20
1.9.1


