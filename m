Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE4277697
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:04:56 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170303110453246_0685;
	Fri, 03 Mar 2017 03:04:53 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=52021 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjl0w-00018y-CJ; Fri, 03 Mar 2017 06:04:46 -0500
Date: Fri, 3 Mar 2017 06:04:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Jack Mitchell <ml@embed.me.uk>
In-Reply-To: <19415188-9877-089c-5816-0e1a4f263a0e@embed.me.uk>
Message-ID: <alpine.LFD.2.20.1703030602410.9044@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703020605560.10072@uk63952.mitel.com>
	<alpine.LFD.2.20.1703020627050.11911@uk63952.mitel.com>
	<20170303095825.k2mfmg2mnut7hvks@ad.chargestorm.se>
	<alpine.LFD.2.20.1703030504170.6531@uk63952.mitel.com>
	<19415188-9877-089c-5816-0e1a4f263a0e@embed.me.uk>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: "inherit setuptools" versus "inherit pypi" -- a python style question
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
X-List-Received-Date: Fri, 03 Mar 2017 11:04:57 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Mar 2017, Jack Mitchell wrote:

> On 03/03/17 10:06, Robert P. J. Day wrote:
> > On Fri, 3 Mar 2017, Anders Darander wrote:
> >
> >> * Robert P. J. Day <rpjday@crashcourse.ca> [170302 12:33]:
> >>
> >>> On Thu, 2 Mar 2017, Robert P. J. Day wrote:
> >>
> >>>>   inherit pypi setuptools
> >>>>   require python-psutil.inc
> >>
> >>>> and the corresponding .inc file contains:
> >>
> >>>>   RDEPENDS_${PN} += " \
> >>>>     ${PYTHON_PN}-shell \
> >>>>     ${PYTHON_PN}-subprocess \
> >>>>     ${PYTHON_PN}-threading \
> >>>>   "
> >>
> >>>> so the first recipe inherits pypi, the second one inherits setuptools,
> >>>> and the third inherits *both*. what is the *preferred* style?
> >>
> >> Well, different purposes... If you take a look at pypi.bbclass, it's all
> >> about how to retrieve the module (source code). setuptools.bbclass is
> >> about how to install the module...
> >>
> >> Ie retrieving and installing...
> >
> >   yes, i finally twigged to that, but is there a *preferred* style?
> > from what i've seen, if there is a pair of files for a python module:
> >
> >   * foo.bb (which includes ...)
> >   * foo.inc
> >
> > the common style seems to be that:
> >
> >   * foo.bb inherits setuptools, while
> >   * foo.inc inherits pypi (if necessary, of course)
> >
> > at least i think that was the common style. obviously, there are
> > perfectly acceptable variations, i'd just like to know if there is a
> > recommended style.
>
> One reason for this is for py2/py3 reciepes. python-foo.bb will
> inherit setuptools, while python3-foo has to inherit setuptools3. So
> I would imagine that setuptools should always go in the bb. While
> pypi is python version agnostic I believe.

  right, which suggests that even if one has a recipe for which there
is only one version (python2 or python3), it's still a good idea to
break it as above just in case, some day, you want to support both
versions. that's all i mean by "style." thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


