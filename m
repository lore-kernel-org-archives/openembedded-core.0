Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SADYy-0003nG-DO
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 05:54:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Mar 2012 21:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="79838651"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2012 21:45:26 -0700
Received: from azsmsx602.amr.corp.intel.com (10.2.121.201) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 20 Mar 2012 21:45:25 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx602.amr.corp.intel.com (10.2.121.201) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 20 Mar 2012 21:45:24 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 12:45:23 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: packaging errors in some -nativesdk recipes
Thread-Index: Ac0HHWvwq+xU/ZyDTe6QMN5WwLPrJA==
Date: Wed, 21 Mar 2012 04:45:22 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD0349C@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: packaging errors in some -nativesdk recipes
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
X-List-Received-Date: Wed, 21 Mar 2012 04:54:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

When I'm looking at some package warnings of eglibc-nativesdk(and some othe=
r -nativesdk packages' warnings), e.g.

WARNING: For recipe eglibc-nativesdk, the following files/directories were =
installed but not shipped in any package:
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/lib/libthre=
ad_db.so.1
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/lib/libnss_=
hesiod-2.13.so
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/lib/libSegF=
ault.so
...... ......

I found this has something to do with the usage of PKGSUFFIX in eglibc-pack=
age.inc:

PKGSUFFIX =3D ""
PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
FILES_eglibc-thread-db${PKGSUFFIX} =3D "${base_libdir}/libthread_db.so.* ${=
base_libdir}/libthread_db-*.so"

Instead of the variable FILES_eglibc-thread-db-nativesdk being defined, the=
 variable FILES_eglibc-thread-db gets defined after parsing the eglib-nativ=
esdk recipe, so many files are not packaged in relevant -nativesdk packages=
. This is because in the functioin finalize() of ast.py in bitbake, it firs=
t calls expandKeys() then update_data(), while the OVERRIDES only takes pla=
ce in the function of update_data().=20

I saw in the git history there was a commit to fix this issue at http://git=
.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/eglibc/eglibc=
-package.inc?id=3Df800862555b81dec65f3de09a2f7b1a0c97a09c1, but later was r=
everted by the commit http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit=
/meta/recipes-core/eglibc/eglibc-package.inc?id=3D2a7870778f141b2f29271405e=
e62b06cc4856920.=20

Any suggestions of how to resolve this issue? We're not 100% sure if we can=
 change the sequence of calling expandKeys() and update_data() in the final=
ize() in ast.py in bitbake without causing any other problems.

Best Regards,
-Lianhao


