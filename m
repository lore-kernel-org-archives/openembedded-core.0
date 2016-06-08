Return-Path: <ovidiu.vancea@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EB96A6FF72
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:08:36 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u58G8aYi013342; Wed, 8 Jun 2016 11:08:36 -0500
Received: from ovidiu-ro-l0.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016060811083668-656131 ;
	Wed, 8 Jun 2016 11:08:36 -0500 
From: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 8 Jun 2016 19:08:32 +0300
Message-Id: <1465402114-1588-2-git-send-email-ovidiu.vancea@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
References: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/08/2016 11:08:36 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/08/2016 11:08:36 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-08_05:, , signatures=0
Subject: [PATCH v2 1/3] package_ipk.bbclass: add kernel version to its dependencies
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
X-List-Received-Date: Wed, 08 Jun 2016 16:08:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Use the kernel package Version field for its rdepends, rrecommends, and
rsuggests fields=E2=80=99 values. This makes the packages on which the kern=
el
depends be the same version as the kernel.

Signed-off-by: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
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
+            for key in rrecommends:
+                rrecommends[key] =3D suffix
+            for key in rsuggests:
+                rsuggests[key]   =3D suffix
+
         if rdepends:
             ctrlfile.write("Depends: %s\n" % bb.utils.join=5Fdeps(rdepends=
))
         if rsuggests:
--=20
2.7.4


