Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.10452.1597132639808002954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 00:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dp3hYz06;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id l2so10547148wrc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 00:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0hp8pY3U4y/gXhYbYUVlUnFY8I0BGR6K0z8zzLPOXeM=;
        b=dp3hYz06UxqOhYuGTwDOPLu9Cidu5663YMgUDhHsx3loZs6E7uPFkPw9W9QOxIFyFX
         R96yGcioNCYdtUYISIFBwk1UQ0VxvrYehbLvIU9P2UjUWgnTkd9+Zm8MAJ28C5w1F3pk
         n2oK9EZWR+PpduCU+Cu01EkYgsVLFF0XeWtOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0hp8pY3U4y/gXhYbYUVlUnFY8I0BGR6K0z8zzLPOXeM=;
        b=OY5COzjgtc0gu4eBjQhTlRz0khFwdlr70vXnRnmXCqAI+Fy4AJXmBAAyJ13ne1KN71
         Da+0mtYtnhLfOiZ0oT80lW06c2eJQ7lX9toeUGli2JX8h4Qe+xf3jfoeYvW/GLjLOP0d
         bRcuEFjpZCRdOnqm9vAWHoPvs70hVkHW9H56cCZDFpL5XnuP2tOnFrKT8Msdoh1EcYCr
         l7tSpx00tE/tMNMZIP7ZJjDb7QeWTF7IHG14lM7Fm6DK1ZykJ4L8JyrzqdRJx4Yh3n+k
         PB2BkcVXur0FSeCIhcGtLBFEke7H8tFs8JgPdslbz4EnZkz/b+jBCT4F49L2WGwS3Spm
         zvDg==
X-Gm-Message-State: AOAM531U/wLpLLPqzbASZWRaiVpU4CXFJCUahlqkZ6ibNweytUSc0/St
	FEUzgBTKsXBMsWd8W+EENAyIwg==
X-Google-Smtp-Source: ABdhPJyzYw5pItUwZhVaNO+VctP06Ley91tIy+JvjLOpC9UvXYQMTwGVr/b149rLzadhs3z2aKBp8A==
X-Received: by 2002:adf:f189:: with SMTP id h9mr4947910wro.122.1597132638297;
        Tue, 11 Aug 2020 00:57:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.1.8.7.e.c.7.c.b.7.0.b.c.1.9.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.1.8.7.e.c.7.c.b.7.0.b.c.1.9.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:291c:b07b:c7ce:781b])
        by smtp.gmail.com with ESMTPSA id v8sm3840763wmb.24.2020.08.11.00.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 00:57:17 -0700 (PDT)
Message-ID: <2803933a96d0b791c8cad542bbfec3c3dd67eefd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: set the default pigz thread
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2020 08:57:14 +0100
In-Reply-To: <20200811072258.4074290-1-mingli.yu@windriver.com>
References: <20200811072258.4074290-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-11 at 15:22 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> pigz, which stands for parallel implementation of gzip, is a
> fully functional replacement for gzip that exploits multiple
> processors and multiple cores to the hilt when compressing data.
> 
> do_package uses pigz to compress data to speed up the time
> if there is pigz available on the build server.
> 
> But for some big package such as clang, there comes below
> error during do_package.
> gzip: stdout: Cannot allocate memory
> tar: TOPDIR/sstate-cache/20/80/sstate:clang:cortexa57-wrs-linux:10.0.1:r0:cortexa57:3:20808f8a746b00ec9470a81057c8595d878cfe8c565cfbcbbaa3ea870528ee34_package.tgz.QF5dss8M: Wrote only 8192 of 10240 bytes
> tar: Child returned status 1
> tar: Error is not recoverable: exiting now
> 
> So set the default pigz thread and the user also can customize
> the pigz thread such as via PIGZ = "-p 3" or PIGZ_pn-clang = "-p 3"
> for the individual package in local.conf to avoid eating so much
> memory.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/bitbake.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 353caacef9..bc87e78d78 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -804,6 +804,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
>  XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
>  XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>  
> +# Default parallelism and resource usage for pigz
> +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"

Why not just set this in the cases you need it in and leave the
defaults alone? You can just export it in the tasks which need it too.

This change actually makes the sstate number of cpus specific which we
definitely don't want.

Cheers,

Richard


