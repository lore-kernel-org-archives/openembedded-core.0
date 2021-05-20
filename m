Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.6877.1621510026288716919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 04:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R2eopt1f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so4992521wmf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 04:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Iwvw2d3FigxEtC4PsbeNItpWFyyeE0G9Rz+/1lx4kDk=;
        b=R2eopt1fNJeeAHEh4kq2BMtNkhBPFE3XdiCWb6fpxPhJEyiWtlGNG3OCgSa2uDPt9L
         +Ede9mO7RlwVmoEor+ndcdTdAikTejwwxZj2zKadr/qWu0vHPvD0nCnmJFY0MiX66QUx
         1eBjwu/+8zyXcpB1VHQCnM4w7OIrgjoy1hOmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Iwvw2d3FigxEtC4PsbeNItpWFyyeE0G9Rz+/1lx4kDk=;
        b=lQCQ+m6OfYiYlkGHCnH1yrkbkFHqsVQrvZ4vZXacZ34067+Z7jafZ1HV4+LzbVEhLx
         3hMApPywcJ5S3Rw2A7w+OrYXEwqzyhM30HXuqhPRbf4ArAoOz3mh/pKQGi417z+G4hmp
         ZUc9dkJd3xVZqrcW/UxZena49g1HR4LnnzSmMJo52nrNomKqHOx26cphlv5bEvvMcFMc
         kuYf2wcMWq1Symc6F8G32cTEssn7CafboJdkifgdcIoUMctf1+QKkS5BVfn0iRUMgQmA
         Yd0INE26c8xUx8SP25WHkkS2CTKLQeoe5V8yQaiKnFwsCihXx7FZe/gkaNBoOc6VJmDW
         DFig==
X-Gm-Message-State: AOAM5309UH4jTaDpQ0bMi6I7sGdAiabAd+tklKXgZrW2N7FVmn7k3V/k
	llcTgLjl0tRSX8mtUKW1q2PxOA==
X-Google-Smtp-Source: ABdhPJx3RgXLzWTn0xoFtigCqBTE3nqvsyzJnTRuPDOIVR/QZM5PgghIzTCghSHc2pa7NNXgusaREA==
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr3609138wmb.170.1621510024739;
        Thu, 20 May 2021 04:27:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:56da:83e7:85fe:8f81? ([2001:8b0:aba:5f3c:56da:83e7:85fe:8f81])
        by smtp.gmail.com with ESMTPSA id k7sm2961196wro.8.2021.05.20.04.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 04:27:04 -0700 (PDT)
Message-ID: <bac5ee8232dc8a9e391fd3fe85912622c0669472.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa: sdk: basic go toolchain test support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Morrow <pemorrow@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Cc: peter.morrow@microsoft.com, Jon Mason <Jon.Mason@arm.com>
Date: Thu, 20 May 2021 12:27:03 +0100
In-Reply-To: <1621343133-5221-1-git-send-email-pemorrow@linux.microsoft.com>
References: <1621343133-5221-1-git-send-email-pemorrow@linux.microsoft.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-18 at 06:05 -0700, Peter Morrow wrote:
> Add a simple build test for the golang toolchain which is produced into a SDK.
> 
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>  meta/lib/oeqa/sdk/cases/go.py   | 34 ++++++++++++++++++++++++++++++++++
>  meta/lib/oeqa/sdk/files/test.go |  7 +++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdk/cases/go.py
>  create mode 100644 meta/lib/oeqa/sdk/files/test.go
> 
> diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
> new file mode 100644
> index 0000000..1af5516
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/cases/go.py
> @@ -0,0 +1,34 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +import shutil
> +import unittest
> +
> +from oeqa.core.utils.path import remove_safe
> +from oeqa.sdk.case import OESDKTestCase
> +
> +from oeqa.utils.subprocesstweak import errors_have_output
> +errors_have_output()
> +
> +class GoCompileTest(OESDKTestCase):
> +    @classmethod
> +    def setUpClass(self):
> +        files = {'test.go' : self.tc.files_dir}
> +        for f in files:
> +            shutil.copyfile(os.path.join(files[f], f),
> +                    os.path.join(self.tc.sdk_dir, f))
> +
> +    def setUp(self):
> +        if not self.tc.hasHostPackage("^nativesdk-go", regex=True):
> +            raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a golang toolchain")
> +
> +    def test_go_compile(self):
> +        self._run('go build -o %s/test %s/test.go' % (self.tc.sdk_dir, self.tc.sdk_dir))
> +
> +    @classmethod
> +    def tearDownClass(self):
> +        files = [os.path.join(self.tc.sdk_dir, f) for f in ['test.go', 'test']]
> +        for f in files:
> +            remove_safe(f)
> diff --git a/meta/lib/oeqa/sdk/files/test.go b/meta/lib/oeqa/sdk/files/test.go
> new file mode 100644
> index 0000000..089f721
> --- /dev/null
> +++ b/meta/lib/oeqa/sdk/files/test.go
> @@ -0,0 +1,7 @@
> +package main
> +
> +import "fmt"
> +
> +func main() {
> +    fmt.Println("hello world!")
> +}

I'd love to add something like this but adding it triggered a lot of errors
in our automated QA:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2169

Cheers,

Richard


