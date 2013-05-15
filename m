Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UcVQh-0007Yu-N3
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 08:43:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 14 May 2013 23:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="334267344"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2013 23:25:01 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 15 May 2013 07:25:00 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.193]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.126]) with mapi id
	14.03.0123.003; Wed, 15 May 2013 07:25:00 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] connman: replace hardcoded path in init
	script and systemd service
Thread-Index: AQHOUL9NdIUWEkVSIUm8A55hNLvPhJkFyEAQ
Date: Wed, 15 May 2013 06:24:59 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1623B71F@IRSMSX102.ger.corp.intel.com>
References: <1368548495-30122-1-git-send-email-stefanx.stanacar@intel.com>
In-Reply-To: <1368548495-30122-1-git-send-email-stefanx.stanacar@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH v2] connman: replace hardcoded path in init script and systemd service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 06:44:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Stefan Stanacar
Sent: Tuesday, May 14, 2013 7:22 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2] connman: replace hardcoded path in init scrip=
t and systemd service

The connman init script sources a setup file from /usr/lib/connman, so we e=
nd up with no network in qemu multilib enabled images.

The init script it's installed by connman and because wired-setup it's inst=
alled by another package (connman-conf) we can't use libexecdir here and no=
w (in the init script and systemd service file).

Once libexecdir changes from ${libdir}/${bpn} to something else like /usr/l=
ibexec we could use that instead of ${libdir}/connman.

Changed in v2: - better commit message

[YOCTO #4493]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     | 3 ++-
 meta/recipes-connectivity/connman/connman/connman | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc
index afc361c..3d3ec93 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -47,7 +47,7 @@ INITSCRIPT_NAME =3D "connman"
 INITSCRIPT_PARAMS =3D "start 05 5 2 3 . stop 22 0 1 6 ."
=20
 SYSTEMD_SERVICE_${PN} =3D "connman.service"
-SYSTEMD_WIRED_SETUP =3D "ExecStartPre=3D-/usr/lib/connman/wired-setup"
+SYSTEMD_WIRED_SETUP =3D "ExecStartPre=3D-${libdir}/connman/wired-setup"
=20
 # IMPORTANT: because xuser is shared with rootless X, please make sure the=
  # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb @@ -73,6 =
+73,7 @@ do_install_append() {
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
 	fi
=20
 	install -d ${D}${bindir}
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recip=
es-connectivity/connman/connman/connman
index a111f60..67ba7c8 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -32,8 +32,8 @@ do_start() {
 		ethn=3D`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
 		EXTRA_PARAM=3D"-I $ethn"
 	fi
-	if [ -f /usr/lib/connman/wired-setup ] ; then
-		. /usr/lib/connman/wired-setup
+	if [ -f @LIBDIR@/connman/wired-setup ] ; then
+		. @LIBDIR@/connman/wired-setup
 	fi
 	$DAEMON $EXTRA_PARAM
 }
--
1.8.1.4


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


