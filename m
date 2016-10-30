Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 70B356FEFA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 17:36:52 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161030173650597_0486;
	Sun, 30 Oct 2016 17:36:50 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=49324 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c0u2F-0000QR-PW; Sun, 30 Oct 2016 13:36:43 -0400
Date: Sun, 30 Oct 2016 13:35:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610301333390.3944@localhost.localdomain>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
	<CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Sun, 30 Oct 2016 17:36:53 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-270796150-1477848946=:3944"

--8323328-270796150-1477848946=:3944
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 30 Oct 2016, Christopher Larson wrote:

> On Sun, Oct 30, 2016 at 5:25 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>         not sure if i should have noticed this before, but i was building a
>       number of python modules, and my collection of layers gave me two
>       possibilities for python-django:
>
>         * python-django_git.bb      (meta-openstack)
>         * python-django_1.9.7.bb    (meta-python)
>
>         i simply assumed that any "git"-versioned recipe would typically
>       take precedence over a fixed version recipe, so i was surprised to see
>       that what was built was python-django-1.8.6. huh?
>
>         then i looked at the recipe from meta-openstack, and it contained
>       the lines:
>
>         PV = "1.8.6"
>         SRCREV = "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
>
>         SRC_URI = " \
>             git://github.com/django/django.git;branch=stable/1.8.x \
>             "
>
>       am i right in being a bit confused by that? i checked out the github
>       repo, and it has branches "stable/1.8.x", and also "stable/1.9.x" and
>       "stable/1.10.x". so what is that supposed to mean?
>
>         am i right in assuming that a "git" recipe will (in the absence of
>       any PREFERRED_VERSION settings or other overriding settings) always be
>       considered before a fixed version recipe? and is that why i got this
>       (for me) unexpected result?
>
>
> Bitbake selects default versions via DEFAULT_VERSION,
> PREFERRED_VERSION, and lacking both, a naïve version comparison.
> There’s nothing magic to select or not select an _git recipe.
>
> It’s been a very common pattern for the _git recipe to be the
> development version / branch HEAD, to be used only when explicitly
> selected, whereas the versioned recipes are stable and versioned, so
> are appropriate defaults. That said, there are also _git recipes
> that set specific versions, and version recipes that use git to
> fetch that version. There’s a lack of consistency in that regard,
> but what you were surprised by has basically been the expected,
> default convention in the past, not the exception.

  fair enough ... i'm embarrassed to admit i didn't really understand
the versioning selection so i'm going to examine it way more carefully
now. i wonder how many recipes in oe-core are "_git" recipes that, in
the end, just lock down to a specific version. as you say, i was a bit
surprised.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-270796150-1477848946=:3944--
