Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1070E7678B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 19:01:03 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so72209084wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 12:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ye0s/KAzh3ONL0Ledp9LdemoM+q1jN7Dk/gg60xg8Q0=;
	b=LKNs0Wgg/qHKtYHQIBOpw1zD4L9X5ahw22LrJlP4XCS3dL/sznj9SoUJJ9gdm6CaXW
	2a9RuruwBeolfCrgiA//vyff9gC1qk18m3Q6FzSI6kNs+fGcA9SG/m3+c3k9GFZqk63q
	51/fHN7rC8+vZluO/PwW4EYI3rvP5Y6zWcx+SzLwiCV2x/gGw6+s5h0udDE7N678fh3S
	X8yfECW9dxiEHNlgYRa9h5uIvqF/wcwyMg9Bz797mEhSw0HYReXB/JeVu+p3CHblS//p
	6s6Orhboi04r7WAgL4jC2dKt2d9r5zUZHeZKchuiMcOP+rx6cUrcZkNKlPihrnXcbSgS
	nInQ==
MIME-Version: 1.0
X-Received: by 10.180.75.243 with SMTP id f19mr9182639wiw.52.1438974062893;
	Fri, 07 Aug 2015 12:01:02 -0700 (PDT)
Received: by 10.194.236.166 with HTTP; Fri, 7 Aug 2015 12:01:02 -0700 (PDT)
In-Reply-To: <CAMKF1srzd9m9WshEsrxrZUtbHQ0xiB98r2mGc96xwpUgJNyx2Q@mail.gmail.com>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
	<1438890086-2710-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1srzd9m9WshEsrxrZUtbHQ0xiB98r2mGc96xwpUgJNyx2Q@mail.gmail.com>
Date: Fri, 7 Aug 2015 12:01:02 -0700
Message-ID: <CAJ86T=WGLspsp1c5ULdOQqqYpzd5wMb72pKGdMJ80-6=4a=Q0Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 07 Aug 2015 19:01:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2015 at 7:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 6, 2015 at 12:41 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> uclibc fails to build when security_flags.inc is used.
>>
>>  | i686-rdk-linux-uclibc-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
-mfpmath=3Dsse --sysroot=3D/build-vbox32/tmp/sysroots/vbox32-tcbootstrap  -=
Wl,-EL -Wl,--sort-common -Wl,--sort-section=3Dalignment -m32 -shared -Wl,--=
warn-common -Wl,--warn-once -Wl,-z,combreloc -Wl,-z,relro -Wl,-z,now -Wl,--=
hash-style=3Dgnu -Wl,-z,defs   -Wl,-init,__uClibc_init  -Wl,-soname=3Dlibc.=
so.0 -nostdlib -o lib/libuClibc-0.9.34-git.so  -Wl,--whole-archive libc/lib=
c_so.a -Wl,--no-whole-archive ./lib/interp.os ./lib/ld-uClibc.so.0 ./lib/uc=
libc_nonshared.a /build-vbox32/tmp/sysroots/vbox32-tcbootstrap/usr/lib/i686=
-rdk-linux-uclibc/4.9.3/libgcc.a
>>  | libc/libc_so.a(sigaction.os): In function `__libc_sigaction':
>>  | /build-vbox32/tmp/work/core2-32-rdk-linux-uclibc/uclibc/0.9.33+gitAUT=
OINC+48a0006012-r9/git/libc/sysdeps/linux/i386/sigaction.c:37: undefined re=
ference to `__stack_chk_guard'
>>  | /build-vbox32/tmp/work/core2-32-rdk-linux-uclibc/uclibc/0.9.33+gitAUT=
OINC+48a0006012-r9/git/libc/sysdeps/linux/i386/sigaction.c:49: undefined re=
ference to `__stack_chk_fail_local'
>>  | collect2: error: ld returned 1 exit status
>>  | make: *** [lib/libc.so] Error 1
>
> This fix is papering over real problem. this means gcc is expecting
> ssp implementation from libc but is not detecting it rightly can you
> try passing gcc_cv_libc_provides_ssp=3Dyes to help it configure

OK, so I tried adding:

  export gcc_cv_libc_provides_ssp =3D 'yes'

to gcc-configure-common.inc and uclibc does then seem to build OK
without needing to provide uclibc specific SECURITY_CFLAGS.

The build still fails later (gcc-runtime fails while configuring
libgomp) but getting beyond building uclibc with security_flags.inc
enabled seems like progress.

>>
>> Clearing SECURITY_CFLAGS completely may not be the best approach, but
>> it's the approach taken for glibc, so try it for uclibc too.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/distro/include/security_flags.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dis=
tro/include/security_flags.inc
>> index 3724972..a107657 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -84,6 +84,8 @@ SECURITY_CFLAGS_pn-python-smartpm =3D "${SECURITY_NO_P=
IE_CFLAGS}"
>>  SECURITY_CFLAGS_pn-python-numpy =3D "${SECURITY_NO_PIE_CFLAGS}"
>>  SECURITY_CFLAGS_pn-tcl =3D "${SECURITY_NO_PIE_CFLAGS}"
>>  SECURITY_CFLAGS_pn-tiff =3D "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-uclibc =3D ""
>> +SECURITY_CFLAGS_pn-uclibc-initial =3D ""
>>  SECURITY_CFLAGS_pn-valgrind =3D "${SECURITY_NO_PIE_CFLAGS}"
>>  SECURITY_CFLAGS_pn-webkit-gtk =3D "${SECURITY_NO_PIE_CFLAGS}"
>>  SECURITY_CFLAGS_pn-zlib =3D "${SECURITY_NO_PIE_CFLAGS}"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

