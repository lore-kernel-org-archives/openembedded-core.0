Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C99126B6C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:53:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8D96gcB015312; Fri, 13 Sep 2013 10:06:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bPGh2RCNaAAd; Fri, 13 Sep 2013 10:06:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8D96bj7015294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 13 Sep 2013 10:06:39 +0100
Message-ID: <1379062359.3484.243.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hans =?ISO-8859-1?Q?Beck=E9rus?= <hans.beckerus@gmail.com>
Date: Fri, 13 Sep 2013 09:52:39 +0100
In-Reply-To: <CAFyqS9omO7majs22+o-DPii9wpw15rrhxkgQAUD35GRWjRFqLw@mail.gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
	<5231F548.6010801@linux.intel.com>
	<CAFyqS9r3WOEjfrPe5s=n1H9SzFsnJ4FAdo=AGprWUkufUe6QRQ@mail.gmail.com>
	<52322D8B.7080406@gmail.com> <52324915.6030708@gmail.com>
	<CAFyqS9omO7majs22+o-DPii9wpw15rrhxkgQAUD35GRWjRFqLw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Fri, 13 Sep 2013 08:53:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2013-09-13 at 10:06 +0200, Hans Beckérus wrote:
> On Fri, Sep 13, 2013 at 1:07 AM, Hans Beckerus <hans.beckerus@gmail.com> wrote:
> > On 2013-09-12 11:09, Hans Beckerus wrote:
> >>
> >> On 2013-09-12 8:02, Hans Beckérus wrote:
> >>
> > I now got a somewhat better picture of what is going on. I know what is
> > failing, and why. But currently I have no solution ready. Actually there are
> > some nasty traps to get caught in here :(. The problem is actually as simple
> > as it is obvious. For all those native packages that do work (this is a
> > unique problem for native packages using libtool), they all seem to share a
> > common thing in their recipes:
> >
> > EXTRA_OECONF += " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
> >
> > Great! This is the way to do it. But, what if someone forgets to do this?
> > Well the answer is; it will most likely *not* compile!
> > Since libtool now has been fixed to correctly pick up the sysroot from the
> > compiler (using --print-sysroot) if --with-libtool-sysroot is not specified
> > it will try to execute ${CC} --print-sysroot. Bummer! ${CC} is most likely
> > simply set to 'gcc' for native packages. That is, the local host compiler is
> > used.
> > The sysroot for that is of course "/". And it should be. Otherwise it will
> > bring in the wrong set of header files and libraries. But, there is another
> > problem here. We should not let libtool use "/"! Because even if we use the
> > local host compiler for native packages, we still use the oe-core upstream
> > version of libtool, and that does not like using "/" as sysroot.  If it does
> > everything becomes a mess. And that is exactly what seems to happen now
> > after the patch. Before the patch libtool rendered the SDK for libtool
> > enabled packages more or less useless. But, it also saved us in the native
> > case. Because if --with-libtool-sysroot was set, the path was used directly,
> > but if it was not set, lt_sysroot was also kept unset. And here is the
> > spooky part again. Having lt_sysroot set to nothing seems to work just as
> > well as setting it, provided it points to a valid location!? This magic
> > however did not work for the SDK which requires the sysroot to be resolved
> > correctly when not specified. So one conclusion could be that, for native
> > packages, enforcement of --with-libtool-sysroot is a possible way forward.
> > Would this be safe? I think so, but I might have overlooked something.  I
> > can also see in config.log that "configure" is fed with a lot of arguments,
> > even if EXTRA_OECONF is not specified. How is this handled? How can I try to
> > force this in for all native packages. I looked into native.bbclass but it
> > was not obvious to me how anything in there actually ends up in arguments to
> > "configure". Any hints? There are still a lot of gaps in my analysis ;) If
> > anyone feels like they can fill in the gaps, please do.
> >
> >
> Now this is getting interesting. When I said before I could reproduce
> the problem in a world build I did not know that it would actually
> succeed later. On a different build server!! The previous analysis
> made is mostly true. But there is something more. Why did it succeed
> on one of my servers but not the other one? The way to find out was to
> compare what lt_sysroot is resolved to in both cases. And there it
> was. On the machine for which it works, lt_sysroot is now picked up
> from $CC --print-sysroot (due to the patch), but the result is not
> "/", it is unset! Which is the same behavior that can be observed
> without the libtool patch. So this is getting even worse now. It is
> gcc and host dependent. If gcc has been built with a sysroot of "/" is
> does not work since that will be picked up by libtool, and is of
> course wrong in our case. But if lt_sysroot is kept unset, libtool
> seems to be able to resolve a working default using some other
> (unknown) mechanism. That is why we have not seen this problem before,
> even though libtool actually did the wrong thing before the patch. So
> this leaves me with at least this question; is it actually correct
> that gcc has "/" as a compiled in sysroot on some machines?
> 
> I then saw two possible solutions:
> 
> a) update the patch in libtool and if gcc reports a single "/", skip
> it and leave lt_sysroot unset.
> b) consistency is the key. Let all native packages force setting of a
> proper lt_sysroot  using --with-libtool-sysroot.
> 
> This is also when I found this in autotools.bbclass
> 
> def append_libtool_sysroot(d):
>     # Only supply libtool sysroot option for non-native packages
>     if not bb.data.inherits_class('native', d):
>         return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
>     return ""
> 
> I can somewhat understand the rationale behind this. If building for
> target you wish to point libtool to a proper sysroot, and leaving it
> unset for native seems like a good idea. But I do not think that
> really is the case. Even for native builds you wish to point it to the
> sysroot for the libtool actually being used. Not to what the compiler
> is pointing to, which is now the effect after applying the libtool
> patch. But which is actually what you want when building from an
> placement independent SDK toolchain for which $CC is updated with a
> proper --sysroot argument to gcc automatically when the environment
> script is sourced.
> 
> So my propasal now is to update autotools.bbclass and for native
> packages set -with-libtool-sysroot=${STAGING_DIR_NATIVE}. This should
> cover all the corner cases and work in all different combinations.
> Again, consistency is the key. But I still need to try it. Problem now
> is that I need to wait until I have access to the machine for which it
> currently does not work to verify it properly.
> 
> Please advise. Does anyone object strongly to this idea?

Sadly its not the right thing to do. The purpose of a sysroot option is
to say "compile and link against things in this subdirectory, do not
look outside it". Our native binaries need to use the system libc and
headers. They are therefore expected to look outside STAGING_DIR_NATIVE
if they don't find what they need in there. Native is really a special
hybrid case.

So things should be working if "/" is specified as the sysroot, or its
not specified at all. I think there are deeper bugs in libtool we're
uncovering :(

When I first saw the patch, it looked like the correct thing to be doing
but it now seems it may uncover further bugs which are going to need to
get fixed before we can take this patch :(.

Cheers,

Richard




