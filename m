Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17396.1598530269446572061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 05:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78F5A31B
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 05:11:06 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D0CE3F68F
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 05:11:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package.bbclass: explode the RPROVIDES so we don't think the versions are provides
Date: Thu, 27 Aug 2020 13:11:03 +0100
Message-Id: <20200827121103.2388751-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

emit_pkgdata() creates symlinks for each of the RPROVIDES in
pkgdata/MACHINE/runtime-rprovides.  However this string can contain
versions which results in directories called (=3D2.32), so pass the
RPROVIDES string through bb.utils.explode_deps() to strip the versions
out.

Also use os.path.join() instead of string glueing.

Helps mitigate - but not solve - #13999.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7a36262eb6..9ce1a29eec 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1638,8 +1638,8 @@ fi
         # Symlinks needed for rprovides lookup
         rprov =3D d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES'=
)
         if rprov:
-            for p in rprov.strip().split():
-                subdata_sym =3D pkgdatadir + "/runtime-rprovides/%s/%s" =
% (p, pkg)
+            for p in bb.utils.explode_deps(rprov):
+                subdata_sym =3D os.path.join(pkgdatadir, "runtime-rprovi=
des", p, pkg)
                 bb.utils.mkdirhier(os.path.dirname(subdata_sym))
                 oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, T=
rue)
=20
--=20
2.28.0

