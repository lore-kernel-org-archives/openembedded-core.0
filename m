Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SmT7t-0003g9-ID for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:12:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64H1OJH025375
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 18:01:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24103-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 18:01:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64H1Hf7025369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 18:01:18 +0100
Message-ID: <1341421277.19821.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 18:01:17 +0100
In-Reply-To: <20120704153843.GD15100@jama.jama.net>
References: <4FF33085.1070703@linux.intel.com>
	<1341415425-16073-1-git-send-email-paul.gortmaker@windriver.com>
	<20120704153843.GD15100@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] u-boot: make FILESDIR a shared setting via FILESPATH
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
X-List-Received-Date: Wed, 04 Jul 2012 17:12:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 17:38 +0200, Martin Jansa wrote:
> On Wed, Jul 04, 2012 at 11:23:45AM -0400, Paul Gortmaker wrote:
> > The setting is the same in all recipes, so move it to
> > the shared settings in u-boot.inc
> > 
> > Since FILESDIR is also being phased out, use the FILESPATH
> > setting as suggested by Richard Purdie.
> 
> Shouldn't it be added in FILESEXTRAPATHS instead of FILESPATH?

The line is correct as it stands as far as I can tell. If you add to
FILESEXTRAPATHS, it will add various overrides to the end so the
${MACHINE} would become unnecessary. We know what combinations we
support in this case though.

Cheers,

Richard

> Cheers,
> 
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > ---
> > 
> > [ PG: Retested builds for 8315 and beagleboard ]
> > 
> >  meta/recipes-bsp/u-boot/u-boot.inc           |    1 +
> >  meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
> >  meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
> >  meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
> >  4 files changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> > index 5de3583..664c2e6 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -59,6 +59,7 @@ do_install () {
> >  }
> >  
> >  FILES_${PN} = "/boot"
> > +FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
> >  
> >  do_deploy () {
> >      install -d ${DEPLOYDIR}
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> > index e99bc2c..ed38f54 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> > @@ -10,8 +10,6 @@ LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> >                      file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
> >  
> > -FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> > -
> >  # This revision corresponds to the tag "v2011.03"
> >  # We use the revision in order to avoid having to fetch it from the repo during parse
> >  SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> > index 680401f..da61852 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> > @@ -10,8 +10,6 @@ LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> >                      file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
> >  
> > -FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> > -
> >  # This revision corresponds to the tag "v2011.06"
> >  # We use the revision in order to avoid having to fetch it from the repo during parse
> >  SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> > index dbdc663..25cc8c9 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> > @@ -14,8 +14,6 @@ DEFAULT_PREFERENCE = "-1"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> >  
> > -FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> > -
> >  # This revision corresponds to the tag "v2012.04.01"
> >  # We use the revision in order to avoid having to fetch it from the
> >  # repo during parse
> > -- 
> > 1.7.9.6
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




