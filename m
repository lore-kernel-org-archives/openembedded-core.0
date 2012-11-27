Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TdRuT-0005Qj-TT
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 21:37:38 +0100
Received: from mail249-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.23; Tue, 27 Nov 2012 20:08:15 +0000
Received: from mail249-va3 (localhost [127.0.0.1])	by
	mail249-va3-R.bigfish.com (Postfix) with ESMTP id C1091C800FA;
	Tue, 27 Nov 2012 20:08:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(zz98dI9371I1432Izz1de0h1202h1d1ah1d2ahzz8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh162dh1631hbe9i15d0l1155h)
Received: from mail249-va3 (localhost.localdomain [127.0.0.1]) by mail249-va3
	(MessageSwitch) id 1354046894376315_11661;
	Tue, 27 Nov 2012 20:08:14 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.242])	by
	mail249-va3.bigfish.com (Postfix) with ESMTP id 5976BC00143;
	Tue, 27 Nov 2012 20:08:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 27 Nov 2012 20:08:11 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Tue, 27 Nov 2012 20:08:11 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] gcc-cross: Explicitly depend on
	linux-libc-headers
Thread-Index: AQHNzNrs7HL96ZXfMke/w8NoAZ6wMw==
Date: Tue, 27 Nov 2012 20:08:10 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7AE107@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1353620179.10459.59.camel@ted>
In-Reply-To: <1353620179.10459.59.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
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
X-List-Received-Date: Tue, 27 Nov 2012 20:37:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CC335EE610CA6F48BAA5709CD547CD4C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 3:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> gcc-cross cannot build without linux-libc-headers but doesn't explicitly =
depend on
> it relying on the implied dependency through libc. With cases where piece=
s
> can be installed through sstate, we now need this explicit dependency to
> ensure builds with partial sstate work.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 6d160d6..cde08ee 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -1,6 +1,6 @@
>  inherit cross
>
> -DEPENDS =3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}li=
bc-for-gcc ${NATIVEDEPS}"
> +DEPENDS =3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}li=
bc-for-gcc linux-libc-headers ${NATIVEDEPS}"

How would you suggest not forcing a rebuild of all components if the
linux headers signature changes? During our normal development we
change Linux headers for things that would in no way effect gcc or
even libc. It's painful to watch a complete rebuild occur because of
this.

Just have a different recipe for headers for some components?

-M=



