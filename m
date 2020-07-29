Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.5747.1596029097011297949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UUbTTpvC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id a5so11670994wrm.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=is1+s9o7LTIFlea3LmM+qTTL8n5JRvTC1hI2led8YFk=;
        b=UUbTTpvCqr7Lo09zmP5aMIC04CzTDZOjE/aadzL7yqYdhXTW0ECjuEoe281JriDkc/
         tdPUU1VVeuvAyYCa0vZ9213TzG1Yov6zjlsdi+hQDwNeS1iScV2RQsT1volbLWqwFYCt
         b3nXPYyEXTRVZgn+NSqStoWGySVE/i/errx00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=is1+s9o7LTIFlea3LmM+qTTL8n5JRvTC1hI2led8YFk=;
        b=L9mNmz9oiQxiUxlm54Ybcf27FfGlQR6pZOAFx3CoaK8lyYpflxHL+fz6Z15DqebB+V
         g04V4CbS7stCLg3pH3hAUZ06s3HD80W/7FU3olTd8aqU6pcCNkoAHRzMb7Wn1w0WsRS8
         DDz0AhpXwMr3FCUa21RtUMJKpubaNusjjdp5duNVUqPefFqpO5Ri9L/Fj4YLAwppTEZV
         bxNxbOHiWcsz6xrgLSyzwYGoHXBBzG/qD4iCPWKkSk62A2u4zAdpYuvFfslaJhYOURWx
         XZgpxicEuFkiwrFmJU3NxSS1i84IteFq7+lYJ0f/c5V4S6YjDnc9umg5/Te757thQHIn
         +kqQ==
X-Gm-Message-State: AOAM530//vvWvOQGPsYguMNHufU98b2aEP6XbMwd0oyViNwAos+dsIes
	WyswkrDZapP9LLG1yoAeI2fGbw==
X-Google-Smtp-Source: ABdhPJwi7rHO5DOJ9Hd8XNCuz8ae3TDD4yZiFuj8T5CLlYGEC2CVnv2npdxc4tQ0hETawRthLxvTsQ==
X-Received: by 2002:adf:f186:: with SMTP id h6mr30290735wro.144.1596029095452;
        Wed, 29 Jul 2020 06:24:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id r14sm6018045wrc.29.2020.07.29.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:24:54 -0700 (PDT)
Message-ID: <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2] ltp: remove OOM tests from runtest/mm
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthew <matthew.zeng@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2020 14:24:53 +0100
In-Reply-To: <20200729130916.38764-1-matthew.zeng@windriver.com>
References: <20200729130916.38764-1-matthew.zeng@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 09:09 -0400, Matthew wrote:
> Fixes [YOCTO #13802]

Thanks, we can reference the bug but I don't think we can yet claim it
fixes it.

The missing log issue happened again:
https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/908
so I think there are multiple issues at play here.

Is there any way to have the logging logged to disk straight away
rather than stuck internally in oeqa's logging buffers? That way we
could see which tests had run before a hang?

Also, could we make the scp failure non-fatal, maybe a warning so that
when it fails we can look at the rest of the logs?

Cheers,

Richard

> Remove the OOM tests, since they might cause oeqa ssh
> connection lost.
> 
> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> ---
>  ...001-Remove-OOM-tests-from-runtest-mm.patch | 33
> +++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-OOM-
> tests-from-runtest-mm.patch
> 
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-
> from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-
> OOM-tests-from-runtest-mm.patch
> new file mode 100644
> index 0000000000..2d8262be78
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-
> runtest-mm.patch
> @@ -0,0 +1,33 @@
> +From 373b21dcf7a2879c27cc3dbeac5d83f5d45d22ae Mon Sep 17 00:00:00
> 2001
> +From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
> +Date: Wed, 29 Jul 2020 08:47:09 -0400
> +Subject: [PATCH] Remove OOM tests from runtest/mm
> +
> +Disable OOM tests, as they might cause oeqa ssh connection lost
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> +---
> + runtest/mm | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/runtest/mm b/runtest/mm
> +index 4701a14bd..2f9888ec6 100644
> +--- a/runtest/mm
> ++++ b/runtest/mm
> +@@ -75,12 +75,6 @@ ksm06_2 ksm06 -n 10000
> +
> + cpuset01 cpuset01
> +
> +-oom01 oom01
> +-oom02 oom02
> +-oom03 oom03
> +-oom04 oom04
> +-oom05 oom05
> +-
> + swapping01 swapping01 -i 5
> +
> + thp01 thp01 -I 120
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb
> b/meta/recipes-extended/ltp/ltp_20200515.bb
> index ece3acf0f9..0c7044d044 100644
> --- a/meta/recipes-extended/ltp/ltp_20200515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200515.bb
> @@ -37,6 +37,7 @@ SRC_URI = "git://github.com/linux-test-
> project/ltp.git \
>             file://0001-ptrace01-Fix-missing-format-string.patch \
>             file://0001-sigwaitinfo-Do-not-run-invalid-undefined-
> test-cases.patch \
>             file://0001-syscalls-copy_file_range02-Expect-EFBIG-in-
> subcase-m.patch \
> +           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             "
> 
>  S = "${WORKDIR}/git"
> --
> 2.27.0
> 

