Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TB7U5-0002wo-Ml
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 19:09:18 +0200
Received: from mail49-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.23; Mon, 10 Sep 2012 16:56:47 +0000
Received: from mail49-va3 (localhost [127.0.0.1])	by mail49-va3-R.bigfish.com
	(Postfix) with ESMTP id 6E5AF160063;
	Mon, 10 Sep 2012 16:56:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ahzz8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9hbe9i1155h)
Received: from mail49-va3 (localhost.localdomain [127.0.0.1]) by mail49-va3
	(MessageSwitch) id 1347296204343750_30582;
	Mon, 10 Sep 2012 16:56:44 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.249])	by
	mail49-va3.bigfish.com (Postfix) with ESMTP id 4F6DD10004E;
	Mon, 10 Sep 2012 16:56:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 10 Sep 2012 16:56:43 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Mon, 10 Sep 2012 11:56:42 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Phil Blundell <philb@gnu.org>
Thread-Topic: [OE-core] [PATCH 11/32] sysvinit-inittab_2.88dsf.bb: Allow
	multiple serial port consoles to be defined
Thread-Index: AQHNj3VAdzds9LzwYEuZ320iVlJd9g==
Date: Mon, 10 Sep 2012 16:56:41 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6696DB@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1344892361.git.scott.a.garman@intel.com>
	<2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
	<1347139311.4396.253.camel@x121e.pbcl.net>
In-Reply-To: <1347139311.4396.253.camel@x121e.pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/32] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 17:09:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A387681391650F4B9B581C5AD210F0B7@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 8, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2012-08-13 at 14:14 -0700, Scott Garman wrote:
>> +pkg_postinst_${PN} () {
>> +# run this on the target
>> +if [ "x$D" =3D=3D "x" ]; then
>> +     tmp=3D"${SERIAL_CONSOLES_CHECK}"
>> +     for i in $tmp
>> +     do
>> +             j=3D`echo ${i} | sed s/^.*\;//g`
>> +             if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
>> +                     sed -i /^.*${j}$/d /etc/inittab
>> +             fi
>> +     done
>> +     kill -HUP 1
>> +else
>> +     exit 1
>> +fi
>> +}
>
> This makes the package uninstallable, even if SERIAL_CONSOLES_CHECK is
> empty, on a READ_ONLY_ROOTFS.

What do you mean uninstallable? I could see this generating an error
message at each boot, but not sure what you mean about uninstallable.

-M=



