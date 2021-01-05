Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.364.1609889187457343472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 15:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ijMiQ3gx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id c133so987939wme.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 15:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1WB+6kWb3+2+4vtyWlRfRqokDyWo4eFbQGkpV78UFJA=;
        b=ijMiQ3gxDF4Jkf17SGv0+um6Tj0UArlFf04XiLzON3I3Q2o4RPs4zjertxdQyTWt8T
         8z7dENkuNTaxVjDhTlH9V+ijKaiUOHBhHTMTXD1HyrPBZtBg0LKp1LQmj1bb1YNtfM2+
         uwPKcEttgS+Eu8xIegnJWcnKKaI5GpNKNKLOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1WB+6kWb3+2+4vtyWlRfRqokDyWo4eFbQGkpV78UFJA=;
        b=iOp0BUYgwyUc1qqKt7DaZpxVCxyOiz4EAxnqCy9UALrPj63c9FPRFAHjLlavtUBLzm
         0hADAd5EzltQITgC7Kl1zc8JbBs3aUShv3jeDXtsJkfyytXN4YWM1yfGyjMx2/Gp4cUb
         MtE92huh0KrHEuDmYxukjGlMOpRt2GEE5uD5LsCvCdALaiKYYfaTYF0vUFBM5MhW//zm
         qODypzbeOk959GBxD0If2Si2VvmU2YVKOhsN/MaGPxNXp3jbbkVM3Qk7AK6s7+uFfNpw
         iXF/sfSLQ7i0zjxWAscDhBCuMD30fGvqTbeiJVvcrslxqqHz+sPPAz0z+lu6cVgDlNOG
         aRDA==
X-Gm-Message-State: AOAM533o01G/6kIxkvbNvVbfmGKeoVWFaoXDn/KYApbw5nEcNwGQkNPg
	qQYp4gdRgPxOZqWeuRTxZqCTmg==
X-Google-Smtp-Source: ABdhPJz8tsBHP+FAQaqAS1BmUiuT9M19VeqvqLk9KDhTaPP+LuPf9zVgZmobLcjUQq2GbvgcJJnUZg==
X-Received: by 2002:a1c:1bcc:: with SMTP id b195mr1183737wmb.131.1609889185902;
        Tue, 05 Jan 2021 15:26:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f056:12a7:edca:60f8? ([2001:8b0:aba:5f3c:f056:12a7:edca:60f8])
        by smtp.gmail.com with ESMTPSA id b10sm833757wmj.5.2021.01.05.15.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 15:26:25 -0800 (PST)
Message-ID: <42d65f9e6a9827a514fe15b0507450e90ab8736a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 1/2] oeqa: add OETestPriority decorator
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
Date: Tue, 05 Jan 2021 23:26:24 +0000
In-Reply-To: <16577937CE280D91.26660@lists.openembedded.org>
References: 
	<DBBPR09MB4748488AFABBB0B74D5E3151A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
	 <16577937CE280D91.26660@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-05 at 23:17 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2021-01-05 at 20:16 +0100, Konrad Weihmann wrote:
> > This modifies an implicit default priority.
> > Can be used to move the test case either to the front
> > or to the end of the test suite.
> > Value can be between 0 and 99, implicit default is 50.
> > Lower values move are run at the beginning of the list,
> > higher values at the end.
> > Within a single priority ordering remains unchanged.
> 
> > It enables use cases such as shutdown tests, which
> > should always run at the end of the overall test suite,
> > no matter what test suites/cases are set in the current
> > test suite list.
> 
> > This avoids also using test suite naming hacks, such as
> > usage of zzz_foo_test.FooClass.test_foo to move it to
> > the end of the test suite list.
> 
> I have to admit I'm not 100% convinced we want to do this but I can see
> why you might want it for log tests for example.
> 
> I did throw it into the pile of patches to run regression tests
> against, it didn't get far unfortunately, it breaks check-layer:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/2905

Breaks oe-selftest too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1699

I've stopped that build.

Cheers,

Richard

