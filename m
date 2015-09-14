Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9FAA76E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:04:37 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Sep 2015 12:04:34 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Sep 2015 12:04:32 +0200
Message-ID: <1442225072-37487-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH][fido][dizzy] libtasn1: CVE-2015-3622
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
X-List-Received-Date: Mon, 14 Sep 2015 10:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

_asn1_extract_der_octet: prevent past of boundary access

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-3622
http://git.savannah.gnu.org/gitweb/?p=3Dlibtasn1.git;a=3Dpatch;
h=3Df979435823a02f842c41d49cd41cc81f25b5d677

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   | 44 ++++++++++++++++++=
++++
 meta/recipes-support/gnutls/libtasn1_4.0.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-=
3622.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.pa=
tch b/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
new file mode 100644
index 0000000..0989ef6
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
@@ -0,0 +1,44 @@
+From f979435823a02f842c41d49cd41cc81f25b5d677 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Mon, 20 Apr 2015 14:56:27 +0200
+Subject: [PATCH] _asn1_extract_der_octet: prevent past of boundary access
+
+Fixes CVE-2015-3622.
+Upstream-Status: Backport
+
+Reported by Hanno B=C3=B6ck.
+---
+ lib/decoding.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 7fbd931..42ddc6b 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -732,6 +732,7 @@ _asn1_extract_der_octet (asn1_node node, const unsigne=
d char *der,
+     return ASN1_DER_ERROR;
+=20
+   counter =3D len3 + 1;
++  DECR_LEN(der_len, len3);
+=20
+   if (len2 =3D=3D -1)
+     counter_end =3D der_len - 2;
+@@ -740,6 +741,7 @@ _asn1_extract_der_octet (asn1_node node, const unsigne=
d char *der,
+=20
+   while (counter < counter_end)
+     {
++      DECR_LEN(der_len, 1);
+       len2 =3D asn1_get_length_der (der + counter, der_len, &len3);
+=20
+       if (IS_ERR(len2, flags))
+@@ -764,7 +766,6 @@ _asn1_extract_der_octet (asn1_node node, const unsigne=
d char *der,
+ 	  len2 =3D 0;
+ 	}
+=20
+-      DECR_LEN(der_len, 1);
+       counter +=3D len2 + len3 + 1;
+     }
+=20
+--=20
+1.7.2.5
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.0.bb b/meta/recipes-sup=
port/gnutls/libtasn1_4.0.bb
index 289833ec..16cf4d6 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504 \
 SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://libtasn1_fix_for_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
+           file://libtasn1-CVE-2015-3622.patch \
            "
=20
 SRC_URI[md5sum] =3D "d3d2d9bce3b6668b9827a9df52635be1"
--=20
1.9.1


