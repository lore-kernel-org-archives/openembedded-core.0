Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.11768.1628182791722738031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 09:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dppRDsPN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d8so7465434wrm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+qm7/DX0//M/BNQC1LQuF4yVXJfUR/OmY/Cov6PzQQk=;
        b=dppRDsPNV2bedbEH+uhGywhV1Z62fU+Q1Ti8s7osOfqnVkiNKwxVwbduftV4pFcXpX
         at5PbZY1HJbxUCISQFYmomkHMVvPro9LVmprCmD6nbffCUGfah8Ec+bKph1kgp8Qll4X
         GDS1ET47Tt+ovXAooFdBfvZMq6QlkqkR0JaGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+qm7/DX0//M/BNQC1LQuF4yVXJfUR/OmY/Cov6PzQQk=;
        b=kRIncO9xxm4+WlaWYaAd0NcAWOVevfl3t2E85MXCndvD3J3lhVa1jV7ElB1Vxn2QrQ
         x5oWwj4QeZhze0BRe7/eSoL5Loui6Ptju1/fa02pu5Pg1aJ4FXU2yrHHIHnK3dfbbReI
         14KaLNp3maGVNPktNPL88ffljWjKbSH5ctSY3Hl0oYbCK8rBjzLSmp+afBOaqMPEy/Wk
         a+RWYMSRTo5pHn2hmEsWDo71gA177NwPAhm5I247NmIgupjJe6dbqx9viy/+T001sGvb
         Aq8c1s5jEdAignQ7J5vTcPfeUNQshEDAX2VvNXlm4qZf6JL3gQMWGuuGtKU7KhMEMHx/
         3Oug==
X-Gm-Message-State: AOAM530eGa1eU1ol6Pdz9qCuAih3dbm+xvaC8yQ+TP1Kn7HwEzeJJD9m
	cIpC/TnrQEtlSnfQdsDMMnuH2g==
X-Google-Smtp-Source: ABdhPJwNjFyRCEBylazJrmSdSqE5/UjK3SzcUa2JqDX6lI8zF+oZJQNeBE3bcyldy2naY4KNDH7OZA==
X-Received: by 2002:adf:f590:: with SMTP id f16mr6551092wro.162.1628182790173;
        Thu, 05 Aug 2021 09:59:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4? ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id x18sm6555070wrw.19.2021.08.05.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:59:49 -0700 (PDT)
Message-ID: <de9fb5c5a4cea7f2f1100c028eb7b750a7eae4a7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 3/4] bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tony Battersby <tonyb@cybernetics.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Thu, 05 Aug 2021 17:59:46 +0100
In-Reply-To: <1698745FB6BE4CCB.3515@lists.openembedded.org>
References: <30028597-3dcb-cbe2-f7a7-54b0e7bd8e1f@cybernetics.com>
	 <1698745FB6BE4CCB.3515@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-05 at 17:00 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2021-07-27 at 09:36 -0400, Tony Battersby wrote:
> > -f*-prefix-map flags are required when linking with LTO enabled to make
> > the output binary reproducible.
> > 
> > See discussion here:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473
> > 
> > [YOCTO #14481]
> > 
> > Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> > ---
> > 
> > /usr/sbin/lspci from pciutils is a good program to test that shows how
> > adding -f*-prefix-map to LDFLAGS makes a program binary reproducible
> > with LTO enabled.
> > 
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 160abf40ee..c0d2e3f82f 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -595,7 +595,7 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
> >  ASNEEDED ?= "-Wl,--as-needed"
> >  
> > 
> >  export LDFLAGS = "${TARGET_LDFLAGS}"
> > -TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
> > +TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PREFIX_MAP}"
> >  # mips does not support GNU hash style therefore we override
> >  LINKER_HASH_STYLE_mipsarch_libc-musl = "sysv"
> >  
> 
> This failed in testing in ruby:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/514
> 
> The error is a bit obtuse but in summary, the file:
> 
> /tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/sysroot-destdir/usr/lib/pkgconfig/ruby-3.0.pc
> 

The fix for this looked relatively straight forward so I've queued a patch
in master-next for this.

Cheers,

Richard

