Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Rz1L7-0008Jv-Bl
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Feb 2012 08:37:45 +0100
Received: from mail32-am1-R.bigfish.com (10.3.201.240) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Sun, 19 Feb 2012 07:29:27 +0000
Received: from mail32-am1 (localhost [127.0.0.1])	by mail32-am1-R.bigfish.com
	(Postfix) with ESMTP id 8C9734053B;
	Sun, 19 Feb 2012 07:29:27 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail32-am1 (localhost.localdomain [127.0.0.1]) by mail32-am1
	(MessageSwitch) id 1329636565158334_17610;
	Sun, 19 Feb 2012 07:29:25 +0000 (UTC)
Received: from AM1EHSMHS019.bigfish.com (unknown [10.3.201.233])	by
	mail32-am1.bigfish.com (Postfix) with ESMTP id 239B02004B;
	Sun, 19 Feb 2012 07:29:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS019.bigfish.com
	(10.3.206.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 19 Feb 2012 07:29:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Sun, 19 Feb 2012 01:29:25 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] useradd: Add missing DEPEND on shadow
Thread-Index: AQHM7tg0PUQHDhYhBkusb6mkJ5e9XQ==
Date: Sun, 19 Feb 2012 07:29:24 +0000
Message-ID: <CAEsOVNfS-UvJPCR527463OzKJLvVxK7GAnwr_==Lz7sjEOsYbA@mail.gmail.com>
References: <1320883434.10843.244.camel@ted>
In-Reply-To: <1320883434.10843.244.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: useradd: Add missing DEPEND on shadow
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
X-List-Received-Date: Sun, 19 Feb 2012 07:37:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BC61D8037BFFD4439CCD73727E085AB7@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 9, 2011 at 4:03 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Without this rootfs generation fails as an RDEPENDS is added
> but the package might not have bneen built.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 8cd7f4f..7faf1a7 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -2,7 +2,7 @@
> =A0# target sysroot, and shadow -native and -sysroot provide the utilitie=
s
> =A0# and support files needed to add and modify user and group accounts
> =A0DEPENDS_append =3D "${USERADDDEPENDS}"
> -USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot"
> +USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot shadow"

The shadow recipe is a 'PACKAGE_ARCH =3D "${MACHINE_ARCH}"' recipe. This
makes all recipes that inherit useradd depend on shadow which will
depend on the MACHINE being built for. Ideally, we just need a way to
ensure these packages are deployed - we don't want them to effect
signatures.

Can you suggest a better fix here? Some
bb.exec_func("shadow:do_populate_sysroot") or something equivalent?

-M=



