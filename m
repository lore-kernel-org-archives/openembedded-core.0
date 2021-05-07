Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.6771.1620369620682549211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 23:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VBJ2kHoO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l2so7945224wrm.9
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Z/zPNG612gaMkP+gwgu3JwO7XmVusurBt500iyU99gU=;
        b=VBJ2kHoOaegol+21oxrsIEZWGJWTa28/XDgschbkvxwNe5fAjSnFYr0c/gU5PecOBA
         FgsQLwWWWjlmwROoYbHmBtkJGvhWmBMVUlcwcYcV9tkxeDzn4ruvoHNPMZ31Blzd8qP5
         AZW8CWz1OZLT6BBkRW/veNHgHVLsBcL1fJG+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Z/zPNG612gaMkP+gwgu3JwO7XmVusurBt500iyU99gU=;
        b=KiQs9UXV7KxGdfz7VQyt4ZfF87HSpXqeC0eo9C7fA4rDWqdjdcAjBJK4xuzov2YU3B
         5EmI9yUD2fP2Usiey9C5UsBFyfO95/HPIzJJ7dUQLFT84HC0zXbxqwZ5RrwlLybhYr1g
         Jd5Hn+amBZrfBkH2zDKFG1SUcaHEETimUU/UaTWfl1H8vZvSPVhrQaFS97nSdc337J5D
         nDInfyG21TGyaJnWWFS378MAiL/2nbakA32W0TsWCVmNZm6y3xtytQY5t1iG0aT93n8z
         a3jWRbVfn8CPjbAdL+WG7Rkf1e1pfC4R7Flh7jiIFGwl+cjb3PNUIaMWEqnmw5l9zakg
         qzsQ==
X-Gm-Message-State: AOAM533ovqhOBXe9iOAEh8Cl50MQ+vi5eUhwfcT4TLYXihgHCeZCOrE6
	FBmD+gIVz6Q2uCNKHX2vaoi4tA==
X-Google-Smtp-Source: ABdhPJzeVxFGsXUcCnqZOxti51hamOiCaLeAfE+tQ1bg0SNhPm/Y0rRkP4O+Rm8GlTBkgXenlGDlOQ==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr10321415wrs.9.1620369618887;
        Thu, 06 May 2021 23:40:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b293:70f:415f:a3e? ([2001:8b0:aba:5f3c:b293:70f:415f:a3e])
        by smtp.gmail.com with ESMTPSA id o1sm7897944wrm.66.2021.05.06.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 23:40:18 -0700 (PDT)
Message-ID: <f7ff29b8856ef96d7316948cc5b18ab7b0479882.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 07 May 2021 07:40:16 +0100
In-Reply-To: <YJTYCgxanqxIZvIw@korppu>
References: <20210506171232.2832063-1-steve@sakoman.com>
	 <YJTYCgxanqxIZvIw@korppu>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-05-07 at 06:02 +0000, Mikko Rapeli wrote:
> Hi,
> 
> On Thu, May 06, 2021 at 07:12:32AM -1000, Steve Sakoman wrote:
> > The preferred methods for CVE resolution are:
> > 
> > 1. Version upgrades where possible
> > 2. Patches where not possible
> > 3. Database updates where version info is incorrect
> > 4. Exclusion from checking where it is determined that the CVE
> >    does not apply to our environment
> > 
> > In some cases none of these methods are possible. For example the
> > CVE may be decades old with no apparent resolution, and with broken
> > links that make further research impractical.
> > 
> > This patch creates a mechanism for users to remove this type of
> > CVE from the cve-check results via an optional include file.
> > 
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
> > 
> > diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> > new file mode 100644
> > index 0000000000..956b3a9a3c
> > --- /dev/null
> > +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> > @@ -0,0 +1,18 @@
> > +# This file contains a list of CVE's where resolution has proven to be impractical.
> > +# It contains all the information we are aware of about an issue and analysis about
> > +# why we believe it can't be fixed/handled. Additional information is welcome through
> > +# patches to the file.
> > +#
> > +# Include this file in your local.conf or distro.conf to exclude these CVE's
> > +# from the cve-check results
> > +
> > +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
> > +# CVE is more than 20 years old with no resolution evident
> > +# broken links in CVE database references make resolution impractical
> > +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> 
> Could this be specific to a recipe?
> 
> It may be that CVE data changes and adds new CPEs and the same CVE could still
> be valid for another recipe. I think the analysis also applies to a single
> recipe.

I've been discussing this with Steve a bit. My concern and motivation for this is
that we have a set of CVEs which are proving hard to find any useful data about
and that we can do little to address, particularly the ones 10-20 years old. Having
those showing up on weekly reports when we can do little about them is painting the 
situation a little unfairly. Whitelisting them in the recipes is also not entirely
appropriate though. This file is primarily intended to collect up a list of those 
along with what information we do know.

For more recent entries with better data, I'd expect we either fix them or we can
handle on a per recipe basis. The entries in this file are likely to be the really
old ones which are very unlikely to change.

We've left the file as opt-in so users have to choose whether they want this data
but it gives us a way to document any investigation done and what the status is.

In answer to the specific question, we could likely use pn- overrides here I 
guess but for the kinds of CVEs likely to be listed, I'm not sure it gains us much?

Cheers,

Richard







