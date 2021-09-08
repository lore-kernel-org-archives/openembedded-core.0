Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web09.15075.1631123212083527768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 10:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: wusto.de, ip: 80.241.56.171, mailfrom: tobias.kaufmann@wusto.de)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4H4V205YjjzQlRW;
	Wed,  8 Sep 2021 19:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: tobias.kaufmann@wusto.de
To: openembedded-core@lists.openembedded.org
Cc: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
Subject: [PATCH] package-manager: escape package names for regexps
Date: Wed,  8 Sep 2021 19:46:41 +0200
Message-Id: <20210908174641.223936-1-tobias.kaufmann@wusto.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A6EEE26A
Content-Transfer-Encoding: quoted-printable

From: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>

If a package-name contains characters which are used
in regular expressions (e.g. libstdc++) this might
break the regexp compilation.

To solve this issue the package names are escaped before using
them in the regular expression

Signed-off-by: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
---
 meta/lib/oe/package_manager/deb/__init__.py | 5 +++--
 meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/pa=
ckage_manager/deb/__init__.py
index 9f112ae25b..4d5921044a 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -208,8 +208,9 @@ class DpkgPM(OpkgDpkgPM):
=20
                     status =3D sf.read()
                     for pkg in packages:
-                        status =3D re.sub(r"Package: %s\n((?:[^\n]+\n)*?=
)Status: (.*)(?:unpacked|installed)" % pkg,
-                                        r"Package: %s\n\1Status: \2%s" %=
 (pkg, status_tag),
+                        _pkg =3D re.escape(pkg)
+                        status =3D re.sub(r"Package: %s\n((?:[^\n]+\n)*?=
)Status: (.*)(?:unpacked|installed)" % _pkg,
+                                        r"Package: %s\n\1Status: \2%s" %=
 (_pkg, status_tag),
                                         status)
=20
                     tmp_sf.write(status)
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pa=
ckage_manager/ipk/__init__.py
index 4cd3963111..503a4f5181 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -207,8 +207,9 @@ class OpkgPM(OpkgDpkgPM):
=20
                     status =3D sf.read()
                     for pkg in packages:
-                        status =3D re.sub(r"Package: %s\n((?:[^\n]+\n)*?=
)Status: (.*)(?:unpacked|installed)" % pkg,
-                                        r"Package: %s\n\1Status: \2%s" %=
 (pkg, status_tag),
+                        _pkg =3D re.escape(pkg)
+                        status =3D re.sub(r"Package: %s\n((?:[^\n]+\n)*?=
)Status: (.*)(?:unpacked|installed)" % _pkg,
+                                        r"Package: %s\n\1Status: \2%s" %=
 (_pkg, status_tag),
                                         status)
=20
                     tmp_sf.write(status)
--=20
2.33.0

