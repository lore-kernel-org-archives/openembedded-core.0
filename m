Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F0CC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 18:32:19 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41466.1782498734904275260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 11:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=MyyGtdC4;
 spf=pass (domain: baylibre.com, ip: 209.85.217.50, mailfrom: hfranco@baylibre.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7298df1610cso1571495137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782498734; x=1783103534; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAdtFnHH5d+fPMCOWqviquOB63tU0tYSaOw/hkPQYMc=;
        b=MyyGtdC4gDlp4/OP7bfWc0sqwz/q/sgqHJNDg5TmFtC25iR6AgKbXzN9BFPp74gHBv
         beRmnoCN/CM3yb0/kXbneOHWe3EhbqSNYeKxFspkyqzOiCfAix33BD5GjQBYUuCK58Xv
         iGa2FGxjbOlKWAtJWb+RISHxdfj4nLCwMGFahcPqynpSEVXAkpkH47pyvlyonXYqHTXC
         UiF22gL0pTU5tuWEgN/22ddmIIhaasI3PUMSe6yRqh2ATPGw2LpD0xYdQcsPSOgoOzkb
         IlgYLr31L6eqw7ajxi+hrmBqlqo7pr4AmcW8CHbHGzyWyTOr373Npqs1v7+K7VJm1eTx
         06Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782498734; x=1783103534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAdtFnHH5d+fPMCOWqviquOB63tU0tYSaOw/hkPQYMc=;
        b=AP2lMrJncGSp2pudFobw22kZFtu5o6LI2nJR68JjBKLOrhMZXyR66YlhlnEdcnIbVo
         Rkl55CYfIcxNHNUjYqdhK64Qy1rr4uA+wYodU8dBK8DUc5f+n4gxB+1PZZgL7Q/zQ3r3
         7I2iNCy8kSyFIbW40mg/DOREQrHziaA9ZONb2RqMHfpE9D1oxCGOTp0tR0bKRznUNfR8
         NeLsgCILL67mQ/W6AxMShriABUWk501UJ88ATJ0WBiOlZ5H73Glq5qxky9GNOY9MfIws
         axdpHn3fnTfGn8FGnrXU92ExAfbgyLkNXoLPpcaSpzhux9jjujK57BzZ7tGHWWy1sor3
         2njQ==
X-Gm-Message-State: AOJu0Yzq8e6k6oKsRoSuOYrE1XRlFWeEEuQ+GnNr4/uFWcfpzLe0z+32
	FT7r10PASBmFzgxXV96s2JjbQ2fEmoK0gwB9d1pnOx2dxoKNAIeaSi6LSrLcPdSeWKI=
X-Gm-Gg: AfdE7cl36w9U0fndFQz8R9ILiFNWQiXhPp3Yyp5J+b7LLRQUT9Z052GI78++JmZrW5R
	ySWJ6v5u22RQwflKFBEmxWkKpVjg9hsur/KXWNYCKWtf8psgfOxJ8O7RuHi/SCyb4/s+lwqCkZu
	qz+1wfYg5Cvzeh+pxJ7o0dWCYPfztRNBLBMuDa8HnS1GUi4dUdXvAqRa99KzhyUFCoYq5ko84VD
	bSoLl6pZOX27n3AuLEGZ5lOrKfDY8axtDthfsUdSdgBsWTaQ7mwRFV0S/rN0qlpDWmRimDtjpfb
	jt5KVdQeB14JmJUtIj8lEMBb9+AyiAc+Rvpk5rj9dBTe5KEyQhjRhtM/HXrmlIKhbn5rszEYdfD
	K1SpVsyFSK5t/gHm++nEslVNNC0RIyGUFlSN0QdnliePLaG/6RV/C70pPx7IKqhgcA+Yuptl1Nz
	R1RzfjTD/kuQafJw0gydkBaxVi0trC7CtTBqWuQ5QcUm8qfFQQxpbmIc6tUS90
X-Received: by 2002:a67:fa4c:0:b0:735:d53f:259e with SMTP id ada2fe7eead31-735d53f267dmr821175137.5.1782498733558;
        Fri, 26 Jun 2026 11:32:13 -0700 (PDT)
Received: from hfranconb ([2804:14c:4c5:9534::62b3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916e24e0csm1566788241.3.2026.06.26.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:32:13 -0700 (PDT)
Date: Fri, 26 Jun 2026 15:32:08 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sbom-cve-check-recipe: add
 SBOM_CVE_CHECK_RECIPE_AUTO
Message-ID: <cvjkk6o6v4vhg5ndllowjohl2q6opccmq3dg4wsvv7xbhde35l@rjgtdlkzq57m>
References: <20260625182435.979787-1-hfranco@baylibre.com>
 <DJIUCWVZ14A4.2PD6X0FXERH9Q@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJIUCWVZ14A4.2PD6X0FXERH9Q@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 18:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239656

On Fri, Jun 26, 2026 at 10:34:44AM +0200, Yoann Congal wrote:
> On Thu Jun 25, 2026 at 8:23 PM CEST, Hiago De Franco via lists.openembedded.org wrote:
> > "do_sbom_cve_check_recipe" is only added "after do_create_recipe_sbom"
> > and is never wired before "do_build", so it does not run as part of a
> > normal build. Users who build packages directly or run "bitbake world"
> > without producing an image get no CVE analysis.
> >
> > Add SBOM_CVE_CHECK_RECIPE_AUTO variable that, when enabled, hooks
> > do_sbom_cve_check_recipe into do_build for every recipe. This lets
> > "bitbake world" run recipe-scoped CVE analysis across the whole package
> > feed without first building an image.
> >
> > The task is only wired for recipes that actually produce a recipe SBOM.
> > Recipes inheriting "nospdx" delete "do_create_recipe_sbom" and are
> > skipped, to avoid scanning a non-existent SBOM.
> >
> > Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> 
> Hello,
> 
> Isn't what is meta-world-recipe-sbom for?
> 
> To do a world CVE check we do:
> bitbake meta-world-recipe-sbom -R conf/distro/include/cve-extra-exclusions.inc -c sbom_cve_check_recipe
> 
> See:
> * https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/meta/meta-world-recipe-sbom.bb
> * https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-cvecheck

Hi Yoann, 

Thanks for sharing this with me, I wasn't aware of that. I tested
locally and it works fine. So I believe this patch can be ignored, sorry
for the noise.

Thanks again,
Hiago.
> 
> Regards,
> 
> > ---
> > Hello,
> >
> > I tested this with Poky Wrynose, running "bitbake world" from an empty
> > build (from scratch). It worked as do_sbom_cve_check_recipe ran for
> > every recipe.
> >
> > This patch is dependent on the patch I sent earlier,
> > https://lore.kernel.org/all/20260619183406.239931-1-hfranco@baylibre.com/.
> >
> > Thanks,
> > Hiago.
> > ---
> >  meta/classes/sbom-cve-check-common.bbclass | 5 +++++
> >  meta/classes/sbom-cve-check-recipe.bbclass | 7 +++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom-cve-check-common.bbclass
> > index 32c29a0ec2..236bce8545 100644
> > --- a/meta/classes/sbom-cve-check-common.bbclass
> > +++ b/meta/classes/sbom-cve-check-common.bbclass
> > @@ -52,6 +52,11 @@ SBOM_CVE_CHECK_SHOW_WARNINGS ?= "1"
> >  SBOM_CVE_CHECK_SHOW_WARNINGS[doc] = "Show warning messages when unpatched CVEs are found. \
> >  Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
> >  
> > +SBOM_CVE_CHECK_RECIPE_AUTO ?= "0"
> > +SBOM_CVE_CHECK_RECIPE_AUTO[doc] = "If '1', run do_sbom_cve_check_recipe as part of \
> > +    the normal build (do_build) for every recipe. This also includes running CVE \
> > +    check for all recipes with 'bitbake world'. Default is '0' (disabled)."
> > +
> >  def show_warnings_from_file(cvecheck_export_file):
> >      import json
> >  
> > diff --git a/meta/classes/sbom-cve-check-recipe.bbclass b/meta/classes/sbom-cve-check-recipe.bbclass
> > index c80b8ac83f..084fcf4946 100644
> > --- a/meta/classes/sbom-cve-check-recipe.bbclass
> > +++ b/meta/classes/sbom-cve-check-recipe.bbclass
> > @@ -22,6 +22,13 @@ python do_sbom_cve_check_recipe() {
> >  }
> >  
> >  addtask do_sbom_cve_check_recipe after do_create_recipe_sbom
> > +python() {
> > +    if oe.types.boolean(d.getVar("SBOM_CVE_CHECK_RECIPE_AUTO") or "0"):
> > +        # Recipes that inherit nospdx.bbclass delete do_create_recipe_sbom, so
> > +        # skip them to avoid running the check against a missing SBOM.
> > +        if d.getVarFlag("do_create_recipe_sbom", "task", False):
> > +            bb.build.addtask("do_sbom_cve_check_recipe", "do_build", None, d)
> > +}
> >  
> >  SSTATETASKS += "do_sbom_cve_check_recipe"
> >  do_sbom_cve_check_recipe[cleandirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
> 
> 
> -- 
> Yoann Congal
> Smile ECS
> 

