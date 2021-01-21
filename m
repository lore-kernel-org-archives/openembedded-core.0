Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1173.1611245366474993949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70EB611D4
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 08:09:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A2433F68F
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 08:09:24 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: use URI instead of decodeurl when detecting unpack dependencies
Date: Thu, 21 Jan 2021 16:09:22 +0000
Message-Id: <20210121160922.3935165-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

decodeurl() has limitations, primarily that it doesn't handle query
parameters at all. If a SRC_URI looks like this:

  http://example.com/download.tar.gz?something

Then the returned path attribute is download.tar.gz?something.  This mean=
s
the filename extension detection fails and required tools are not added
to the dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/base.bbclass | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 78ae28bb0f..d287065e08 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -596,62 +596,62 @@ python () {
=20
     needsrcrev =3D False
     srcuri =3D d.getVar('SRC_URI')
-    for uri in srcuri.split():
-        (scheme, _ , path) =3D bb.fetch.decodeurl(uri)[:3]
+    for uri_string in srcuri.split():
+        uri =3D bb.fetch.URI(uri_string)
=20
         # HTTP/FTP use the wget fetcher
-        if scheme in ("http", "https", "ftp"):
+        if uri.scheme in ("http", "https", "ftp"):
             d.appendVarFlag('do_fetch', 'depends', ' wget-native:do_popu=
late_sysroot')
=20
         # Svn packages should DEPEND on subversion-native
-        if scheme =3D=3D "svn":
+        if uri.scheme =3D=3D "svn":
             needsrcrev =3D True
             d.appendVarFlag('do_fetch', 'depends', ' subversion-native:d=
o_populate_sysroot')
=20
         # Git packages should DEPEND on git-native
-        elif scheme in ("git", "gitsm"):
+        elif uri.scheme in ("git", "gitsm"):
             needsrcrev =3D True
             d.appendVarFlag('do_fetch', 'depends', ' git-native:do_popul=
ate_sysroot')
=20
         # Mercurial packages should DEPEND on mercurial-native
-        elif scheme =3D=3D "hg":
+        elif uri.scheme =3D=3D "hg":
             needsrcrev =3D True
             d.appendVar("EXTRANATIVEPATH", ' python3-native ')
             d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do=
_populate_sysroot')
=20
         # Perforce packages support SRCREV =3D "${AUTOREV}"
-        elif scheme =3D=3D "p4":
+        elif uri.scheme =3D=3D "p4":
             needsrcrev =3D True
=20
         # OSC packages should DEPEND on osc-native
-        elif scheme =3D=3D "osc":
+        elif uri.scheme =3D=3D "osc":
             d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_popul=
ate_sysroot')
=20
-        elif scheme =3D=3D "npm":
+        elif uri.scheme =3D=3D "npm":
             d.appendVarFlag('do_fetch', 'depends', ' nodejs-native:do_po=
pulate_sysroot')
=20
         # *.lz4 should DEPEND on lz4-native for unpacking
-        if path.endswith('.lz4'):
+        if uri.path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_popu=
late_sysroot')
=20
         # *.lz should DEPEND on lzip-native for unpacking
-        elif path.endswith('.lz'):
+        elif uri.path.endswith('.lz'):
             d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_pop=
ulate_sysroot')
=20
         # *.xz should DEPEND on xz-native for unpacking
-        elif path.endswith('.xz') or path.endswith('.txz'):
+        elif uri.path.endswith('.xz') or uri.path.endswith('.txz'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_popul=
ate_sysroot')
=20
         # .zip should DEPEND on unzip-native for unpacking
-        elif path.endswith('.zip') or path.endswith('.jar'):
+        elif uri.path.endswith('.zip') or uri.path.endswith('.jar'):
             d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_po=
pulate_sysroot')
=20
         # Some rpm files may be compressed internally using xz (for exam=
ple, rpms from Fedora)
-        elif path.endswith('.rpm'):
+        elif uri.path.endswith('.rpm'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_popul=
ate_sysroot')
=20
         # *.deb should DEPEND on xz-native for unpacking
-        elif path.endswith('.deb'):
+        elif uri.path.endswith('.deb'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_popul=
ate_sysroot')
=20
     if needsrcrev:
--=20
2.25.1

