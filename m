Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9D6772C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:34:45 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 8FB4C43C; Fri, 13 Nov 2015 10:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 57E0221D;
	Fri, 13 Nov 2015 10:33:59 +0100 (CET)
Date: Fri, 13 Nov 2015 10:33:59 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20151113093359.GH4230@piout.net>
References: <1447351617-7516-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20151112191500.GM2574@jama>
MIME-Version: 1.0
In-Reply-To: <20151112191500.GM2574@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa5.inc: Allow tuning for vfpv3d16, vfpv3 and neon-vfpv4
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
X-List-Received-Date: Fri, 13 Nov 2015 09:34:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/11/2015 at 20:15:00 +0100, Martin Jansa wrote :
> On Thu, Nov 12, 2015 at 07:06:57PM +0100, Alexandre Belloni wrote:
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> 
> Please check
> http://lists.openembedded.org/pipermail/openembedded-core/2015-October/111318.html
> thread and following discussion.
> 

Yeah, I saw that one but I'm not sure what conclusion I should draw
regarding the vfp selection. I understand the mtune/mcpu still needs
some work.

> > ---
> >  meta/conf/machine/include/tune-cortexa5.inc | 34 +++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
> > index 139e65c8285d..56ea93e81d5e 100644
> > --- a/meta/conf/machine/include/tune-cortexa5.inc
> > +++ b/meta/conf/machine/include/tune-cortexa5.inc
> > @@ -6,31 +6,61 @@ TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
> >  TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -mtune=cortex-a5", "", d)}"
> >  
> >  # Little Endian base configs
> > -AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
> > +AVAILTUNES += "cortexa5 cortexa5t cortexa5-vfpv3d16 cortexa5t-vfpv3d16 cortexa5-vfpv3 cortexa5t-vfpv3 cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
> >  ARMPKGARCH_tune-cortexa5 = "cortexa5"
> >  ARMPKGARCH_tune-cortexa5t = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5-vfpv3d16 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5t-vfpv3d16 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5-vfpv3 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5t-vfpv3 = "cortexa5"
> >  ARMPKGARCH_tune-cortexa5-neon = "cortexa5"
> >  ARMPKGARCH_tune-cortexa5t-neon = "cortexa5"
> >  TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
> >  TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5-vfpv3d16 = "${TUNE_FEATURES_tune-armv7a-vfpv3d16} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5t-vfpv3d16 = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5-vfpv3 = "${TUNE_FEATURES_tune-armv7a-vfpv3} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5t-vfpv3 = "${TUNE_FEATURES_tune-armv7at-vfpv3} cortexa5"
> >  TUNE_FEATURES_tune-cortexa5-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
> >  TUNE_FEATURES_tune-cortexa5t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16} cortexa5-vfp cortexa5-vfp-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} cortexa5-vfp cortexa5-vfp-vfpv3d16 cortexa5t2-vfp cortexa5t2-vfp-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3} cortexa5-vfp cortexa5-vfp-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa5-vfp cortexa5-vfp-vfpv3 cortexa5t2-vfp cortexa5t2-vfp-vfpv3"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
> >  
> >  # VFP Tunes
> > -AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
> > +AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon cortexa5hf-vfpv3d16 cortexa5thf-vfpv3d16 cortexa5hf-vfpv3 cortexa5thf-vfpv3 cortexa5hf-neon-vfpv4 cortexa5thf-neon-vfpv4"
> >  ARMPKGARCH_tune-cortexa5hf = "cortexa5"
> >  ARMPKGARCH_tune-cortexa5thf = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5hf-vfpv3d16 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5thf-vfpv3d16 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5hf-vfpv3 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5thf-vfpv3 = "cortexa5"
> >  ARMPKGARCH_tune-cortexa5hf-neon = "cortexa5"
> >  ARMPKGARCH_tune-cortexa5thf-neon = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5hf-neon-vfpv4 = "cortexa5"
> > +ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 = "cortexa5"
> >  TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
> >  TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5hf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5thf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3d16} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5hf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5thf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3} cortexa5"
> >  TUNE_FEATURES_tune-cortexa5hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
> >  TUNE_FEATURES_tune-cortexa5thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa5"
> > +TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa5"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16} cortexa5hf-vfp cortexa5hf-vfp-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} cortexa5hf-vfp cortexa5hf-vfp-vfpv3d16 cortexa5t2hf-vfp cortexa5t2hf-vfp-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3} cortexa5hf-vfp cortexa5hf-vfp-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa5hf-vfp cortexa5hf-vfp-vfpv3 cortexa5t2hf-vfp cortexa5t2hf-vfp-vfpv3"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
> >  PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5hf-vfp-vfpv4-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon cortexa5hf-vfp-vfpv4-neon cortexa5t2hf-vfp-vfpv4-neon"
> > -- 
> > 2.5.0
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

