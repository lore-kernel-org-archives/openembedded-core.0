Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SG43Y-0006jU-IP
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 09:58:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Apr 2012 00:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127806189"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 06 Apr 2012 00:48:50 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 6 Apr 2012 00:48:50 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 15:48:48 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] Do we have a package that installs the kernel
	headers and config into the target?
Thread-Index: Ac0TpDNglZsuvcTWTNSj8hhUp7EH6P//g5AA//9u5YCAALYcAP//ZSGg
Date: Fri, 6 Apr 2012 07:48:47 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
	<4F7E881E.1000106@linux.intel.com>
In-Reply-To: <4F7E881E.1000106@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Fri, 06 Apr 2012 07:58:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2012-04-06:
> On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
>> Darren Hart wrote on 2012-04-06:
>>> On 04/05/2012 08:20 PM, Cui, Dexuan wrote:
>>>> In a typical Linux distribution, there is a build link(or directory)
>>>> that specifies the directory where the kernel headers and kernel confi=
g
>>>> are put.
>>>>=20
>>>> E.g. in my Ubuntu 11.04, a package linux-headers-2.6.38-8-generic
>>> installs .config, include/ and Kconfig into
>>> /usr/src/linux-headers-2.6.38-8-generic/ and makes a link
>>> /lib/modules/2.6.38-8-generic/build to point to the directory.
>>>>=20
>>>> However, looks in Yocto, we don't have such a package? Do we have a
>>>> plan to add it?
>>>>=20
>>>> I'm asking the question because in the ESDC contest, the students foun=
d in
>>> Yocto they couldn't build the wifi driver's source code that was
>>> downloaded from realtek.com:
>>>=20
>>> http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=3D1&PFid=
=3D4
>>>=20
> 8&Level=3D5&Conn=3D4&ProdID=3D226&DownTypeID=3D3&GetDown=3Dfalse&Download=
s
> =3Dtrue
>>>> In Ubuntu, they can build the driver fine.
>>>=20
>>> There is an open bug:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1614
>>=20
>> Glad to know this is a know bug.
>> I personally think it would be pretty nice if we can fix this bug soon
>> since the students are being frustrated by this...
>>=20
>> And, in the Build Appliance (self-hosted-image) work, we want to
>> enable the vmware guest's VMware Tools. This also requires the ability
>> to build kernel module in the target.
>>=20
>=20
> While I understand there are valid use cases, I think this is generally
> contrary to workflow of the project. We build the OS, it runs on the
> target. This is building a general purpose OS, and then having it build
> itself out more. It doesn't feel like an embedded workflow.
I totally agree with you.

Unluckily we'll have to face an imperfect world:
E.g., in the ESDC contest, after the students boot the board with
Yocto Linux, they attach a Realtek wifi device and try to build and
install the driver.

What's bad is: the driver's source code is not integrated into the
upstream linux. The students can only run a makefile of the driver
tarball to build the driver.  To the students' surprise, there is no
kernel headers in the running Yocto linux! :-(

Surely, the "standard" way is: we should write a recipe to
cross-compile and install the driver. But this is difficult to the
students:
1) They're not familiar with Poky at all, and actually the downloaded
wifi driver's code here seems indeed complex.

2) The students only have limited time so they intend to spend
most of the time on things that could make them win a prize or
money. :-)
So this actually makes Yocto less appealing to them though the
goal of Yocto is making developing on embedded easy...

> That said, there are valid use cases, but I don't consider this a
> particularly high priority at the moment. I'm happy to hear other
> thoughts on why this should be bumped in prio though.
Currently I have suggested them that they should manually copy
The kernel headers and .config into the target.
Hope this can work around the issue for them.

Thanks,
-- Dexuan




