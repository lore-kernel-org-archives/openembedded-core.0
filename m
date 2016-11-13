Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 81FFF719F9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2016 09:51:01 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161113095055303_0485;
	Sun, 13 Nov 2016 09:50:55 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=38590 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c5rR2-0002DW-35; Sun, 13 Nov 2016 04:50:48 -0500
Date: Sun, 13 Nov 2016 04:49:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <ca53cb96-5c1e-35f1-55f3-8f61897de18f@windriver.com>
Message-ID: <alpine.LFD.2.20.1611130434570.28277@localhost.localdomain>
References: <alpine.LFD.2.20.1611121436420.20479@localhost.localdomain>
	<ca53cb96-5c1e-35f1-55f3-8f61897de18f@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: WRL error: "Can't locate Config_heavy-target.pl in @INC" -- OE versus WRL
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
X-List-Received-Date: Sun, 13 Nov 2016 09:51:03 -0000
Content-Type: text/plain; charset=US-ASCII


  sorry, i'm still confused, let me make sure i understand this ...

On Sat, 12 Nov 2016, Mark Hatle wrote:

> On 11/12/16 2:45 PM, Robert P. J. Day wrote:
> >
> >   (note: this is actually an error i'm getting under wind river linux
> > 8, i'm just curious as to why OE works just fine.)
> >
> >   as mentioned, when trying to build a trivial hand-rolled perl recipe
> > under wind river linux 8, i'm getting:
> >
> > | Can't locate Config_heavy-target.pl in @INC (@INC contains: ... long
> > path snipped ...) at
> > .../tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Config.pm
> > line 88.
>
> My suspicion is that you are not using the buildtools-tarball with
> your OE build, ...

  that would be correct, i've never used that, never needed to, on my
fedora system. which means (correct me if i'm wrong) that i *am* using
some natively-installed content, based on ASSUME_PROVIDED from
bitbake.conf. and i notice there's a few extra lines there than what i
remember from quite some time back, including

    hostperl-runtime-native \

so i'll have to look at what that means. but the point here is that
the OE build *does* work.

> but Wind River Linux automatically uses this in an attempt to avoid
> host incompatibilities with all of the random hosts our customers
> use.

  ok, so WRL builds and uses the buildtools-tarball, and that's where
i get the aforementioned error.

> To use the OE version of buildtools-tarball, you will have to build
> it, extract it and then source the environment file.

  and that's where i'm confused ... i'm not using the OE version of
buildtools-tarball with my OE build and things *work*, so why would i
want to use it *now*? this seems backwards.

> >   but building precisely the same recipe under regular OE (actually,
> > poky) works just fine. i did some searching, and found this:
> >
> > https://patchwork.openembedded.org/patch/111047/
> >
> > but i have no idea what it means. i also notice that the standard
> > bitbake.conf (which i haven't looked at in a while), now contains a
> > few more ASSUME_PROVIDED entries, including:
> >
> >     hostperl-runtime-native \
> >     hostpython-runtime-native \
>
> f4dade8e meta/conf/bitbake.conf         (Ed Bartosh                2016-01-07
> 13:39:39 +0200 179)     hostperl-runtime-native \
> 8a474057 meta/conf/bitbake.conf         (Ed Bartosh                2016-01-13
> 10:03:04 +0200 180)     hostpython-runtime-native \
>
> These are newer then Wind River Linux 8, which is based on Yocto Project 2.0 /
> Jethro which was released around Nov 2015.
>
> > while the WRL version contains:
> >
> >     perl-native-runtime \
> >     python-native-runtime \
>
> You you look at Jethro you will see:
>
> 34927dfa meta/conf/bitbake.conf         (Richard Purdie          2007-12-18
> 15:04:06 +0000 174)     perl-native-runtime \
> 34927dfa meta/conf/bitbake.conf         (Richard Purdie          2007-12-18
> 15:04:06 +0000 175)     python-native-runtime \
>
> So you are attempting to compare apples to oranges (master/morty/krogoth against
> jethro.)

  so ... what is the solution here? how would i tweak my WRL build to
resolve this issue? again, apologies for asking a WRL question on the
OE list, i'm just trying to understand the difference.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


