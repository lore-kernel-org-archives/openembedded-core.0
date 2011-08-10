Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qr7KD-0006Gb-5D
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 13:51:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2011 04:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,350,1309762800"; d="scan'208";a="37098998"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2011 04:47:21 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 10 Aug 2011 19:47:05 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 10 Aug 2011 19:47:04 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 10 Aug 2011 19:47:03 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 19:47:02 +0800
Thread-Topic: [RFC Bug #892] Putting siteconfig cache files into ROOTFS
Thread-Index: AcxXUzge7F626BbKQc29Dv4H5XKSiQ==
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2FA76753AC@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: [RFC Bug #892] Putting siteconfig cache files into ROOTFS
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
X-List-Received-Date: Wed, 10 Aug 2011 11:51:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

When trying to fix bug #892(http://bugzilla.pokylinux.org/show_bug.cgi?id=
=3D892), I met some problems in generating the default site config files us=
ed by cross-canadian toolchain.

When using autoconf for cross-compile, it is impossible to check features t=
hat require running a test program. We should set those values in a file an=
d have the environment variable CONFIG_SITE set to that file, so the autoco=
nf can run correctly for cross-compiling. That's why the 2 recipes meta-too=
lchain.bb and meta-environment.bb set the CONFIG_SITE environment variable =
in relevant environment files. Both of them use the function siteinfo_get_f=
iles() defined in siteinfo.bbclass.

The function siteinfo_get_files() is designed to get the default site confi=
g files for the target system. It collects site config files from 2 places,=
 one is the "site" subdirectory of each BBPATH, the other is from SITECONFI=
G_SYSROOT_CACHE where each package will put their own site config cache fil=
e during their populate-sysroot task respectively.=20

Here we have a problem with meta-environment/meta-toolchain recipe. When me=
ta-environment/meta-toolchain try to call siteinfo_get_files(), there is no=
 way to guarantee that all other packages have finished their populate-sysr=
oot tasks and have put their site config cache files into the SITECONFIG_SY=
SROOT_CACHE. So the value returned by siteinfo_get_files() might differ fro=
m time to time depends on what other packages have been built before "bitba=
ke meta-toolchain".

When the user try to cross-compile an application using cross-canadian tool=
chain we provide, we now encourage the user to use the same rootfs for both=
 running and cross-compiling. So I'm thinking of copying those site config =
cache files in SITECONFIG_SYSROOT_CACHE into the rootfs, and have the CONFI=
G_SITE in the relevant environment file point to those site config cache fi=
les in the rootfs, something like:

    export CONFIG_SITE=3D"${POKY_TARGET_SYSROOT}/usr/share/site-config-i586=
-poky-linux"

Any comments?

Best Regards,
-Lianhao


