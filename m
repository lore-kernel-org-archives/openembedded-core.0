Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AC70C73DAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:02:42 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 11:02:43 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 4A0AD28BA1D;
	Wed, 29 Apr 2015 11:02:43 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 11:02:20 +0200
Message-ID: <1430298142-9117-4-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
References: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [daisy 3/5] coreutils: parse-datetime: CVE-2014-9471
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
X-List-Received-Date: Wed, 29 Apr 2015 09:02:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Sona Sarmadi <sona.sarmadi@enea.com>

Memory corruption flaw in parse_datetime()

Reference
https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2014-9471

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../parse-datetime-CVE-2014-9471.patch             | 43 ++++++++++++++++++=
++++
 meta/recipes-core/coreutils/coreutils_8.22.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/parse-dateti=
me-CVE-2014-9471.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.22/parse-datetime-CVE-=
2014-9471.patch b/meta/recipes-core/coreutils/coreutils-8.22/parse-datetime=
-CVE-2014-9471.patch
new file mode 100644
index 0000000..a094b8b
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.22/parse-datetime-CVE-2014-94=
71.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/ChangeLog b/ChangeLog
+--- a/ChangeLog	2013-12-13 16:20:00.000000000 +0100
++++ b/ChangeLog	2015-02-26 09:24:10.640577829 +0100
+@@ -1,3 +1,11 @@
++2014-02-25  Sona Sarmadi <sona.sarmadi@enea.com>
++
++       parse-datetime: fix crash or infloop in TZ=3D"" parsing
++       * lib/parse-datetime.y (parse_datetime): Break out of the
++       TZ=3D"" parsing loop once the second significant " is found.
++       Also skip over any subsequent whitespace to be consistent
++       with the non TZ=3D case (CVE-2014-9471)
++
+ 2013-12-13  P=C3=A1draig Brady  <P@draigBrady.com>
+=20
+ 	version 8.22
+diff -ruN a/lib/parse-datetime.y b/lib/parse-datetime.y
+--- a/lib/parse-datetime.y	2013-12-04 15:53:33.000000000 +0100
++++ b/lib/parse-datetime.y	2015-02-26 09:20:15.238528670 +0100
+@@ -1303,8 +1303,6 @@
+             char tz1buf[TZBUFSIZE];
+             bool large_tz =3D TZBUFSIZE < tzsize;
+             bool setenv_ok;
+-            /* Free tz0, in case this is the 2nd or subsequent time throu=
gh. */
+-            free (tz0);
+             tz0 =3D get_tz (tz0buf);
+             z =3D tz1 =3D large_tz ? xmalloc (tzsize) : tz1buf;
+             for (s =3D tzbase; *s !=3D '"'; s++)
+@@ -1316,7 +1314,12 @@
+             if (!setenv_ok)
+               goto fail;
+             tz_was_altered =3D true;
++
+             p =3D s + 1;
++            while (c =3D *p, c_isspace (c))
++              p++;
++
++            break;
+           }
+     }
+=20
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-c=
ore/coreutils/coreutils_8.22.bb
index ba3a0a0..9746683 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://dummy_help2man.patch \
            file://fix-for-dummy-man-usage.patch \
+           file://parse-datetime-CVE-2014-9471.patch \
           "
=20
 SRC_URI[md5sum] =3D "8fb0ae2267aa6e728958adc38f8163a2"
--=20
1.9.1


