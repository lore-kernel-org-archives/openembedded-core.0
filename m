Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id B4C396C44A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 13:55:51 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id hDKGi2kvjsjQShDKHicAuG; Tue, 17 Dec 2019 13:55:52 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=cZasUULM c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pxVhFHJ0LMsA:10
	a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8 a=wTIONdLjaZLwpqchzUcA:9
	a=CjuIK1q_8ugA:10
	a=YiJXXBSSIdIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=RfpyWH84uPYraobF7zyAW8HdcoTAU1hw+GbJihFmRrs=;
	b=QBA3z
	aA6JjzvovamKaNCca64yrJxNjObtYMFHjeu/GsxhJ19PPYhp3YmPNjeO4xyIB0efu6AZl+7FTFDVn
	xYw/HWLRuaM5vS9MwuEYVBaIR9cIw0+Vcy9uRzXRmKvjtU4nq7mKTuxe3gh+SIA6CIumO6DBuu3c0
	NVfrK4DS2971Tez3v5V869++qAaflpprVgm89y0kAV13+AM8tT3sXgtCvEQUllaapkL3agowi4ogD
	Lk0s0sVXpaUBWbRjeB7ZxUimkU3hq93rSJEpiyKRR5+2yr8A5C0Klj9iNB/MfUWJ4NZ/3fGUMhWFG
	k6ONosv9M23H/jd6oNxZCU4kxlgfg==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1ihDKG-0000fb-LP; Tue, 17 Dec 2019 13:55:48 +0000
Date: Tue, 17 Dec 2019 13:55:48 +0000
From: Mike Crowe <mac@mcrowe.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20191217135548.GA1639@mcrowe.com>
References: <20191217080225.897186-1-mac@mcrowe.com>
	<0cfbd853-0ad2-e010-5ee6-6277be55db9b@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0cfbd853-0ad2-e010-5ee6-6277be55db9b@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfKYml2LxzmuhawFZqbA26BBJijUU8Ltz4Kt2OIEt5PdQ2YaYrW0SwUjs92PkP7pWs4IJcm1NKHVSAyXGWx13QaT12ilJDXTK0BBlIJvu8FsC5wUP7Ah2
	4ny16o9LnJoPbHY/RfMmXYtlHvIV4GGEU9UDjpa3SCQWQyXogkohQ66q
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 17 Dec 2019 13:55:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 17 December 2019 at 16:56:11 +0800, ChenQi wrote:
> On 12/17/2019 04:02 PM, Mike Crowe via Openembedded-core wrote:
> > Ensure that RECIPE_SYSROOT is the same for -native recipes whether
> > multilib.conf is included or not.
> > 
> > Without this change task signatures for -native recipes change when
> > switching between MACHINEs that require multilib.conf and those that
> > don't.
> > 
> > This fix was one of the ones suggested by Khem Raj in
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290303.html
> > 
> > Add test_sstate_multilib_or_not_native_samesigs test case to
> > sstatetests.py to ensure that this stays fixed.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >   meta/conf/multilib.conf                     |  1 +
> >   meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
> >   2 files changed, 41 insertions(+)
> > 
> > diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> > index cfed3fbbd0..58f2ac5c86 100644
> > --- a/meta/conf/multilib.conf
> > +++ b/meta/conf/multilib.conf
> > @@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
> >   STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> >   STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> >   RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> > +RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
> 
> How about just removing MLPREFIX?

I'm afraid that I don't understand what you are suggesting. The above
change does remove MLPREFIX for -native only.

Thanks.

Mike.

