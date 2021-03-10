Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.1122.1615411631576102161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 13:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fe7wZxnY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id e10so24932337wro.12
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MjcTj9OViw/FyXqSNLOSTgFiiXHvPAo1g37cU4pMcAU=;
        b=Fe7wZxnYUrW7gmRY8lyPSXZIhYjPlG0gtleE7oUsHco8u4/V9NEuLSg/yQppkPnjsQ
         cUnr5SQZL9KgcCH7mwx58f90UGPpl9G7YQz52woX3f724sGUAUvpYe45r9uW90XmHQM/
         54vOjcLZnodtoh5zpYVTuVQSXKbpT/FqOOSGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MjcTj9OViw/FyXqSNLOSTgFiiXHvPAo1g37cU4pMcAU=;
        b=MGcQmyD2C+YJ7iGlD+WD055hvuEyNSa+6tiLRuDzwWm1WquDwfUWSlNQ67Cw5tHY9p
         z0UVIguH7DB3eOcaB9xQwpyaLIG/5KvCp/j1vT4jNcxZh6MpflIYFtMpQHkTdR8dEJ7D
         1QhMW7zWPDx7M/Kgs1RpXz3DL+kG4/M/nvRIlfS6MgFgP5UmPLXQHRumwhWMiRKKLTKr
         51vO0rpNNlrWnq3lJeLXd44XIGUjBBwP5jKo9Zs72Q3GJlVC1KhmCzEKVZZk/b9wG+AR
         fWgT0NS6S+7DC7jwgG9CZioy1iABsPuLSVgPTbRMLLbN/zVKck3855GwwX4MoauaxHoS
         LbSg==
X-Gm-Message-State: AOAM5323XB/cvrhgqOL9iyW0WqYKieWBVMGDf9U1AWs+Mku3232kKBHB
	MNLKAUm4GBuZxdtxu9QuVG5Sng==
X-Google-Smtp-Source: ABdhPJxXlcnR0MaJdIEMlB4UK6mgrjBr3bulHaJ4nR5zIjS+1qmnAWu4qjcyxJexCnKX7zZ1oUGykA==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr209731wrf.4.1615411625061;
        Wed, 10 Mar 2021 13:27:05 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id v18sm698352wrf.41.2021.03.10.13.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:27:04 -0800 (PST)
Message-ID: <28b0728df3fdc076dd39615268d56eb9ee960fd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] any reason for "cmake_" prefix on cmake_runcmake_build()?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Mar 2021 21:27:03 +0000
In-Reply-To: <ed7fc1ff-d861-a0b9-e749-627193f3db66@crashcourse.ca>
References: <b0117e87-c17f-e22f-c2b9-868dd12ea09@crashcourse.ca>
	 <cf23928e-ea00-6f4e-78b3-82bed1658fc1@gmail.com>
	 <ed7fc1ff-d861-a0b9-e749-627193f3db66@crashcourse.ca>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-10 at 06:38 -0500, Robert P. J. Day wrote:
> On Mon, 8 Mar 2021, Khem Raj wrote:
> 
> > 
> > 
> > On 3/8/21 3:22 AM, Robert P. J. Day wrote:
> > > 
> > >    collecting some examples of inheritance of class functions using
> > > EXPORT_FUNCTIONS, and ran across this routine in cmake.bbclass:
> > > 
> > >    ... snip ...
> > >    cmake_runcmake_build() {
> > >  bbnote ...
> > >  eval ...
> > >    }
> > > 
> > >    cmake_do_compile()  {
> > >          cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
> > >    }
> > >    ... snip ...
> > > 
> > > what puzzles me is that the routine cmake_runcmake_build(), despite
> > > having a "cmake_" prefix, is not being exported with EXPORT_FUNCTIONS,
> > > so while that's a perfectly respectable function, it's not clear why
> > > it would have a "cmake_" prefix. is there some value to that prefix,
> > > or is it just arbitrary?
> > 
> > it does not intend to provide a default function like do_compile do_install
> > exporting it is not necessary
> 
>   no, that part i understand ... the nitpicky observation was the use
> of the "cmake_" prefix for a function which was not intended to be
> exported for the purpose of inheritance. sure, it's perfectly legal,
> but in a stylistic sense, it just leaves open the possibility of
> misinterpretation by someone reading the code.
> 
>   a simpler style rule might be, "reserve classname_ prefixes for only
> those routines you plan on exporting." but i admit this is a quibble.

No, please lets not do that. Having come kind of standard prefixing for 
variables/functions in classes does help give people direction to know 
where to find code from tracebacks or variable definitions and the like.

The use of EXPORT_FUNCTIONS is a bit of a special case which requires the
prefixing but I really don't want to see any recommendation we drop all 
prefixes otherwise.

Cheers,

Richard

