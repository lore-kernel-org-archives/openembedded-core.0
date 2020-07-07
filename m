Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.23757.1594149927155027973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 12:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MudKfWD+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id f18so38386434wrs.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cfxYsU774YtHWm/ZhvDr41wba2df+KnMHhVYrkXIHIs=;
        b=MudKfWD+7eDOkfLtwUB+SAR9GTySRcV7R1Ig5WOuNkVE/PSvML/VESeiZNhTeVXmg5
         /Xo5/5VW/ghZF6uNUvVdPXa/OJb2yQ1I/3doIAMOLt5n+uBGdSEVT03JVyox45plZWBh
         XbeTNv6mzice3muHxYO+/+lP7wqbkzGx4dR1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cfxYsU774YtHWm/ZhvDr41wba2df+KnMHhVYrkXIHIs=;
        b=Gw/E+UWxfWoP952rMMxDxnXwWJpn27E5wFN3u8dVPTsYtofPDtFq1Qx38YRCu7u5kw
         Xdw4Tjrx11M/UhBMUCXhn2rs77q/kEPp1X2Fo4u+Ev06ibFrn6Wfaaz9JnuXEw2zX7CI
         oVVFR1HC0xxPI9WEdGCKKtUNJE310vH1WErBzeSl1IVQ14seHddb+JOE9tZQy0oXWoNJ
         IDEvQ0tGjE/+bPZM9hSISbuwOrXVmrsSCpyb8UijUNJRFaW9YtRoWURSpDryBKBp8Q5Y
         zaMbww/L9CzUzrXUadcUaMQIK65rGNayvW7Rut7zPCxSR7+7KDlr05qmGWHTHgGVfnln
         HyJQ==
X-Gm-Message-State: AOAM530w82XC0hmijrDqCb5RtG5c3YLuUJEDrt7Q2CAyZ+kAyyQMGVU7
	qyEQtzqdgfgmxtW/ZEyi1zDkjw==
X-Google-Smtp-Source: ABdhPJyMl7J++BhxjA3wsG3A2gqmNgDoCRc7/D9ool3P5ZKlSmO7yojUSh7upaeNN2y/f54AKWhY+Q==
X-Received: by 2002:adf:e908:: with SMTP id f8mr54144408wrm.3.1594149925468;
        Tue, 07 Jul 2020 12:25:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j6sm2280617wro.25.2020.07.07.12.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 12:25:24 -0700 (PDT)
Message-ID: <c16a183feaffb57121e74462dcd56816220daeac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] distutils: put tests to a separate package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 07 Jul 2020 20:25:21 +0100
In-Reply-To: <PR3PR05MB6890710E8729FAD4ED19D5F4A8660@PR3PR05MB6890.eurprd05.prod.outlook.com>
References: 
	<PR3PR05MB6890710E8729FAD4ED19D5F4A8660@PR3PR05MB6890.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-07 at 21:01 +0200, Konrad Weihmann wrote:
> Put files from installed tests into a separate package to avoid
> having
> them in an image unwanted and to avoid having more runtime
> dependencies than necessary.
> 
> Background:
> As setuptools is pretty much unregulated in terms what is installed
> by some module, even tests are installed into base package, which
> then
> go right into production, although completely unnecessary.
> When now trying to determine the needed runtime dependencies, more
> than actually needed will slip into the image.
> To give a really bad example GitPython ships its tests into
> production
> leading to the effect that theoretically besides the known RDEPENDS
> python3-asyncio, python3-distutils, python3-idle, python3-misc,
> python3-pickle, python3-shell, python3-ddt and python3-nose would be
> required.
> That's why I came up with the idea to package tests (if existing)
> into
> a separate package, which is NOT installed by default.
> Please let me know if you see any issues with that patch

Shouldn't these be part of a PN-ptests package to match the rest of the
system?

Cheers,

Richard



