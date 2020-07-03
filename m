Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7775.1593773319384872334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 03:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fh9rX1QS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b6so32136665wrs.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rpez8Mi3o5k39xktJ50Qc0pnXakGe8SWASpKZuVjChs=;
        b=Fh9rX1QSOxAFXCer/AxGAqo1x2LYc6f0omhiVz9dLwgbpZ0lCVmj6N71XRcvLbflAA
         0Bk2qoXC3DJLdLgntyN1WIh4yRtE9JCV43rn6Go2Krm4gzs1muMtqVsqCijwpTIn/h/A
         3kWhFt/eDWNYgEtIHAnbrWstl/zrrV+h3J7w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rpez8Mi3o5k39xktJ50Qc0pnXakGe8SWASpKZuVjChs=;
        b=o3AbshP+oBVyRq0metGBgcHgVPKMzn/gT+NjEAIYRHIzoOQlaQbi91EOSP7fPCtDQf
         01yOdKF9nzlBDhc8TGs6/BZOS2hYBjhH3NNAvSQmpXfivreQIeM4LlTwzoxgDQcMi5z1
         f8rIb479j6j4z8z8t2aFJ3xfiETGSm326oMCbBU89zUZTaCe3YI5vR+kQhYF6y/xPy1V
         D/jrpWCQKREOXhLAmxQ5ZVk9DBpY6ZcZMWZCRVkyDbgqjCU4CQzwnUFtkEouu4EJbQM4
         7O9dn0xNuoJAfaX9i0res+Qtoli07o8MQZ1TrL/Ncj8UxsRfW8yiD+PTdhQw6Nzsuv85
         X+7A==
X-Gm-Message-State: AOAM530YzfEMIz7pmN7YgDhjin6dbax2+kgBLMV1PqcRfv2mlSzEMYBZ
	9TvUD0mygb6MTJIAz7fSuaHPBA==
X-Google-Smtp-Source: ABdhPJxDgpRQayxjk6ugonGts6u0TnQ1jo7MMnjpmv9ranZTrXLkl+cLO26gXmz5q1Rv8wNlKCYIpA==
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr36140798wrr.202.1593773317823;
        Fri, 03 Jul 2020 03:48:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v6sm1251441wrr.85.2020.07.03.03.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 03:48:37 -0700 (PDT)
Message-ID: <5c9d33386f921a0b7fe06bfc480b6d52bfa26708.camel@linuxfoundation.org>
Subject: Re: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Bunk <bunk@stusta.de>
Date: Fri, 03 Jul 2020 11:48:36 +0100
In-Reply-To: <ee34bd95-2dcf-cbea-2b3f-e5c11f95e5e2@prevas.dk>
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
	 <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
	 <ee34bd95-2dcf-cbea-2b3f-e5c11f95e5e2@prevas.dk>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 11:29 +0200, Rasmus Villemoes wrote:
> On 03/07/2020 11.19, Richard Purdie wrote:
> > On Fri, 2020-07-03 at 09:36 +0200, Rasmus Villemoes wrote:
> > > Commit 992cec44 (coreutils: Move stdbuf into an own package
> > > coreutils-stdbuf) breaks package-qa when the single-binary
> > > PACKAGECONFIG is used:
> > > 
> > > ERROR: coreutils-8.31-r0 do_package_qa: QA Issue: /usr/bin/stdbuf
> > > contained in package coreutils-stdbuf requires /usr/bin/coreutils,
> > > but no providers found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
> > > ERROR: coreutils-8.31-r0 do_package_qa: QA run found fatal errors.
> > > Please consider fixing them.
> > 
> > Does this problem exist for other packages in coreutils?
> 
> What other packages? stdbuf is the only one being split to its own package:
> 
> coreutils/8.31-r0$ ls -l packages-split/
> total 32
> drwxr-xr-x 4 ravi abcdef 4096 Jul  3 09:49 coreutils
> drwxr-xr-x 3 ravi abcdef 4096 Jul  3 09:50 coreutils-dbg
> drwxr-xr-x 2 ravi abcdef 4096 Jul  3 09:49 coreutils-dev
> drwxr-xr-x 3 ravi abcdef 4096 Jul  3 09:49 coreutils-doc
> drwxr-xr-x 2 ravi abcdef 4096 Jul  3 09:49 coreutils-locale
> -rw-r--r-- 1 ravi abcdef   48 Jul  3 09:49 coreutils.shlibdeps
> drwxr-xr-x 3 ravi abcdef 4096 Jul  3 09:50 coreutils-src
> drwxr-xr-x 2 ravi abcdef 4096 Jul  3 09:49 coreutils-staticdev
> 
> 
> > I'd suspect it
> > does in which case why is stdbuf special?
> 
> Because it's the only util that gets special packaging treatment. Unless
> there's some magic 'please auto-split all utils to their own packages'
> that I don't know about and which we don't happen to set.

Sorry, I think I was confusing this with util-linux for some reason!
Just having one package here definitely helps.

> > Whilst I realise there is a problem here is the correct fix not:
> > 
> > RDEPENDS_coreutils-stdbuf_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils', d)}"
> > 
> > ?
> 
> [Well, the coreutils should be in the true branch of that.] I dunno, it
> creates a cyclic rdepends between coreutils and coreutils-stdbuf. Is
> that ok? Seems a bit ugly to me, even if it would work.

I hadn't realised there was already the reverse dependency. I think we
need to let the package exist in both cases so the two dependencies
need to reverse direction depending on whether single-binary is set.

So something like:

RDEPENDS_coreutils_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils-stdbuf', d)}"
RDEPENDS_coreutils-stdbuf_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'coreutils', '', d)}"

?

Cheers,

Richard

