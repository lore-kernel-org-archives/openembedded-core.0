Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1253761EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 22:10:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r53MA0Xs007798
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jun 2013 15:10:00 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 3 Jun 2013 15:10:00 -0700
Message-ID: <51AD1437.6000500@windriver.com>
Date: Mon, 3 Jun 2013 17:09:59 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
	<51AD0820.8030302@juszkiewicz.com.pl>
	<CAP9ODKouzXgg7xu8yfOGHGgD-FZeEHgDjjgKB47b2v6R5QMhqA@mail.gmail.com>
In-Reply-To: <CAP9ODKouzXgg7xu8yfOGHGgD-FZeEHgDjjgKB47b2v6R5QMhqA@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Jun 2013 22:10:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/13 4:51 PM, Otavio Salvador wrote:
>
>
>
> On Mon, Jun 3, 2013 at 6:18 PM, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl
> <mailto:marcin@juszkiewicz.com.pl>> wrote:
>
>     W dniu 03.06.2013 18:40, Andy Voltz pisze:
>      > Signed-off-by: Andy Voltz <andy.voltz@timesys.com
>     <mailto:andy.voltz@timesys.com>>
>      > ---
>      >  meta/conf/machine/include/tune-cortexa5.inc |   36
>     +++++++++++++++++++++++++++
>
>     I think that it is time to create simple tune-cortex.inc which would be
>     used by cores tunes to set all of it.
>
>     So tune-cortexa5.inc would be:
>
>     ----
>     CORTEX_ID   = "a5"
>     CORTEX_NAME = "A5"
>
>     require conf/machine/include/arm/tune-cortex.inc
>     ----
>
>     and tune-cortex.inc will have things like:
>
>     ----
>     DEFAULTTUNE ?= "armv7a-neon"
>
>     require conf/machine/include/arm/arch-armv7a.inc
>
>     TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific
>     processor optimizations"
>     TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
>     "cortex${CORTEX_ID}", " -mtune=cortex-${CORTEX_ID}", "", d)}"
>
>     # Little Endian base configs
>     AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t
>     cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
>     ARMPKGARCH_tune-cortex${CORTEX_ID} = "cortex${CORTEX_ID}"
>     ARMPKGARCH_tune-cortex${CORTEX_ID}t = "cortex${CORTEX_ID}"
>     ARMPKGARCH_tune-cortex${CORTEX_ID}-neon = "cortex${CORTEX_ID}"
>     ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon = "cortex${CORTEX_ID}"
>     TUNE_FEATURES_tune-cortex${CORTEX_ID} = "${TUNE_FEATURES_tune-armv7a}
>     cortex${CORTEX_ID}"
>     TUNE_FEATURES_tune-cortex${CORTEX_ID}t = "${TUNE_FEATURES_tune-armv7at}
>     cortex${CORTEX_ID}"
>     TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon =
>     "${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}"
>     TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon =
>     "${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}"
>     PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp"
>     PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp
>     cortex${CORTEX_ID}t2-vfp"
>     PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp
>     cortex${CORTEX_ID}-vfp-neon"
>     PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon =
>     "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp
>     cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp
>     cortex${CORTEX_ID}t2-vfp-neon"
>
>     [..]
>     -----
>
>     What do you think?
>
>
> I fully agree :-)

Works for me.  Just be sure to document the new variables in the arm/README file.

--Mark

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


