Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q7siS-00035Z-M2
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 19:09:58 +0200
Received: by wye20 with SMTP id 20so2602292wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2011 10:07:48 -0700 (PDT)
Received: by 10.227.39.89 with SMTP id f25mr1162480wbe.154.1302196068302;
	Thu, 07 Apr 2011 10:07:48 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d6sm940774wer.26.2011.04.07.10.07.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 10:07:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTimCkUNZcm+gb4vAouMJ6mUopFvFAw@mail.gmail.com>
Date: Thu, 7 Apr 2011 19:07:46 +0200
Message-Id: <8BFF150F-785B-476C-ACCF-0F1A52613374@dominion.thruhere.net>
References: <1302001365.24596.459.camel@rex>
	<BANLkTinaGY_6Ks7pTfwYcVaDxs3ANbT2Gg@mail.gmail.com>
	<9024C872-9FD7-4016-B40C-89DE43199F66@windriver.com>
	<BANLkTimCkUNZcm+gb4vAouMJ6mUopFvFAw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: poky <poky@yoctoproject.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Thu, 07 Apr 2011 17:09:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 apr 2011, om 18:53 heeft Colin Walters het volgende geschreven:

> On Thu, Apr 7, 2011 at 12:10 PM, Hatle, Mark =
<mark.hatle@windriver.com> wrote:
>>=20
>> I think definition may be an issue here.  When I speak of multilibs I =
am talking primarily about multiliple non-conflicting, ABI incompatible =
libraries being installed at the same time.  This is the ELF 32 and ELF =
64 case where the items can't be linked together, but can be installed =
and jrun on the same machine.
>=20
> Right, that's "multilib".
>=20
>> The alternative is the case on ARM where we have one single ABI but =
multiple ways to implement the code.. Thumb, neon, vfp, etc being =
options.  We want to do this as well, but while related, I see it as a =
diffent use case.
>=20
> Isn't this already covered by glibc's support for
> /lib/$processor_feature?  On my Fedora 14 x86_64 system I have
> /lib/i686/nosegneg for example, and a simple "strace true" shows us
> trying to find a variant of libc that is built for TLS (and not
> finding it):
>=20
> $ strace true
> execve("/bin/true", ["true"], [/* 54 vars */]) =3D 0
> brk(0)                                  =3D 0xe59000
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) =3D 0x7f54472b0000
> access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or =
directory)
> open("/src/build/jhbuild/lib64/tls/x86_64/libc.so.6", O_RDONLY) =3D -1
> ENOENT (No such file or directory)

That's what I call 'hwcap'. OE currently lacks a decent way to build and =
install the permuations people want. For armv7a this boils down to =
NEON/VENUM or not, TI, Freescale and Qualcomm have it, Nvidia and =
Marvell don't.
This type of setup on ARM is only usefull for people who think that one =
rootfs to rule all boards is the best thing since sliced bread. It does =
make it really easy to hand people a rootfs and have it "just work" and =
not get caught in "why didn't you license NEON?" debates :)

regards,

Koen=


