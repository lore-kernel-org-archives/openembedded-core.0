Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1TE1tb-0006wV-FE
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 19:47:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Sep 2012 10:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,444,1344236400"; d="scan'208";a="146403057"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Sep 2012 10:34:57 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 18 Sep 2012 10:34:57 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.152]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.213]) with mapi id
	14.01.0355.002; Tue, 18 Sep 2012 10:34:56 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: "Palcu, Laurentiu" <laurentiu.palcu@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] adt-installer: fix package installation
	issue
Thread-Index: AQHNlX8rlYKzCAZFOEawXJ++CmkKwpeQXJ1A
Date: Tue, 18 Sep 2012 17:34:55 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46AF3562@ORSMSX101.amr.corp.intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
	<8ac4de1571d9862bb5cbf558b72b9cecc4751fc4.1347959838.git.laurentiu.palcu@intel.com>
In-Reply-To: <8ac4de1571d9862bb5cbf558b72b9cecc4751fc4.1347959838.git.laurentiu.palcu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] adt-installer: fix package installation issue
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
X-List-Received-Date: Tue, 18 Sep 2012 17:47:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

Why this is only an issue for installation to a directory other than the de=
fault e.g. /opt/poky ?

Thanks,
Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Laurentiu Palcu
Sent: Tuesday, September 18, 2012 2:22 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/4] adt-installer: fix package installation issu=
e

When the cross canadian toolchains are installed, for different architectur=
es, they might contain common files. This leads to installation failures si=
nce the opkg, by default, does not overwrite files. This issue happens, for=
 example, for binutils packages (that contain the same locale files) or gdb=
 (which installs some syscalls xml files). The locale files could be remove=
d from the binutils cross-canadian package but we cannot do the same for th=
e syscalls GDB files which are used by GDB to display user friendly names f=
or the syscall numbers. Hence, the best solution is to force opkg to overwr=
ite these files.

[YOCTO #3109]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_inst=
aller_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_=
installer_internal
index 78ea6d0..f113aa4 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_i=
nternal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installe
+++ r_internal
@@ -112,7 +112,7 @@ check_result

 #install below must sdk-host packages
 OPKG_INSTALL_CMD=3D"$OPKG_CMD "
-OPKG_INSTALL_NATIVE_CMD=3D"$OPKG_INSTALL_CMD  -f $OPKG_CONFIG_FILE -o $NAT=
IVE_INSTALL_DIR install"
+OPKG_INSTALL_NATIVE_CMD=3D"$OPKG_INSTALL_CMD  --force-overwrite -f $OPKG_C=
ONFIG_FILE -o $NATIVE_INSTALL_DIR install"

 BASE_HOSTSDK_PKGNAMES=3D"pseudo opkg pkgconfig libtool autoconf automake"
 for pkg in $BASE_HOSTSDK_PKGNAMES; do
--
1.7.9.5


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


