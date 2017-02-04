Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 600BB6010B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Feb 2017 17:12:11 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170204171209528_0685;
	Sat, 04 Feb 2017 09:12:09 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=40986 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ca3sY-00016O-JI; Sat, 04 Feb 2017 12:12:02 -0500
Date: Sat, 4 Feb 2017 12:12:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1486131492.14144.70.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1702041149580.24018@localhost.localdomain>
References: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
	<1486131492.14144.70.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: whatever happened to a proposal for "read-only" sstate?
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
X-List-Received-Date: Sat, 04 Feb 2017 17:12:14 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-785360663-1486228322=:24018"

--8323328-785360663-1486228322=:24018
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2017, Richard Purdie wrote:

> On Fri, 2017-02-03 at 06:45 -0500, Robert P. J. Day wrote:
> >   for purposes of teaching, i wanted to check into the feasibility of
> > having students take advantage of a single shared state cache, but
> > still have the option of building whatever source they needed in
> > their
> > own *personal* sstate cache.
> >
> >   i found this reference from 2014:
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2014-August
> > /096486.html
> >
> > but it seems clear nothing became of it; there's certainly no
> > .bbclass
> > file that matches that.
> >
> >   what are the options for setting up something like this? or is that
> > already supported and i'm just not seeing it?
>
> It was never merged as its not really necessary, you can do this
> with existing functionality.
>
> Just point SSTATE_MIRRORS at the common shared directory and
> SSTATE_DIR at the directory you want to be the personal one.

  let me make sure i understand this so i don't screw it up and waste
time asking even dumber questions.

  imagine i want to teach a class where everyone is going to build
some image -- core-image-minimal, core-image-base, whatever -- for the
same target board. (i realize you don't *need* to share state just for
the same target board but, in my case, there will be a great deal of
commonality in the classroom so shared state will be particularly
useful.)

  first, i can configure and do a build for a fairly comprehensive
image (core-image-base, perhaps) -- the more comprehensive, the
better, to generate as much shared state as possible. so far, so good?

  first question -- once i do that, can i just copy the generated
sstate-cache/ directory to a publicly-accessible location so everyone
else can get to it? for now, i'll keep it read-only, which means that
if someone needs content that isn't in that shared state cache, they
will have to generate it locally.

  once i copy my sstate-cache/ directory as above, how would others
take advantage of it? i'm looking at the alleged explanation in
local.conf.sample:

# Shared-state files from other locations
#
# As mentioned above, shared state files are prebuilt cache data objects which can
# used to accelerate build time. This variable can be used to configure the system
# to search other mirror locations for these objects before it builds the data itself.
#
# This can be a filesystem directory, or a remote url such as http or ftp. These
# would contain the sstate-cache results from previous builds (possibly from other
# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
# cache locations to check for the shared objects.
# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
# at the end as shown in the examples below. This will be substituted with the
# correct path within the directory structure.
#SSTATE_MIRRORS ?= "\
#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
#file://.* file:///some/local/dir/sstate/PATH"

  this explanation confuses me -- what does that "NOTE" mean? what
would be proper setting for SSTATE_MIRRORS to simply point at an
accessible shared state directory? (possibly NFS-mounted.)

  finally, for building local content, i presume that students would
simply leave SSTATE_DIR with its original value of

  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

i think that's all i want to clarify, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-785360663-1486228322=:24018--
