Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RApx5-0001xO-DP
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:21:32 +0200
Received: from mail16-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 21:15:58 +0000
Received: from mail16-tx2 (localhost.localdomain [127.0.0.1])	by
	mail16-tx2-R.bigfish.com (Postfix) with ESMTP id 031AEEB8291	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:15:58 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail16-tx2 (localhost.localdomain [127.0.0.1]) by mail16-tx2
	(MessageSwitch) id 1317676488190262_9518;
	Mon,  3 Oct 2011 21:14:48 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.248])	by
	mail16-tx2.bigfish.com (Postfix) with ESMTP id 711C39C8081	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 21:12:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 21:12:00 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 16:12:00 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate_clean() overzealous?
Thread-Index: AQHMghEWByaZDBNudkeuZ/nyp+AU3Q==
Date: Mon, 3 Oct 2011 21:11:59 +0000
Message-ID: <CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
References: <1317660469.13337.16.camel@phil-desktop>
In-Reply-To: <1317660469.13337.16.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Mon, 03 Oct 2011 21:21:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3740AC1B94B4FA408F75B1E2BA90E409@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 11:47 AM, Phil Blundell <philb@gnu.org> wrote:
> The sstate_clean() function in sstate.bbclass is doing (inter alia):
>
> =A0 =A0stfile =3D d.getVar("STAMP", True) + ".do_" + ss['task']
> =A0 =A0[...]
> =A0 =A0oe.path.remove(stfile + ".*")
> =A0 =A0oe.path.remove(stfile + "_setscene" + ".*")
>
> which means that, for tasks which set the stamp-extra-info flag to
> ${MACHINE}, it ends up blowing away the stamps for all machines rather
> than just the current one. =A0The net effect of this seems to be that
> there is no way to have the setscene stamps populated for more than one
> MACHINE at any time, and hence all those tasks get rerun every time you
> change MACHINE even if nothing else has been altered.
>
> Is this behaviour deliberate? =A0It is certainly a little bit annoying bu=
t
> I don't understand the internals of sstate well enough to judge what
> exactly that glob is trying to accomplish.

I've noticed that changing the MACHINE will also invalidate the
-native stuff as well.

-M=



