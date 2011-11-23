Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RT8Ul-00052Z-Av for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 09:47:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAN8fMer032168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 08:41:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31500-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 08:41:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAN8fElu032162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 08:41:15 GMT
Message-ID: <1322037680.18926.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 08:41:20 +0000
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F04246AAE@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F04246AAE@NAEMMAIL01.na.leapfrog.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pAN8fMer032168
Subject: Re: Overriding a variable only in our layer
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
X-List-Received-Date: Wed, 23 Nov 2011 08:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-11-23 at 01:24 +0000, Daniel Lazzari wrote:
> I ran into an interesting problem today that I need some help with.
> I=E2=80=99m not sure if this is a bitbake issue or an oe-core one so I =
thought
> I=E2=80=99d try here first. We have our own layer that overlays on top =
of
> oe-core, meta-oe, and meta-angstrom. Our layer has a bunch of recipes
> that pull projects from our local SVN, including a recipe for u-boot.
> We have a build configuration file that has lines like the following:
>
> SRCREV_pn-u-boot =3D =E2=80=9C563=E2=80=9D
> =20
> We pull in this conf at build time using bitbake=E2=80=99s =E2=80=93R a=
rgument. Just
> recently we switched u-boot=E2=80=99s SRCREV from ${AUTOREV} to an actu=
al
> revision number and bitbake started choking trying to parse recipes.
> It looks like it chokes while trying to parse oe-core=E2=80=99s u-boot =
git
> recipe because the SRCREV is meant for SVN, not GIT (even though our
> PREFERRED_VERSION is set up only to build our u-boot). Is there a way
> to override this SRCREV variable only when parsing recipes in our
> layer? I know I can do it directly in the recipe, but that loses us
> the advantages of having all of the SRCREVs in one file (which makes
> specific full rebuilds very easy).

We've not seen a conflict like that before. I'd suggest two possible
solutions off the top of my head:

a) Rename your svn recipe to something like "u-boot-svn" so its clear
which recipe the revision is meant for

b) .bbappend the .git recipe and force bitbake to ignore it (variables
like COMPATIBLE_HOST/COMPATIBLE_MACHINE/BROKEN spring to mind). I do
wonder if these mechanisms trigger early enough to stop bitbake choking.
If not, you could set SRCREV_pn-u-boot in the .bbappend to something it
won't choke on for the git recipe only. Not brilliant but should let you
maintain your existing file.

Cheers,

Richard




