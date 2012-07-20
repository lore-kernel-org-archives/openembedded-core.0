Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1Ss3ci-00080D-7d
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 05:11:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6K1fha8018548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 18:41:44 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.203]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.01.0255.000;
	Thu, 19 Jul 2012 18:41:42 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] modifying inittab (for example)
Thread-Index: Ac1lO3LorVUQ50xMRU6biMXWSeTsigAbkMIAABtmyaA=
Date: Fri, 20 Jul 2012 01:41:42 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF841FF715DA@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF841FF701EF@ALA-MBB.corp.ad.wrs.com>
	<20120719052624.GB3331@jama.jama.net>
In-Reply-To: <20120719052624.GB3331@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: Re: modifying inittab (for example)
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
X-List-Received-Date: Fri, 20 Jul 2012 03:11:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, July 18, 2012 10:26 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] modifying inittab (for example)
>=20
> On Wed, Jul 18, 2012 at 11:29:43PM +0000, Slater, Joseph wrote:
> > Suppose we want to boot to different runlevels for different images.  W=
e could modify
> the default inittab
> > to reflect that.  We could modify it in various ways, but I don't think=
 the exact
> mechanism much matters.
> >
> > What is an interesting question is WHEN we modify it.
> >
> > One way would be to  have a small piece of code and invoke it during im=
age creation
> using
> > something like
> >
> > ROOTFS_POSTPROCESS_COMMAND +=3D "sato_image_pp ; "
> >
> > in our sato-image.bb recipe.  This doesn't require creating any new fea=
tures.
>=20
> This doesn't work very well for images with package management, when user
> upgrades installed packages, he can get new sysvinit-inittab which will
> reset runlevel in all types of images to same value.

In this particular case, I found there is a CONFFILES set in the recipe tha=
t prohibits
updating inittab when updating the package using package management (if you=
're lucky).

I have to admit that there are more of these "variables" lying around than =
a simple mind
would imagine.

Joe

>=20
> > But, we could also do it when we build sysvinit-inittab.  I think, if w=
e did that, we
> would need a feature,
> > probably a DISTRO_FEATURE, that was set in some conf file.
>=20
> This doesn't work too, if you have just one sysvinit-inittab recipe then
> it's used for all images -> so again same runlevel in all.
>=20
> > Is there a preference for one way or the other?
>=20
> You can create different inittab recipes for each runlevel you want and
> then make sure that only right inittab package is pulled to each image.
>=20
> Cheers,
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


