Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UOiZO-0006vJ-Le
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 07:55:15 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 5DE2BD1A65A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2013 07:37:55 +0200 (CEST)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5BB9DA614F;
	Sun,  7 Apr 2013 07:37:47 +0200 (CEST)
Date: Sun, 7 Apr 2013 07:37:45 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130407073745.54c2d0e8@e6520eb>
In-Reply-To: <CAP9ODKoG2xAL+45oqL++9rWWGC+CRBQyFa3jtX-fFUYKdvCOMA@mail.gmail.com>
References: <1365268668-15483-1-git-send-email-otavio@ossystems.com.br>
	<20130406200203.6eca6094@e6520eb>
	<CAP9ODKoG2xAL+45oqL++9rWWGC+CRBQyFa3jtX-fFUYKdvCOMA@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Fix matching of SOC_FAMILY in COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 07 Apr 2013 05:55:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Sat, 6 Apr 2013 17:58:30 -0300,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :

> On Sat, Apr 6, 2013 at 3:02 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> > Hi Otavio,
> >
> > Le Sat,  6 Apr 2013 14:17:48 -0300,
> > Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
> >
> >> When a SOC_FAMILY has more than one value, split by ':' as usual
> >> OVERRIDES, this were not being properly checked in COMPATIBLE_MACHINE
> >> matching as we need to iterate over each SoC family and check if it is
> >> compatible or not.
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta/classes/base.bbclass | 12 +++++++-----
> >>  1 file changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> >> index abd6a52..6f24064 100644
> >> --- a/meta/classes/base.bbclass
> >> +++ b/meta/classes/base.bbclass
> >> @@ -515,11 +515,13 @@ python () {
> >>          need_machine =3D d.getVar('COMPATIBLE_MACHINE', True)
> >>          if need_machine:
> >>              import re
> >> -            this_machine =3D d.getVar('MACHINE', True)
> >> -            if this_machine and not re.match(need_machine, this_machi=
ne):
> >> -                this_soc_family =3D d.getVar('SOC_FAMILY', True)
> >> -                if (this_soc_family and not re.match(need_machine, th=
is_soc_family)) or not this_soc_family:
> >> -                    raise bb.parse.SkipPackage("incompatible with mac=
hine %s (not in COMPATIBLE_MACHINE)" % this_machine)
> >> +            compat_machines =3D [d.getVar('MACHINE', True)]
> >> +            compat_machines.extend((d.getVar('SOC_FAMILY', True) or "=
").split(":"))
> >> +            for this_machine in compat_machines:
> >> +                if re.match(need_machine, this_machine):
> >> +                    break
> >> +            else:
> >> +                raise bb.parse.SkipPackage("incompatible with machine=
 %s (not in COMPATIBLE_MACHINE)" % this_machine)
> >>
> > aren't you breaking this log here vs what is was supposed to
> > print before ?
>=20
> The 'else' is used when no 'break' is done inside of for loop.
>=20
but will this_machine contain the value of the MACHINE variable ?

Eric


