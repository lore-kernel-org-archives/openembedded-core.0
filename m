Return-Path: <mac@mcrowe.com>
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 49D197FDF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 11:43:32 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id hXjmiu6D5KleZhXjni1ZvT; Wed, 18 Dec 2019 11:43:33 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pxVhFHJ0LMsA:10
	a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8 a=3KH0DVyGb0_r9n_7RF8A:9
	a=CjuIK1q_8ugA:10
	a=YiJXXBSSIdIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=o7UXOhILxJDEug9R5MCtlQ6/8NBvoYCfZFZ5TeLu248=;
	b=Ry3he
	TUZOQsgNCi55BwGZlmUpfK6Ikqy1mGYz7wEojwAd69tm7JeCBmEWpQ1UnshBR9EkorHPrjyLICm0e
	Q8jU0CkbWveJvnWOc7xxEPjDxSau+DHWDjWdLfTyGYKf71S0eImHgTpek9vsajLoNSuonzYtmakDi
	mwOmVVNZIaD3CDngCF1Q6T5K8/lDMTNnSgd9H0xHl7wCG9uOvIhcTDlc/kQ6/GXNsGID8ABzfsxeo
	fQ+yGzK+6h8r3sZdHvNq8go6YfdorcDdN3tX0117zo6mgCoIpGqkDZMNVhAfCIV7XVKRtJgTDoPEi
	xCqau1F+ISLW+uIKTkKJH93vygZYQ==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1ihXjm-00040E-IG; Wed, 18 Dec 2019 11:43:30 +0000
Date: Wed, 18 Dec 2019 11:43:30 +0000
From: Mike Crowe <mac@mcrowe.com>
To: ChenQi <Qi.Chen@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20191218114330.GA12175@mcrowe.com>
References: <20191217080225.897186-1-mac@mcrowe.com>
	<0cfbd853-0ad2-e010-5ee6-6277be55db9b@windriver.com>
	<20191217135548.GA1639@mcrowe.com>
	<983ec762-e2ad-4127-00c4-dec513486695@windriver.com>
MIME-Version: 1.0
In-Reply-To: <983ec762-e2ad-4127-00c4-dec513486695@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfBP2RR0Mm6HUp54uFKTJbK/hpLdBhJNLg7uT8VLpgDW4X8TLk/5i9hhqcUeGv6tbcb0qeKWQBvplJHwW/YOkoE31SD4nzPmqrWwNL0GvZEj8Bo33qKO5
	02itDIHXMZK85YUQp1DmilfmgVuPsVeWlSgMeRVpVr5DG1kIEAw18cSl
Subject: Re: [PATCH] multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native
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
X-List-Received-Date: Wed, 18 Dec 2019 11:43:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 18 December 2019 at 09:19:20 +0800, ChenQi wrote:
> On 12/17/2019 09:55 PM, Mike Crowe wrote:
> > On Tuesday 17 December 2019 at 16:56:11 +0800, ChenQi wrote:
> > > On 12/17/2019 04:02 PM, Mike Crowe via Openembedded-core wrote:
> > > > Ensure that RECIPE_SYSROOT is the same for -native recipes whether
> > > > multilib.conf is included or not.
> > > > 
> > > > Without this change task signatures for -native recipes change when
> > > > switching between MACHINEs that require multilib.conf and those that
> > > > don't.
> > > > 
> > > > This fix was one of the ones suggested by Khem Raj in
> > > > http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290303.html
> > > > 
> > > > Add test_sstate_multilib_or_not_native_samesigs test case to
> > > > sstatetests.py to ensure that this stays fixed.
> > > > 
> > > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > > ---
> > > >    meta/conf/multilib.conf                     |  1 +
> > > >    meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
> > > >    2 files changed, 41 insertions(+)
> > > > 
> > > > diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> > > > index cfed3fbbd0..58f2ac5c86 100644
> > > > --- a/meta/conf/multilib.conf
> > > > +++ b/meta/conf/multilib.conf
> > > > @@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
> > > >    STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> > > >    STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> > > >    RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> > > > +RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
> > > How about just removing MLPREFIX?
> >
> > I'm afraid that I don't understand what you are suggesting. The above
> > change does remove MLPREFIX for -native only.
>
> I mean removing all these MLPREFIX, so that STAGING_DIR_HOST,
> STAGING_DIR_TARGET and RECIPE_SYSROOT will all be
> ${WORKDIR}/recipe-sysroot.

The prefix is necessary for RECIPE_SYSROOT because without it a single
recipe can't depend on multiple multilib variants of the same recipe. We do
this because our bootloader requires both a 32-bit and a 64-bit compiler.
When I changed RECIPE_SYSROOT to always be "${WORKDIR}/recipe-sysroot" I
get failures like:

 do_prepare_recipe_sysroot: The file /usr/include/mtd/mtd-user.h is installed by both linux-libc-headers and lib32-linux-libc-headers, aborting

Thanks.

Mike.

