Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q7sfA-0001Iv-A1
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 19:07:24 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p37H4LP9006906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Apr 2011 10:04:21 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.73]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Thu, 7 Apr 2011 10:04:21 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: Colin Walters <walters@verbum.org>
Thread-Topic: [poky] Proposed Multilib Implementation Brainstorming
Thread-Index: AQHL9TmKZrKlv9+FdE6IOU3UGMc605RSkjeQgACBZ4CAAAKnAA==
Date: Thu, 7 Apr 2011 17:04:20 +0000
Message-ID: <D6DCA675-3B27-43B5-A7B8-CAA93048A49B@windriver.com>
References: <1302001365.24596.459.camel@rex>
	<BANLkTinaGY_6Ks7pTfwYcVaDxs3ANbT2Gg@mail.gmail.com>
	<9024C872-9FD7-4016-B40C-89DE43199F66@windriver.com>
	<BANLkTimCkUNZcm+gb4vAouMJ6mUopFvFAw@mail.gmail.com>
In-Reply-To: <BANLkTimCkUNZcm+gb4vAouMJ6mUopFvFAw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: poky <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 07 Apr 2011 17:07:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D646445CE964C74999F8B9AB2718A6F4@corp.ad.wrs.com>
Content-Transfer-Encoding: quoted-printable





On Apr 7, 2011, at 9:53 AM, "Colin Walters" <walters@verbum.org> wrote:

> On Thu, Apr 7, 2011 at 12:10 PM, Hatle, Mark <mark.hatle@windriver.com> w=
rote:
>>=20
>> I think definition may be an issue here.  When I speak of multilibs I am=
 talking primarily about multiliple non-conflicting, ABI incompatible libra=
ries being installed at the same time.  This is the ELF 32 and ELF 64 case =
where the items can't be linked together, but can be installed and jrun on =
the same machine.
>=20
> Right, that's "multilib".
>=20
>> The alternative is the case on ARM where we have one single ABI but mult=
iple ways to implement the code.. Thumb, neon, vfp, etc being options.  We =
want to do this as well, but while related, I see it as a diffent use case.
>=20
> Isn't this already covered by glibc's support for
> /lib/$processor_feature?  On my Fedora 14 x86_64 system I have
> /lib/i686/nosegneg for example, and a simple "strace true" shows us
> trying to find a variant of libc that is built for TLS (and not
> finding it):
>=20

The needs for the arm case include both executables and libraries.  The pro=
cessor feature can be used, but that only covers the libraries themselves. =
 We want a mechanism to say that the whole system is built thumb2, except f=
or a particular compilation modules, library and/or application.  (generall=
y is done on a full recipe basis, and not on a single compilation module..)

The other issue on ARM embedded systems is that the processor feature appro=
ach typically makes the system larger, by providing both the lesser optimiz=
ed and more completely optimized libraries....  I've had resistence to this=
 approach from customer over that reason.  (mind you I'm in favor of making=
 that easier to use in OE as well.)

> $ strace true
> execve("/bin/true", ["true"], [/* 54 vars */]) =3D 0
> brk(0)                                  =3D 0xe59000
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) =3D 0x7f54472b0000
> access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or di=
rectory)
> open("/src/build/jhbuild/lib64/tls/x86_64/libc.so.6", O_RDONLY) =3D -1
> ENOENT (No such file or directory)


