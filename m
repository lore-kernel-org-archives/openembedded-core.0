Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.1330.1591647341790307672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 13:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1jiOBE-0000Ty-FP; Mon, 08 Jun 2020 22:15:36 +0200
Message-ID: <2cf81259a8f75130bc7dfbb473ab92017d054ae4.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
From: "Enrico J?rns" <ejo@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>, jlu@pengutronix.de
Date: Mon, 08 Jun 2020 22:15:35 +0200
In-Reply-To: <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
	 <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com>
	 <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>
User-Agent: Evolution 3.36.2-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Am Donnerstag, den 28.05.2020, 19:02 -0700 schrieb Khem Raj:
> On Wed, May 27, 2020 at 7:36 AM Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> > On 5/27/20 4:31 PM, Robert P. J. Day wrote:
> > > Variable DEPLOY_DIR_TOOLS was introduced in 2007:
> > > 
> > >    commit f751a20152c651a33f08ceda0502fa1d4f11c005
> > >    Author: Richard Purdie <richard@openedhand.com>
> > >    Date:   Wed Aug 8 21:02:39 2007 +0000
> > > 
> > >        bitbake.conf: Sync with OE.dev
> > > 
> > > apparently never used so get rid of it.
> > > 
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > 
> > 
> > meta-openembedded/meta-oe/recipes-support/dfu-util/dfu-util-
> > native_0.9.bb:do_deploy[sstate-outputdirs]
> > = "${DEPLOY_DIR_TOOLS}"

this was removed now in meta-oe commit
af3fc04cfb64d9f229be26f47b4dec892ff919dc ("dfu-util-native: Remove
DEPLOY_DIR_TOOLS from sstate-outputdirs") apparantely.

However, I do not get the argumentation for that:

>    In commit 1ef92d2423d6d6546e4f0585478540212b26f3a0 deploying the native
>    tool was changed to use DEPLOYDIR, so setting DEPLOY_DIR_TOOLS for sstate-outputdir
>    dependency should have been changed as well.

Setting do_deploy[sstate-outputdirs] to something different than its default appears to be valid for me and has nothing to do with DEPLOYDIR, which is only the sstate intermediate directory name.
And the result of this is, that the tool now lands in DEPLOY_DIR_IMAGE instead.


My motivation of questioning is, that we have in our RAUC recipe a similar usage:

https://github.com/rauc/meta-rauc/blob/master/recipes-core/rauc/rauc-native_1.3.bb#L5

The idea behind that was that one might give some convenience to use the tool manually to manipulate update bundles, re-sign them, obtain meta information, etc.

What is the now suggested way of placing these kind of binaries? Simply in DEPLOY_DIR_IMAGES as the above-mentioned commit does (silently)?
Or is there maybe still some motivation to keep DEPLOY_DIR_TOOLS?


Thanks and best regards

Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/
 |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |

