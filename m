Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 50D087652D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 13:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t71DwqKR026019; Sat, 1 Aug 2015 14:58:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CGtM3wybYdY2; Sat,  1 Aug 2015 14:58:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t71Dwaid026015
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Aug 2015 14:58:47 +0100
Message-ID: <1438437516.25455.29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Sat, 01 Aug 2015 14:58:36 +0100
In-Reply-To: <CALbNGRQJvy1GbYp2tBJ_5fk1-yD3cGKd_6DGd=Yubx-vAL6__g@mail.gmail.com>
References: <1437553270-9514-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQJvy1GbYp2tBJ_5fk1-yD3cGKd_6DGd=Yubx-vAL6__g@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Patch process and current build status
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
X-List-Received-Date: Sat, 01 Aug 2015 13:58:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2015-08-01 at 14:14 +0200, Andreas Müller wrote:
> Why do I get the feeling that most non guru patches need ping? So ping

Sorry :/.

Its perhaps worth seeing this from my side of the fence to at least
understand why we're seeing delays.

I (or Ross) end up pulling together a batch of patches off the mailing
list. Some are "obviously" correct and easy to include, some need some
simple checks and maybe take 5 mins to check something. If you have 10
of those, you can easily lose an hour. Other patches are "suspect" in
that you have some idea that it will cause an issue somewhere else. As
soon as a patch needs feedback, it does consume a surprising amount of
time.

I have said before that I do tend to weight patches depending on the
contributor. The first patch someone ever sends for example is
historically quite risky. Patches from contributors who regularly send
patches tend to have different kinds of problems but are generally less
risky to the build. It also depends if its a part of the system that
person has touched before. I'd trust Chris Larson touching internals of
bitbake more than I'd trust a random new person for example and that is
how it should be. It also depends how well I know the code in question.
There are sections of code I'd get someone else to glance at the patches
for and that takes time.

For each patch we think there may be an issue, we then have to "prove"
there is an issue. That can take anything from 15 mins to an hour. If
its complex (e.g. toolchain), it may need its own run on the
autobuilder. If we mix it with other things, we then have to figure out
which patch caused which failure.

Once we have a batch of patches we think may work, we run these up on
the autobuilder which right now takes around six hours. Its then a
waiting game for the results of the build. If it all goes green, great,
we can merge the patches.

If it fails, we then have a dilemma. Do we guess which patch(es) were
the bad ones and merge or do we need another build? Sometimes I take
risks, sometimes I don't/can't. Once we have failures, we need to spend
the time giving that feedback to the person who sent the patch. Two or
three of those can easily lose 20-30mins.

Its also a cost benefit weighting. Do I include a risky patch in the
build and try and merge 31 patches or do I run with 30 and get those
others in with a green build and let the risky one wait?

That is all "normal" day to day and I do this near 24/7 to keep the
builds flowing as best I can, one overnight and one or two during my
day, depending on how fast I can turn the trees around. I keep getting
asked if QA can have their weekly build, are we ready for the M2 release
build and so on, just to keep it interesting.

Then we have the problem cases. The mips toolchain changes took me four
days to get to the bottom of the SDK toolchain problems. I'm one of a
smaller number of people with the right skills/knowledge to stand some
chance of getting that changeset right. Part of the issue was long
rebuild times when I changed gcc and everything rebuilt.

We've had a run of performance regressions recently, it took me and
others probably a couple of days on average to find those, root cause
and fix them. The good news of course is that we did do that but it did
take a lot of time.

We're also struggling with the autobuilder right now and "random"
failures. If someone wants to help, please tell me why we see failures
like any of these:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/417
https://autobuilder.yoctoproject.org/main/builders/nightly-rpm-non-rpm/builds/80
https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/422
https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/420
https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/423
https://autobuilder.yoctoproject.org/main/builders/nightly-rpm-non-rpm/builds/78
https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/76

there are open bugs for some of them but we simply don't know why
they're happening or how to reproduce them in a way which lets us debug
them. The above is just the last three builds, the history is full of
other examples. FWIW, we have fixed a ton of these "random" issues
already too, these are just the hard remaining issues.

The big problem these give us is we are developing selective blindness
to sanity failures on the autobuilder due to the shear number of red
builds.

As an example of this problem, see:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest?numbuilds=75

where we have had three green build in the last month at first glance. A
closer look will show the second last one took 0 seconds and was an
autobuilder bug. So last night was the first green selftest in a month!
Multiple people have put a lot of work into making that happen (and yes,
mistakes were made, some patches were merged that shouldn't have been
and should have then been reverted).

So yes, I am sorry some patches are taking a while to get merged.
Equally, we need to somehow get more people involved in the above
process as the people currently doing it are at breaking point. Right
now, I could use insight into the other failures more than anything.

I'd also note that I'm doing some business travel over the next couple
of weeks and Ross is also away so things are going to be even more
stretched than normal. Its sad I'm sitting here spending most of my
Saturday on trying to sort out more patches. I'll obviously continue to
do what I can though.

Cheers,

Richard


