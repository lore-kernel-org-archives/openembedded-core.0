Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58CFC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 11:33:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.7977.1643888036588240767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=evNyi7EX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id l25so4373644wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jSUusjgPNdyv3vydFH4TWuXQ48ft8Q8iQEB8SmadIoc=;
        b=evNyi7EXBE0l9L3lwDgK2sNNQIe0rM54Nry+iwg91HmR9+zSweignW5CT+cfyzJn5o
         P1lAANpKFd/N+vRm5aeSrdwSSHCdibffNTpKPdBPdWty67H6hQCOiDhe9ZTsUqUBY6vV
         B3/uWOvWGgdRfNb6e7R3w/rQRp5eizkhivtPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jSUusjgPNdyv3vydFH4TWuXQ48ft8Q8iQEB8SmadIoc=;
        b=ySS1bOrqHGBjrQ5UR+NvJk8+fpO3smaZpfs0t3wqk+jGvTs/Hj1j2K4MORNBMG9bpY
         qdVHxdfhUXuauqkZ9L2B5Pldi8k0s++3qOfsg9kN9cF3Z74vDhvWdTfjmuEU/GEA51eI
         b8edJSim3r6AFdEEaf/KzNLtYT61Eh9LEHUAX0YOxwId3p/v1V6a4IvMgAzPSkmf69o9
         gqBEnxtGAd9UMZ2iPu8tKQwd+dlVHwGjpmB1dMCZxYtGdgO4YxJkdd4CLanY57/kENI0
         vfYLqf9c4eV3PpZAMTVeGbLcT5rkbT3r1VVdnmxcN8OIM2Ua+W5cA+7uIOucUR8wYdWW
         1s+Q==
X-Gm-Message-State: AOAM532A60fO3g64u+cy1IACEgMQib/T6U4Fmk0w3h7Bq8BONfiUJpJq
	lquHITBwX2SdjAjS+OUUKzzulg==
X-Google-Smtp-Source: 
 ABdhPJzPVEdS0KGG+oA0eLAS2RhS3wEOi4f4wQlWtFfJSDwV5TMaO6CGGaVX5haEQa+Y+uhfr67mYg==
X-Received: by 2002:a5d:494b:: with SMTP id
 r11mr29362151wrs.626.1643888035089;
        Thu, 03 Feb 2022 03:33:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e772:7635:2207:1103?
 ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 i3sm6954718wmd.30.2022.02.03.03.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 03:33:54 -0800 (PST)
Message-ID: 
 <d38be235460dd3db95943effdae4741fce3cca0b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] staging: Add extra hash handling code
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Feb 2022 11:33:52 +0000
In-Reply-To: 
 <CAGgRHJrs4moW+hhunwgmvRu2z6fDFjGxHjKXPMfsqkgXRjBv6Q@mail.gmail.com>
References: <20220203112534.2389621-1-richard.purdie@linuxfoundation.org>
	 <CAGgRHJrs4moW+hhunwgmvRu2z6fDFjGxHjKXPMfsqkgXRjBv6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 11:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161275

On Thu, 2022-02-03 at 03:31 -0800, Matt Madison wrote:
> On Thu, Feb 3, 2022 at 3:25 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Target build output, stored in do_populate_sysroot or do_package can depend
> > not only upon direct dependencies but also indirect ones. A good example is
> > linux-libc-headers. The toolchain depends on this but most target recipes do
> > not. There are some headers which are not used by the toolchain build and do
> > not change the toolchain task output, hence the task hashes can change without
> > changing the sysroot output of that recipe yet they can influence others.
> > 
> > A specific example is rtc.h which can change rtcwake.c in util-linux but is not
> > used in the glibc or gcc build. To account for this, we need to account for the
> > populate_sysroot hashes in the task output hashes.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/sstate.bbclass  |  2 +-
> >  meta/classes/staging.bbclass | 35 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 35 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 17dcf4cc175..fd9acbab9b4 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -94,7 +94,7 @@ SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
> > 
> >  SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
> > 
> > -SSTATECREATEFUNCS = "sstate_hardcode_path"
> > +SSTATECREATEFUNCS += "sstate_hardcode_path"
> >  SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
> >  SSTATEPOSTCREATEFUNCS = ""
> >  SSTATEPREINSTFUNCS = ""
> > diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> > index 25f77c77350..3ea9c974eb5 100644
> > --- a/meta/classes/staging.bbclass
> > +++ b/meta/classes/staging.bbclass
> > @@ -21,7 +21,7 @@ SYSROOT_DIRS_NATIVE = " \
> >  "
> >  SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
> >  SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
> > -SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
> > +SYSROOT_DIRS:app:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
> 
> Did you intend to drop the "end" from "append" here?

Definitely not, well spotted. I think that happened as I was improving comments
before sending to the list and this is why we have review. I've fixed in master-
next, thanks!

Cheers,

Richard


