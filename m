Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SkfT5-0006H7-Pl
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 19:58:56 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:56706 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SkfIX-00023x-0S for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 13:48:01 -0400
Date: Fri, 29 Jun 2012 13:47:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1sq7aAb=d3Bcnf27AhZo8A06WH63mGdp+gfSPHL-J9h09A@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1206291341400.5592@oneiric>
References: <alpine.DEB.2.02.1206291259270.4694@oneiric>
	<CAMKF1sq7aAb=d3Bcnf27AhZo8A06WH63mGdp+gfSPHL-J9h09A@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: any subtle reason for using "BPN" with ALLOW_EMPTY instead of just "PN"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 17:58:56 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-487220653-1340992080=:5592"

--8323329-487220653-1340992080=:5592
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 29 Jun 2012, raj.khem wrote:

> On Friday, June 29, 2012, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > =C2=A0in current poky ref manual, the explanation of ALLOW_EMPTY talks
> > about using it with a package name, as in:
> >
> > =C2=A0ALLOW_EMPTY_${PN} =3D "1"
> >
> > which makes perfect sense, except that there is the occasional example
> > where something other than "PN" is used, sometimes for good reason,
> > sometimes not clear.
> >
> > =C2=A0for instance, there's this:
> >
> > meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${PN} =3D "1"
> > meta/recipes-qt/qt4/qt4.inc:ALLOW_EMPTY_${QT_BASE_NAME}-fonts =3D "1"
> >
> > which makes sense (i guess) since, in this case, PN=3Dqt4-x11-free,
> > while QT_BASE_NAME=3Dqt4. =C2=A0so there are obviously going to be spec=
ial
> > cases like that.
> >
> > =C2=A0but here are a few that seem to use BPN unnecessarily:
> >
> > meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-binaries =
=3D "1"
> > meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-charmaps =
=3D "1"
> > meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-gconvs =
=3D "1"
> > meta/recipes-core/eglibc/eglibc-locale.inc:ALLOW_EMPTY_${BPN}-localedat=
as =3D "1"
> > meta/recipes-graphics/pango/pango.inc:ALLOW_EMPTY_${BPN}-modules =3D "1=
"
> >
> > it seems that, with the above packages, PN =3D BPN so, yes, either
> > one would have worked, but is there a best practice? =C2=A0i would
> > think that using anything other than PN should be reserved for
> > when it's necessary, so that it's more aesthetically obvious that
> > something different is happening.
>
> This is needed when PN is altered e.g
> When using BBCLASSEXTEND

  ah, that clears it up.  i was using:

  $ bitbake -e pango

to check the environment variables for pango and saw that PN was equal
to BPN ("pango") and i was getting confused.  then i realized i should
have been trying:

  $ bitbake -e pango-native

and then i could see the difference between PN and BPN.  thanks.  more
idiot questions to follow.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-487220653-1340992080=:5592--
