Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80152CFC27B
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:30:56 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11413.1763731845966896189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QILd83hK;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5945510fd7aso1695277e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763731844; x=1764336644; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faHfnEiAK3DsN08F5uFNGK91VCXxftWJNkLzmzSLsM4=;
        b=QILd83hKuGVA+gxkxca8dnWiyw3zKcxaLpXV37vXh1PbkJpaNV5HkTi/FfP2RLQE+N
         k21UUKMZZ8WbHBNm8RzSjCDqy5oVx+se3i200fYYJ+4GZOnsMIIy0IV9mIoKD8PkpjJt
         9qrg7jt2AEXkb3P0choZ09vYlsaUog4h0cDNLQNKjv8x/Xu4Usqk3uO5lqnsEJ6F75jk
         +v6f/qronp4ukZjKovzEP/zX3PAmil5Dd5SyNP/qL8XR/PUHYzSHGBMVoTveegbyCvsR
         U0mpOQ0zgSHVy3XRZy+HAzjUTaHHUmdYx8U9ERfMqldXFwsSQqMdpZ6NuYMRMHuP3fEe
         MzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731844; x=1764336644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faHfnEiAK3DsN08F5uFNGK91VCXxftWJNkLzmzSLsM4=;
        b=SHyma3cP6V1jGKUORnATuzly2+R3bEzl5quc+cc7OT4anp0qJuLQhmVaKwXACpkf4a
         NuC6aLsu1v1r2cKjwu4qV2eQM8FH5GlZdjMJwXo+/aoYLny7eUdCnEvLzBLy5WJXJ3po
         ZNOpGluzl+5wAjWgFx8acIMDmkKcLaAWZ6QD/wP4eayS17L14Eqww4T+o4/Keqwu0HkV
         w65BfIPkMZTgJjgQjsX0HuyDQZ7GK8XyVdssnNqU5pYDZhy8oo7t9lmnE4GT9pGVNRg9
         EWjIVCY1f7MIcyKI2pKwGiW2hI6P6fYnaJltapVVL0oAn8PSygj05rVrrf2H0Bp/jTIN
         Tc8Q==
X-Gm-Message-State: AOJu0Yy8OP5kjCxeS0k4mLU5tPN3+zHkcmaSRqGQ5RDU2xeGSKn3x94/
	i0FKBbKo8mFb4fKTnPQIt61CbUvXWg3ZaD8Gmy1qrjquKRmNZInaiCs+TMdMOIt1sAg=
X-Gm-Gg: ASbGnct+ByWUr/5aVfIKRbUR7DiAt4EaHrXqXvtvDr2GMruq1/q1zxwDeKl7d4cdNW7
	Xq3bJtJj2Ge+F3yvChuo1wgut9zBaSiRDFQK1RaGFOPFrF4/tOQDSnOq3Dnelifoio8vl/BqsM4
	mxPD186BWLiu88fK+BnTV9+KA97nj6qBg0Ioxsol/sW57vFC9tqrb0L70NBX3qow34P20jb9sVf
	FzaT+7Sv0wj9DHYogTo1pl6HN/pKg/lddsc49+Ox5r/PO8BR7ETWjshWvwJpEsByQ1hSO4dcm44
	RnjMoRw5TLxv1djrBp0HaI6RcOHJIjJwrP08hYLmeLNdIsaqi4lZAi1XTdiVZx+DbQE9fQ9mfa6
	OukDQUwk48APnZ6QBS2oOklZIz2F+T4DR0RIp3iazAWNooRsxIEZQ35SNZfzXq/0IA2PmpwJS8l
	htvswSg59qn09k0mMlIpG4f9c8B5L5HQPVaHfZ0h8ZvSxU
X-Google-Smtp-Source: AGHT+IGxw3IBq5cvXf5S9DMEoMBfV7Yx7A11VY7pY79GHX6Qe6iUkghd4HLy8IwY8MSRB/UBtd/Z8w==
X-Received: by 2002:a05:6512:3e0d:b0:591:c8de:467b with SMTP id 2adb3069b0e04-596a3eefdf4mr792748e87.40.1763731843772;
        Fri, 21 Nov 2025 05:30:43 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db894e0sm1641238e87.37.2025.11.21.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:30:43 -0800 (PST)
Date: Fri, 21 Nov 2025 15:30:42 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa httpserver.py: fallback for
 multiprocessing import without bitbake
Message-ID: <aSBpgnKI2iXwD78B@nuoska>
References: <20251121105951.1158626-1-mikko.rapeli@linaro.org>
 <c3d49e5931af8e746ed25587fdd9b180497dc343.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3d49e5931af8e746ed25587fdd9b180497dc343.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226684

Hi,

On Fri, Nov 21, 2025 at 01:27:56PM +0000, Richard Purdie wrote:
> On Fri, 2025-11-21 at 12:59 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > When testexport.bbclass is used, then build environment and bitbake
> > may not be available when oeqa tests run.
> > 
> > Fixes oeqa test execution:
> > 
> > https://ledge.validation.linaro.org/scheduler/job/123974
> > 
> > ImportError: Failed to import test module: apt
> > Traceback (most recent call last):
> > � File "/usr/lib/python3.13/unittest/loader.py", line 396, in _find_test_path
> > ��� module = self._get_module_from_name(name)
> > � File "/usr/lib/python3.13/unittest/loader.py", line 339, in _get_module_from_name
> > ��� __import__(name)
> > ��� ~~~~~~~~~~^^^^^^
> > � File "/lava-downloads/core-image-sato/meta/lib/oeqa/runtime/cases/apt.py", line 8, in <module>
> > ��� from oeqa.utils.httpserver import HTTPService
> > � File "/lava-downloads/core-image-sato/meta/lib/oeqa/utils/httpserver.py", line 9, in <module>
> > ��� from bb import multiprocessing
> > ModuleNotFoundError: No module named 'bb'
> 
> Breaks with python 3.14.

Understood but this would fix current test setups which still have python 3.13.

Cheers,

-Mikko

