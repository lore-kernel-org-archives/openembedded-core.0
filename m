Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id DB2377FC83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 10:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1BD769C01B2;
	Mon, 20 Jan 2020 05:27:34 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id LnUqoFo55GGp; Mon, 20 Jan 2020 05:27:29 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 944F49C01B6;
	Mon, 20 Jan 2020 05:27:29 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id rdF4aAw6wxsc; Mon, 20 Jan 2020 05:27:29 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EF99C9C01C2;
	Mon, 20 Jan 2020 05:27:27 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 11:27:01 +0100
Message-Id: <20200120102705.20916-10-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v5 09/13] lib/oe/package: remove unneeded npm_split_package_dirs function
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
X-List-Received-Date: Mon, 20 Jan 2020 10:27:33 -0000
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


