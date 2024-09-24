Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388B6CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:34:42 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.9017.1727166875601836888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 01:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RoJMkZkP;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365c512b00so6255594e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727166874; x=1727771674; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4WREhmuo8D7CzhWes9xxzZuuQfHTGkcwfx6BtAxeJkw=;
        b=RoJMkZkP+Bv473m9SULypHB9sRwJLaZ7pIvPHDHv7DFNvAZsdjupiT5Qn7lWyNzTDd
         iPVmzpjs0rj2TVsdwNRktu+Cx8mt9S07hMuZL4NT5Z14xngwODXZVLXZIjWe4/GRQSyM
         lXbmOg/VfoP7URbslldSYFNtyJNzfAnYBFqJjGqLZr+4mJw3JlaLUmjXfekTIuW+ra/g
         TT2wsmFB2CHFKvpCqDU1qrzxV9XCCXJUTmH/9HRuFbd5KFdBWuyBSF1fccddfYZoXL3s
         CMJrU6TlidgYdG6O2YqyfaXBLIxb7HB6fPIWSyfeZhSy6ZX1wPqIlsS0vGKiJprZCyPt
         zpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166874; x=1727771674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WREhmuo8D7CzhWes9xxzZuuQfHTGkcwfx6BtAxeJkw=;
        b=IUBwnmAXffru6aA40N4UBngRlm7pOM0d6fTparbF2zkrsVMBMgFUp05ICKlRAnTIBH
         vPI2xEQ+ldL18YgA9HaO3U9HYhs2e7DVcPst4sbY83rCW5TwQviaNaR9o/nyM4++Z+PE
         GFe6zme5z1GCDfYyGcNYmE3czd9lpJokTh+Pp4UtuY1C5sq+ecDcIP+53xHc1Q2J/VNm
         y8hB7QKk0leVQ/V5tjotT2Inz+rUAlqAbgYj2L2q3KWFVw2xI1N1/CIDHaJAKSWoELJk
         mM9quvDCjdaSA5W+p18H4zBOtxbCU95tpj6dgAhtqKR0DtuA5tci2W7QWWWy2caC9hj9
         kDkQ==
X-Gm-Message-State: AOJu0YwLSQWAFaE/+HII/H5+PPBXE8OT1vbqpm7h6SgkmCSFSLemPJwd
	4zFPv4xv6syUYydnTtwi0wGvi3AwUCxRbgacEeM5wbl4DD9AirD9pH4hcKdhyA8=
X-Google-Smtp-Source: AGHT+IFWhDqT0IlPnZbqFwy28gOz8n9U46x7RQz7vtAA0xL/9tUH7+CQ8zDoAnSEYfjsNs8KONqQpw==
X-Received: by 2002:a05:6512:3a8d:b0:530:ae22:a6f0 with SMTP id 2adb3069b0e04-536ac2d6358mr7807882e87.5.1727166873105;
        Tue, 24 Sep 2024 01:34:33 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864e32csm128314e87.300.2024.09.24.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:34:32 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:34:29 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, david.reyna@windriver.com
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
Message-ID: <ZvJ5lTXZmSWClgdf@nuoska>
References: <cover.1726821150.git.liezhi.yang@windriver.com>
 <ZvJvq2MtzI_0BPMd@nuoska>
 <b823dea1-a904-4ee3-884a-0ffd4131bf6a@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b823dea1-a904-4ee3-884a-0ffd4131bf6a@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204842

Hi,

