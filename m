Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QMTrR-0000of-Oz
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 01:39:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 16:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,228,1304319600"; 
   d="scan'208";a="51667"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2011 16:36:38 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 May 2011 07:36:35 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 18 May 2011 07:36:34 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2011 07:36:33 +0800
Thread-Topic: [OE-core] [RFC][v2] [PATCH 1/1] package-index.bb: add support
	for deb and rpm.
Thread-Index: AcwUsSGVt1ZJZLL3SLi5hqrEe6GwxwAOPB6A
Message-ID: <1865303E0DED764181A9D882DEF65FB694322A3FCE@shsmsx502.ccr.corp.intel.com>
References: <cover.1305279161.git.dexuan.cui@intel.com>
	<abd335f0e36fe2a96316b77d5e04e00b8ddb4ea9.1305279161.git.dexuan.cui@intel.com>
	<1305650390.3424.267.camel@rex>
In-Reply-To: <1305650390.3424.267.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [RFC][v2] [PATCH 1/1] package-index.bb: add support for deb and rpm.
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
X-List-Received-Date: Tue, 17 May 2011 23:39:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> Hi Dexuan,
>=20
> When I read Saul's original emails I thought this approach would work
> although it wasn't the first one that came to my mind.
>=20
> Looking at the code you have, the problem is you have nowhere you can
> call the "addtask" for the individual tasks and we don't want to the
> overhead system wide for every recipe as it makes no sense.
Yes, I realized this later.

> I'd therefore like to suggest we tweak this approach a little. Each
> package_xxx.bbclass defines a function which updates the index for
> that packaging backend:
I agree. I've actually made a patch in branch dcui/package-index, but the b=
elow implementation you suggested is obviously much better! :-)
Thank you very much for the detailed suggestion!

> package_ipk.bbclass:
>=20
> PACKAGEINDEXES +=3D "package_index_ipk();"
> PACKAGEINDEXDEPS +=3D "opkg-utils-native:do_populate_sysroot"
> PACKAGEINDEXDEPS +=3D "opkg-native:do_populate_sysroot"
> package_index_ipk[dirs] =3D "${DEPLOY_DIR_IPK}"
>=20
> package_index_ipk() {
>        set -ex
>        package_update_index_ipk
>        set +ex
> }
>=20
> The key is the addition to the PACKAGEINDEXES variable and its
> dependencies in PACKAGEINDEXDEPS.
>=20
> In package-index.bb we can then just have:
>=20
> do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}"
>=20
> do_package_index() {
> 	${PACKAGEINDEXES}
> }
>=20
> and these variables should always have the things we need in them
> depending on the package backends available.
>=20
> Ideally we should cover the case there is no package backend enabled
> and just return too rather than error (or bbwarn "No package backends
> enabled, doing nothing").
Oh, I didn't realize this... I'll remember to handle this, too.

Thanks,
-- Dexuan=


