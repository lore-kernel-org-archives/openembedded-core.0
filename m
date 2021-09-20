Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.307.1632168128634577244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 13:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T+ygSrwZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w17so24835178wrv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dWbzvROnUpWXsaJw8rBNS5YrypbAondc/y/YOpy8llo=;
        b=T+ygSrwZkmHI9EqxU4XjKqUtcop6uKi3j4JZ9eIeUdYUO0qb2U0AYxFhcxPbeQDyrw
         IZcdGwP3dg0MNyvb5bUXC+X+i4vmI6Whfj0E/wLUdThKrSeE/AHdtxlg/I/TJQgbxKNm
         t78gelw77gkerM8m60UVGjS75pumdpQaNOSdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dWbzvROnUpWXsaJw8rBNS5YrypbAondc/y/YOpy8llo=;
        b=vO4U9GJOfPc6rPfjV/+KZBV1a2c1DdXksND9M9nnvVKcS6ehfe16ccQhFwUCqX4ncn
         +lZ2Wcao1jvpDZ9RhMZXxf9S6DarQ8z1WUJfLPuytjcC3icQhZCS+Q5xeDVsRWqIEePq
         4gqrmBevl94J30QfSE4gzFRlsTQf+HWmdRwIZ1WL/7Yw3UU2fe6fvqwabwFf/VPqUKUN
         M4T5et3vLWS57JBn42NDgwUjfJt7LwCd7QGA2qQO6d507vCkXUwyPXWTAtCpHDFTwyPF
         No1oUr5wvKDxZCKjdJKX0hpnE5ws4g+WnAHcY8uufR+LMYTn4wW2w5vULCoaFNaZ4UtK
         n7Yw==
X-Gm-Message-State: AOAM530CBN/rIgO0U7n9FMjbirvumNEUKeEWPABxGkgiAZUe/Wsa10Yo
	NjzPgZG696ArEUEF6rn1HKVNjQ==
X-Google-Smtp-Source: ABdhPJw6Dzh6egdIy854re2d9zlzN4ehWwSyrSHngrd/RC8aOqGwmpA+xe1K8+5p+OmmtdJrKMCrKw==
X-Received: by 2002:a05:600c:4fd2:: with SMTP id o18mr817543wmq.126.1632168126855;
        Mon, 20 Sep 2021 13:02:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:97b0:b8a0:39a5:2c93? ([2001:8b0:aba:5f3c:97b0:b8a0:39a5:2c93])
        by smtp.gmail.com with ESMTPSA id j23sm557096wmo.14.2021.09.20.13.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:02:06 -0700 (PDT)
Message-ID: <57e5c105c40aaf6125249bef77003ea355ca5cb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 11/14] populate_sdk_base/images: Drop use of 'meta' class and hence do_build dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 20 Sep 2021 21:02:05 +0100
In-Reply-To: <01765ca0-de7c-2e32-7e46-455d18737705@gmail.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <16A6887F33E2E04C.31899@lists.openembedded.org>
	 <3efdb496fefa59a9a7edec21f2ca751de5439bd5.camel@linuxfoundation.org>
	 <01765ca0-de7c-2e32-7e46-455d18737705@gmail.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-20 at 09:32 -0700, Khem Raj wrote:
> 
> On 9/20/21 5:51 AM, Richard Purdie wrote:
> > On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
> > wrote:
> > > The 'meta' is old and not very useful. It empties PACKAGES and creates
> > > recursive do_build dependencies.
> > > 
> > > We shouldn't need such recursive build dependencies any more so simplify the code.
> > > 
> > > This does cause behaviour changes as some dependencies are no longer built.
> > > It did show up issues with qemu-helper-native handling for example but those
> > > issues look like real races and the underlying dependency chains were not correct.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >   meta/classes/populate_sdk_base.bbclass | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> > > index ccfe2232895..49e166e697d 100644
> > > --- a/meta/classes/populate_sdk_base.bbclass
> > > +++ b/meta/classes/populate_sdk_base.bbclass
> > > @@ -1,4 +1,6 @@
> > > -inherit meta image-postinst-intercepts image-artifact-names
> > > +PACKAGES = ""
> > > +
> > > +inherit image-postinst-intercepts image-artifact-names
> > >   
> > >   # Wildcards specifying complementary packages to install for every package that has been explicitly
> > >   # installed into the rootfs
> > 
> > This change is probably high impact in that it changes behaviour the most of any
> > of the changes. It does make image builds use a lot less sstate and in theory,
> > if there are issues with failures from this, there are probably existing races.
> > 
> > It does also have CI impact as it changes the things which are built as not all
> > build tasks now run. Open to opinions on whether we should do this now or not.
> > 
>
> I definitely like this change and want it in upcoming LTS in 2022, not 
> comfortable with rushing it into this release. It will cause fair bit of 
> work for rest of layers in ecosystem.

The question is whether this is a real world issue for anyone with CI out there.
I've been looking at the YP autobuilder and I'm not sure it is. Yes, it does
change things but not really in a way I'm too worried about.

There is some breakage in this series but it is mainly from the layer.conf
change.

So the question is whether anyone does see real issues in their CI from this?

There is an easy change if it does cause an issue which I've now documented in
the commit log as I replied to Joshua.

Cheers,

Richard

