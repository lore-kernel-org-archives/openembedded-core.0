Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5029576708
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 02:02:35 +0000 (UTC)
Received: by igr7 with SMTP id 7so22926359igr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 19:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=OeexaIItKR6izNh/3P99DxuED+CLly4LjL0IHB5dKy0=;
	b=UKuyqVNqWkZ7W2E5tzClyru2gd0KABDphBYF4AztJSDpT9ftwgS3A0rHxlb9KAf20Y
	dRl3G94RpDD/qsDRvybhir510AMKLZOM1oV6TY1tVD4wCscIanKcNZ/LeY5KdYolOEYu
	s2gWyYAY482NoZ2zO/SZu4ACGMlM9V6ud5l9NYQSFgMJmwtXs4VtZQzdy6JZZZGmD4rl
	M9rNAu2FI3PXgXHDnHSMmEl7tmBkjAI3HVY6qBgQ8mnhfMlyovtCisMr/fCB5sgDIgov
	N60xwaP4w4frvAmb81mEaQm4s1NWCI0H9u5BEx4/YvbxiKa9oX3YNKeFh3DDyVp3s2rg
	BxUg==
X-Received: by 10.50.112.166 with SMTP id ir6mr747185igb.75.1438912955316;
	Thu, 06 Aug 2015 19:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 19:02:05 -0700 (PDT)
In-Reply-To: <1438890086-2710-3-git-send-email-armccurdy@gmail.com>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
	<1438890086-2710-3-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 19:02:05 -0700
Message-ID: <CAMKF1srzd9m9WshEsrxrZUtbHQ0xiB98r2mGc96xwpUgJNyx2Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] security_flags.inc: clear SECURITY_CFLAGS for uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2015 02:02:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2015 at 12:41 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> uclibc fails to build when security_flags.inc is used.
>
>  | i686-rdk-linux-uclibc-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/build-vbox32/tmp/sysroots/vbox32-tcbootstrap  -W=
l,-EL -Wl,--sort-common -Wl,--sort-section=3Dalignment -m32 -shared -Wl,--w=
arn-common -Wl,--warn-once -Wl,-z,combreloc -Wl,-z,relro -Wl,-z,now -Wl,--h=
ash-style=3Dgnu -Wl,-z,defs   -Wl,-init,__uClibc_init  -Wl,-soname=3Dlibc.s=
o.0 -nostdlib -o lib/libuClibc-0.9.34-git.so  -Wl,--whole-archive libc/libc=
_so.a -Wl,--no-whole-archive ./lib/interp.os ./lib/ld-uClibc.so.0 ./lib/ucl=
ibc_nonshared.a /build-vbox32/tmp/sysroots/vbox32-tcbootstrap/usr/lib/i686-=
rdk-linux-uclibc/4.9.3/libgcc.a
>  | libc/libc_so.a(sigaction.os): In function `__libc_sigaction':
>  | /build-vbox32/tmp/work/core2-32-rdk-linux-uclibc/uclibc/0.9.33+gitAUTO=
INC+48a0006012-r9/git/libc/sysdeps/linux/i386/sigaction.c:37: undefined ref=
erence to `__stack_chk_guard'
>  | /build-vbox32/tmp/work/core2-32-rdk-linux-uclibc/uclibc/0.9.33+gitAUTO=
INC+48a0006012-r9/git/libc/sysdeps/linux/i386/sigaction.c:49: undefined ref=
erence to `__stack_chk_fail_local'
>  | collect2: error: ld returned 1 exit status
>  | make: *** [lib/libc.so] Error 1

This fix is papering over real problem. this means gcc is expecting
ssp implementation from libc but is not detecting it rightly can you
try passing gcc_cv_libc_provides_ssp=3Dyes to help it configure

>
> Clearing SECURITY_CFLAGS completely may not be the best approach, but
> it's the approach taken for glibc, so try it for uclibc too.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dist=
ro/include/security_flags.inc
> index 3724972..a107657 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -84,6 +84,8 @@ SECURITY_CFLAGS_pn-python-smartpm =3D "${SECURITY_NO_PI=
E_CFLAGS}"
>  SECURITY_CFLAGS_pn-python-numpy =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-tcl =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-tiff =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-uclibc =3D ""
> +SECURITY_CFLAGS_pn-uclibc-initial =3D ""
>  SECURITY_CFLAGS_pn-valgrind =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-webkit-gtk =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-zlib =3D "${SECURITY_NO_PIE_CFLAGS}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

