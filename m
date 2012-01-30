Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Rrvmd-0004Be-P6
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 19:16:52 +0100
Received: from mail3-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Mon, 30 Jan 2012 16:48:11 +0000
Received: from mail3-tx2 (localhost [127.0.0.1])	by mail3-tx2-R.bigfish.com
	(Postfix) with ESMTP id A68C43801E5	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 16:48:11 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275dhz2dhc1bhc31hc1ah2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail3-tx2 (localhost.localdomain [127.0.0.1]) by mail3-tx2
	(MessageSwitch) id 132794208956079_20934;
	Mon, 30 Jan 2012 16:48:09 +0000 (UTC)
Received: from TX2EHSMHS033.bigfish.com (unknown [10.9.14.243])	by
	mail3-tx2.bigfish.com (Postfix) with ESMTP id 09475E004B	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 16:48:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS033.bigfish.com
	(10.9.99.133) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 30 Jan 2012 16:48:08 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 30 Jan 2012 10:48:07 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Machine dependencies validation with sstate
Thread-Index: AQHM327wLU9UC1fbZUa6wKg7jXw8Vw==
Date: Mon, 30 Jan 2012 16:48:06 +0000
Message-ID: <CAEsOVNdz1iFgoBa6MsanDUEgQym3-EbaBZy_rJ=om5_oYMvG4g@mail.gmail.com>
References: <1327425729.19643.113.camel@ted>
In-Reply-To: <1327425729.19643.113.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Machine dependencies validation with sstate
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
X-List-Received-Date: Mon, 30 Jan 2012 18:16:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <62D43E91C6D47142B1E89F947C48DAEF@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 11:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> rm tmp/stamps/*/*sigdata*
> MACHINE=3Dqemux86 bitbake core-image-sato -S
> find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l1
> find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l1
> MACHINE=3Dqemux86copy bitbake core-image-sato -S
> find tmp/stamps/i586-poky-linux/ -name \*sigdata* | sort > l2
> find tmp/stamps/all-poky-linux/ -name \*sigdata* | sort >> l2

I never knew about the '-S' option... that's helpful and saves a lot of tim=
e.

> and then comparing the files l1 and l2, you can see which sigdata files
> differ. Running bitbake-diffsigs on the files, e.g.:
>
> bitbake-diffsigs tmp/stamps/all-poky-linux/x11-common-0.1-r44.do_package_=
write_ipk.sigdata.*

Have you found an easy way to traverse up a dependency chain to the
initial signature? It can take a while running the above command until
you get to the *real* signature change on not just a signature change
because one of the dependencies signature changed...

Some sort of tool at this point seems to be the solution. It could do
a lot more as well. Tracking signature changes between builds would be
nice as well. The list could go on and on...

-M=



