Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TR3Zp-0005GW-5Y for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 18:13:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OFxZR5005595;
	Wed, 24 Oct 2012 16:59:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04989-07; Wed, 24 Oct 2012 16:59:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OFxO3F005588
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 24 Oct 2012 16:59:26 +0100
Message-ID: <1351094364.22340.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 24 Oct 2012 16:59:24 +0100
In-Reply-To: <CALbNGRQoX5J5NvPRHc2VAx-D58UvxQmLhunEev09OaxkFwGJKA@mail.gmail.com>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
	<CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
	<1700131.q7Jk2zQzF1@helios>
	<CALbNGRQoX5J5NvPRHc2VAx-D58UvxQmLhunEev09OaxkFwGJKA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q9OFxZR5005595
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Latest head causes challanges
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2012 16:13:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 16:49 +0200, Andreas M=C3=BCller wrote:
> On Wed, Oct 24, 2012 at 4:30 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Wednesday 24 October 2012 16:24:08 Andreas M=C3=BCller wrote:
> >> On Wed, Oct 24, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote=
:
> >> > On Wed, 2012-10-24 at 16:19 +0200, Andreas M=C3=BCller wrote:
> >> >> I updated my layers this morning. Since that I have huge fallout:
> >> >> Poking around I found /usr/libexec is missing on my machine. Any =
idea
> >> >> what might caused this?
> >> >
> >> > 406bd38b4232f9f399ef5ffe0b4fac72ed605a23?
> >> >
> >> > p.
> >>
> >> Wow - I thought we are close to release...
> >
> > The master branch has already moved past release - danny is the relea=
se branch
> > and does not have this patch.
> >
> > Cheers,
> > Paul
> >
> To me this is a log off and go home. Since when do we care for FHS? I
> thought everything is on it's way to /lib... And I thought on master
> branch I am safe from strange changes these days...

Set:

libexecdir =3D "${exec_prefix}/libexec"

and you will get the old behaviour. This change did not go into the
release branch. If you want to track a stable release, please use the
release branch. The master branch has opened up for further development
now.=20

With things like filesystem layout, we've always aimed to allow it to be
configured as the end user requires and nothing has changed. We don't
have to follow FSH although in some cases its probably useful to, or at
least ensure you can follow it (which you couldn't previously). You can
pick whichever layout you want and we've taken steps to ensure both
layouts work.

Part of the reason for doing this is specifically due to the fact that
everything is on its way to /lib/. If you follow that through, it makes
sense to split from /libexec/ to /lib/${PN} and separate the packages.
If we need to do this, its better to test our code can support that kind
of layout now, avoiding pain in the future.

So I'm sorry this change is disruptive for you, I think there are ways
you can avoid the problem, not least by setting the variable as above
and avoiding the change.

Cheers,

Richard



