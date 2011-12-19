Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RcVrk-00031P-6z
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:34:24 +0100
Received: by vcbf1 with SMTP id f1so2915022vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 21:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2yqIid5Farv23f79aIJMq7fCt4+p8SLFXGwUxZpz+/I=;
	b=IayXMhtbwBi9hjJgVNXLgKysY5UCLTuEBmtNRQGSMmyG3gpgobePtlhEXCP/HIJ6lL
	OaPRnZeifbRGawwO8D81Z5+IDhYrVSKVlQfPd3jLhU3ex3mQ+2IZQK/kovs73vb5IJXd
	f+6Xnzh5S2b5Fq23VLcCl2d5k9nPHc8Fo1ma4=
MIME-Version: 1.0
Received: by 10.220.106.207 with SMTP id y15mr8663993vco.69.1324272440503;
	Sun, 18 Dec 2011 21:27:20 -0800 (PST)
Received: by 10.52.89.99 with HTTP; Sun, 18 Dec 2011 21:27:20 -0800 (PST)
In-Reply-To: <33eb9cf534f8e946cf8cb2d67d64b47f193a89e7.1324271587.git.dexuan.cui@intel.com>
References: <cover.1324271587.git.dexuan.cui@intel.com>
	<33eb9cf534f8e946cf8cb2d67d64b47f193a89e7.1324271587.git.dexuan.cui@intel.com>
Date: Sun, 18 Dec 2011 21:27:20 -0800
Message-ID: <CAGDS+n=JdLTOhNH3vgBV9RfqbMROe5DpQ6OsvvNjOpPCVsx=sQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 19 Dec 2011 05:34:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 18, 2011 at 9:14 PM, Dexuan Cui <dexuan.cui@intel.com> wrote:
> On my x86-64 Ubuntu 11.04, with MACHINE=3Dqemux86, "bitbake wget" fails. =
The
> config.log shows:
>
> configure:30072: i586-poky-linux-gcc =A0-m32 =A0 -march=3Di586
> =A0--sysroot=3D/distro/dcui/1212/p1/build/tmp/sysroots/qemux86 -o conftes=
t -O2
> =A0-pipe -g -feliminate-unused-debug-types =A0-Wl,-O1 -Wl,--hash-style=3D=
gnu
> =A0-Wl,--as-needed conftest.c -ldl -lz =A0/usr/lib/libssl.so /usr/lib/lib=
crypto.so
> =A0-lz >&5
> /usr/lib/libssl.so: could not read symbols: File in wrong format
>
> The patch fixes the issue by specifying libssl-prefix.
>
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

I can verify that this patch fixes my build failure.

Tested-by: Steve Sakoman <steve@sakoman.com>

Steve


> =A0meta/recipes-extended/wget/wget.inc | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
> index 7083569..25f36c8 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -4,11 +4,11 @@ LICENSE =3D "GPL"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> =A0DEPENDS =3D "openssl"
>
> -INC_PR =3D "r12"
> +INC_PR =3D "r13"
>
> =A0inherit autotools gettext update-alternatives
>
> -EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-ssl=3Dopenssl"
> +EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-libssl-prefix=3D${STA=
GING_DIR_HOST} --with-ssl=3Dopenssl"
>
> =A0do_install_append () {
> =A0 =A0 =A0 =A0mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
> --
> 1.7.6
>


