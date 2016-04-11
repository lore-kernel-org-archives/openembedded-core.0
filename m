Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 991926FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 10:31:35 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160411103133085_0684;
	Mon, 11 Apr 2016 10:31:33 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=16984 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1apZ9M-0006VE-IV; Mon, 11 Apr 2016 06:32:56 -0400
Date: Mon, 11 Apr 2016 06:31:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20160408140705.GA2562@jama>
Message-ID: <alpine.LFD.2.20.1604110630370.3907@localhost.localdomain>
References: <alpine.LFD.2.20.1604080942280.11776@localhost.localdomain>
	<20160408140705.GA2562@jama>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: does a normal OE kernel build negate the ability to generate a local version string?
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
X-List-Received-Date: Mon, 11 Apr 2016 10:31:37 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Apr 2016, Martin Jansa wrote:

> On Fri, Apr 08, 2016 at 09:57:02AM -0400, Robert P. J. Day wrote:
> >
> >   i was just playing with wind river linux 8 and trying to figure out
> > why i couldn't generate a local version string that contained the git
> > commit ID, so i zipped over to oe-core to see how it was done there,
> > and it seems to be the same way, so can someone clarify that my
> > understanding here is correct?
> >
> >   normally, if i want to add the git commit ID ("-gxxxxxxxx") to the
> > kernel version string so it's available via "uname", i'm used to
> > selecting the kernel config option CONFIG_LOCALVERSION_AUTO, which
> > uses:
> >
> >  $ git rev-parse --verify HEAD
> >
> > to extract the first 8 characters of the commit ID. so i selected that
> > option, but wasn't getting that string.
> >
> >   poking around further, i saw this in scripts/setlocalversion:
> >
> > scm_version()
> > {
> >         local short
> >         short=false
> >
> >         cd "$srctree"
> >         if test -e .scmversion; then
> >                 cat .scmversion
> >                 return
> >         fi
> >         ... snip ...
> >
> > so if the file ".scmversion" exists, its contents are used instead.
> > now *i* never set that file, but lo and behold, in the kernel source
> > tree, there it was, empty, which explains why i wasn't getting any
> > local version string.
> >
> >   and where did that empty .scmversion file come from? i see this in
> > kernel.bbclass:
> >
> > kernel_do_configure() {
> >         # fixes extra + in /lib/modules/2.6.37+
> >         # $ scripts/setlocalversion . => +
> >         # $ make kernelversion => 2.6.37
> >         # $ make kernelrelease => 2.6.37+
> >         touch ${B}/.scmversion ${S}/.scmversion    <---- there
> >         ... snip ...
> >
> > which clearly appears to touch that empty file. is that deliberate? is
> > this an explicit decision by this bbclass file to prevent people from
> > generating that local version string? am i reading all this correctly?
>
> Yes, see
> http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053263.html
> for more details

  hmmmmm ... that's disappointing as i could have used that feature. i
guess i can always tweak a recipe that removes those files.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


