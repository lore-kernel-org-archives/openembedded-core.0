Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RbEBy-0001qi-12
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 17:29:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Dec 2011 08:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="86938537"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 08:22:25 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Dec 2011 00:20:28 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 16 Dec 2011 00:20:28 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 16 Dec 2011 00:20:27 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 00:20:26 +0800
Thread-Topic: [OE-core] [PATCH 4/9] consolekit: fix sdk generation issues
Thread-Index: Acy7OiEqPcvpFWkBTZ+CLCe2IIp1TwAChnLA
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA436A83B6@shsmsx502.ccr.corp.intel.com>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
	<1323961117.4568.41.camel@ted>
In-Reply-To: <1323961117.4568.41.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 15 Dec 2011 16:29:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-12-15:
> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>> Currently sdk generation might fail with the following error:
>> | Collected errors:
>> |  * extract_archive: Cannot create symlink from ./var/log to
>> 'volatile/log': File exists.
>> ERROR: Function 'do_populate_sdk' failed
>>=20
>> This happens as consolekit package will include both
>> /var/log/ConsoleKit and /var/volatile/log/ConsoleKit files:
>> lumag@fangorn:~/OE-scripts$ dpkg-deb -c
> build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  |
> grep var
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/ drwxr-xr-x
>> root/root         0 2011-12-07 22:12 ./var/log/ drwxr-xr-x root/root  =20
>>      0 2011-12-07 22:12 ./var/log/ConsoleKit/ lrwxrwxrwx root/root    =20
>>    0 2011-12-07 22:12 ./var/run -> volatile/run drwxr-xr-x root/root  =20
>>      0 2011-12-07 22:12 ./var/volatile/ drwxr-xr-x root/root         0
>> 2011-12-07 22:12 ./var/volatile/log/ drwxr-xr-x root/root         0
>> 2011-12-07 22:12 ./var/volatile/log/ConsoleKit/ drwxr-xr-x root/root  =20
>>      0 2011-12-07 22:12 ./var/volatile/run/ drwxr-xr-x root/root      =20
>>  0 2011-12-07 22:12 ./var/volatile/run/ConsoleKit/
>>=20
>> Inclusion of both log directories causes this error. Drop the
>> /var/log/ConsoleKit in favour of /var/volatile/log
Hi Dmitry,
Could you please explain how and where the extract_archive error is caused?
Where is /var/log linked to /var/volatile/log?

Do you mean RP's patch "consolekit: Fix ${localstatedir} race" didn't fix t=
he issue?
(I suspect so)
=20
> This effectively reverts:
> http://git.openembedded.org/openembedded-core/commit/?id=3D5608a748
> af2c754f60137ab7c3010ccce6bf9e40 so I think this fixes one problem at
> the expense of causing another. Koen: Any comments?

Thanks,
-- Dexuan




