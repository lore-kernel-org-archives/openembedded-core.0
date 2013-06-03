Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 21BC0621EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 21:18:48 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 707CDD22DE; Mon,  3 Jun 2013 23:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 22443D22CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 23:18:26 +0200 (CEST)
Message-ID: <51AD0820.8030302@juszkiewicz.com.pl>
Date: Mon, 03 Jun 2013 23:18:24 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
In-Reply-To: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
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
X-List-Received-Date: Mon, 03 Jun 2013 21:18:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 03.06.2013 18:40, Andy Voltz pisze:
> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
> ---
>  meta/conf/machine/include/tune-cortexa5.inc |   36 +++++++++++++++++++++++++++

I think that it is time to create simple tune-cortex.inc which would be
used by cores tunes to set all of it.

So tune-cortexa5.inc would be:

----
CORTEX_ID   = "a5"
CORTEX_NAME = "A5"

require conf/machine/include/arm/tune-cortex.inc
----

and tune-cortex.inc will have things like:

----
DEFAULTTUNE ?= "armv7a-neon"

require conf/machine/include/arm/arch-armv7a.inc

TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific
processor optimizations"
TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
"cortex${CORTEX_ID}", " -mtune=cortex-${CORTEX_ID}", "", d)}"

# Little Endian base configs
AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t
cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
ARMPKGARCH_tune-cortex${CORTEX_ID} = "cortex${CORTEX_ID}"
ARMPKGARCH_tune-cortex${CORTEX_ID}t = "cortex${CORTEX_ID}"
ARMPKGARCH_tune-cortex${CORTEX_ID}-neon = "cortex${CORTEX_ID}"
ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon = "cortex${CORTEX_ID}"
TUNE_FEATURES_tune-cortex${CORTEX_ID} = "${TUNE_FEATURES_tune-armv7a}
cortex${CORTEX_ID}"
TUNE_FEATURES_tune-cortex${CORTEX_ID}t = "${TUNE_FEATURES_tune-armv7at}
cortex${CORTEX_ID}"
TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon =
"${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}"
TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon =
"${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}"
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp"
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp
cortex${CORTEX_ID}t2-vfp"
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon =
"${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp
cortex${CORTEX_ID}-vfp-neon"
PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp
cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp
cortex${CORTEX_ID}t2-vfp-neon"

[..]
-----

What do you think?

