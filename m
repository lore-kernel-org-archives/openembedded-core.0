Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87FBC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:26:30 +0000 (UTC)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39432.1789133187984877910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=irDe4jo2;
 spf=pass (domain: baylibre.com, ip: 74.125.226.204, mailfrom: hfranco@baylibre.com)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde4so346655241.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789133187; x=1789737987; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQS9FonPG/72mgkYfiMi0r2YcBItRCdsAEtv3Tu6Xns=;
        b=irDe4jo24pu7nVrSys+1kl79E/zoKrVHCQa/UCa1Cc6SS2XgY0PTzOq7JmDUNLDxFR
         A2X/uBTn4SdCzNVbIB73J9yQ6tLUwNwwFjELt3zDOV+w980EeltH7LLSjAlciFG8kZfe
         xgSojZVuXYx4heNjS//RP+OIod5Mfkb7fDYaBP8S4GswU4nJk1iMPzLjQQDEsH+PWxJR
         EYLXwgTSg2waffJyKu6gvA/kRh5HRjSOp5mG2AZwtcVF0/vYpcpvJEhwOcyISXWNBHxb
         oRfeuA2cI86fmVzv6dFJZLoXZUJGKx/CXoo0ExJjIWm76qfG+29ODrDCsL+V1hT1jxq0
         5huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133187; x=1789737987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQS9FonPG/72mgkYfiMi0r2YcBItRCdsAEtv3Tu6Xns=;
        b=PaoO3Fj91uWgLxAWLvG3vktftTa1eOy2jPxXfixKCuZ42IRnC2FyRmNrV/gCNUk2tT
         OZvw3rYr4TrKx30Km6WvVBj9Znq/s0rImaBj8M3hhyCBpi1bVs54ylNSEr9cJh4ujl4k
         KOXq92qpf96CRPpBCOvZdpzNWTjZPnFKOGglR7SMcwLvlXFIVVcLt2Om9PMgknlt0OVh
         uQLK0W2DmRy82gLIxy1soNVFPlFmWAuwi0fkzqtWVtfEguAmsVGZ7Q5hxxXpBsf37TCT
         WHXuoiwaZZ1/a5TDnlmmAmlspUSxz/QyJMaxxbX+9G+7L1GoW6Z3Aboi0G4V/BpJzCew
         CdPw==
X-Gm-Message-State: AFuF++n7kTGcWBrSMsQ7RZKW63xuj5J4ZQ4V0aPINhC8fW0aUya9fjAt
	1lwqJ1UD1uQBRdYBVmnNmIkz4dH1MeeJG+7zYpyAfMLaCm3tnAVjMi0u2WnUCZePiwU=
X-Gm-Gg: AYBFou3m0wbeHeSrTBguG7iLqEO9tADJkTFb+PokrcKvtdLl4V3+k5x6IZSKf4NQWSJ
	RcSxkJ+QmpOzUFBvcZlzcqaBNot4P1hvsXF7ClbOYD2akSjRi3lJIOYUtD592+MQ3/0adQ0Q5X2
	6gpgzvwlpdSUUX+UqlXw2gaD7wq0Kry8aMVyCKiXhUbcPRDoiFZW7tMfn97e1V1Tcsc4GECQnDJ
	Guc7DL1j06RB1L4hmhNNWTzDAvPyPnrmNjY7GR1Nti4XgrM1/jiO30DsRxvVGu4rRNVane2n1mu
	REh8TU/0aevkIW6ObakhdGLwANz+B5vie/tfHl47HVQc3twLh/w3GVr8sCUaTJn3i8sFdMomDdK
	7hEmXrLyOUiqRYyylzUqTau1zeAaiRjOdFvRyqcGUV4eD/Pi8drIi3WPQRkUx5wfAxTI8+bYGam
	MkiCtShpHqOpq9AdYe/+Aynkk7qcxIuwpLWaI5dp5RveUrpC+XxJYTnockeNgIGC9ftI365xxnx
	unzTvqi+s27fYvWuWPLsuv2h/dn3DfDUok=
X-Received: by 2002:a05:6102:6414:b0:785:35cb:e64a with SMTP id ada2fe7eead31-792a6b4b78amr3422275137.3.1789133186228;
        Fri, 11 Sep 2026 06:26:26 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::7f1c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf17fsm2516985137.3.2026.09.11.06.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:26:25 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:26:22 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [scarthgap][PATCH] improve_kernel_cve_report: fix
 crash on entries without detail
Message-ID: <aqQBVr_WI-7nU7iO@hiagonb>
References: <20260901-fix-kernel-cve-scarthgap-v1-1-405f5d7a8957@baylibre.com>
 <DLBQZJYT26YH.23YA0N3PX5036@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLBQZJYT26YH.23YA0N3PX5036@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245648

On Thu, Sep 10, 2026 at 05:39:31PM +0200, Yoann Congal wrote:
> On Tue Sep 1, 2026 at 9:42 PM CEST, Hiago De Franco via lists.openembedded.org wrote:
> > When the CNA reports Unpatched and the scan reports Patched, cve_update()
> > reads cve_data[cve]['detail'] unguarded. cve-check only writes 'detail'
> > for CVEs carrying a CVE_STATUS varflag, so an entry marked Patched by an
> > NVD version comparison has no such key and the script aborts with
> > KeyError: 'detail' on ordinary cve-check output. The unhandled-update
> > warning below makes the same assumption.
> >
> > Use .get() in both places. A missing detail falls through to the CNA
> > verdict, and only an explicit CVE_STATUS = "backported-patch" outranks
> > it, which is what the guard was added for.
> >
> > Tested by calling cve_update() with a Patched entry carrying no detail:
> > before it raises KeyError, after it takes the CNA's Unpatched verdict,
> > while an entry with detail = "backported-patch" stays Patched either way.
> >
> > AI-Generated: Uses Claude (claude-opus-5)
> > Fixes: d317e2a52bd2 ("improve_kernel_cve_report: do not override backported-patch")
> > Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> > ---
> >  scripts/contrib/improve_kernel_cve_report.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Hello,
> 
> If I'm not mistaken, this patch is the squash of 80ff4903ea1 and
> f5da16b0d3c. I'd rather have 2 clean cherry-picks, this make tracking
> which patch is needed or not easier.
> 
> Can you send the 2 cherry-picks as a series?

Correct. Sure, I just sent to the list. Thanks!

> 
> Thanks!
> -- 
> Yoann Congal
> Smile ECS
> 

-- 
Hiago

