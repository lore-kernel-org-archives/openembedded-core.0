Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7483C606E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 20:18:48 +0000 (UTC)
Received: from [99.240.204.5] (port=47814 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPGVg-0004FQ-Qg; Sat, 21 Feb 2015 15:18:44 -0500
Date: Sat, 21 Feb 2015 15:18:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1424522044.11836.70.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1502211336280.15889@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
	<1424522044.11836.70.camel@linuxfoundation.org>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Sat, 21 Feb 2015 20:18:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'll finalize all this a bit at a time ... thanks for your time in
clearing all this up.

On Sat, 21 Feb 2015, Richard Purdie wrote:

> On Sat, 2015-02-21 at 05:09 -0500, Robert P. J. Day wrote:
> > which makes sense since gcc is a special case -- in short, for any
> > kind of "normal" recipe, there is no compelling reason to ever
> > mess with the WORKDIR variable, is there?
>
> You'd probably break things if you did.

  good ... so my guidance will be, don't mess with WORKDIR or evil
things will happen. students like that sort of advice.

> >   next, S, and its default value, again from bitbake.conf:
> >
> >   S = "${WORKDIR}/${BP}"
> >
> > as i read it (and i sure hope i understand this correctly), the S
> > directory is where a recipe's source is going to be unloaded and
> > patched, correct? and, AFAICT, setting this is a *choice* on the part
> > of the recipe author. leaving that value as it is seems to be
> > perfectly reasonable, or a recipe author can tweak it to some other
> > moderately-related value. i've seen numerous examples where, if the
> > SRC_URI refers to a git repo, the recipe author sets:
> >
> >   S = "${WORKDIR}/git"
> >
> > but, again, that's a *choice*, correct?
>
> No, this is where the bitbake fetcher typically unpacks to. The git
> fetcher module defaults to a directory called "git" in WORKDIR.
>
> >  just because you're cloning from a git repo doesn't *require* you
> > to set S that way, does it? is there any standard OE convention
> > or, more importantly, *requirement* for the value of S depending
> > on the recipe?
>
> The S value is determined by the things in SRC_URI. A tarball
> usually has the files in directory called ${BP} and when the fetcher
> extracts to WORKDIR, the files end up in a directory called ${BP} as
> a result.
>
> Not all tarballs follow that convention so the recipe sets this
> value as appropriate.

  ah, suddenly it's all clear ... the destination unpack (S) directory
is determined by the type of fetching being done. in the case of
tarballs, the default of ${WORKDIR}/${BP} is simply based on the fact
that that's the most common top-level directory name used in creating
those tarballs in the first place. if a different top-level name is
used, it's the responsibility of the recipe's author to know what it
is and set S accordingly. (i've actually never written a recipe from
scratch so embarrassed to admit i didn't know that.)

> >   moving on, when a recipe contains associated files in a files/
> > or ${PN}/ directory, as i read it, all of those files are always
> > copied directly into ${WORKDIR} for further processing, correct?
> > as in, it doesn't matter how you set S for that recipe, all files
> > listed with "file://" in the recipe's SRC_URI will be copied
> > directly to ${WORKDIR}, yes? and those files fall into two major
> > categories.
>
> *All* items in SRC_URI are unpacked to WORKDIR. Its just some create
> subdirectories themselves (like tarballs or the git fetcher) since
> to do otherwise would be more confusing.
>
> If you change these values you will see things break.

  good, that's what i thought.

> >   if a file is a patch file (.diff,.patch suffix), it will be
> > applied automatically. if it's not a patch file, then it only
> > makes sense if the corresponding recipe manually and explicitly
> > does something with that file, correct? otherwise, there's no
> > point in it being there.
>
> Correct.

  thought so ... and i *know* i've seen recipes which have local files
in the SRC_URI that don't seem to be referenced in the recipe. no
harm, of course, probably just historical holdovers someone forgot to
remove.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