On Tue, Sep 24, 2024 at 04:21:49PM +0800, Robert Yang wrote:
> On 9/24/24 15:52, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Fri, Sep 20, 2024 at 01:53:13AM -0700, Robert Yang via lists.openembedded.org wrote:
> > > From: Robert Yang <liezhi.yang@windriver.com>
> > > 
> > > The VENDOR_REVISION is for cve scanners to know the CVEs have been fixed in a
> > > lower version, CVE scanners such as Trivy can know the CVEs have been fixed in
> > > a higher version, but it can't know the CVE is fixed in a lower version without
> > > a helper, we have the following ways to set the helper:
> > > 1) Use PR server
> > >     This doesn't work since the server updates PR for any changes.
> > > 
> > > 2) Update PR manually when add a CVE patch
> > >     This is doesn't work either since:
> > >     - This is very trivial and people may forget to update the PR
> > >     - The PR may be updated for other reasons except CVE patches
> > > 
> > > So we need a specific part such as VENDOR_REVISION for cve scanners.
> > > The VENDOR_REVISION is designed as part of PR:
> > >    PR:append = ".vr51"
> > > - ".vr51": The VENDOR_REVISION
> > > - "vr": Vendor Revision, can be set to other values such as oe or poky
> > > - "51": Convert from DISTRO_VERSION (Yocto 5.1), it can be customized with
> > >          a function defined in GET_CURRENT_VENDOR_REVISION.
> > > - The VENDOR_REVISION will only append to the recipes which have patches
> > > 
> > > There are two bbclasses to manage the VENDOR_REVISION automatically:
> > > - gen-vendor-revision.bbclass: This is used for generating VENDOR_REVISION
> > >    automatically, and save all the recipes' VENDOR_REVISION in
> > >    vendor-revision.conf, it is like:
> > >    VENDOR_REVISION[meta_recipes-support_libssh2_libssh2_1.11.0.bb] ??= '${VENDOR_REVISION_PREFIX}51 \
> > >     CVE-2023-48795:CVE-2023-48795.patch:b6c68cd1f0631180914ff112ac0c29c4 \
> > >     notcve:0001-disable-DSA-by-default.patch:61b6368d4a969d187805393d8b8fee85'
> > > 
> > >    And in the second release such as Yocto 5.1.1, the bbclass will update the
> > >    vr51 to vr511 when both of the following 2 conditions are met:
> > >    - The DISTRO VERSION is updated, for example, from 5.1 to 5.1.1
> > >    - The recipe's patches are changed (Patches added, removed or updated),
> > >      otherwise, it will still be "51" when Yocto updated to 5.1.1, this can avoid
> > >      unnecessary PR bump.
> > > 
> > > - enable-vendor-revision.bbclass: Append VENDOR_REVISION to PR
> > >    After the VR is appended, the rpm package is like:
> > >    openssl-3.3.1-r0.vr51.core2_64.rpm
> > > 
> > >    There is no change if the recipe doesn't have patches, for example:
> > >    base-files-3.0.14-r0.qemux86_64.rpm
> > > 
> > > Check the comments in the header of gen-vendor-revision.bbclass for more details.
> > 
> > This is very much backwards, like Alex mentioned as well.
> > 
> > There is no need for this. If CVEs are fixed with patches, then those patches will
> > mark the specific version and patch applied as not affected by the CVE.
> > The classes export this data. If anyone feeds this data to external tooling, then
> > the CVE patch status is a critical detail which must be exported and imported into
> > the tools as well. Otherwiser the external tooling is not really up for the job.
> > 
> > I've seen several commercial tools not managing the patch status at all. IMO these
> > tools are broken and can't be used to manage secure patches of real products
> > which have to apply CVE patches and can't always update SW versions.
> 
> Maybe you're right, but the mainstream distributions work with those tools
> such as Trivy:
> 
> https://aquasecurity.github.io/trivy/v0.17.2/vuln-detection/os/

I think maintaining CVE and security patches of a distro using
tools which are not used by the uptream maintainers of the distro is not a
good idea.

I understand that organizations and managers may want to use specific,
sometimes commercial tools.

But these may not help. If you only look at the RPM package data exported
by yocto, then CVE patch status is lost. Same is true for other package
output from yocto builds.

In the past I was asked to provide and use Black Duck tooling and have
explained these problems multiple times, and eventually the requests
went away. Time was better spent fixing actual issues found by upstream
compatible tooling, e.g. cve-check.bbclass.

If there is a standard for RPM package metadata to include CVE patch
status, then that could of course be added to the package built by
yocto.

In similar way, if I were asked to maintain a Debian/Ubuntu variant for
CVE security patches, then I'd start with
https://security-tracker.debian.org/tracker/ and the data embedded there.

Cheers,

-Mikko

