Return-Path: <ovidiu.vancea@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id ED44077479
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 10:01:46 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u53A1l3j027343 for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2016 05:01:47 -0500
Received: from ovidiu-ro-l0.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016060305014707-872790 ;
	Fri, 3 Jun 2016 05:01:47 -0500 
From: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 3 Jun 2016 13:01:45 +0300
Message-Id: <1464948105-5311-1-git-send-email-ovidiu.vancea@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/03/2016 05:01:47 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/03/2016 05:01:47 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-03_06:, , signatures=0
Subject: [RESEND][PATCH] package_ipk.bbclass: add kernel version to module dependencies
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
X-List-Received-Date: Fri, 03 Jun 2016 10:01:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Ovidiu Vancea <ovidiu.vancea@ni.com>

Updating the kernel ("opkg install kernel") does not update the
dependencies (i.e. modules) because there is no possibility to do version
enforcement in the OE recipe. Upon rebooting, the older version modules
do not load and can leave hardware in a non-functioning state (if their
drivers are not built into the kernel).

Use the Version field from the kernel package on its rdepends, rrecommends,
and rsuggests fields=E2=80=99 version. This makes the packages on which the=
 kernel
depends to be the same version as the kernel.

Version field contains package build number (including git hash) and package
revision, thus restricting the kernel and modules to always be built togeth=
er.

Signed-off-by: Ovidiu Vancea <ovidiu.vancea@ni.com>
---
 meta/classes/package=5Fipk.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/package=5Fipk.bbclass b/meta/classes/package=5Fip=
k.bbclass
index 08f7020..0a07f61 100644
--- a/meta/classes/package=5Fipk.bbclass
+++ b/meta/classes/package=5Fipk.bbclass
@@ -196,6 +196,15 @@ python do=5Fpackage=5Fipk () {
         rconflicts =3D bb.utils.explode=5Fdep=5Fversions2(localdata.getVar=
("RCONFLICTS", True) or "")
         debian=5Fcmp=5Fremap(rconflicts)
=20
+        if (pkgname =3D=3D "kernel") and (localdata.getVar("VERSION=5FKERN=
EL=5FMODULES", False) =3D=3D "1"):
+            suffix =3D "=3D"+localdata.getVar('PKGV', True)+"-"+localdata.=
getVar('PKGR', True)
+            for key in rdepends:
+                rdepends[key]    =3D suffix
+            for key in rsuggests:
+                rsuggests[key]   =3D suffix
+            for key in rrecommends:
+                rrecommends[key] =3D suffix
+
         if rdepends:
             ctrlfile.write("Depends: %s\n" % bb.utils.join=5Fdeps(rdepends=
))
         if rsuggests:
--=20
2.7.4


