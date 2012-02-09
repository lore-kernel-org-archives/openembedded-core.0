Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RvNXI-0004yg-Fi
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 07:31:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Feb 2012 22:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104795499"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 08 Feb 2012 22:23:10 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 9 Feb 2012 14:22:35 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Thu, 9 Feb 2012 14:22:34 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: do_patch signature confliction for gcc family recipes
Thread-Index: Aczm8zMiDOtm+TUHRqyQC5M3aZ37Aw==
Date: Thu, 9 Feb 2012 06:22:33 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FCE533D@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: do_patch signature confliction for gcc family recipes
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
X-List-Received-Date: Thu, 09 Feb 2012 06:31:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I just found that the gcc-runtime-nativesdk has different task signature fo=
r task do_patch, comparing to that of gcc-cross-initial. This would cause a=
 do_patch failure if we use OEBasicHash as the BB_SIGNATURE_HANDLER. By com=
paring their sigdata files, it turns out that the difference comes from the=
 dependency to the variable PN in do_patch(See the following output of diff=
sigs). It is not designed, because all gcc family recipes share the same so=
urce therefore should have the same signature for all do_patch tasks.

$ bitbake-diffsigs i586-poky-linux/gcc-cross-initial-4.6.2+svnr181430-r22.d=
o_patch.sigdata.c7458123b61e7799d85c0f7b5c2c42f5 x86_64-nativesdk-pokysdk-l=
inux/gcc-runtime-nativesdk-4.6.2+svnr181430-r22.do_patch.sigdata.c6fd9cc879=
6537680198a31c39a5efb7=20

basehash changed from 49509723413c15e414b91b1e0074c169 to 026f47cf7b6f9bc63=
58b8727a14feacd
List of dependencies for variable PN changed from set(['FILE']) to set([])
changed items: set(['FILE'])
Variable PN value changed from {@bb.parse.BBHandler.vars_from_file(d.getVar=
('FILE'),d)[0] or 'defaultpkgname'} to gcc-runtime-nativesdk
Task dependency hash changed from 1cad915227dbbe6a9d2e5f85c9a4748f to 2526a=
771c7e3d733fccbff32c70328cc (for gcc-cross-initial_4.6.bb.do_unpack and qui=
lt-native_0.51.bb.do_populate_sysroot)
Task dependency hash changed from 2526a771c7e3d733fccbff32c70328cc to 214e4=
a3f054da63cb266af4394ccb9a5 (for quilt-native_0.51.bb.do_populate_sysroot a=
nd virtual:nativesdkgcc-runtime_4.6.bb.do_headerfix)
Task dependency hash changed from 214e4a3f054da63cb266af4394ccb9a5 to 1cad9=
15227dbbe6a9d2e5f85c9a4748f (for gcc-cross-initial_4.6.bb.do_headerfix and =
virtual:nativesdkgcc-runtime_4.6.bb.do_unpack)

I'm wondering if it is a correct way to fix this issue by excluding the PN =
from do_patch dependency:
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtoo=
ls/gc
index e89a7c0..57668f9 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -109,3 +109,4 @@ do_headerfix[vardepvalue] =3D "PATH"
 # We need to ensure that for the shared work directory, the do_patch singa=
tures
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] =3D "WORKDIR"
+should_apply[vardepsexclude] =3D "PN"


Best Regards,
-Lianhao


