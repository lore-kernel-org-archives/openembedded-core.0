Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QKUJ1-0001o3-DR
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:43:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 04:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,358,1301900400"; 
   d="scan'208";a="756153"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:40:58 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 12 May 2011 19:38:18 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 12 May 2011 19:38:17 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2011 19:38:16 +0800
Thread-Topic: [OE-core] [PATCH 0/1] Automatically generate package repos for
	rpm	and deb [bug #1024]
Thread-Index: AcwQkj893XSXxWFySAW950Qb1SYX+wABdPNg
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD99@shsmsx502.ccr.corp.intel.com>
References: <cover.1305196874.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1305196874.git.dexuan.cui@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] Automatically generate package repos for rpm	and deb [bug #1024]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2011 11:43:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dexuan Cui wrote:
> From: Dexuan Cui <dexuan.cui@intel.com>
>=20
> This was made to address
> http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1024. Please comment.
>=20
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: dcui/master
>   Browse:
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/master=20

This is an improved and simple version that keeps 1  package-index recipe a=
nd updates the 3 kinds of packages at the same time:
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/packag=
e-index&id=3Dfb26e81dcb6e27e2908294e406a3011baed0120d
This avoids forcing the user to remember which package type they enabled wh=
en running "bitbake package-index".
(I also past the new version at the end of this mail for easy reviewing)

Thanks!
-- Dexuan

commit fb26e81dcb6e27e2908294e406a3011baed0120d
Author: Dexuan Cui <dexuan.cui@intel.com>
Date:   Thu May 12 19:15:59 2011 +0800

    package-index.bb: also add the support for rpm/deb

    [YOCTO #1024]

    -------------------------------
    (I'll make a new patch to add the below description to the manual).

    How to generate and use repos:

    1) run "bitbake package-index" after building some target;
    2) export ${DEPLOY_DIR_RPM} and ${DEPLOY_DIR_IPK} by a webserver on the=
 host
    (let's assume the host IP is 192.168.7.1) at
    http://192.168.7.1/rpm
    http://192.168.7.1/ipk
    3) inside the target, according to the packaging system (ipk, rpm, deb)=
 used
    when we generate the target image, we can use different ways to manage
    packages:
        3.1) RPM:  "zypper addrepo http://192.168.7.1/rpm main; zypper refr=
esh"
    to retrieve info about the repo; next, we can use zypper install/remove=
 to
    manage packages.
        3.2) IPK:  add the repo info into opkg config file, i.e., in
    /etc/opkg/arch.conf, we can add something like
    src i586 http://192.168.7.1/ipk/i586, and next we run "opkg update" to =
make
    opkg update the list of available packages, and next we can use
    opkg install/remove to manage packages.
        3.3) DEB:(To be added)

    Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/me=
ta/package-index.bb
index 3c642cb..969430b 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -22,10 +22,14 @@ do_package_index[nostamp] =3D "1"
 do_package_index[dirs] =3D "${DEPLOY_DIR_IPK}"
 do_package_index[depends] +=3D "opkg-utils-native:do_populate_sysroot"
 do_package_index[depends] +=3D "opkg-native:do_populate_sysroot"
+do_package_index[depends] +=3D "createrepo-native:do_populate_sysroot"
+do_package_index[depends] +=3D "dpkg-native:do_populate_sysroot apt-native=
:do_populate_sysroot"

 do_package_index() {
    set -ex
    package_update_index_ipk
+   createrepo "${DEPLOY_DIR_RPM}"
+   package_update_index_deb
    set +ex
 }
 addtask do_package_index before do_build=


