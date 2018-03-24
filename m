Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B00D9601F2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 12:36:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2OCaSjk023739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 24 Mar 2018 12:36:30 GMT
Message-ID: <1521894988.11431.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Date: Sat, 24 Mar 2018 12:36:28 +0000
In-Reply-To: <20180323185655.51d96c05@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 12:36:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-23 at 18:56 -0500, Seebs wrote:
> On Fri, 23 Mar 2018 23:47:30 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > > I... am really unsure whether it's possible to catch that,
> > > because
> > > I really, really, don't want to try to intercept raw syscall()
> > > calls. I don't think that ends well.
> > Just out of interest for my education, why is that a really bad
> > idea?
> > Loops, e.g. with memory allocation issues?
>
> Potentially. We rely pretty heavily on the assumption that an
> *actual* syscall can go through.
> 
> Although... Actually, I don't even know if this is an actual syscall.
> This could be an actual glibc wrapper around the syscall interface,
> just like all the others, which is not the *actual* raw syscall or
> whatever, and... I have no idea how often that is or isn't hit.
> 
> It's totally possible it would work, but basically, I have a pretty
> good intuition of when something sounds brittle and error-prone, and
> trying to trap syscall() sounds brittle and error-prone and might
> work today but not next week...

I do totally agree that this is into dangerous territory. That said, I
did want to understand what they've done here.

Checking on a f27 machine:

[rpurdie@fedora27 ~]$ objdump -T /bin/mv | grep sys
0000000000000000      DF *UND*	0000000000000000  GLIBC_2.2.5
syscall

and a quick look at the glibc source says there is a syscall()
function:

long syscall (syscall_number, arg1, arg2, arg3, arg4, arg5, arg6)

which whilst written in assembler, is a standard library function which
I believe coreutils is using.

I think, at least in principle, pseudo could wrap that and intercept
this particular syscall, check syscall_number (the numbering having its
own set of issues) and then only handle the specific problem case we
have.

The unfortunate reality is we will have to figure out some solution to
this as f27 is in the wild now. Explaining why this causes problems for
debian/yocto to the upstream is also obviously a good idea.

Cheers,

Richard


