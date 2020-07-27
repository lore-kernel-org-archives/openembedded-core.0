Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.57146.1595861261369333879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 07:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M+E2Xp/I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id x5so13853743wmi.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eWrg92atvBA/da0JjMoVrC7TU9xVAXvOGa0fJQ9rwaE=;
        b=M+E2Xp/Ie5asy7uEup3aTcFIwMykVNtyZOzNKd82c3AEN1ukHD0ZaQAMUIdfvPdQEN
         hq61fN79qeV+RqQIfW0VYrmRKP+f+udT90OeJ4purRivESLM6d6F5lypMGpMvsqfllND
         PbhQ2g2OJ+vK5eMWT1pZNu8y7Zr+SWxyHSFEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eWrg92atvBA/da0JjMoVrC7TU9xVAXvOGa0fJQ9rwaE=;
        b=JavtPAvEqM9upmvKeIuzoVLSLdo00Gs+jN2c9aYSiiR8T9UxGXj50t/QmqRgc4FUT5
         DyH8Q8rV2Xc9kRHxywJnXW2JO0ZIhUB8gxZL31coYrCeHEUc9FxBHOkfl2m1wGQ32hNj
         8WBMC21uR/cpBx/H8RZPuRLtWRjNd2nu9GHfn5AqE8xDVA0dijKBUGLjJxjG+fXYJqh9
         ZmZfqFc0c2wfBtWErMfvadNqLTHLLaZ/PnOlQtT/sxp8q4zALBBdxg+Q4j8iinsa15L6
         VrVjtygM+QiuAtksoID5nlJtJrykEot04dHNKu2/FsxkrzT5PGvVQt4+sYfPbiJOabh1
         ZX6A==
X-Gm-Message-State: AOAM533kSR7X9GoSdJqZZldQE7BpdhCQdLhir/Fw6A0OjOdruWgq21tP
	qEq9kg1FyFFQMFS6BuOVWAnUZw==
X-Google-Smtp-Source: ABdhPJwDKAeayTpSEYLL3OUz1SXhRP7ClngBp7ln6WnW82iXl6gxkHn+TVsuMUl9qBUYxPQy4vqsuA==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr20353839wmc.162.1595861259845;
        Mon, 27 Jul 2020 07:47:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id v11sm10851232wrr.10.2020.07.27.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 07:47:35 -0700 (PDT)
Message-ID: <5d6b233e209d6ea0a3c3047c0d63feea0543b647.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2][PATCH] cve-check: print warning if file is missing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2020 15:47:32 +0100
In-Reply-To: <f5995aa5-dedb-167e-cbfb-00886de6ca64@gmail.com>
References: <20200727025231.24418-1-akuster808@gmail.com>
	 <d60c82f476989c46864b9d50a7f6fce3ae9eb189.camel@linuxfoundation.org>
	 <f5995aa5-dedb-167e-cbfb-00886de6ca64@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-27 at 06:57 -0700, akuster808 wrote:
> 
> On 7/27/20 2:39 AM, Richard Purdie wrote:
> > On Sun, 2020-07-26 at 19:52 -0700, akuster wrote:
> > > If the "tmp/cve_check" file was not create as in the case for -c
> > > populate_sdk, just print a
> > > warning instead of dumping a trace back
> > > 
> > > ---
> > > v2] lets include the missing part of the patch
> > > 
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > ---
> > >  meta/classes/cve-check.bbclass | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
> > > check.bbclass
> > > index 0889e7544aa..b16da9890af 100644
> > > --- a/meta/classes/cve-check.bbclass
> > > +++ b/meta/classes/cve-check.bbclass
> > > @@ -55,6 +55,10 @@ python cve_save_summary_handler () {
> > >  
> > >      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
> > >  
> > > +    if not os.path.isfile(cve_tmp_file):
> > > +        bb.warn("File Not found: %s" % cve_tmp_file)
> > > +        return
> > > +
> > A warning is something the user really needs to fix or take some
> > action
> > about. Is this a warning?
> Its actually an error in certail conditions. Do we want this to be
> silent or fail on 'populate_sdk'?

What are the "certain conditions"?

Should it not detect those conditions and error if they occur?

Showing a warning and asking the user to guess is not a good user
experience. I have no idea whether I should worry about the warning
above or not for example, so I doubt anyone else does either.

Cheers,

Richard

