Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SpXZn-0005Og-Kf
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 06:34:01 +0200
Received: from mail127-va3-R.bigfish.com (10.7.14.249) by
	VA3EHSOBE012.bigfish.com (10.7.40.62) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 03:37:23 +0000
Received: from mail127-va3 (localhost [127.0.0.1])	by
	mail127-va3-R.bigfish.com (Postfix) with ESMTP id 6EC9F1600DC;
	Fri, 13 Jul 2012 03:37:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zzbb2dI98dI9371I542M1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ahbe9i)
Received: from mail127-va3 (localhost.localdomain [127.0.0.1]) by mail127-va3
	(MessageSwitch) id 1342150641844262_9886;
	Fri, 13 Jul 2012 03:37:21 +0000 (UTC)
Received: from VA3EHSMHS041.bigfish.com (unknown [10.7.14.236])	by
	mail127-va3.bigfish.com (Postfix) with ESMTP id CA056E0088;
	Fri, 13 Jul 2012 03:37:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS041.bigfish.com
	(10.7.99.51) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 03:37:21 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.250]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Thu, 12 Jul 2012 22:37:21 -0500
From: Liu Ting-B28495 <B28495@freescale.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] lsof: define linux C library type when using
	eglibc
Thread-Index: AQHNX/YElAMCie4Vl0KjIbhHPCIda5cmXZcAgAAl0eCAAAuw0A==
Date: Fri, 13 Jul 2012 03:37:19 +0000
Message-ID: <AF604684617F454390621992F367F1690119F903@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1342073846-23047-1-git-send-email-b28495@freescale.com>
	<4FFF25EC.70002@linux.intel.com> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.96]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>
Subject: Re: [PATCH] lsof: define linux C library type when using eglibc
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
X-List-Received-Date: Fri, 13 Jul 2012 04:34:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: Liu Ting-B28495=20
Sent: Friday, July 13, 2012 10:47 AM
To: 'Saul Wold'; Patches and discussions about the oe-core layer
Cc: McClintock Matthew-B29882
Subject: RE: [OE-core] [PATCH] lsof: define linux C library type when using=
 eglibc

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]
Sent: Friday, July 13, 2012 3:31 AM
To: Patches and discussions about the oe-core layer
Cc: Liu Ting-B28495; McClintock Matthew-B29882
Subject: Re: [OE-core] [PATCH] lsof: define linux C library type when using=
 eglibc

On 07/11/2012 11:17 PM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> lsof tries to compile a temp c source file and execute the binary to=20
> determine linux C library type (file Configure, line 2689-2717).
> It is inpracticable for cross-compilation and may have build issue on=20
> some distros since it depends on host settings.
>
> Fix below error when building for 64bit target on 64bit host:
> [...]
> | dsock.c:481:44: error: 'TCP_LISTEN' undeclared (first use in this
> | function)
> | dsock.c:482:45: error: 'TCP_CLOSING' undeclared (first use in this
> | function)
> [...]
> | make: *** [dsock.o] Error 1
>
> The actual issue exists in do_configure:
> [...]
> Testing C library type with cc ... done Cannot determine C library=20
> type; assuming it is not glibc.
>
> Which is in turn caused by missing 'gnu/stubs-32.h" when compiling the=20
> temp c source file on host:
> [...]
> fatal error: gnu/stubs-32.h: No such file or directory compilation termin=
ated.
>
> file gnu/stubs-32.h is provided by 32bit glibc.
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   meta/recipes-extended/lsof/lsof_4.85.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/lsof/lsof_4.85.bb
> b/meta/recipes-extended/lsof/lsof_4.85.bb
> index 5823725..d28d2cb 100644
> --- a/meta/recipes-extended/lsof/lsof_4.85.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.85.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Lsof is a Unix-specific diagnostic tool.=
 \
>   Its name stands for LiSt Open Files, and it does just that."
>   SECTION =3D "devel"
>   LICENSE =3D "BSD"
> -PR =3D "r1"
> +PR =3D "r2"
>
>   SRC_URI =3D "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.=
tar.bz2"
>
> @@ -31,6 +31,11 @@ export LSOF_INCLUDE =3D "${STAGING_INCDIR}"
>   do_configure () {
>   	export LSOF_AR=3D"${AR} cr"
>   	export LSOF_RANLIB=3D"${RANLIB}"
> +        if [ "x${EGLIBCVERSION}" !=3D "x" ];then
> +                LINUX_CLIB=3D${EGLIBCVERSION/\./}
> +                LINUX_CLIB=3D"-DGLIBCV=3D${LINUX_CLIB}"
Does this really do what you intent it to?

why not set the EGLIBCVERSION directly on the second line, what's the purpo=
se of the /\./?  It renders the version empty in my tests.

Sau!

[Liu Ting-B28495] LINUX_CLIB is set to "-DGLIBCV=3D213" when lsof can figur=
e out the right Linux c library type. String 213 corresponds to the eglibc =
version 2.13. the purpose of /\./ is to get rid of '.'.
Here is my test:
-bash-3.2$ EGLIBCVERSION=3D"2.13"
-bash-3.2$ echo ${EGLIBCVERSION/\./}
213
-bash-3.2$

[Liu Ting-B28495] ok, I find why it renders the version empty:
In temp/run.configure:
....
export BUILD_STRIP=3D"strip"
do_configure() {
        if [ "x2.13" !=3D "x" ];then
                LINUX_CLIB=3D${EGLIBCVERSION/\./}
                LINUX_CLIB=3D"-DGLIBCV=3D${LINUX_CLIB}"
                export LINUX_CLIB
        fi
        yes | ./Configure linux

}

Variable EGLIBCVERSION is expanded instead of exported.=20




