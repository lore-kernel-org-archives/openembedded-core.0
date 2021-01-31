Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.16849.1612089293069149621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 02:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QJlcI7KH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id s24so9559481wmj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=m9bvlKYhyCANKEwDzDOOr88XENGGcgrURJOVIBDdwOk=;
        b=QJlcI7KH1KpEAwAEiIhmwfs5uTNbpdWt2ORCvqbdaVu8wkLZqF0ZQWiuwPeGdVlXNk
         LzDEClzAWJ80cgPqpWWBF7EQ9C5p7quIuJcLeTNLxctGXtYG1oUtb0xWnQtAPsomgM/H
         lueTdxcGNWh0RFSVORwDX9EFXB7f0oWkmPzn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=m9bvlKYhyCANKEwDzDOOr88XENGGcgrURJOVIBDdwOk=;
        b=T9DrnSzsYkN07Z1i2HBgnqkTwkrsSJDcrRNsCjj+lSlbN9kSwfuui8Zh7WrmxWrGvc
         Ea1B7tKu7gFpHs7Z6rgZjgzbUAwAD7euFnst8/XuP0ahjl/0WUgo39aAU9NbR4qOxokd
         1Q5wtqvinwuIe+kPPKM5Of+Wc+JRIGcS8VUBOYd/WZ+uBGtwO8aQjatEd0hoHSYCnWdP
         BEBeZRPc62ooEqzdB3fyrp2YNlSQED76RMFCdir2pPEZPRfcVL5AwbxhveO6nDrhV/Ot
         nkQio058cDbBJs0E+fZtEGOznWw9UKWOsX0WDAeJzBrUriH0mBOh0HhyZazu2Uz5Ru/P
         5Uvw==
X-Gm-Message-State: AOAM532cr/+hKZbBC662/ghIPMFXiUmXrq2v+4qIRAwgnDPRNBq2vv+M
	xqzmWjJSHROJ53QCQyg2ycvIAg==
X-Google-Smtp-Source: ABdhPJx5Cu5eM6+OorisAvNeUU1TY2OMyrEb1uFuezOnBhAyxCNYsNASgOAhcB3k0xPSHXE6rfD4Aw==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr10662740wmo.161.1612089291517;
        Sun, 31 Jan 2021 02:34:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29f7:5a4e:c660:258e? ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id y18sm21944275wrt.19.2021.01.31.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 02:34:51 -0800 (PST)
Message-ID: <1af99424085f84d64915e6251cc809ac450b8b0f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2021 10:34:48 +0000
In-Reply-To: <20210131095518.iqqi2lrx7n5b2csp@jama>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
	 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
	 <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
	 <20210131095518.iqqi2lrx7n5b2csp@jama>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-01-31 at 10:55 +0100, Martin Jansa wrote:
> On Sun, Jan 31, 2021 at 09:07:50AM +0000, Richard Purdie wrote:
> > On Sat, 2021-01-30 at 17:15 +0100, Martin Jansa wrote:
> > > I'm asking because meta-python2 has the same issue in:
> > > https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/python-setuptools.inc#n49
> > > 
> > > and my fix I was planing to send was to replace it with:
> > > RDEPENDS_${PN}_append_class-target = " ${PYTHON_PN}-pkg-resources"
> > > and drop the RPROVIDES, because it unfortunately causes bitbake to
> > > get stuck after reporting parsing error as:
> > > 
> > > ERROR: meta-python2/recipes-devtools/python/python-
> > > setuptools_42.0.2.bb: QA Issue: meta-python2/recipes-
> > > devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is
> > > set as not being package specific, please fix this. [pkgvarcheck]
> > > ERROR: meta-python2/recipes-devtools/python/python-
> > > setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> > > ERROR: Failed to parse recipe: meta-python2/recipes-
> > > devtools/python/python-setuptools_42.0.2.bb
> > 
> > Are you saying that it does that with the RPROVIDES removed? That seems
> > odd :/
> 
> No, this was before removing RPROVIDES in meta-python2, I was just
> surprised that bitbake got stuck after reporting parsing failure, I'm
> seeing bitbake getting stuck in dunfell builds quite often, but don't
> remember seeing it with gatesgarth and newer (and was believing that you
> have already fixed most if not all cases there). But it's also true that
> our jenkins runs 1000x more builds based on dunfell, so it's much more
> likely to happen there.

Its the first time I've heard a report of that and it sounds a little
worrying. What you say stuck, bitbake hangs? Is it using cpu? A process
tree of what it looks like when stuck would be interesting if it is
hanging and maybe the last things in any running or just finished task
logs. It could be some issue with the way a failing task is handled?

We've seen a lot of weird issues on the autobuilder but not that. Could
you have something enabled in your setup for logging/reporting whch
wouldn't be in ours and could be causing it?

Cheers,

Richard

