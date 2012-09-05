Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9MQP-0003W6-M6 for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 22:42:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85KTlUe030327;
	Wed, 5 Sep 2012 21:29:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27558-08; Wed,  5 Sep 2012 21:29:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85KTdki030321
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Sep 2012 21:29:41 +0100
Message-ID: <1346876980.21985.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 05 Sep 2012 21:29:40 +0100
In-Reply-To: <50470CAE.5090406@windriver.com>
References: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
	<1346807137-4231-2-git-send-email-Martin.Jansa@gmail.com>
	<5046ED1D.9080204@windriver.com> <20120905081909.GL3372@jama.jama.net>
	<50470CAE.5090406@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 05 Sep 2012 20:42:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-05 at 16:26 +0800, Robert Yang wrote:
> 
> On 09/05/2012 04:19 PM, Martin Jansa wrote:
> > On Wed, Sep 05, 2012 at 02:11:41PM +0800, Robert Yang wrote:
> >>
> >>
> >> On 09/05/2012 09:05 AM, Martin Jansa wrote:
> >>> * pixman-native can have different do_configure sstate checksums if it's built with armv4t machine and armv7a
> >>>     OE @ ~ $ bitbake/bin/bitbake-diffsigs
> >>>       before-mgmt/stamps.1346795706/nokia900/x86_64-linux/pixman-native-*.do_configure.sigdata.*
> >>>       after-mgmt/stamps.1346801508/om-gta02/x86_64-linux/pixman-native-*.do_configure.sigdata.*
> >>>     basehash changed from 27e577de60880a788c7aaba797ef83e0 to c6799807eb3e767daf1e75738fc753f7
> >>>     Variable NEON value changed from   to  --disable-arm-neon
> >>> * so if you start building with different machine then last time (wrt
> >>>     NEON setting) all recipes which depends on pixman-native will be rebuilt too
> >>> * this explains why sstate-cache-management.sh wanted to remove many
> >>>     native sstate packages when --stamps-dir option was used (see comment
> >>>     28 in https://bugzilla.yoctoproject.org/show_bug.cgi?id=2897)
> >>>
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>>    meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb | 5 +++--
> >>>    1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> >>> index 35a2def..218808a 100644
> >>> --- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> >>> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> >>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
> >>>    DEPENDS += "zlib libpng"
> >>>    BBCLASSEXTEND = "native"
> >>>
> >>> -PR = "r1"
> >>> +PR = "r2"
> >>>
> >>>    PE = "1"
> >>>
> >>> @@ -25,7 +25,8 @@ NEON = " --disable-arm-neon "
> >>>    NEON_armv7a = " "
> >>>    NEON_armv7a-vfp-neon = " "
> >>>
> >>> -EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> >>> +EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> >>> +EXTRA_OECONF_class-native = "--disable-gtk"
> >>>
> >>
> >> Hi Martin,
> >>
> >> What's the differences between "_virtclass-native" and "_class-native", please?
> >
> > _class-foo works for all types of recipes:
> > target,native,cross,crosssdk,cross-canadian,nativesdk
> >
> > classes/base.bbclass:CLASSOVERRIDE ?= "class-target"
> > classes/cross-canadian.bbclass:CLASSOVERRIDE = "class-cross-canadian"
> > classes/cross.bbclass:CLASSOVERRIDE = "class-cross"
> > classes/crosssdk.bbclass:CLASSOVERRIDE = "class-crosssdk"
> > classes/native.bbclass:CLASSOVERRIDE = "class-native"
> > classes/nativesdk.bbclass:CLASSOVERRIDE = "class-nativesdk"
> > conf/bitbake.conf:OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
> > conf/bitbake.conf:CLASSOVERRIDE ?= "class-target"
> >
> > while _virtclass-foo works only for cross, native, nativesdk and multilib
> > classes/cross.bbclass:    bb.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-cross", e.data)
> > classes/native.bbclass:    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
> > classes/nativesdk.bbclass:    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
> > classes/populate_sdk_base.bbclass:        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
> > classes/utils.bbclass:        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
> > recipes-core/eglibc/eglibc-ld.inc:        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
> >
> > IIRC RP said somewhere that virtclass usages should be
> > cleaned from metadata and replaced with stronger CLASSOVERRIDE, that's
> > why I used class-native here.
> >
> 
> Got it, thank you very much, Paul and Martin.

virtclass* is going away at some point so class* should be used in new
code and we need to do a conversion at some point. I keep getting
distracted by other bigger issues...

Cheers,

Richard



