Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SFOZi-00066L-JI for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 13:40:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q34BVKX1032615
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Apr 2012 12:31:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32341-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 12:31:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q34BV8LB032609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Apr 2012 12:31:11 +0100
Message-ID: <1333539066.11559.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Apr 2012 12:31:06 +0100
In-Reply-To: <20120404094728.01c3ba51@eb-e6520>
References: <loom.20120404T082801-1@post.gmane.org>
	<20120404091834.367f9617@eb-e6520>
	<CAGiJk9f_=5pVUurpPT4pO3qPZC=bOn2Qg_1iaaE=A5g+0cG1Vw@mail.gmail.com>
	<20120404094728.01c3ba51@eb-e6520>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q34BVKX1032615
Subject: Re: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Wed, 04 Apr 2012 11:40:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-04 at 09:47 +0200, Eric B=C3=A9nard wrote:
> Le Wed, 4 Apr 2012 09:21:02 +0200,
> Samuel Stirtzel <s.stirtzel@googlemail.com> a =C3=A9crit :
>=20
> > 2012/4/4 Eric B=C3=A9nard <eric@eukrea.com>:
> > > Hi Surenda,
> > >
> > > Le Wed, 4 Apr 2012 06:34:39 +0000 (UTC),
> > > surendra dhobale <surendra.dhobalelinux@gmail.com> a =C3=A9crit :
> > >>  I am working with the open embedded environment.
> > >>
> > >> I have added one u-boot package in that. First time by default the=
 compilation
> > >> done successfully using the bitbake. But Now i made some changes i=
n the source
> > >> .
> > >>
> > >> Now i have to built the same package with neglecting the fetch() s=
tage.
> > >> and rebuilt it means need to compilation.
> > >>
> > >> Is any commands for that...
> > >> Can please anyone explain me in deatails about that. I am newbie i=
n the open
> > >> embedded.
> > >>
> > > bitbake u-boot -c cleansstate
> > > bitbake u-boot
> > >
> > > Eric
> >=20
> > Hi,
> > please note this will delete local changes (in thework directory) to
> > the sourcecode!
> >=20
> > If you only want to compile again you can use
> >=20
> > bitbake -c compile -f u-boot
> > and then "bitbake u-boot" to build the other tasks.

There is some documentation in the manual about this:
http://www.yoctoproject.org/docs/latest/poky-ref-manual/poky-ref-manual.h=
tml#platdev-appdev-insitu

> oops, I read his message to fast and didn't notice the "i made some
> changes in the source code , which is created in the Temp work
> directory".
>=20
> For this kind of work, I prefer to do :
> bitbake u-boot -c configure
> copy the source from workdir to a directory outside OE
> then change to this dir and
> git init
> git add .
> git commit -m init
> then you can hack it outside OE (and compile it using a meta-toolchain
> for example)
> and in the end you can easily produce a patch using git that you
> integrate back into OE.

Eric: You should probably look at the externalsrc.bbclass since it gives
you a way to do things like this yet also build and package it with the
usual build system:

http://www.yoctoproject.org/docs/latest/poky-ref-manual/poky-ref-manual.h=
tml#ref-classes-externalsrc

Cheers,

Richard



