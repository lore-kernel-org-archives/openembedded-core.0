Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.2746.1595535852143671766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 13:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HpH9r7XS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id o8so6083764wmh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0md8+0FgCYM/gEI9BrwspHI85i+2WmiiY5alve4aKzc=;
        b=HpH9r7XSD96OlF/GGsOWyTvzH2xFtBVg0NQA6n9iDhWepazyZ/7E0/FxbTlL1ttLo5
         yH8OxOV7lDut0IAQRW40VlMcQ105AG/zB+6FclaE9gyazBVNipT6ZwvXlCthF2b+jdB6
         N9mxaYKQ8RKn+Abov9KsqMzX1WHXrZ0rOoLYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0md8+0FgCYM/gEI9BrwspHI85i+2WmiiY5alve4aKzc=;
        b=iq7rzJiFBIXZ6Lo6MfJbMRwnARMcMm5YMXFWCIyfFDjLd3UeEL/78WhSx6AgKEuIqA
         XHsHqqUVfyTiDFUIdaqQvDkHdw2q6ogU9X4slwRA0Dg1SzT49W5L+Uczz15lme1DMgum
         KWgE+O/QSLiVhA+C/OAKZyA5nUtucrS067hq3+MXvdn7vVvlcL1PAQ916+X+YxoXBsh0
         MIjLi1jKmamEr5hcUDkXikM9qnm0kfKWDzHnI8dSqWl+tH3/jc1oLMDUSIYhPZGtKXBw
         j2j8Y0fkCB15W3alAAXwpFTFpDVoQjWQvLE5o7fsSg23VBtbdOxSaXzv45U8JM9hpICa
         G0vQ==
X-Gm-Message-State: AOAM531BUZhPFzXA9owSkIEWaMCzzl8dqvgAI7mz1jwS0U0zkRa1w8F1
	jjiLtx1FiWaNo7JPXabxJC0b1A==
X-Google-Smtp-Source: ABdhPJxKy82orADmSDoBbAAjarCzHhHVDStftobJypW729CoIix0hcJtWV1deaTw5gjLjzggQsl6jg==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr5446659wmf.103.1595535850695;
        Thu, 23 Jul 2020 13:24:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.a.5.c.a.d.d.d.3.0.d.d.c.1.8.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.a.5.c.a.d.d.d.3.0.d.d.c.1.8.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:981c:dd03:ddda:c5af])
        by smtp.gmail.com with ESMTPSA id u16sm4672984wmn.11.2020.07.23.13.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 13:24:09 -0700 (PDT)
Message-ID: <6e45c583bf1b87091a25ff67b9f0ce0ae2a195a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5] Add package managers as a plugin
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	openembedded-core@lists.openembedded.org
Cc: tools-cfpbuild-internal@axis.com, Paul Barker <pbarker@konsulko.com>
Date: Thu, 23 Jul 2020 21:24:09 +0100
In-Reply-To: <16245936DC93093A.3889@lists.openembedded.org>
References: <20200722133120.11484-1-fredrigu@axis.com>
	 <16245936DC93093A.3889@lists.openembedded.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-23 at 10:57 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2020-07-22 at 15:31 +0200, Fredrik Gustafsson wrote:
> > OE-core today has three different package managers, the well-known
> > formats deb
> > and rpm is supported as well as ipkg that is good for embedded
> > devices.
> > 
> > When building and having a good cache hit, a significant amount of
> > time is
> > spent in the phase of generating a rootfs, which is really about
> > the
> > performance of the package manager. To save build time and also get
> > a
> > package manager that is suitanle for use on targets where flash
> > memory is a
> > concern, support for apk is suggested.
> > 
> > However, it might or might not be what's wanted for OE-core since
> > it
> > increases
> > the test matrix. Therefore I will refactor the package management
> > code to
> > allow a layer to add a new package manager without editing the meta
> > layer.
> > 
> > This refactor will be divided into multiple patch series to be
> > easier
> > to review,
> > this series will only move code but keep existing functionality.
> > 
> > Changes since v4:
> > * Removed blank lines in end of new files
> > * Rename package_managers to package_manager
> > * Move import statements out from function when it's possible.
> > * Edit commit message to prepend subject with rpm:, ipk:, deb:,
> > etc.
> 
> I did try this on the autobuilder to see where things stood. I showed
> at least one problem with quite widespread effects:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1197

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=810656611871cf5b26a82c85228fda8fe0ceb834

shows the fixes needed to get this to build. I'm not 100% convinced
about some of the naming, mainly that:

oe.package_manager.XXX.package_manager

feels awkward and duplication. Maybe the main PM pieces are better in
the rpm level?

Cheers,

Richard



