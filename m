Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.4740.1631694961978378977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LSna9I/1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso1425778wme.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=v8pO+A4qwF2Nj5Xk0rgUTJFxknKOQvnMe9au9vzJtGU=;
        b=LSna9I/1gRDkvHzllrEE2Yq6Jo5YIOMq4N7Gp/fTnpv/0Tmb9oME+IbPY8BYIC89L5
         YyHHOmGU7iegoC0qvqrj9haQZIPDgYsCaOn5WsfaFf2qGUjhf0kRwdSEAEaSgUvMMBGl
         xsv5Jj3uKtL+nO1cJq0A2sVfNWQ9DMmDhkwxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=v8pO+A4qwF2Nj5Xk0rgUTJFxknKOQvnMe9au9vzJtGU=;
        b=4QrsPdwfkzfDHBZvBkBRRrBtbfw3EalcD67YCB8yai3wT5hWVOLwRx4P/CkZip5Q1V
         YU3g/cmWCbasob0bThuZCF+H7l3rupBkcWl59AU/CfjUQggDv2Y38jAHTklAsmOFTL2u
         sJ89BWyvbGcgMa9J1/4Zi+gevmUs652ifhcgEgAUsQSdncurXrLWWKBMbZ3LxN2iN1WG
         XZUcfW1BxP53Sb7tIzPWwX19e5jUjMSIkCi0a4WaeJG4uDIyDgaXfC3uEObIj2Aej1X9
         hmBAePIQF6PYVacfFOrtKQdhRP1VHCY2u5H/1pqybxQAdNdBfrQjJ0eNd52YXK3TJ78h
         wbWA==
X-Gm-Message-State: AOAM530UQJ27k+w+O28VqaUCBDYBqCzfiLmLsvrsXFFvCL+6f3A6cT09
	+1pusNalpHRFa/ELrrRqayta+g==
X-Google-Smtp-Source: ABdhPJzyCMC4mFq7C4vQttcnyFuH6VJvPi/5+gbKd3o7Ps5Xufofe7hKXUuOfiswTvyzNy6vW9xkgQ==
X-Received: by 2002:a7b:c191:: with SMTP id y17mr3116181wmi.122.1631694960316;
        Wed, 15 Sep 2021 01:36:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cb98:b99:6df8:dffd? ([2001:8b0:aba:5f3c:cb98:b99:6df8:dffd])
        by smtp.gmail.com with ESMTPSA id u25sm3909726wmm.5.2021.09.15.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 01:35:59 -0700 (PDT)
Message-ID: <04a96263ce4c741c833e1022dcc2a5a48119280a.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] Rust oe-selftest script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, vinay.m.engg@gmail.com, 
	alex.kanavin@gmail.com
Date: Wed, 15 Sep 2021 09:35:57 +0100
In-Reply-To: <20210913173513.176653-1-pgowda.cve@gmail.com>
References: <20210913173513.176653-1-pgowda.cve@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-13 at 10:35 -0700, Pgowda wrote:
> The file builds remote-test-server and executes rust testing
> remotely using background ssh. It adds the necessary test environment
> and variables to run the rust oe-selftest.
> 
> Print the results in case of failure of runCmd().
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py | 54 ++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py

Thanks for this series, it would be great to have these new test cases.

We did see a couple of failures in testing on our infrastructure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3970/steps/19/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/3967/steps/20/logs/stdio

I also needed to add a maintainers entry:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=50f7a13e69e8987b3629d455f9f56720c376e89b

Cheers,

Richard

