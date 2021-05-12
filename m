Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.5688.1620861144760305899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 16:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S5OfXqD6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a4so25235769wrr.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 16:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UddEaXgrw5NoQo+YornZQC2r6/gy2exRMVciZsl0Qqc=;
        b=S5OfXqD6T/1x5cswGmhpxU8ro1Ee0zO5qqSX5TPyeReb2IiO3ol1tIzCtSeWGcgJi3
         bOAOCH5npe6xkUvbwnerTTNMgcs/yisZ5ucDvRf/e8lAAiADkiry1XRI4N4nWbdqrrBK
         9cZ7rtpi4DiIZOj0JxQSxhReSMZYNZLeNU58w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UddEaXgrw5NoQo+YornZQC2r6/gy2exRMVciZsl0Qqc=;
        b=ccmJpUzGf+LLstXrH7rOfV+GWcrvKl6ynDzeS4d9zpbv2tMBCrbbs6M04gogheEiBX
         305xll1K+mlTiKZ7k7k8m3y4EhFFX+VGuDPI5HljXygJV91BZf23d0qzKDrQXOP+KOsQ
         XrTCffBscytNXHWG+TLHzAUzhVdBjm6QM4kz1SBZpMZXGoF1tme3DjGaTWlsUBYkLjyB
         AYYHPzOwr/fQpZm8V0LptEZBsdxNhIPiuhsGXj+Y5s7XGIyC8iib2cFUi3f6xRNGuTtg
         8A8IV+cEmivrm7kkKVmAvIgNi5ziIJc0m0kBns9F68pa3Ob+x1Xq67L9UXeDigjdaztE
         Cleg==
X-Gm-Message-State: AOAM533evPLRvt9ksyboYQfg+DZgkn3RI15ZSAzoQfrQUBsKUvU1DlHx
	hozPM/Vcth8RE+UGBpulODFyPQ==
X-Google-Smtp-Source: ABdhPJzs//dUwE4Zcc38QfTqtulme/upcE6rErfXdMZWFDxskdzepuMYa2+lCHipOW72Ev7y1SfB/Q==
X-Received: by 2002:a5d:6daa:: with SMTP id u10mr47461842wrs.119.1620861143195;
        Wed, 12 May 2021 16:12:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f649:3481:d239:bb03? ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id v12sm1181158wrv.76.2021.05.12.16.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 16:12:23 -0700 (PDT)
Message-ID: <a797bbeecd3bdbfdcf52943ff5a51857729ffe00.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] ovmf: Disable lto to aid reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 May 2021 00:12:22 +0100
In-Reply-To: <CAMKF1spC4W1sWy32C_=WwY8SwH2CHPD7YQJym-gUShy2BZaR5g@mail.gmail.com>
References: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1spC4W1sWy32C_=WwY8SwH2CHPD7YQJym-gUShy2BZaR5g@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-12 at 16:04 -0700, Khem Raj wrote:
> On Wed, May 12, 2021 at 2:32 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > lto tends to break reproducibility and makes ovmf near impossible to debug
> > reproducibility issues in. Disable it and supress the warnings that then
> > generates from Werror.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-core/ovmf/ovmf_git.bb | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> > index 1fe01146d6b..ef5545bf705 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -102,15 +102,22 @@ fix_toolchain_append_class-native() {
> >      # to make ovmf-native reusable across distros.
> >      sed -i \
> >          -e 's#^\(DEFINE GCC.*DLINK.*FLAGS  *=\)#\1 -fuse-ld=bfd#' \
> > +        -e 's#-flto#-fno-lto#g' \
> > +        -e 's#-DUSING_LTO##g' \
> >          ${S}/BaseTools/Conf/tools_def.template
> >  }
> > 
> > +# We disable lto above since the results are not reproducible and make it hard to compare
> > +# binary build aretfacts to debug reproducibility problems.
> > +# Surprisingly, if you disable lto, you see compiler warnings which are fatal. We therefore
> > +# have to hack warnings overrides into GCC_PREFIX_MAP to allow it to build.
> > +
> 
> could lto piece be turned into a packageconfig,as I think LTO usage
> will only grow in coming future
> some distros may prefer LTO over reproducibility for performance reasons.

If someone wants to do it, sure. I've had enough problems with this horrid build 
system already today. You don't want to know how many hours the reproducibility 
fixes have taken :(.

Cheers,

Richard

