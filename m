Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262E7C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 23:06:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.201.1637708780609918993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 15:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LlneIvlm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 133so497442wme.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 15:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=icQmA7t66EBTaKvfxA6e3i26hLSthepFMGnv1kVcnSw=;
        b=LlneIvlmtlpsZ07FgoXl2U6mBjKpM09rHpn9anF7KhYd2TVAlfn37HTzV123/lf6DZ
         VtrN4+I7tKlUjRH6KWPCTo50pUv3qaCYqnPOZP2VAUyojd6jeD1ob3x+t9CswManBcIR
         +aNXEB7Wu+iJheq97iVWApfCiw3J4zeqS9V84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=icQmA7t66EBTaKvfxA6e3i26hLSthepFMGnv1kVcnSw=;
        b=yEuOF7caNJsNwgD5uC+t3m4yLQg6R1AuJ4bvsbnpo+TvF2F2alWsh0rTZ6PGWqAXX+
         kxTdOl+kFuzvi05wZjA4b+5gtdJndi9Sep7/MqlqkO6IxLAZXnowkNiG2IGLYv7IEj2N
         eHNeb89zmr3wxRbJn43jRCUIvUiaap2iw9x96aUuFCyqm5YzDMb8rqskThZJK6BtfiaB
         U2fMW7wtIRMuE33D6vW9+LYHyTyWNOckW2foYadMv1yPCAHYVsPzd0dNEZo7YdPio3vK
         LJGE3I1ExwpqegknrmXp/jxcpPkMKfTXdk1KbZpvwVFS6EQbT5F/9AIPigpWE/krWFKZ
         sTRA==
X-Gm-Message-State: AOAM530m3+3fpeIylvFE9/OTJ7TqodJMViOT5z6uq14m1AoPTUWrh05j
	cQxUxMNJz29z3mWzJbxCukLzAg==
X-Google-Smtp-Source: 
 ABdhPJwwGOEI8sk8jqIBBJBKWe0uu4+Rgj4sn4D+HYIs5MtYxNA1u9Ncvm4qzeT/ufubZJxP3PXXbA==
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr8047457wmq.180.1637708778992;
        Tue, 23 Nov 2021 15:06:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id 9sm16983283wry.0.2021.11.23.15.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 15:06:18 -0800 (PST)
Message-ID: 
 <5db1f1f65d061ae660e45c0f0440c5446bddb398.camel@linuxfoundation.org>
Subject: Re: [PATCH] native/cross: Add ar wrapper for determinism
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Nov 2021 23:06:16 +0000
In-Reply-To: <9415e9e5-10b7-8c9a-6eb0-7f563c6472fc@gmail.com>
References: <20211123141210.28396-1-richard.purdie@linuxfoundation.org>
	 <9415e9e5-10b7-8c9a-6eb0-7f563c6472fc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 23:06:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158645

On Tue, 2021-11-23 at 21:22 +0100, Jacob Kroon wrote:
> 
> On 11/23/21 15:12, Richard Purdie wrote:
> > From: Jacob Kroon <jacob.kroon@gmail.com>
> > 
> > Add a wrapper around ar calls for native/cross recipes. This wrapper adds
> > the -D option so that deterministic archives are built for native/cross
> > output. This improves the changes of hash equivalence matches and hence
> > build artefact reuse.
> > 
> > We don't need this in the target case since we compile binutils-cross
> > with an option making this the default. We need a wrapper since we need
> > to remove the "u" option and replace it with "D" but also allow things like
> > "--version" to continue to work too.
> > 
> > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/cross.bbclass  |  2 ++
> >  scripts/cross-intercept/ar  |  1 +
> >  scripts/native-intercept/ar | 29 +++++++++++++++++++++++++++++
> >  3 files changed, 32 insertions(+)
> >  create mode 120000 scripts/cross-intercept/ar
> >  create mode 100755 scripts/native-intercept/ar
> > 
> > diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> > index 3e6a2f60b9e..9d951076a78 100644
> > --- a/meta/classes/cross.bbclass
> > +++ b/meta/classes/cross.bbclass
> > @@ -93,3 +93,5 @@ python do_addto_recipe_sysroot () {
> >  }
> >  addtask addto_recipe_sysroot after do_populate_sysroot
> >  do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
> > +
> > +PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
> > diff --git a/scripts/cross-intercept/ar b/scripts/cross-intercept/ar
> > new file mode 120000
> > index 00000000000..bc68ffd7a21
> > --- /dev/null
> > +++ b/scripts/cross-intercept/ar
> > @@ -0,0 +1 @@
> > +../native-intercept/ar
> > \ No newline at end of file
> > diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
> > new file mode 100755
> > index 00000000000..642b6eae864
> > --- /dev/null
> > +++ b/scripts/native-intercept/ar
> > @@ -0,0 +1,29 @@
> > +#!/usr/bin/env python3
> > +#
> > +# Wrapper around 'ar' that defaults to deterministic archives
> > +
> > +import os
> > +import shutil
> > +import sys
> > +
> > +# calculate path to the real 'ar'
> > +path = os.environ['PATH']
> > +path = path.replace(os.path.dirname(sys.argv[0]), '')
> > +real_ar = shutil.which('ar', path=path)
> > +
> > +if len(sys.argv) == 1:
> > +    os.execl(real_ar, 'ar')
> > +
> > +# modify args to mimic 'ar' configured with --default-deterministic-archives
> > +argv = sys.argv
> > +if argv[1].startswith('--'):
> > +    # No modifier given
> > +    None
> > +else:
> > +    # remove the optional '-'
> > +    if argv[1][0] == '-':
> > +        argv[1] = argv[1][1:]
> > +    argv[1] = argv[1].replace('u', '')
> > +    argv[1] = 'D' + argv[1]
> > +
> > +os.execv(real_ar, argv)
> > 
> 
> What should we do if the user is explicitly passing U, "Do not operate
> in deterministic mode." ? Don't replace any 'u' and don't pass D ?

That would seem to make sense to me...

Cheers,

Richard


