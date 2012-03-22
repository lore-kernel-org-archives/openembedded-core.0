Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAlB1-0003Y4-KA for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:47:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MGcmBf016845;
	Thu, 22 Mar 2012 16:38:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16529-03; Thu, 22 Mar 2012 16:38:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MGcUMO016837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Mar 2012 16:38:33 GMT
Message-ID: <1332434311.9740.250.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 16:38:31 +0000
In-Reply-To: <CABcZANm8=Jb-XZT3BZh=yOKhq-eCw_iwwQJivJKN=hk=8G_YoA@mail.gmail.com>
References: <1332428403-25048-1-git-send-email-kergoth@gmail.com>
	<CABcZANmc2Apcv3WyyX-JN4JV10RLV3_ARCOLq5+x1KSMrJjxPQ@mail.gmail.com>
	<CAEsOVNcFM35wUOMz+mHnCbDnWe1VAoUA-G79Wvco8MYaa=XF3Q@mail.gmail.com>
	<CABcZANkM3zjp48pTU59QUmU2a40O_xnj-x6YMOtFmfSU-UOTbw@mail.gmail.com>
	<CAEsOVNecKdJhVFN0SRuR+1-MyecD-1Uyk+zR+C855NEaPo2n4g@mail.gmail.com>
	<CABcZANm8=Jb-XZT3BZh=yOKhq-eCw_iwwQJivJKN=hk=8G_YoA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] powerpc: fix overly aggressive TUNE_PKGARCH set
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
X-List-Received-Date: Thu, 22 Mar 2012 16:47:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 08:33 -0700, Chris Larson wrote:
> On Thu, Mar 22, 2012 at 8:32 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> > On Thu, Mar 22, 2012 at 10:27 AM, Chris Larson <clarson@kergoth.com> wrote:
> >> On Thu, Mar 22, 2012 at 8:21 AM, McClintock Matthew-B29882
> >> <B29882@freescale.com> wrote:
> >>> On Thu, Mar 22, 2012 at 10:08 AM, Chris Larson <kergoth@gmail.com> wrote:
> >>>> On Thu, Mar 22, 2012 at 8:00 AM, Christopher Larson <kergoth@gmail.com> wrote:
> >>>>> From: Christopher Larson <chris_larson@mentor.com>
> >>>>>
> >>>>> There's a problem in arch-powerpc.inc today, wherein it directly sets
> >>>>> TUNE_PKGARCH, rather than setting TUNE_PKGARCH_tune-<tuning>. As a result,
> >>>>> more specific tuning files (e.g. ppce500mc) then see their
> >>>>> TUNE_PKGARCH_tune-<tuning> variable definitions no longer obeyed. As
> >>>>> a consequence, the TUNE_PKGARCH ends up as 'powerpc' or 'powerpc-nf' rather
> >>>>> than 'ppce500mc', which in turn causes a 'TUNE_PKGARCH not in PACKAGE_ARCHS'
> >>>>> failure in the build.
> >>>>>
> >>>>> To fix, the .inc now sets TUNE_PKGARCH_tune-powerpc and
> >>>>> TUNE_PKGARCH_tune-powerpc-nf rather than TUNE_PKGARCH.
> >>>>>
> >>>>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >>>>> ---
> >>>>>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    5 +++--
> >>>>>  1 files changed, 3 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >>>>> index c9b2829..f811a3e 100644
> >>>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >>>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> >>>>> @@ -21,13 +21,14 @@ ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-e
> >>>>>  PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
> >>>>>
> >>>>>  PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> >>>>> -TUNE_PKGARCH ?= "${PPCPKGARCH}"
> >>>>>
> >>>>>  # Basic tune definitions
> >>>>> -AVAILTUNES += "powerpc powerpc-nf"
> >>>>> +AVAILTUNES += "powerpc powerpc-nf"
> >>>>>  TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
> >>>>> +TUNE_PKGARCH_tune-powerpc-nf = "${PPCPKGARCH}"
> >>>>>  BASE_LIB_tune-powerpc-nf = "lib"
> >>>>>  PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
> >>>>>  TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
> >>>>> +TUNE_PKGARCH_tune-powerpc = "${PPCPKGARCH}"
> >>>>>  BASE_LIB_tune-powerpc = "lib"
> >>>>>  PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc
> >>>>
> >>>> Hmm, actually, there's no reason these can't just set
> >>>> TUNE_PKGARCH_tune-powerpc = "powerpc", etc rather than using the
> >>>> PPCPKGARCH indirection. Anyone more familiar with the tuning code have
> >>>> an opinion here?
> >>>
> >>> I thought this was already fixed in my patch. Seems like it was not applied?
> >>>
> >>> -M
> >>>
> >>> commit 216b54e23a995aea79499b88a99f606bb65579af
> >>> Author: Matthew McClintock <msm@freescale.com>
> >>> Date:   Mon Feb 27 10:58:45 2012 -0600
> >>>
> >>>    arch-powerpc.inc: use default value of TUNE_PKGARCH
> >>>
> >>>    We can use the default value for TUNE_PKGARCH, and now we just
> >>>    append "-nf" if TARGET_FPU is fpu-soft
> >>>
> >>>    Signed-off-by: Matthew McClintock <msm@freescale.com>
> >>
> >> Ah, indeed, apparently it was not. That said, it looks like your
> >> version will end up with TUNE_PKGARCH like ppce500mc-nf, is that
> >> correct? You know this stuff better than I do.
> >
> > Ugh. I pasted an old version of my patch the correct version is here:
> >
> > commit 216b54e23a995aea79499b88a99f606bb65579af
> > Author: Matthew McClintock <msm@freescale.com>
> > Date:   Mon Feb 27 10:58:45 2012 -0600
> >
> >    arch-powerpc.inc: use default value of TUNE_PKGARCH
> >
> >    We can use the default value for TUNE_PKGARCH, and now we just
> >    append "-nf" if TARGET_FPU is fpu-soft
> >
> >    Signed-off-by: Matthew McClintock <msm@freescale.com>
> >
> > diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > index c9b2829..9f588e8 100644
> > --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> > @@ -18,10 +18,8 @@ TARGET_FPU .=
> > "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
> >
> >  ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in
> > ['ppc-efd', 'ppc-efs']]}"
> >
> > -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" ,
> > "", "-nf", d)}"
> > -
> > -PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> > -TUNE_PKGARCH ?= "${PPCPKGARCH}"
> >
> > +PPCPKGSFX_FPU = "${@['', '-nf'][d.getVar('TARGET_FPU',d,1) in ['fpu-soft']]}"
> > +TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
> 
> Cool, thanks. For what it's worth, oe-core folk, this has my ack, as
> Mentor is going to need this fix also in the long term :)

d.getVar('TARGET_FPU',d,1) is not valid.

Can someone please send me a correct version of this patch! :)

Cheers,

Richard







