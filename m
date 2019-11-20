Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 766017F7E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8ED359C01A7;
	Wed, 20 Nov 2019 04:34:11 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id zy4kL3D-B7Z5; Wed, 20 Nov 2019 04:34:10 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E693D9C01C2;
	Wed, 20 Nov 2019 04:34:10 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id B6uCb_hZIr7k; Wed, 20 Nov 2019 04:34:10 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A4BE29C0292;
	Wed, 20 Nov 2019 04:34:09 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:45 +0100
Message-Id: <20191120093358.11622-5-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 04/17] lib/oe/package.py: remove unneeded npm_split_package_dirs function
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:10 -0000
Content-Transfer-Encoding: quoted-printable

The npm_split_package_dirs function was used by the recipetool when
creating npm recipes. This is not the case anymore.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/lib/oe/package.py | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b8585d4253..dd700cbb0c 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -283,36 +283,3 @@ def read_shlib_providers(d):
                         shlib_provider[s[0]] =3D {}
                     shlib_provider[s[0]][s[1]] =3D (dep_pkg, s[2])
     return shlib_provider
-
-
-def npm_split_package_dirs(pkgdir):
-    """
-    Work out the packages fetched and unpacked by BitBake's npm fetcher
-    Returns a dict of packagename -> (relpath, package.json) ordered
-    such that it is suitable for use in PACKAGES and FILES
-    """
-    from collections import OrderedDict
-    import json
-    packages =3D {}
-    for root, dirs, files in os.walk(pkgdir):
-        if os.path.basename(root) =3D=3D 'node_modules':
-            for dn in dirs:
-                relpth =3D os.path.relpath(os.path.join(root, dn), pkgdi=
r)
-                pkgitems =3D ['${PN}']
-                for pathitem in relpth.split('/'):
-                    if pathitem =3D=3D 'node_modules':
-                        continue
-                    pkgitems.append(pathitem)
-                pkgname =3D '-'.join(pkgitems).replace('_', '-')
-                pkgname =3D pkgname.replace('@', '')
-                pkgfile =3D os.path.join(root, dn, 'package.json')
-                data =3D None
-                if os.path.exists(pkgfile):
-                    with open(pkgfile, 'r') as f:
-                        data =3D json.loads(f.read())
-                    packages[pkgname] =3D (relpth, data)
-    # We want the main package for a module sorted *after* its subpackag=
es
-    # (so that it doesn't otherwise steal the files for the subpackage),=
 so
-    # this is a cheap way to do that whilst still having an otherwise
-    # alphabetical sort
-    return OrderedDict((key, packages[key]) for key in sorted(packages, =
key=3Dlambda pkg: pkg + '~'))
--=20
2.20.1


