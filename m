Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVU1o-0003Ct-Vf
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:11:45 +0100
Received: from mail42-am1-R.bigfish.com (10.3.201.246) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Tue, 29 Nov 2011 20:04:17 +0000
Received: from mail42-am1 (localhost [127.0.0.1])	by mail42-am1-R.bigfish.com
	(Postfix) with ESMTP id 1B51A1600C0	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 20:04:16 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail42-am1 (localhost.localdomain [127.0.0.1]) by mail42-am1
	(MessageSwitch) id 132259703625592_24490;
	Tue, 29 Nov 2011 20:03:56 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.241])	by
	mail42-am1.bigfish.com (Postfix) with ESMTP id F0B2A3C004C	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 20:03:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 29 Nov 2011 20:03:56 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Tue, 29 Nov 2011 14:04:36 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] eglibc-initial: Fix kernel headers symlink
	being wrong
Thread-Index: AQHMrtIdYVdQUcvPuEGVPKfctrXILQ==
Date: Tue, 29 Nov 2011 20:04:36 +0000
Message-ID: <CAEsOVNdrYqRqq0CP-Jf_anpo8gU7H+JK_jEEMZBTwHsL_y_qBQ@mail.gmail.com>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
	<CAMKF1srHXnMOHHVBsQ_1HrketEJZEcjRnFWgYaK-Zk3kZb-WMQ@mail.gmail.com>
In-Reply-To: <CAMKF1srHXnMOHHVBsQ_1HrketEJZEcjRnFWgYaK-Zk3kZb-WMQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] eglibc-initial: Fix kernel headers symlink being wrong
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
X-List-Received-Date: Tue, 29 Nov 2011 20:11:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <23C80373EB0C164A94660075605528E7@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 1:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> =A0 =A0 =A0 =A0# add links to linux-libc-headers: gcc-{cross,crossdk}-in=
termediate need this.
>> =A0 =A0 =A0 =A0for t in linux asm asm-generic; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -s ${STAGING_DIR_TARGET}${includedir}/$=
t ${D}${includedir}/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp -ar ${STAGING_DIR_TARGET}${includedir}/=
$t ${D}${includedir}/
>
> thinking a bit more I think just doing ln -sf might be another option
> instead of doing ln -s
> will avoid copying.

Richard's new approach was sort of more along the lines of what I was
thinking. It's essentially fixing the symlinks after we deploy from
sstate-cache. I don't think (correct me if I'm wrong) this step above
will get run when deploying from sstate-cache.

-M=



