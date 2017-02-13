Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id B81A46006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:51:42 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170213135140118_0484;
	Mon, 13 Feb 2017 13:51:40 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=58461 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cdH2T-00014v-6e; Mon, 13 Feb 2017 08:51:33 -0500
Date: Mon, 13 Feb 2017 08:51:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <37eeaba5-4561-6e3c-60e9-ae090b2e579f@linux.intel.com>
Message-ID: <alpine.LFD.2.20.1702130808300.13813@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702090654250.29564@uk63952.mitel.com>
	<37eeaba5-4561-6e3c-60e9-ae090b2e579f@linux.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the significance of the numeric version part of 'PV = "1.0.1+git${SRCPV}"'?
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
X-List-Received-Date: Mon, 13 Feb 2017 13:51:43 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Feb 2017, Leonardo Sandoval wrote:

>
>
> On 02/09/2017 06:06 AM, Robert P. J. Day wrote:
> >    i *thought* i understood this, but a colleague insists i don't so
> > ... dumb question time.
> >
> >    recently, i asked about the netdata recipe file "netdata_git.bb",
> > which contains the snippet:
> >
> >    SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
> >    SRCREV = "36c1304e37094174ea51001903058e65053107ca"
> >    PV = "1.0.1+git${SRCPV}"
> >
> > perhaps i've been wrong all this time, but i understood the above to
> > mean that the source checked out would be based on commit
> > 36c1304e37094174ea51001903058e65053107ca, and that the "1.0.1+" part
> > of the PV variable was simply for aesthetics.
> >
> >    i realize that the full value of PV would be used to generate the
> > final rpm files, and here's what i get:
> >
> >    netdata-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
> >    netdata-dbg-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
> >    netdata-dev-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
> >
> > but is there some other significance or functionality associated
> > with that "1.0.1+" prefix for PV?
> that is the version and it should be the most recent release or tag
> point of the SCM.
> >
> >    the only thing i can think of is OE's algorithm for selecting
> > the most recent recipe. AIUI, if i have multiple versions for the
> > same recipe. all things being equal, OE would choose the "git"
> > recipe file over a numerically-versioned recipe file, correct?
> >
> >    so, say i have two recipe files:
> >
> >    netdata_1.0.2.bb
> >    netdata_git.bb
> >
> > i assume that OE would choose the second one by default, even if,
> > internally, that "git" form of the recipe selected a SRCREV that
> > might represent an earlier commit than the 1.0.2 version.
> On this area, check this link
>
> http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#var-PREFERRED_VERSION
>
> If you want to use git recipe, then you need to explicitly indicate
> it through the latter variable, otherwise the 1.0.2 will be used.

  ok, i've never dug into the recipe versioning really, really deeply
so a few questions if i may. (and if all this is written out
somewhere already, a link would be just ducky.)

  first, where is the code that handles recipe versioning and
selection? i'm assuming it's part of the bitbake fetcher library, but
i'm willing to be corrected.

  next (ignoring "git"-based recipes for the moment and
PREFERRED_VERSION aside), is the selection of one of a number of
recipes based on the final value of "PV" that is set/calculated for a
given recipe file? i can see that one can set "PV" in any recipe file,
and i'm also assuming that if one doesn't do that, the value of "PV"
would be extracted from the recipe file name so, for instance, the
recipe file busybox_1.24.1.bb would automatically generate a "PV"
value of 1.24.1. that part seems fairly obvious.

  next (and what might be a silly question), based on the above, is it
possible to set absurdly misleading PV values in recipe files for the
same recipe, such as:

  rday_1.0.bb
	PV = "2.0"

  rday_2.0.bb
	PV = "1.0"

of course the above is wildly confusing, but is it legal? and given
what's written above, i'm concluding that the most "recent" recipe
selected by default would be "rday_1.0.bb", yes?

  now, on to "git" recipes. for all of the git-based recipes i can
see, the recipe files contain some variation of:

  SRCREV = "8f33f80100096f7790c7b819ce37a3ed8ce8b5fa"
  PV = "2.99.917+git${SRCPV}"

(side question: is there any "git"-based recipe that *doesn't* have
some form of the above? would a file like that be considered an error?
or at least badly written?)

  as for "git" recipe files, i've always understood that, regardless
of the version number prefix used in setting "PV" (in the above,
"2.99.917"), the "SRCPV" value defines the actual commit that will be
fetched and checked out. so where does that leave the version number
prefix "2.99.917".

  as i've read it all this time, even when using a git-based recipe,
developers like to choose that version number prefix to represent some
official tag that was not so far in the recent past from the git
commit ID -- kind of an aesthetic reminder that, "this git recipe
represents some level of improvement over version 2.99.917", but not
as far as the *next* official version number, something like that.

  in addition, though, that numeric version prefix is used to select
the most "recent" recipe version, so that (if i read this correctly),
if i have two recipe files:

  * netdata_1.0.2.bb
  * netdata_git.bb

while the first file is a fixed version, it all depends on the value
of "PV" set in the second version, so that if the second recipe file
contained the line:

  PV = "1.0.1+git${SRCPV}"

then PREFERRED_VERSION aside, the fixed version (1.0.2) would be
selected as the more recent recipe file, even if that git SRCPV
represented newer content. how am i doing so far?

  i might have a couple more questions on all of this shortly as i
keep reading.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================





