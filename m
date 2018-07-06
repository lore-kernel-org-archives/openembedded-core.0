Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D90476024
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 09:12:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w669BwZ5021252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 6 Jul 2018 10:11:59 +0100
Message-ID: <0dd54be24537b0609ca810fff36923019911366a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 06 Jul 2018 10:11:58 +0100
In-Reply-To: <CAJ86T=ULm4BBu2JWmVTDfuVxh4vcd9FVDVJzyC3Qt6tgiTNHZw@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
	<CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
	<CAJTo0LaUkxKcPhasnQh6KAsh2kv5rEmy-jMW3oXKxttS-kd1mQ@mail.gmail.com>
	<CAJ86T=ULm4BBu2JWmVTDfuVxh4vcd9FVDVJzyC3Qt6tgiTNHZw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 09:12:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-05 at 17:57 -0700, Andre McCurdy wrote:
> On Thu, Jul 5, 2018 at 5:07 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 6 July 2018 at 00:39, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > On Wed, Jul 4, 2018 at 5:53 AM, Burton, Ross <ross.burton@intel.c
> > > om> wrote:
> > > > On 4 July 2018 at 01:55, Andre McCurdy <armccurdy@gmail.com>
> > > > wrote:
> > > > >  DEPENDS += "${PYTHON_PN}"
> > > > > -DEPENDS_class-native += "${PYTHON_PN}-native"
> > > > > -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
> > > > > +DEPENDS_class-native = "${PYTHON_PN}-native"
> > > > > +DEPENDS_class-nativesdk = "nativesdk-${PYTHON_PN}"
> > > > 
> > > > Whilst there's nothing wrong with this patch, as the
> > > > BBCLASSEXTEND
> > > > handles DEPENDS-munging isn't this a better fix:
> > > > 
> > > >   DEPENDS += "${PYTHON_PN}"
> > > >  -DEPENDS_class-native += "${PYTHON_PN}-native"
> > > >  -DEPENDS_class-nativesdk += "nativesdk-${PYTHON_PN}"
> > > 
> > > Removing the over-rides completely results in both the native and
> > > nativesdk variants gaining a new dependency on
> > > python-distribute-native (courtesy of setuptools.bbclass).
> > 
> > setuptools.bbclass:DEPENDS += "python-distribute-native"
> > 
> > If python-distribute-native is a build dependency for target then
> > its a dependency for native and nativesdk too, right?
> 
> DEPENDS has been over-ridden for native and nativesdk for some time,
> so either the dependency gets provided indirectly or it's not
> required at all?

I'd suspect indirectly but hard to tell :/.


> > Considering python-distribute is just an alias for python-
> > setuptools
> > (its a RPROVIDES in the recipe, and the pip entry is just a
> > dependnecy) I guess the setuptools class should follow setuptools3
> > and
> > depend on python-setuptools-native instead of
> > python-distribute-native.
> > 
> > Context is this from 2015:
> > 
> > commit c4553e07cdbec5c29a74a43e0c5fdb2bb5583f7a
> > Author: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> > Date:   Thu May 14 16:49:56 2015 +0000
> > 
> >     python3-distribute: Upgrade to python3-setuptools 15.2
> > 
> >     python3-distribute was merged back to python3-setuptools in
> > 2013,
> >     and it is no longer being maintained, this upgrade also
> > provides
> >     functionality that will be needed for python3-pip.
> > 
> > The same needs to be applied to the py2 classes, as both Py2 and
> > Py3
> > use the same version of setuptools.
> 
> That all sounds plausible, but starts to unravel into a bigger set of
> potential cleanups. For example, digging a little more uncovers this
> from distutils-base.bbclass:
> 
>   DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}",
> ""][(d.getVar('PACKAGES') == '')]}"
>   RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}'
> == 'class-target']}"
> 
> The first line adding to DEPENDS for target and nativesdk (but not
> native) and the second line adding to RDEPENDS for target only.
> Should this be re-written to make use of over-rides?

I suspect class- overrides did not exist when that code was written.
Rewriting it using them would be a good cleanup.

> And looking at nativesdk builds in general, why does
> DISTRO_FEATURES_NATIVE contain ipv6 and xattr but
> DISTRO_FEATURES_NATIVESDK does not? I couldn't find any comments to
> explain that.

I suspect nativesdk should have those and its just a oversight.
Unfortunately we have a number of little details like this, I do take a
pass at some things when I have time but clearly there are things which
can be improved.

FWIW I tend to look at them from a risk perspective too and how well we
can know whether the cleanup will or won't risk breakage before
deciding where to make changes.

Cheers,

Richard



