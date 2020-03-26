Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.324.1585242505987686773
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gIL77Aot;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id a81so7910842wmf.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5NSzjOvXb2sl3EWoKohjnJwhuYUuArxdesV6zBcmvC8=;
        b=gIL77Aot+9rNNYwdl0oTRJMXyII14Qd+Ua8PANdlQoPIxYdvXY6OGaAvwiBthyDR7E
         ghlXVySIpg54dD0O2i5z12SQ1qzDk1DzRXEzfDgmzkbkQfgEIi+chbHgDH6i57aDxYpC
         zS365nEKuFpaRldByC1vXqmLZ7t9Lo5GyLN4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5NSzjOvXb2sl3EWoKohjnJwhuYUuArxdesV6zBcmvC8=;
        b=AoFOo3IeqEr+oLj0260K26L0JKWOn5gO5iRD/yii8BgxS6rdsVohsO3P5huFNLO80x
         6Wb7rvBuDAI9yCfV2fo267ljPuVs/8orCushNBtZj21wcyjJ8y2u1jw+OGryEpO2CVaP
         7URODF+Kk2zohiEPm/Jk1PzGuavQFLt3AhQrGD5L2b5Wqtm2yetdXaHVFwZUECyuB0Ja
         9+bOO++NPszBku8/+YgntN2ci2emIERv882HeTnLxUBWRsBUb2iQIi/25VVpZdycCr4B
         lhIqkjagLYhHCMIhlsdiBP4nR6CIwX2T7RKADOhGlCjUbqvrld7MLBUiR//e2TMVOTrt
         LaiQ==
X-Gm-Message-State: ANhLgQ0jHb2zQXmt7nvV4ctD8mYoABo3MeZUUu6uzJr12aoyWVlhjydf
	TyUyEfJb+UUtm887HLLYrcy5KA==
X-Google-Smtp-Source: ADFU+vvwr1ydpc1OxfC74umHyLIG4e+CmRZkL/h5X4nJ0WlyJ2vTiuAMXsetdCb71jATEOlOabmj5g==
X-Received: by 2002:a1c:3586:: with SMTP id c128mr916414wma.82.1585242504462;
        Thu, 26 Mar 2020 10:08:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s127sm4310872wmf.28.2020.03.26.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:08:23 -0700 (PDT)
Message-ID: <32f03631742205f4edb194b990e64661b42a1a6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2 PATCH] base.bbclass: Add COMPATIBLE_OS, useful for non-Linux target recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Mar 2020 17:08:22 +0000
In-Reply-To: <27695.149.199.62.130.1585242305.squirrel@gate.crashing.org>
References: <20200326152559.64446-1-mark.hatle@kernel.crashing.org>
	 <0b6612fe59631529b92e231400373b93e3396944.camel@linuxfoundation.org>
	 <27695.149.199.62.130.1585242305.squirrel@gate.crashing.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-26 at 12:05 -0500, Mark Hatle wrote:
> > On Thu, 2020-03-26 at 10:25 -0500, Mark Hatle wrote:
> > > Add the ability to generate non-Linux based components, such as
> > > baremetal, FreeRTOS, Zypher, etc, exist.  There is a need for a
> > > way
> > > to take components as specific to a given OS.
> > > 
> > > This is especially important in a multiconfig build where you may
> > > be
> > > targeting different OSes which different sets of recipes in a
> > > common
> > > set of layers.
> > > 
> > > Setting a default of (matching bitbake.conf's default TARGET_OS):
> > > 
> > >    COMPATIBLE_OS ?= "linux${LIBCEXTENSION}${ABIEXTENSION}"
> > > 
> > > will allow all existing recipes to be tagged as Linux specific,
> > > so
> > > only non-Linux recipes would need to be tagged with specific
> > > compatibility.
> > > 
> > > For a baremetal recipes, the following was used to test this
> > > code:
> > > 
> > >    COMPATIBLE_OS = "elf"
> > >    COMPATIBLE_OS_arm = "eabi"
> > > 
> > > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > > ---
> > > V2:
> > > Only difference to V1 is typograhic fixes to the commit message.
> > > 
> > >  meta/classes/base.bbclass    | 7 +++++++
> > >  meta/conf/documentation.conf | 1 +
> > >  2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/meta/classes/base.bbclass
> > > b/meta/classes/base.bbclass
> > > index 45f9435fd8..c123c5dc50 100644
> > > --- a/meta/classes/base.bbclass
> > > +++ b/meta/classes/base.bbclass
> > > @@ -509,6 +509,13 @@ python () {
> > >          d.setVarFlag('do_devshell', 'fakeroot', '1')
> > >          d.appendVarFlag('do_devshell', 'depends', '
> > > virtual/fakeroot-native:do_populate_sysroot')
> > > 
> > > +    need_os = d.getVar('COMPATIBLE_OS')
> > > +    if need_os and not d.getVar('PARSE_ALL_RECIPES', False):
> > > +        import re
> > > +        this_os = d.getVar('TARGET_OS')
> > > +        if not re.match(need_os, this_os):
> > > +            raise bb.parse.SkipRecipe("incompatible with os %s
> > > (not
> > > in COMPATIBLE_OS)" % this_os)
> > > +
> > >      need_machine = d.getVar('COMPATIBLE_MACHINE')
> > >      if need_machine and not d.getVar('PARSE_ALL_RECIPES',
> > > False):
> > >          import re
> > > diff --git a/meta/conf/documentation.conf
> > > b/meta/conf/documentation.conf
> > > index 0b21d1f63e..7a87540f43 100644
> > > --- a/meta/conf/documentation.conf
> > > +++ b/meta/conf/documentation.conf
> > > @@ -111,6 +111,7 @@ COMBINED_FEATURES[doc] = "A set of features
> > > common between MACHINE_FEATURES and
> > >  COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses
> > > in
> > > the Source Directory, which is where generic license files
> > > reside."
> > >  COMPATIBLE_HOST[doc] = "A regular expression that resolves to
> > > one or
> > > more hosts (when the recipe is native) or one or more targets
> > > (when
> > > the recipe is non-native) with which a recipe is compatible."
> > 
> > How does COMPATIBLE_OS compare to COMPATIBLE_HOST (documented
> > above)?
> 
> HOST_SYS="aarch64-oe-linux"
> 
> So the equivalent to the COMPATIBLE_OS would be:
> 
> COMPATIBLE_HOST ?= ".*-linux.*"
> 
> So it COULD be used in most cases.
> 
> When I tried this before though, I could get it to work in a
> multiconfig
> setting.
> 
> Specifically what I tried was setting, in my local.conf:
> 
> COMPATIBLE_HOST ?= ".*-linux${LIBCEXTENSION}${ABIEXTENSION}"
> 
> And then in the recipes:
> 
> COMPATIBLE_HOST = ".*-elf"
> COMPATIBLE_HOST_arm = ".*-eabi"
> 
> But then the second one matches the linux ABIEXTENSION and broke..
> 
> So really the issue is that I -only- ever want to match on the OS
> part of
> the "SYS" string.  And done to the multiple natures of the '-', it's
> difficult to get right.
> 
> I didn't try something complex like: [^-]-[^-]-eabi

From what I remember, COMPATIBLE_HOST has full re support so something
should be possible...

Cheers,

Richard

