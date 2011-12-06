Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXkYe-00050f-Fj
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:15:01 +0100
Received: from mail195-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Dec 2011 02:08:13 +0000
Received: from mail195-ch1 (localhost [127.0.0.1])	by
	mail195-ch1-R.bigfish.com (Postfix) with ESMTP id 76080540251;
	Tue,  6 Dec 2011 01:10:46 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail195-ch1 (localhost.localdomain [127.0.0.1]) by mail195-ch1
	(MessageSwitch) id 1323133844392301_7270;
	Tue,  6 Dec 2011 01:10:44 +0000 (UTC)
Received: from CH1EHSMHS013.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail195-ch1.bigfish.com (Postfix) with ESMTP id
	5B2612C0043;	Tue,  6 Dec 2011 01:10:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS013.bigfish.com
	(10.43.70.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Dec 2011 02:08:10 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Mon, 5 Dec 2011 20:08:10 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] do_populate_lic_setscene when building LSB on edison
Thread-Index: AQHMsrTI+sIH3mCgFEC3XmCMc1OGDZXNUMqAgAEmD4A=
Date: Tue, 6 Dec 2011 02:08:09 +0000
Message-ID: <CAEsOVNeozRGrQnE2tsfEs_Ei2g3XzrP73VpQOYou18p17wSdQg@mail.gmail.com>
References: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
	<1323074115.25960.88.camel@ted>
In-Reply-To: <1323074115.25960.88.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: do_populate_lic_setscene when building LSB on edison
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 06 Dec 2011 02:15:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <445C3882AC91A549B25EB613D9CB3150@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2011 at 2:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2011-12-04 at 18:44 +0000, McClintock Matthew-B29882 wrote:
>> Can anyone comment if this issue has been resolved on master? It's
>> very random which package it occurs on, it only seems to happen when
>> building the LSB target, and it also appears to happen on my CentOS 5
>> box and not my Ubuntu box (at least less often)... sometimes it
>> happens only on one package in a build, sometimes it's 5-10
>> packages...
>>
>> ERROR: Task 3209
>> (/opt/yocto/cache-test/p2041rdb/meta/recipes-graphics/freetype/freetype_=
2.4.6.bb,
>> do_populate_lic_setscene) failed with exit code '1'
>
> What do the logfiles in the workdir/temp directories say for these
> tasks?

This is my own doing.

Basically what is going on is I switched sstate-cache to use xz
instead of gzip. Well what happens is when I come along and install
xz-native, then stuff starts failing because we are running xz from
sysroot instead of host and briefly all the librarys for xz are not in
place so it fails with:

xz: error while loading shared libraries: liblzma.so.5: cannot open
shared object file: No such file or directory

Is this a situation where it's just to just install this package
beforehand like we do for tar and pseudo?

-M=



