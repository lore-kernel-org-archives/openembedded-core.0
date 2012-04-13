Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SInhk-0006B4-5X
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 23:06:52 +0200
Received: from mail170-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Apr 2012 20:57:30 +0000
Received: from mail170-va3 (localhost [127.0.0.1])	by
	mail170-va3-R.bigfish.com (Postfix) with ESMTP id 2E8CA1C03C6	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 20:57:30 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zzbb2dI9371I936eK1432N98dKb922lzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail170-va3 (localhost.localdomain [127.0.0.1]) by mail170-va3
	(MessageSwitch) id 1334350648704598_16315;
	Fri, 13 Apr 2012 20:57:28 +0000 (UTC)
Received: from VA3EHSMHS027.bigfish.com (unknown [10.7.14.237])	by
	mail170-va3.bigfish.com (Postfix) with ESMTP id A21D9160050	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 20:57:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS027.bigfish.com
	(10.7.99.37) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Apr 2012 20:57:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.132]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 13 Apr 2012 15:57:25 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2] gcc-4.6: Add fix for relocation problem
	and ccache
Thread-Index: AQHNGbgGgjcaWxaVa0iU1mvH3XOoIA==
Date: Fri, 13 Apr 2012 20:57:24 +0000
Message-ID: <CAEsOVNeScLQ-GP0vi_J3feti4BgH0RsoJiweNjYQakGOcNqFHg@mail.gmail.com>
References: <1334318173.7309.70.camel@ted> <1334322828.7309.73.camel@ted>
In-Reply-To: <1334322828.7309.73.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCHv2] gcc-4.6: Add fix for relocation problem and ccache
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
X-List-Received-Date: Fri, 13 Apr 2012 21:06:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8398F35748C1F04EB6CD286BCA700AA6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

I suspect this would effect 1.1.2.

-M

On Fri, Apr 13, 2012 at 8:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If the toolchain is reused from sstate and ccache is installed, build fai=
lures
> were occuring due to gcc trying to access the original sysroot rather tha=
n the
> new one, particularly if the old sysroot existed but was not readable by =
the
> current user.
>
> This turns out of the an issue inside gcc to do with preservation of the =
sysroot
> option. See the gcc patch for more details. It only triggers when preproc=
essed
> sources are used which happens when ccache is used.
>
> The same issue occurs with c++ and c++-cpp-output so the same fix is appl=
ied there.
>
> [YOCTO #2074]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtool=
s/gcc/gcc-4.6.inc
> index d40a534..020e21b 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
> =A0require gcc-common.inc
>
> -PR =3D "r24"
> +PR =3D "r25"
>
> =A0# Third digit in PV should be incremented after a minor release
> =A0# happens from this branch on gcc e.g. currently its 4.6.0
> @@ -73,6 +73,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=
=3D${BRANCH};proto=3Dhttp \
> =A0 =A0 =A0 =A0 =A0 file://gcc-arm-set-cost.patch \
> =A0 =A0 =A0 =A0 =A0 file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
> =A0 =A0 =A0 =A0 =A0 file://fortran-cross-compile-hack.patch \
> + =A0 =A0 =A0 =A0 =A0file://cpp-honour-sysroot.patch \
> =A0 =A0 =A0 =A0 =A0"
>
> =A0SRC_URI_append_sh3 =A0=3D " file://sh3-installfix-fixheaders.patch "
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch b=
/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
> new file mode 100644
> index 0000000..4792c20
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
> @@ -0,0 +1,40 @@
> +Currently, if the gcc toolchain is relocated and installed from sstate, =
then you try and compile
> +preprocessed source (.i or .ii files), the compiler will try and access =
the builtin sysroot location
> +rather than the --sysroot option specified on the commandline. If access=
 to that directory is
> +permission denied (unreadable), gcc will error.
> +
> +This happens when ccache is in use due to the fact it uses preprocessed =
source files.
> +
> +The fix below adds %I to the cpp-output spec macro so the default substi=
tutions for -iprefix,
> +-isystem, -isysroot happen and the correct sysroot is used.
> +
> +[YOCTO #2074]
> +
> +Upstream-Status: Pending
> +
> +RP 2012/04/13
> +
> +Index: gcc-4_6-branch/gcc/gcc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4_6-branch.orig/gcc/gcc.c =A0 =A0 =A02012-04-13 12:24:37.9396711=
40 +0000
> ++++ gcc-4_6-branch/gcc/gcc.c =A0 2012-04-13 12:24:54.439670688 +0000
> +@@ -953,7 +953,7 @@
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 %W{o*:--output-pch=3D%*}}%V}}}}=
}}", 0, 0, 0},
> + =A0 {".i", "@cpp-output", 0, 0, 0},
> + =A0 {"@cpp-output",
> +- =A0 "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-o=
nly:%(invoke_as)}}}}", 0, 0, 0},
> ++ =A0 "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsynta=
x-only:%(invoke_as)}}}}", 0, 0, 0},
> + =A0 {".s", "@assembler", 0, 0, 0},
> + =A0 {"@assembler",
> + =A0 =A0"%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}"=
, 0, 0, 0},
> +Index: gcc-4_6-branch/gcc/cp/lang-specs.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4_6-branch.orig/gcc/cp/lang-specs.h =A0 =A02012-04-13 12:25:01.0=
19670594 +0000
> ++++ gcc-4_6-branch/gcc/cp/lang-specs.h 2012-04-13 12:25:07.567670180 +00=
00
> +@@ -64,5 +64,5 @@
> + =A0 {".ii", "@c++-cpp-output", 0, 0, 0},
> + =A0 {"@c++-cpp-output",
> + =A0 =A0"%{!M:%{!MM:%{!E:\
> +- =A0 =A0cc1plus -fpreprocessed %i %(cc1_options) %2\
> ++ =A0 =A0cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> + =A0 =A0 %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



