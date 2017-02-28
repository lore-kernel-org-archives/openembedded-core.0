Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 65A3572F91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:16:16 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170228101610223_0485;
	Tue, 28 Feb 2017 10:16:10 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=46816 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciep9-0005No-5M; Tue, 28 Feb 2017 05:16:03 -0500
Date: Tue, 28 Feb 2017 05:16:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Patrick Ohly <patrick.ohly@intel.com>
In-Reply-To: <1488276258.7785.26.camel@intel.com>
Message-ID: <alpine.LFD.2.20.1702280513570.29184@localhost.localdomain>
References: <alpine.LFD.2.20.1702270559150.22784@uk63952.mitel.com>
	<1488276258.7785.26.camel@intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: style suggestions for that whole "_append" and leading space thing
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
X-List-Received-Date: Tue, 28 Feb 2017 10:16:19 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Feb 2017, Patrick Ohly wrote:

> On Mon, 2017-02-27 at 06:07 -0500, Robert P. J. Day wrote:
> >   getting pedantic (as i am wont to do), occasionally i run across
> > things like this, from meta/conf/distro/include/no-static-libs.inc:
> >
> >   EXTRA_OECONF_append = "${DISABLE_STATIC}"
> >
> > which, at first glance, simply seems wrong given the lack of a leading
> > space, until one looks higher up in that same file to read:
> >
> >   DISABLE_STATIC = " --disable-static"
> >
> > where one finds the leading space as part of the variable itself.
> > i find this potentially *really* confusing; consistent style
> > suggests variables should be assigned their values without regard
> > as to how they might be used later. subsequent references or
> > usages of those variables should be responsible for making sure
> > they're included properly, no?
>
> In principle you are right, but probably it was done this way here
> to avoid adding a space to EXTRA_OECONF in those cases where
> DISABLE_STATIC is overridden to be empty. Consider DISABLE_STATIC an
> implementation detail and then it becomes okay to set it as needed
> by the implementation.

  ehhhhhhhhh ... i'm not sure i'm convinced but i'll let this one go.

> >   and the last line in that same file also suggests potential misuse:
> >
> >   EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"
>
> Yes, that's just plain wrong and just happens to work by accident.

  just submitted a patch for this.

> > p.s. would the same logic hold with lines like this?
> >
> > meta/conf/machine/include/tune-ppce6500.inc:
> >
> >   MACHINE_FEATURES_BACKFILL_CONSIDERED_append =
> >      "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
> >
> > would it not be clearer if one were to write:
> >
> >   MACHINE_FEATURES_BACKFILL_CONSIDERED_append =
> >      " ${@bb.utils.contains('TUNE_FEATURES', 'e6500', 'qemu-usermode', '', d)}"
>
> The existing line is better because it avoids adding a space when
> nothing needs to be added.

  ok, i'll buy that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


