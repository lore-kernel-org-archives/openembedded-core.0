Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2T8d-0000A7-19
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 21:59:39 +0100
Received: from mail58-am1-R.bigfish.com (10.3.201.240) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Mon, 4 Feb 2013 20:13:44 +0000
Received: from mail58-am1 (localhost [127.0.0.1])	by mail58-am1-R.bigfish.com
	(Postfix) with ESMTP id 4C50060127;
	Mon,  4 Feb 2013 20:13:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 12
X-BigFish: VS12(z49a8vz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail58-am1 (localhost.localdomain [127.0.0.1]) by mail58-am1
	(MessageSwitch) id 1360008822882023_4022;
	Mon,  4 Feb 2013 20:13:42 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.236])	by
	mail58-am1.bigfish.com (Postfix) with ESMTP id CAC2C2E004F;
	Mon,  4 Feb 2013 20:13:42 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 4 Feb 2013 20:13:42 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Mon, 4 Feb 2013 20:13:41 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use
	CC to form KERNEL_CC
Thread-Index: AQHOAxQgkNK9RzoTv0aD6xHtf1I1vw==
Date: Mon, 4 Feb 2013 20:13:41 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A86C5F5@039-SN1MPN1-002.039d.mgd.msft.net>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
In-Reply-To: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Mon, 04 Feb 2013 20:59:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1F262F1BD6BFF049860B72CFE10B0090@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2013 at 4:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> kernel compiler is not special and we currently have it so
> we want to pass -march and -mtune options as CFLAGS to kernel
> build so that compiler picks the right subarch flags when
> compiling assembly files in particular. Otherwise defaults
> are chosen which may not be right in many case e.g. when
> compiling kernel for collie machine we should use arch=3Darmv4
> but it uses toolchain/as defaults which is armv5te
>
> in some case e.g. thumb1 we know that kernel can not be compiled
> in thumb1 mode so we can provide that information e.g. -marm
> option through KERNEL_HOST_CC_ARCH variable as we do now
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel-arch.bbclass |   13 +++++++++++++
>  meta/classes/kernel.bbclass      |   16 +---------------
>  meta/classes/module-base.bbclass |   16 ----------------
>  3 files changed, 14 insertions(+), 31 deletions(-)
>
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.=
bbclass
> index b3b78b6..a51e82b 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -43,3 +43,16 @@ def map_uboot_arch(a, d):
>
>  export UBOOT_ARCH =3D "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
>
> +# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
> +# specific options necessary for building the kernel and modules.
> +TARGET_CC_KERNEL_ARCH ?=3D ""
> +HOST_CC_KERNEL_ARCH ?=3D "${TARGET_CC_KERNEL_ARCH}"
> +TARGET_LD_KERNEL_ARCH ?=3D ""
> +HOST_LD_KERNEL_ARCH ?=3D "${TARGET_LD_KERNEL_ARCH}"
> +TARGET_AR_KERNEL_ARCH ?=3D ""
> +HOST_AR_KERNEL_ARCH ?=3D "${TARGET_AR_KERNEL_ARCH}"
> +
> +KERNEL_CC =3D "${CC} ${HOST_CC_KERNEL_ARCH}"

Why change to ${CC} from "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX}?

It breaks some kernel builds we have...

-M=



