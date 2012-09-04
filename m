Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8tam-0001kt-Pm for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 15:55:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84DgbYG017462;
	Tue, 4 Sep 2012 14:42:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17016-03; Tue,  4 Sep 2012 14:42:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84DgU2v017456
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 14:42:31 +0100
Message-ID: <1346766150.30964.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 04 Sep 2012 14:42:30 +0100
In-Reply-To: <CALbNGRS=MCh2R4MK=BJyX2SDC_3Mr_-ETHCS7sX_tVhB9bG_5w@mail.gmail.com>
References: <CAJTo0LYYFvwD75PsXu2WtC+CvQ2ep0i5bDKZFcNKFyQXwDDGTQ@mail.gmail.com>
	<50433775.2030101@gmail.com> <1346589598.30964.4.camel@ted>
	<CALbNGRS=MCh2R4MK=BJyX2SDC_3Mr_-ETHCS7sX_tVhB9bG_5w@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q84DgbYG017462
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Tue, 04 Sep 2012 13:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-02 at 15:30 +0200, Andreas M=C3=BCller wrote:
> On Sun, Sep 2, 2012 at 2:39 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2012-09-02 at 12:39 +0200, Zoltan Gaal wrote:
> >> I've tried it, but mesa-dri is required for xserver and it won't com=
pile
> >> without it. libgles-omap3 cannot replace the mesa dependency, though=
 I'm
> >> not sure  if it is a simple config issue or some interface is missin=
g
> >> (libgl). And as libgles-omap3 also provides virtual/egl, the bitbake
> >> process detects, there exists multiple projects with the same provid=
ed
> >> feature:
> >>
> >> NOTE: Resolving any missing task queue dependencies
> >> NOTE: Preparing runqueue
> >> ERROR: Multiple .bb files are due to be built which each provide
> >> virtual/egl
> >> (/home/gzp/work/gumstix/oe/oe-meta/meta-ti/recipes-graphics/libgles/=
libgles-omap3_4.05.00.03.bb
> >> /home/gzp/work/gumstix/oe/oe-core/meta/recipes-graphics/mesa/mesa-dr=
i_8.0.4.bb).
> >>   This usually means one provides something the other doesn't and sh=
ould.
> >> NOTE: Executing SetScene Tasks
> >> NOTE: Executing RunQueue Tasks
> >>
> >> (in local.conf: PREFERRED_PROVIDER_virtual/egl=3D"libgles-omap3")
> >
> > Try also adding it to MULTI_PROVIDER_WHITELIST (see bitbake.conf).
> >
> > This error message did use to just be a note but was turned into an
> > error at various user's requests. Sometimes it means there are seriou=
s
> > configuration issues, in a case like this, its ok though...
> >
> The problem is not the error message in first place but the wrong libs
> (egl/gles/glesv2) in rootfs. As soon as mesa is in, libgles-omap libs
> are out.

This sounds like a configuration issue.

Firstly, the machine config needs to make sure the libgles-omap package
is included in the image, probably through something like the XSERVER
variable although I appreciate we don't have anything for egl at this
point.

Secondly, the libglex-omap module should CONFLICT/REPLACE/PROVIDE the
bits of mesa it replaces.

Cheers,

Richard



