Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id B5BDE71AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 11:33:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170302113322711_0486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 11:33:22 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=56488 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjOyz-0004IB-1j for openembedded-core@lists.openembedded.org;
	Thu, 02 Mar 2017 06:33:17 -0500
Date: Thu, 2 Mar 2017 06:33:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.20.1703020605560.10072@uk63952.mitel.com>
Message-ID: <alpine.LFD.2.20.1703020627050.11911@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703020605560.10072@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
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
X-List-Received-Date: Thu, 02 Mar 2017 11:33:23 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2017, Robert P. J. Day wrote:

>   possibly a "best practices" question ... regarding recipe for
> "python-psutil" (although this applies for numerous python recipes),
> wind river linux 8 has a recipe for python-psutil_2.2.1.bb which
> inherits pypi:
>
>   RDEPENDS_${PN} += " \
>     python-subprocess \
>     "
>
>   inherit pypi
>
> a newer recipe i ran across in-house that someone else set up,
> python-psutil_3.2.1.bb, instead inherits setuptools and gets the
> source from github:
>
>   inherit setuptools
>
>   # 3.2.1 tag
>   SRCREV = "99f6abf9bcff3abff815b8e93c8cd2fbe26487a2"
>   SRC_URI = "git://github.com/giampaolo/psutil.git;protocol=https"
>
>   S = "${WORKDIR}/git"
>
>   RDEPENDS_${PN} += " \
>     python-subprocess \
>     "
>
> finally, the current (meta-openembedded) meta-python recipe,
> python-psutil_5.0.1.bb, inherits both:
>
>   inherit pypi setuptools
>   require python-psutil.inc
>
> and the corresponding .inc file contains:
>
>   RDEPENDS_${PN} += " \
>     ${PYTHON_PN}-shell \
>     ${PYTHON_PN}-subprocess \
>     ${PYTHON_PN}-threading \
>   "
>
> so the first recipe inherits pypi, the second one inherits setuptools,
> and the third inherits *both*. what is the *preferred* style?
>
>   i'm assuming that if a python module is availably via pypi, then
> you'd go with that; otherwise, just use regular setuptools. and not
> being a python guru, why does that third recipe need to inherit both?
>
>   i did a quick grep of the current meta-python layer to see the
> frequency of each, and got:
>
>   $ grep -r "inherit pypi$" | wc -l
>   13
>   $
>
>   $ grep -r "inherit pypi setuptools" | wc -l
>   157
>   $
>
> so, clearly, far more python recipes inherit both as opposed to just
> inheriting pypi. i don't know enough about python recipes to
> appreciate if this distinction is necessary or not. can someone
> clarify this? thanks.

  grrrrrr ... i just looked more closely and it appears that all of
the "recipe" files under meta-python that inherit only pypi are all
".inc" files, being included by recipe files that first inherit
setuptools. so, again, clarification on the proper way to do this
would be nice.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


