Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qdhub-0006gz-LY
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 14:06:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2011 05:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="22441203"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2011 05:02:07 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 4 Jul 2011 20:02:07 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 4 Jul 2011 20:02:06 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Mon, 4 Jul 2011
	20:02:05 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2011 20:02:04 +0800
Thread-Topic: [OE-core] The swap partition's size is too big for BSP?
Thread-Index: Acw6P/scylMo+61fR+il+Eqs2FltzAAARIxA
Message-ID: <1865303E0DED764181A9D882DEF65FB6A20949386F@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A200B1C93F@shsmsx502.ccr.corp.intel.com>
	<1309779592.20015.661.camel@rex>
In-Reply-To: <1309779592.20015.661.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: The swap partition's size is too big for BSP?
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
X-List-Received-Date: Mon, 04 Jul 2011 12:06:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Mon, 2011-07-04 at 13:35 +0800, Cui, Dexuan wrote:
>> In meta/recipes-core/initrdscripts/files/init-install.sh, we have
>>=20
>> # 5% for the swap
>> swap_ratio=3D5               # dexuan: this variable is not used at
>> all! ...=20
>> swap_size=3D$((disk_size*5/100))
>>=20
>> This algorithm seems too wasty -- e.g., for a CrownBay box with a
>> 160GB disk, we would create a 8GB swap partition while the box has
>> only 1GB memory. =20
>>=20
>> What's the proper swap size?
>> This link http://www.cyberciti.biz/tips/linux-swap-space.html
>> discussed this and I think the below algorithm seems suitable for
>> us: =20
>>=20
>> Systems with 2GB of ram or less require the same size of swap space
>> Systems with 2GB to 4GB of ram require a minimum of 2GB of swap space
>> Systems with 4GB to 16GB of ram require a minimum of 4GB of swap
>> space=20
>> Systems with 16GB to 64GB of ram require a minimum of 8GB of swap
>> space=20
>> Systems with 64GB to 256GB of ram require a minimum of 16GB of swap
>> space=20
>>=20
>> Any comment?
>=20
> Looks like a much better idea to me, I'll take patches :)
Ok, I'll try to make a patch for this algorithm.

> For reference if you want to do suspend to disk (swap) you need a lot
> of swap space btw. Still no where near that much though!
Does (or should )Yocto Linux support suspend-to-disk? I'm not sure about th=
is.
BTW: Linux can alse use a regular file as swap area.
So in case the swap size is not enough (e.g., for suspend-to-disk), I think=
 a user could create a big enough file  to meet the need (I didn't test thi=
s with Linux yet).

Thanks,
-- Dexuan=


