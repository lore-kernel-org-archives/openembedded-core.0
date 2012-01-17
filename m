Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnHf8-00048b-Oq
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 23:37:54 +0100
Received: by lami14 with SMTP id i14so2492137lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=dyQaA8foLhdjbzTRz+hZ/qGHuss7HVY5D0y0ztl+W1k=;
	b=ujhiXqGeTQKEl2zmM2oEi9Q34GR1U/rwSJ6fQCOHuNs670jyh5FazzDO1KR/EH7CU0
	Uf4wMnpQYSgpT+e+GEnY42P2VNvPNoeHkZBsELb6IF5E02Qg/8gDQjhe481z5vRMUgbu
	ESKaUB6DADL7ddLGCRDm0KLtmBDwwxDNSRO+s=
Received: by 10.152.111.200 with SMTP id ik8mr9107650lab.43.1326839417302;
	Tue, 17 Jan 2012 14:30:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 14:29:46 -0800 (PST)
In-Reply-To: <20120117130948.GB3503@jama.jama.net>
References: <20120117130948.GB3503@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 14:29:46 -0800
Message-ID: <CAMKF1srCUPF2+yRTQn7PxKT=FPD2i=rs5BG-o-_2xnj=fUsJ3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Different libdir in libstdc++.la for qemux86-64 causing issues
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
X-List-Received-Date: Tue, 17 Jan 2012 22:37:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 5:09 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> After fixing gnutls pulling system libs to every EFL build I ended with o=
nly
> difference - libdir in libstdc++.la
>
> OE @ ~/shr-core/tmp-eglibc/sysroots $ grep libdir */usr/lib/libstdc*la
> nokia900/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> om-gta02/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
> qemux86-64/usr/lib/libstdc++.la:libdir=3D'/usr/lib/../lib'
> spitz/usr/lib/libstdc++.la:libdir=3D'/usr/lib'
>
> Which results in added -Wl,-rpath -Wl,/usr/lib/../lib while building for
> qemux86-64 (see logs below).
>
> Is there any reason to have different libdir (pointing to the same direct=
ory
> actually)? Or is it bug in libtool or how it's used from eve? Can we chan=
ge
> it in gcc-runtime?
>
> smaller test-case:
> OE @ ~/shr-core/tmp-eglibc $ sysroots/qemux86-64/usr/bin/crossscripts/x86=
_64-oe-linux-libtool -n --tag=3DCC --mode=3Dlink x86_64-oe-linux-gcc -m64 -=
-sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o test -lstdc++
> x86_64-oe-linux-libtool: link: x86_64-oe-linux-gcc -m64 --sysroot=3D/OE/s=
hr-core/tmp-eglibc/sysroots/qemux86-64 -o test =C2=A0/OE/shr-core/tmp-eglib=
c/sysroots/qemux86-64/usr/lib/../lib/libstdc++.so -lm -Wl,-rpath -Wl,/usr/l=
ib/../lib
>
> OE @ ~/shr-core/tmp-eglibc $ sysroots/nokia900/usr/bin/crossscripts/arm-o=
e-linux-gnueabi-libtool -n --tag=3DCC --mode=3Dlink arm-oe-linux-gnueabi-gc=
c -march=3Darmv7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o=
 test -lstdc++
> arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=3Darm=
v7-a --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900 -o test =C2=A0/O=
E/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/libstdc++.so -lm
>
> I can confirm that manually changing /usr/lib/../lib to just /usr/lib
> in libstdc++.la works for eve build - -rpath is gone (and IIRC I had
> similar issue for openssh or openssl).

Can you confirm the converse ? i.e. change /usr/lib to /usr/lib/../lib
in say for arm
build and check what happens ?


