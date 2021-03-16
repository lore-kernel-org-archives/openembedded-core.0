Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.173.1615923532664566197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 12:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5648ED6E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 12:38:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00C8D3F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 12:38:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: respect downloadfilename when sniffing the SRC_URI for dependencies
Date: Tue, 16 Mar 2021 19:38:50 +0000
Message-Id: <20210316193850.3163565-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 meta/classes/base.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b4160402f0..42fb84c4d5 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -593,6 +593,8 @@ python () {
     srcuri =3D d.getVar('SRC_URI')
     for uri_string in srcuri.split():
         uri =3D bb.fetch.URI(uri_string)
+        # Also check downloadfilename as the URL path might not be usefu=
l for sniffing
+        path =3D uri.params.get("downloadfilename", uri.path)
=20
         # HTTP/FTP use the wget fetcher
         if uri.scheme in ("http", "https", "ftp"):
@@ -626,27 +628,27 @@ python () {
             d.appendVarFlag('do_fetch', 'depends', ' nodejs-native:do_po=
pulate_sysroot')
=20
         # *.lz4 should DEPEND on lz4-native for unpacking
-        if uri.path.endswith('.lz4'):
+        if path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_popu=
late_sysroot')
=20
         # *.lz should DEPEND on lzip-native for unpacking
-        elif uri.path.endswith('.lz'):
+        elif path.endswith('.lz'):
             d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_pop=
ulate_sysroot')
=20
         # *.xz should DEPEND on xz-native for unpacking
-        elif uri.path.endswith('.xz') or uri.path.endswith('.txz'):
+        elif path.endswith('.xz') or path.endswith('.txz'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_popul=
ate_sysroot')
=20
         # .zip should DEPEND on unzip-native for unpacking
-        elif uri.path.endswith('.zip') or uri.path.endswith('.jar'):
+        elif path.endswith('.zip') or path.endswith('.jar'):
             d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_po=
pulate_sysroot')
=20
         # Some rpm files may be compressed internally using xz (for exam=
ple, rpms from Fedora)
-        elif uri.path.endswith('.rpm'):
+        elif path.endswith('.rpm'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_popul=
ate_sysroot')
=20
         # *.deb should DEPEND on xz-native for unpacking
-        elif uri.path.endswith('.deb'):
+        elif path.endswith('.deb'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_popul=
ate_sysroot')
=20
     if needsrcrev:
--=20
2.25.1

