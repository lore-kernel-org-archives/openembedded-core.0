Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.37297.1598594718874088747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 23:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vj/4BAI1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id h15so134750wrt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RI7urzgZRmscs2kRuDi7r3/y+HjWjU6pfn7wUQdLPCc=;
        b=Vj/4BAI1tYEL/F2LjAJZK2UzYtT+9v1TrbvJQn5pKdvSLgljSbf0qjSAMVkuT+hpLJ
         egPc5PTAmg9aOejLLzpYwrBBShE/mNm32YwmSS3qiSwLnBUvUio2JPlg0W4a9V4Dtqhc
         neHRwYFwzmQellnpVmwbdjefl8HkY9AJH+/qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RI7urzgZRmscs2kRuDi7r3/y+HjWjU6pfn7wUQdLPCc=;
        b=d8jEx32cj6yqg+MwAjL75xsga7jFp23BCE+vuwwrCUL/ALRNc3NokGRC6EfKpI3GNS
         c6YyZ9MkuqXoFdMbdXiwMcqYc26gd4545bvcy3Gs6sbu8/ViFYg3OHuQiYbD+a+5pPRj
         9CP1Ny4UPRKX6krV5DMJdvzZyB2dw7ge/X0WjFOUnD1bpxt5xjYh9Mj+WA7ecA0zrvJu
         fz+TCUQ0TDF/gtFSUHN9lGhQBsEaxKLvBjkaXdsWhV1qhCa75DiilBgBn7vXBo1ZaZrt
         TSDWXxLyA+7aNylKSr4cIIDQ+R11wgwP271aYIDGNv80jsDpWz17xKpVlmvv+A3JwONb
         0Jrg==
X-Gm-Message-State: AOAM533j/pzGpswHPlEqh8IB1D/fgmLdEjoF3IgjY17P6TAbDli8mwjW
	EcS78+XGeoDqut5s/AngckbWrA==
X-Google-Smtp-Source: ABdhPJzMMVJ+EVuGRQ/OuvfR6W31VLVS4iRCyt9we5ksqFXKsT1tqErGoJL6ebstJeu9CwGux8w/cw==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr24645107wrs.419.1598594717206;
        Thu, 27 Aug 2020 23:05:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.b.f.8.e.0.5.3.2.7.f.3.1.9.d.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.b.f.8.e.0.5.3.2.7.f.3.1.9.d.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:dd91:3f72:350e:8fbe])
        by smtp.gmail.com with ESMTPSA id v9sm94496wru.37.2020.08.27.23.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 23:05:16 -0700 (PDT)
Message-ID: <4c41acd31147f3bce1424199f619692918cf8388.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH v7 3/3] package.bbclass: hash equivalency and pr service
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2020 07:05:13 +0100
In-Reply-To: <20200827221237.143692-4-mark.hatle@kernel.crashing.org>
References: <20200827221237.143692-1-mark.hatle@kernel.crashing.org>
	 <20200827221237.143692-4-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 17:12 -0500, Mark Hatle wrote:
> When the PR service is enabled a number of small changes may happen
> to variables.  In the do_package step a call to package_get_auto_pr
> will end up setting PRAUTO and modifying PKGV (if AUTOINC is there).
> 
> PRAUTO is then used by EXTENDPRAUTO, which is then used to generate
> PKGR.
> 
> Since this behavior typically happens BEFORE the BB_UNIHASH is
> calculated for do_package, we need a way to defer the expansion
> until after we have the unihash value.
> 
> Writing out the pkgdata files w/o AUTOPR and PKGV (AUTOINC) expanded
> to placeholder values is the easiest way to deal with this.  All
> other
> variables are expanded as expected.
> 
> In the next task, typically do_packagedata, we will then use the
> UNIHASH from the do_package to get the PR (AUTOPR) as well as
> generate the AUTOINC replacement value (now PRSERV_PV_AUTOINC).
> 
> The do_packagedata then translates the placeholders to the final
> values
> when copying the data from pkgdata to pkgdata-pdata-input.
> 
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/package.bbclass | 58 +++++++++++++++++++++++++++++++---
> --
>  meta/conf/bitbake.conf       |  1 +
>  2 files changed, 51 insertions(+), 8 deletions(-)

This looked ok in testing apart from:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1289
(and similar)

which should reproduce with:

oe-selftest -r prservice.BitbakePrTests

basically the PRServ tests need updating to match the code changes.

Cheers,

Richard

