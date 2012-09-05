Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9AkW-0008T1-3W
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 10:14:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Sep 2012 01:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,372,1344236400"; d="scan'208";a="189065092"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2012 01:01:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 05 Sep 2012 09:01:46 +0100
Message-ID: <2723658.2NbsIHjKa1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <5046ED1D.9080204@windriver.com>
References: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
	<1346807137-4231-2-git-send-email-Martin.Jansa@gmail.com>
	<5046ED1D.9080204@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] pixman: ignore NEON, IWMMXT, LOONGSON_MMI variables for class-native
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
X-List-Received-Date: Wed, 05 Sep 2012 08:14:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 September 2012 14:11:41 Robert Yang wrote:
> On 09/05/2012 09:05 AM, Martin Jansa wrote:
> > * pixman-native can have different do_configure sstate checksums if it's
> > built with armv4t machine and armv7a> 
> >    OE @ ~ $ bitbake/bin/bitbake-diffsigs
> >    
> >      before-mgmt/stamps.1346795706/nokia900/x86_64-linux/pixman-native-*.d
> >      o_configure.sigdata.*
> >      after-mgmt/stamps.1346801508/om-gta02/x86_64-linux/pixman-native-*.d
> >      o_configure.sigdata.*>    
> >    basehash changed from 27e577de60880a788c7aaba797ef83e0 to
> >    c6799807eb3e767daf1e75738fc753f7 Variable NEON value changed from   to
> >     --disable-arm-neon
> > 
> > * so if you start building with different machine then last time (wrt
> > 
> >    NEON setting) all recipes which depends on pixman-native will be
> >    rebuilt too> 
> > * this explains why sstate-cache-management.sh wanted to remove many
> > 
> >    native sstate packages when --stamps-dir option was used (see comment
> >    28 in https://bugzilla.yoctoproject.org/show_bug.cgi?id=2897)
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > 
> >   meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> > b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb index 35a2def..218808a
> > 100644
> > --- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> > @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \> 
> >   DEPENDS += "zlib libpng"
> >   BBCLASSEXTEND = "native"
> > 
> > -PR = "r1"
> > +PR = "r2"
> > 
> >   PE = "1"
> > 
> > @@ -25,7 +25,8 @@ NEON = " --disable-arm-neon "
> > 
> >   NEON_armv7a = " "
> >   NEON_armv7a-vfp-neon = " "
> > 
> > -EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> > +EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> > +EXTRA_OECONF_class-native = "--disable-gtk"
> 
> Hi Martin,
> 
> What's the differences between "_virtclass-native" and "_class-native",
> please?

Not a huge amount, it's part of the set of new overrides that allows you to 
have an override for the target:

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/19325

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


