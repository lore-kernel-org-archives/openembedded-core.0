Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A5A137199D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 95D09208FB;
	Thu,  3 Aug 2017 20:26:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tFZhvaDeLakp; Thu,  3 Aug 2017 20:26:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74652203C2;
	Thu,  3 Aug 2017 20:26:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 07FA4162554; Thu,  3 Aug 2017 16:26:00 -0400 (EDT)
Date: Thu, 3 Aug 2017 16:25:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20170803202556.GX26405@denix.org>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
MIME-Version: 1.0
In-Reply-To: <b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Thu, 03 Aug 2017 20:26:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2017 at 12:31:58PM -0500, Mark Hatle wrote:
> On 7/31/17 12:16 PM, Armin Kuster wrote:
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> > index 5e832fa..dc1ba5e 100644
> > --- a/meta/conf/machine/include/arm/arch-armv8.inc
> > +++ b/meta/conf/machine/include/arm/arch-armv8.inc
> > @@ -1 +1,26 @@
> > +DEFAULTTUNE ?= "armv8-a"
> 
> do we want the '-a'?  The other arm (7) are of the format armv7a (no '-').

On the other hand, gcc went with armv7-a instead of armv7a...
So, maybe having '-a' is actually more aligned with others?


> > +
> > +TUNEVALID[armv8-a] = "Enable instructions for ARMv8-a"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', ' -march=armv8-a', '', d)}"
> > +
> > +TUNEVALID[crypto] = "Enable crypto instructions for ARMv8-a"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
> > +
> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', 'armv8a:', '' ,d)}"
> > +
> >  require conf/machine/include/arm/arch-arm64.inc
> > +
> > +AVAILTUNES += "armv8-a armv8-a-crypto"
> > +ARMPKGARCH_tune-armv8-a ?= "armv8-a"
> > +
> > +# Enable Crypto extension. This also enables Advanced SIMD and floating-point instructions
> > +ARMPKGARCH_tune-armv8-a-crypto ?= "armv8-a"
> > +
> > +TUNE_FEATURES_tune-armv8-a = "aarch64 armv8-a"
> > +TUNE_FEATURES_tune-armv8-a-crypto = "${TUNE_FEATURES_tune-armv8-a} crypto"
> > +
> > +PACKAGE_EXTRA_ARCHS_tune-armv8-a = "aarch64 armv8-a"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-a} armv8-a-crypto"
> > +
> > +BASE_LIB_tune-armv8-a = "${BASE_LIB_tune-aarch64}"
> > +BASE_LIB_tune-armv8-a-crypto = "${BASE_LIB_tune-aarch64}"
> > 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

