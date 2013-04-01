Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UMZYD-0005Sy-9A
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 09:53:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Apr 2013 00:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,385,1363158000"; d="scan'208";a="314912212"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2013 00:35:59 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.198]) with mapi id
	14.01.0355.002; Mon, 1 Apr 2013 08:35:56 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] lsb: distro codename info added
Thread-Index: AQHOLqtat/HOwofcvUOwOzUYCEOpWpjA+WZA
Date: Mon, 1 Apr 2013 07:35:55 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1621D54B@IRSMSX102.ger.corp.intel.com>
References: <1364801685-7249-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1364801685-7249-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH] lsb: distro codename info added
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
X-List-Received-Date: Mon, 01 Apr 2013 07:53:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

V2 patch.

DISTRO_CODENAME is check for existence, in case of distros not defining it.

Regards,
Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Monday, April 01, 2013 10:35 AM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH] lsb: distro codename info added

Poky distro codename info added to /etc/lsb-release file.
lsb_release script will not complain anymore about the incompleteness of /e=
tc/lsb-release file by returning an error code.
Increases LSB compliance.

Partial fix for [YOCTO #4071].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/l=
sb/lsb_4.1.bb
index 01368b3..59d5bca 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "LSB support for OpenEmbedded"
 SECTION =3D "console/utils"
 HOMEPAGE =3D "http://prdownloads.sourceforge.net/lsb"
 LICENSE =3D "GPLv2+"
-PR =3D "r1"
+PR =3D "r2"
=20
 # lsb_release needs getopt
 RDEPENDS_${PN} +=3D "util-linux"
@@ -41,6 +41,9 @@ do_install(){
 	echo "\"" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_ID=3D${DISTRO}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_RELEASE=3D${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-relea=
se
+	if [ -n "${DISTRO_CODENAME}" ]; then
+		echo "DISTRIB_CODENAME=3D${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-re=
lease
+	fi
 	echo "DISTRIB_DESCRIPTION=3D\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}=
${sysconfdir}/lsb-release
=20
 	if [ "${TARGET_ARCH}" =3D "i586" ];then
--
1.7.10.4



