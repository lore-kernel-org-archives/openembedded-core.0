Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.1092.1611707131624811990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 16:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BB5Vrg9Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id f1so228137edr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 16:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=l6ghrSrJJJiet/mR7f3RlG2fhmMuvLOr/mRErVAytxE=;
        b=BB5Vrg9YtkIDDQBuLUY5QZnoG67RMKssEHQVcmXHvUdn73SAis7aLJsruTnj/1mYeW
         GH1nhCGD+MqL8DtsQG0GDbpDpDTnDOdERm3rmRpByzGjm981oT5/q0hU4bk8mQB2Schl
         TN4KmHXjCwEtdS6BAqclg/XxihqhWQ9QZVDbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=l6ghrSrJJJiet/mR7f3RlG2fhmMuvLOr/mRErVAytxE=;
        b=T248EBRiCCpwK0GMqHBCXpaJ1Royzb8iZ+y5dC8uADRhSBGfhajsXy96tpxdzYZa5v
         R46bQH1cDaoWCvEzKANQEwHrJYOLsnI3+BPy+1+58xItqf8ykn7HvEnbSqYEQd2eh2DP
         7VxQdolxy+PamkiBNKAh/af2t6woOA9KZDyUB2GAkM7F7zUcuJEB+CT5bp1xmR0NT1hc
         0g/Z1E2HYew4mawrE56ozeKeAXtfJ/VfGpxI+6f6m0kixvMTTshgIeJDqLWw9/Vk8QrU
         K5pVaPrMrRr4OE0v6xKdG+gyi9lbO3QbeQJOxGSLKBHKi9fyEJc6Z84IUm8HTHxfilks
         Mh5g==
X-Gm-Message-State: AOAM530mzzuN6/UqHVs7NdrOIakYJI5R7VUnl4cPZfPnCgREMveV+vdu
	3XJlfImz7CJCmYjjPwevRBHxrQ==
X-Google-Smtp-Source: ABdhPJxEiv45gAJBL4+oJxDFqycL1ekqBISW42jXAN1YaUu24GY5YPl4QhSRFc3DoE3rVtHJpOuSTg==
X-Received: by 2002:a05:6402:1549:: with SMTP id p9mr6678340edx.387.1611707130026;
        Tue, 26 Jan 2021 16:25:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id ko23sm93386ejc.35.2021.01.26.16.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:25:29 -0800 (PST)
Message-ID: <0735cfcf376ab8ef98f8be81bff16525bc525569.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] oeqa: add OETestPriority decorator
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 00:25:28 +0000
In-Reply-To: <AM9PR09MB46420375BEE263298A28ED52A8BC0@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB46420375BEE263298A28ED52A8BC0@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-26 at 19:01 +0100, Konrad Weihmann wrote:
> This modifies an implicit default priority.
> Can be used to move the test case either to the front
> or to the end of the test suite.
> Value can be between 0 and 99, implicit default is 50.
> Lower values move are run at the beginning of the list,
> higher values at the end.
> Within a single priority ordering remains unchanged.
> 
> It enables use cases such as shutdown tests, which
> should always run at the end of the overall test suite,
> no matter what test suites/cases are set in the current
> test suite list.
> 
> This avoids also using test suite naming hacks, such as
> usage of zzz_foo_test.FooClass.test_foo to move it to
> the end of the test suite list.
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/lib/oeqa/core/decorator/priority.py | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/lib/oeqa/core/decorator/priority.py

I'm still not convinced this is a great idea as tests should be
independent and if we need pre/post test hooks, we should have those
separately. Its also complex when it comes to parallelism, when should
the tests run in that context.

I did try testing these but it blows up too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1786

The more I think about it, the more I'm convinced its a bad idea.

Cheers,

Richard

