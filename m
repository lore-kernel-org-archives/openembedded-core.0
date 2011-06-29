Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qbqr8-0005ts-02
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:14:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2011 02:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,442,1304319600"; d="scan'208";a="21823792"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 02:11:01 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 17:10:24 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 29 Jun 2011 17:10:24 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 17:10:22 +0800
Thread-Topic: [Multilib] a problem of SHLIBSDIR 
Thread-Index: AcwwDO/yAB5rlaxmRGS9m5+tKtz8dgGGu1gw
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F27050B57BE@shsmsx502.ccr.corp.intel.com>
References: <1308658461.20015.24.camel@rex>
In-Reply-To: <1308658461.20015.24.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: [Multilib] a problem of SHLIBSDIR
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
X-List-Received-Date: Wed, 29 Jun 2011 09:14:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

SHLIBSDIR is a central place where to store the pkg information about the s=
hared libraries which the package would provide. In the do_package task,  t=
he function package_do_shlibs() will use this kind of information to automa=
tically add RDEPENDS for the package being built. In the multilib situation=
, the SHLIBSDIR should be set to a different place form the normal version,=
 otherwise a 32bit application might RDEPENDS on lib64-eglibc instead of th=
e 32bit eglibc.=20

The following patch tries to solve this problem. Any comment?
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dllu/ml&i=
d=3D1970842424c414db50058ff99c6627e3ca034a04=20

---------------------------------------------------------------------------=
-------
classes/multilib.bbclass: Change the SHLIBSDIR.
Changes the SHLIBSDIR for the multilib version, so it won't mix up with the=
 normal version.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>

Diffstat (more/less context) (ignore whitespace changes)
-rw-r--r--	meta/classes/multilib.bbclass	1+=09
1 files changed, 1 insertions, 0 deletions

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 36c52ef..17edc37 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -30,6 +30,7 @@ python multilib_virtclass_handler () {
             e.data.setVar("BASE_PACKAGE_ARCH", "${TARGET_ARCH}")
=20
     bb.data.setVar("PN", variant + "-" + bb.data.getVar("PN", e.data, Fals=
e), e.data)
+    bb.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,bb.data.getV=
ar("SHLIBSDIR",e.data,False) + "/" + variant, e.data)
     bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", e.data, False)=
 + override, e.data)
 }

Best Regards,
-Lianhao Lu


