Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.10903.1623151000177773640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 04:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RnHy/k4D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id f17so1592578wmf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3WRjxLAB7mfzXwiOeIPfa0OaKRD1p+nq3bF+jBWKh7M=;
        b=RnHy/k4DsF3Q3EBTo6LTqjiZnO54D5jbqpgt54qgPFp8NAhYsJpBmXkMxHqwK66dGn
         RTg8HMGeXUKf0u6HCMPm2Q05EiJh/Yj0nkwoKGLzafIs8jMUl8CjSy7IY6kjsq6qkTun
         MA2ZNWe/yhhcjFUEjUUU+HZPtjx0Uwl/bngGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3WRjxLAB7mfzXwiOeIPfa0OaKRD1p+nq3bF+jBWKh7M=;
        b=pta5gLv43/BM104Mzu8YQ1TPbYLooPmjHRcPbLvH1y1ElKrAjlXR6Z19yZTazLhufO
         A3V+f1PHuh3AxyKP9ttZ3fsUDbYZCcniGaLgCV5qzH01+Pcm7saUebwIq9X1WLVcP+jd
         ObBMyj5HT7d79O+tJ7fIztHlq6voxUxRpmr/N4OA3dTKrmainGCQODKsAfqgvvdKKfvE
         jTvuHewSrztdwvZLkVYbGPH3BA5cmjHcJ7anuxbCx51KOTOAaIABTBFPQoe93I9q6HEY
         SuNvakDIuECLtClFbGryMmckrkvDYBsnGep9n9cYs+jqVtGhFBDHVw9I1COEuPtV7tIf
         sh0Q==
X-Gm-Message-State: AOAM531vF280k+WiA5az/TTMxyF3Q3Br1koTnQjaEbeDLhsD4aA9LfR/
	MD7xx8/pin6gumv3r+fLKu6VWA==
X-Google-Smtp-Source: ABdhPJyAO0xiQA2SP5sy+RFwDMHAJ/ATEEpnDhovakPtZfEpc0In0p2PB47uwukgm/2aCFAD2jcR+w==
X-Received: by 2002:a1c:3dc2:: with SMTP id k185mr3651233wma.15.1623150998561;
        Tue, 08 Jun 2021 04:16:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:119e:2d1:fea4:6669? ([2001:8b0:aba:5f3c:119e:2d1:fea4:6669])
        by smtp.gmail.com with ESMTPSA id x3sm2457165wmj.30.2021.06.08.04.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:16:38 -0700 (PDT)
Message-ID: <038c3cc612569f32f6b837ca389abad930fd76e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Wes Lindauer
	 <wesley.lindauer@gmail.com>
Date: Tue, 08 Jun 2021 12:16:35 +0100
In-Reply-To: <CAFrQVPPHw0BpXUOXrhnYOeZHRBd=w=kEthVqbAVucRTyeiz7Fg@mail.gmail.com>
References: <20210607212558.86624-1-bkylerussell@gmail.com>
	 <dccbc4111daf453cec3f7fe60e4da15d1c3e5306.camel@linuxfoundation.org>
	 <CAFrQVPPHw0BpXUOXrhnYOeZHRBd=w=kEthVqbAVucRTyeiz7Fg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-07 at 18:49 -0400, Kyle Russell wrote:
> On Mon, Jun 7, 2021 at 5:43 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441
> > 
> > This doesn't look quite right?
> > 
> 
> 
> Yes, that's the one.  I assumed this was what you meant by, "Another option would 
> be to have multiple uninative feeds based on gcc version rather than a single uninative one."

That is effectively what the code ended up doing and why 4.8 and 4.9
are split out. We only wanted to separate out the specific versions 
with issues as we wanted to allow reuse where we could.

> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441#c1
> 
> > This is a huge performance penalty to put onto the build unfortunately and I really
> > don't want to do that by default on the autobuilder. We haven't seen many of these
> > errors on the autobuilder and I'm reluctant to take the performance hit on our testing.
> > 
> 
> I realize this is not ideal, but I guess the trade-off is dealing with these issues 
> as they arise on a case-by-case basis.

If they were many issues arriving that might be what we'd have to do but so
far I've not seen reports of that many...

> 
> > There were specific issues with gcc 4.8 and 4.9 which required separate sstate. Do we
> > know which gcc version switched the default and can we force older gcc's to use the 
> > same default or does it not work? I'm wondering if we could split off a "nopic" verison
> > of sstate for example for the older gccs?
> > 
> 
> 
> gcc 6 introduced an --enable-default-pie configure option, but I'm not exactly sure where
> between Ubuntu 16.04 and Ubuntu 18.04 they picked that configure option up.  Since packages
> based on the older gcc already exist in sstate, I think we would have to force the newer
> behavior on each affected package.
> 
> I realize we can just swizzle the compiler flags on the affected packages to make things happy,
> but it seemed like this approach had at least been considered before, so I thought I would at least
> get some feedback.

As Andrea points out, we did fix this with a global include file which should have
handled the issue. Are you using a release which doesn't have that or not using
the include through your own custom distro?

Cheers,

Richard




