Return-Path: <ovidiu.vancea@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DDE5D6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:08:35 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u58G8Zlb010495; Wed, 8 Jun 2016 11:08:35 -0500
Received: from ovidiu-ro-l0.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016060811083582-656130 ;
	Wed, 8 Jun 2016 11:08:35 -0500 
From: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 8 Jun 2016 19:08:31 +0300
Message-Id: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/08/2016 11:08:35 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/08/2016 11:08:36 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-08_05:, , signatures=0
Subject: [PATCH v2 0/3] ipk/deb/rpm: add kernel version to its dependencies
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

Updating the kernel (for all package managers) does not update the dependen=
cies
(eg. modules) because there is no possibility to do version enforcement in =
the
OE recipe. Upon rebooting, the older version modules do not load and can le=
ave
hardware in a non-functioning state (if their drivers are not built into the
kernel).

Use the Version field from the kernel package on its rdepends, rrecommends,=
 and
rsuggests fields=E2=80=99 version. This makes the packages on which the ker=
nel depends
to be the same version as the kernel. Version field contains package build
number (including git hash) and package revision, thus restricting the kern=
el
and modules to always be built together.

The current and default behavior will not change unless the variable=20
"VERSION=5FKERNEL=5FMODULES =3D 1" is defined in the kernel recipe.

Ovidiu-Adrian Vancea (3):
  package=5Fipk.bbclass: add kernel version to its dependencies
  package=5Fdeb.bbclass: add kernel version to its dependencies
  package=5Frpm.bbclass: add kernel version to its dependencies

 meta/classes/package=5Fdeb.bbclass | 10 ++++++++++
 meta/classes/package=5Fipk.bbclass |  9 +++++++++
 meta/classes/package=5Frpm.bbclass | 21 +++++++++++++++++++++
 3 files changed, 40 insertions(+)

--=20
2.7.4


