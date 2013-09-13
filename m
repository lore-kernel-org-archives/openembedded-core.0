Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id E92D86B6BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:29:36 +0000 (UTC)
Received: from ad.chargestorm.se (83.252.255.124) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 13 Sep 2013 21:27:46 +0200
Date: Fri, 13 Sep 2013 21:29:34 +0200
From: Anders Darander <anders@chargestorm.se>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130913192934.GA5469@ad.chargestorm.se>
Mail-Followup-To: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20130913075635.GA3573@ad.chargestorm.se>
	<CAP9ODKqcm79GME3fKMDQqWvE-h2cB++mFOC9vcr3JjE3B+ywYw@mail.gmail.com>
	<923730d4-0ca2-411a-97e8-17cbe043ea43@email.android.com>
	<CAP9ODKpaEDmOXK6b1KLvwOv6FYXGJ1nfZ3D4MGUa3qo-cagfyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpaEDmOXK6b1KLvwOv6FYXGJ1nfZ3D4MGUa3qo-cagfyw@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot-fw-utils -> u-boot-fw-utils-cross
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
X-List-Received-Date: Fri, 13 Sep 2013 19:29:38 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Otavio Salvador <otavio@ossystems.com.br> [130913 21:16]:

> On Fri, Sep 13, 2013 at 3:55 PM, Anders Darander <anders@chargestorm.se> =
wrote:
> > Otavio Salvador <otavio@ossystems.com.br> wrote:
> >>On Fri, Sep 13, 2013 at 4:56 AM, Anders Darander
> >><anders@chargestorm.se> wrote:
> >>> As I've started to bring our internal distro and machines up to the
> >>> lates oe-core, I've got some issues with the u-boot-fw-utils to
> >>> u-boot-fw-utils-cross transition.

> >>Right.

> >>> In my old branch, I used u-boot-fw-utils_2011.06. This used to
> >>compile
> >>> and package fw_printenv(setenv) just fine.

> >>> In the new, u-boot-fw-utils-cross_2013.07.bb, fw_printenv is now
> >>built
> >>> using HOSTCC instead of the cross-compiler. The old recipe used to
> >>> include:
> >>> EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}"'
> >>> as u-boot defaults to build everything under tools/ using HOSTC.

> >>Yes; this is intended to be used in the host. I can add support for
> >>use in target as well (or help you to do it).

> > Sorry that I didn't see this during the review of your patch that made =
this change. If u-boot-fw-utils-cross of intended to be used on the host, w=
hy did you then replace the old u-boot-fw-utils with this recipe?

> > The old u-boot-fw-utils were to create fw_printenv to be used on the _t=
arget_ not on the host. Unfortunately, I don't think this was ever mentione=
d during the patch review...

> Yes but this was a /bug/ in the build system. As it got HOSTCC so it
> was indeed to be used as /host/ not target.

Well, the fw_printenv is indeed mainly intended to be used on target...
Why the U-Boot maintainers insist on defaulting to use HOSTCC is a
completely different matter. I know that there's been quite a few mail
threads about that (and I've personally argued on this matter in at
least one of those threads). Thus, I don't agree with you that it was a
bug in the original recipe.

I'm doing the same thing in my patch, as I prefer to do it that way
instead of patching the Makefile.

> >>> What's the reason for this change? Currently fw_printenv is being
> >>built
> >>> for my host system, and not the target...

> >>Yes; the way to proper package it for target is from u-boot itself,
> >>not on this recipe.

> > Yep, so the commit log that makes the transition from u-boot-fw-utils t=
o u-boot-fw-utils-cross should have mentioned that the purpose of those two=
 packages are completely different.

> Right; I might not been clear on this.

> >>> Further more, fw_printenv does not get packaged. I can see that
> >>> fw_printenv is installed in ${WORKDIR}/image, but never moved to
> >>> ${WORKDIR}/package. I guess that this is caused by inheriting
> >>> cross.bbclass?

> >>> Am I missing something in my distro config, or have I overlooked
> >>> something else? fw_printenv doesn't really make sense for me to run
> >>on
> >>> the host, and is (in my case) rather essential on the target.

> >>> I guess that I'm doing something wrong; can anyone give me some hint
> >>on
> >>> where to look? Or do we have an issue with the u-boot-fw-utils-cross
> >>> recipe?

> >>No, you are right. I can help you to solve it (or solve it and send
> >>you the solution) if you want.

> > I've got a working u-boot-fw-utils recipe that I can submit. I'll look =
into this on Monday morning, to ensure that it's of enough quality to publi=
sh.

> Ahh neat! So please e-mail me and I help to clean it.

I've made a quick clean-up and submitted a patch a few moments ago.
Hopefully, I might have some review comments by Monday, which hopefully
could get the patch to a mergeable state during Monday / Tuesday.=20

> > Just curious, what use case do you have for fw_* the build host?

> So we can mangle environment per image ;-)

Ok. I've never tried to do that using these tools. The only times I've
created env-images, I've been using an old TCL script based on the one
Atmel supplies in their SAM-BA tool...

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se

