Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 1423F6A54E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 19:57:11 +0000 (UTC)
Received: from timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0; Tue, 4 Jun 2013
	15:57:12 -0400
Date: Tue, 4 Jun 2013 15:57:26 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20130604195725.GH18597@timesys.com>
References: <mailman.5041.1370320509.3521.openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <mailman.5041.1370320509.3521.openembedded-core@lists.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] tune-cortexa5.inc: add tune file for cortex-a5, based on a7
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
X-List-Received-Date: Tue, 04 Jun 2013 19:57:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> Date: Mon, 03 Jun 2013 23:18:24 +0200
> From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] tune-cortexa5.inc: add tune file for
>         cortex-a5, based on a7
> Message-ID: <51AD0820.8030302@juszkiewicz.com.pl>
> Content-Type: text/plain; charset=UTF-8
> 
> W dniu 03.06.2013 18:40, Andy Voltz pisze:
> > Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
> > ---
> >  meta/conf/machine/include/tune-cortexa5.inc |   36 +++++++++++++++++++++++++++
> 
> I think that it is time to create simple tune-cortex.inc which would be
> used by cores tunes to set all of it.
> 
> So tune-cortexa5.inc would be:
> 
> ----
> CORTEX_ID   = "a5"
> CORTEX_NAME = "A5"
> 
> require conf/machine/include/arm/tune-cortex.inc
> ----
> 
> and tune-cortex.inc will have things like:
> 
> ----
> DEFAULTTUNE ?= "armv7a-neon"
> 
> require conf/machine/include/arm/arch-armv7a.inc
> 
> TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific
> processor optimizations"
> TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
> "cortex${CORTEX_ID}", " -mtune=cortex-${CORTEX_ID}", "", d)}"
> 
> # Little Endian base configs
> AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t
> cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
> ARMPKGARCH_tune-cortex${CORTEX_ID} = "cortex${CORTEX_ID}"
> ARMPKGARCH_tune-cortex${CORTEX_ID}t = "cortex${CORTEX_ID}"
> ARMPKGARCH_tune-cortex${CORTEX_ID}-neon = "cortex${CORTEX_ID}"
> ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon = "cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID} = "${TUNE_FEATURES_tune-armv7a}
> cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID}t = "${TUNE_FEATURES_tune-armv7at}
> cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon =
> "${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}"
> TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon =
> "${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp
> cortex${CORTEX_ID}t2-vfp"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp
> cortex${CORTEX_ID}-vfp-neon"
> PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp
> cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp
> cortex${CORTEX_ID}t2-vfp-neon"
> 
> [..]
> -----
> 
> What do you think?
> 
> 

I just tried this solution with my vybrid cortex-a5 build. The only issue is a
parse error on ${CORTEX_ID} here: 

TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific

I amended the changes so that each tune-cortexa5.inc (for example) looks like:

+CORTEX_ID = "a5"
+
+TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
+
+require conf/machine/include/tune-cortex.inc

I didn't think it was worth having a CORTEX_NAME if TUNEVALID does not parse..

My only other thought is perhaps tune-cortex.inc should be called
tune-cortexa.inc? It seems like the m series is a different animal.

What do you think?

Regards
--
Andy Voltz
Linux Engineer
Timesys Corporation

