Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8497460138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4C7SC5Z013969; Tue, 12 May 2015 08:28:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fz0QVRuJSi89; Tue, 12 May 2015 08:28:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4C7S02v013960
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 May 2015 08:28:11 +0100
Message-ID: <1431415680.30971.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2015 08:28:00 +0100
In-Reply-To: <CAMKF1srBkzXSiVyo27LbF0TYb6AjxB_Z++no3QyJ9VJwJHFFWw@mail.gmail.com>
References: <1431363297.30971.76.camel@linuxfoundation.org>
	<5551395B.60503@gmail.com>
	<CAMKF1srBkzXSiVyo27LbF0TYb6AjxB_Z++no3QyJ9VJwJHFFWw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc5: Add PR65779 patch to fix powerpc compile issues
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
X-List-Received-Date: Tue, 12 May 2015 07:28:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-11 at 17:24 -0700, Khem Raj wrote:
> On Mon, May 11, 2015 at 4:20 PM, akuster808 <akuster808@gmail.com> wrote:
> >
> >
> > On 05/11/2015 09:54 AM, Richard Purdie wrote:
> >>
> >> This fixes compile issues on powerpc with gcc 5 which show up with
> >> errors like:
> >>
> >> | make[2]: Entering directory
> >> '/media/build1/poky/build/tmp/work/ppc7400-poky-linux/xprop/1_1.2.2-r0/build'
> >> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
> >> --sysroot=/media/build1/poky/build/tmp/sysroots/qemuppc -Wall
> >> -Wpointer-arith -Wmissing-declarations -Wformat=2 -Wstrict-prototypes
> >> -Wmissing-prototypes -Wnested-externs -Wbad-function-cast
> >> -Wold-style-definition -Wdeclaration-after-statement -Wunused
> >> -Wuninitialized -Wshadow -Wmissing-noreturn -Wmissing-format-attribute
> >> -Wredundant-decls -Wlogical-op -Werror=implicit -Werror=nonnull
> >> -Werror=init-self -Werror=main -Werror=missing-braces -Werror=sequence-point
> >> -Werror=return-type -Werror=trigraphs -Werror=array-bounds
> >> -Werror=write-strings -Werror=address -Werror=int-to-pointer-cast
> >> -Werror=pointer-to-int-cast -fno-strict-aliasing  -O2 -pipe -g
> >> -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> >> -o xprop dsimple.o clientwin.o xprop.o -lX11
> >> | /media/build1/poky/build/tmp/sysroots/qemuppc/usr/lib/../lib/libX11.so:
> >> undefined reference to `.LCL2'
> >> | collect2: error: ld returned 1 exit status
> >>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> >
> > Acked-by: Armin Kuster <Akuster808@gmail.com>
> >
> >
> > this fixes all but one package(lzop) failure on qemuppc base yocto world
> > build.
> >
> 
> I am fine witj this patch for now, since we are mostly build testing,
> we have to keep in mind
> its a codegen bug and can bite us at runtime. I am just hoping for an
> update to this patch and that will eliminate
> that doubt.

Agreed, an update upstream would obviously help. FWIW the automated
runtime tests did look reasonable on the autobuilder apart from:

core-image-sato-sdk has a problem with the C++ toolchain not finding
limits (all arches).

qemuarm is not booting (minimal, sato or sato-sdk).

However these issues were present before the patch so I don't think its
related.

Since the failures list is better with the patch I'll merge it until
something better comes along.

Cheers,

Richard



