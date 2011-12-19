Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RcW6j-0003Lw-9q
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:49:56 +0100
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 4DCF577DC08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 06:37:09 +0100 (CET)
Received: from [192.168.0.10] (unknown [82.228.86.110])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 1D083D481E0;
	Mon, 19 Dec 2011 06:37:02 +0100 (CET)
Message-ID: <4EEECD7D.7030807@eukrea.com>
Date: Mon, 19 Dec 2011 06:37:01 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Dexuan Cui <dexuan.cui@intel.com>
References: <cover.1324271587.git.dexuan.cui@intel.com>
	<33eb9cf534f8e946cf8cb2d67d64b47f193a89e7.1324271587.git.dexuan.cui@intel.com>
In-Reply-To: <33eb9cf534f8e946cf8cb2d67d64b47f193a89e7.1324271587.git.dexuan.cui@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wget: fix a host intrusion issue introduced by adding --with-ssl=openssl.
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
X-List-Received-Date: Mon, 19 Dec 2011 05:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Dexuan,

Le 19/12/2011 06:14, Dexuan Cui a =E9crit :
> On my x86-64 Ubuntu 11.04, with MACHINE=3Dqemux86, "bitbake wget" fails=
. The
> config.log shows:
>
> configure:30072: i586-poky-linux-gcc  -m32   -march=3Di586
>   --sysroot=3D/distro/dcui/1212/p1/build/tmp/sysroots/qemux86 -o confte=
st -O2
>   -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dg=
nu
>   -Wl,--as-needed conftest.c -ldl -lz  /usr/lib/libssl.so /usr/lib/libc=
rypto.so
>   -lz>&5
> /usr/lib/libssl.so: could not read symbols: File in wrong format
>
> The patch fixes the issue by specifying libssl-prefix.
>
> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
> ---
>   meta/recipes-extended/wget/wget.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extende=
d/wget/wget.inc
> index 7083569..25f36c8 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -4,11 +4,11 @@ LICENSE =3D "GPL"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
>   DEPENDS =3D "openssl"
>
> -INC_PR =3D "r12"
> +INC_PR =3D "r13"
>
>   inherit autotools gettext update-alternatives
>
> -EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-ssl=3Dopenssl"
> +EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-libssl-prefix=3D${S=
TAGING_DIR_HOST} --with-ssl=3Dopenssl"
>
>   do_install_append () {
>   	mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}

this also fix a problem I just met (angstrom, armv5 target) :
  | configure: error: --with-ssl=3Dopenssl was given, but SSL is not avai=
lable.

Tested-by: Eric B=E9nard <eric@eukrea.com>

Thanks !
Eric


