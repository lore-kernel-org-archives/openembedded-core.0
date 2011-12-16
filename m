Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RbN9X-0002OB-DZ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 03:04:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 17:57:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87129582"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 17:57:02 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Dec 2011 09:56:58 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Dec 2011 09:56:58 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 16 Dec 2011 09:56:57 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Fri, 16 Dec 2011 09:56:55 +0800
Thread-Topic: [OE-core] [PATCH 4/9] consolekit: fix sdk generation issues
Thread-Index: Acy7Ozm505m5perrQPG/Hxt3suP9ywAWnYRA
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA436A84A5@shsmsx502.ccr.corp.intel.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
	<1323961117.4568.41.camel@ted>
	<8A9F3915-1804-4B78-A84C-5721FFD6E5FB@dominion.thruhere.net>
In-Reply-To: <8A9F3915-1804-4B78-A84C-5721FFD6E5FB@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 4/9] consolekit: fix sdk generation issues
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
X-List-Received-Date: Fri, 16 Dec 2011 02:04:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on 2011-12-15:
>=20
> Op 15 dec. 2011, om 15:58 heeft Richard Purdie het volgende geschreven:
>=20
>> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>>> Currently sdk generation might fail with the following error:
>>> | Collected errors:
>>> |  * extract_archive: Cannot create symlink from ./var/log to
>>> 'volatile/log': File exists.
>>> ERROR: Function 'do_populate_sdk' failed
>>>=20
>>> This happens as consolekit package will include both=20
>>> /var/log/ConsoleKit and /var/volatile/log/ConsoleKit files:
>>> lumag@fangorn:~/OE-scripts$ dpkg-deb -c
> build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  |=20
> grep var
>>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/ drwxr-xr-x
>>> root/root         0 2011-12-07 22:12 ./var/log/ drwxr-xr-x root/root =20
>>>       0 2011-12-07 22:12 ./var/log/ConsoleKit/ lrwxrwxrwx root/root  =20
>>>      0 2011-12-07 22:12 ./var/run -> volatile/run drwxr-xr-x root/root
>>>         0 2011-12-07 22:12 ./var/volatile/ drwxr-xr-x root/root      =20
>>>  0 2011-12-07 22:12 ./var/volatile/log/ drwxr-xr-x root/root         0
>>> 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/ drwxr-xr-x root/root =20
>>>       0 2011-12-07 22:12 ./var/volatile/run/ drwxr-xr-x root/root    =20
>>>    0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/
>>>=20
>>> Inclusion of both log directories causes this error. Drop the=20
>>> /var/log/ConsoleKit in favour of /var/volatile/log
>>>=20
>>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>>=20
>> This effectively reverts:
>>=20
> http://git.openembedded.org/openembedded-core/commit/?id=3D5608a748
> af2c7
>> 54f60137ab7c3010ccce6bf9e40 so I think this fixes one problem at the=20
>> expense of causing another.
>> Koen: Any comments?
>=20
> If you revert it consolekit won't work at runtime because it fails to sta=
rt.
We need to find the proper fix.
meta-toolchain-gmae building (at least with ipk packaging) has been broken =
by this for half a month...

Thanks,
-- Dexuan




