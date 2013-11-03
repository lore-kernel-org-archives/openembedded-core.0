Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B3DF66B21A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2013 23:11:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA3NAnpZ027108; Sun, 3 Nov 2013 23:10:49 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Nvd1EN5Czn7A; Sun,  3 Nov 2013 23:10:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA3NAh66027097
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 3 Nov 2013 23:10:45 GMT
Message-ID: <1383520239.6271.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Sun, 03 Nov 2013 23:10:39 +0000
In-Reply-To: <CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
	<20131029082852.4399ee5e@e6520eb> <1383146112.25877.34.camel@ted>
	<20131102094725.14fb6902@e6520eb>
	<CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI computing order
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
X-List-Received-Date: Sun, 03 Nov 2013 23:11:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2013-11-03 at 23:16 +0100, Andrea Adami wrote:
> On Sat, Nov 2, 2013 at 9:47 AM, Eric Bénard <eric@eukrea.com> wrote:
> > Hi Richard,
> >
> > Le Wed, 30 Oct 2013 15:15:12 +0000,
> > Richard Purdie <richard.purdie@linuxfoundation.org> a écrit :
> >
> >> On Tue, 2013-10-29 at 08:28 +0100, Eric Bénard wrote:
> >> > Hi Khem,
> >> >
> >> > Le Mon, 28 Oct 2013 20:45:21 -0700,
> >> > Khem Raj <raj.khem@gmail.com> a écrit :
> >> >
> >> > > On Mon, Oct 28, 2013 at 7:10 AM, Eric Bénard <eric@eukrea.com> wrote:
> >> > > > Hi Richard,
> >> > > >
> >> > > > I saw your patch fixing FILESPATH's and Kergoth's one fixing
> >> > > > PACKAGECONFIG processing order and I think I'm also facing an order
> >> > > > problem when SRC_URI is computed.
> >> > > >
> >> > > > So when building SRC_URI when two layers have bbappend which apply
> >> > > > patches : the SRC_URI seems to be built using an order I fail to
> >> > > > understand somewhere instead of priority or the overrides' order.
> >> > > >
> >> > > > The use case is a System on Module and its custom motherboard :
> >> > > > - meta-fsl-arm :
> >> > > > * linux-imx_xyz.bb :
> >> > > > SRC_URI = "patchgeneric1 ..."
> >> > > >
> >> > > > - meta-som-support :
> >> > > > * conf/machine/mysom.conf
> >> > > >
> >> > > > * linux-imx_xyz.bbappend :
> >> > > > SRC_URI_append_mysom = "patchsom1 patchsom2 ..."
> >> > > >
> >> > > > - meta-custommotherboard (SOM + Cunstom Motherboard) :
> >> > > > * conf/machine/myproduct.conf
> >> > > > MACHINEOVERRIDES_prepend = "mysom:"
> >> > > > include conf/machine/mysom.conf
> >> > > >
> >> > > > * linux-imx_xyz.bbappend :
> >> > > > SRC_URI_append_myproduct = "patchproduct1 patchproduct2 ..."
> >> > > >
> >> > > > in the end I get :
> >> > > > SRC_URI = "patchgeneric1 ... patchsoc1 ... patchproduct1 ...
> >> > > > patchsom1 ..."
> >> > > >
> >> > > > and of course as patchproduct* are supposed to apply on top of
> >> > > > patchsoc* the patch fail to apply.
> >> > > >
> >> > > > I didn't found a way to build SRC_URI in the order I would like (I
> >> > > > tested : changing MACHINEOVERRIDES 's order, changing layers' priority,
> >> > > > changing machine's name to see if that was an alphabetical order ...).
> >> > > >
> >> > > > In the end the only thing which worked was to add an (empty by default)
> >> > > > variable in som's SRC_URI and filling this variables from the
> >> > > > custommotherboard's bbappend.
> >> > > >
> >> > > > Is the behaviour I'm seeing expected or is there something wrong in my
> >> > > > setup ?
> >> > >
> >> > > what is your OVERRIDES order.
> >> > >
> >> > "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
> >> >
> >> > so it follows the MACHINEOVERRIDES order (and I tried both append and
> >> > prepend to hack MACHINEOVERRIDES without any behaviour change).
> >>
> >> I think what Khem is asking is what OVERRIDES expands to?
> >>
> >> You mean patchso* and not patchsoc* above, right? Or should patchsom1 be
> >> patchsoc2?
> >>
> > oops :
> > I expect  SRC_URI = "patchgeneric1 ... patchsom1 ... patchproduct1 ..."
> > and I get :
> > SRC_URI = "patchgeneric1 ... patchproduct1 ... patchsom1 ..."
> >
> >> Its hard to follow and it might be easier if you could share a
> >> simplified test case we could reproduce this with. I don't doubt there
> >> is an issue in there but we need a way to reproduce and debug this.
> >>
> > OK, I'm preparing a simple testcase to reproduce that with oe-core +
> > meta-fsl-arm + meta-som + meta-baseboard.
> >
> > Eric
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> I have to report an undesiderate behavior:
> 
> the formfactor files in our .bbappend are not considered :/
> DEBUG: Searching for machconfig in paths:....
>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor-0.0/
>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor/
>   /oe/oe-core/meta/recipes-bsp/formfactor/files/
>   /oe/meta-handheld/recipes-bsp/formfactor/files/poodle
> 
> so we end up with the empty machconfig of
> /oe/oe-core/meta/recipes-bsp/formfactor/files/
> 
> Surely this didn't happen when we tested the recipe.

With which revision of OE-Core? Was this with the dora release tag,
current dora head or master?

Cheers,

Richard



