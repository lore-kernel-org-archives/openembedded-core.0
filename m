Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.498.1614289540095073142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lsq2OFfG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id i7so5664363wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MiDTuBejDCbJs707UeIvJjd3VhFn0nBgA/awpPqfy0M=;
        b=Lsq2OFfGAYkHruvoiTyMNLKs7in7vYNZ5h9bXLe30gWHkgYqzpEG29U84PfK3vGIT2
         InifjWOCXKP094SHWC3DRig/De6zcPk09hJ0Iz9GTLMD66kv5pZkE7AuSB1P/c82Ag5q
         gQXUa1mIlu77V/EMcxMGVv2YZax52C8tBoH9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MiDTuBejDCbJs707UeIvJjd3VhFn0nBgA/awpPqfy0M=;
        b=S/0N4J/75+CALxREgFt4Cpwg5LvX7GZ5SWQRud1EKVCooCD8gUOr90qOqaOSBJzHjm
         ibdw4fvyW5NjpWLjQGVFR0X3Ss9fApk9I78r8V9RKSRl/E+knO0IM6xwCYU5IC+tIHIT
         9smCiYveh0abDcLpZ0WRWGQPW0uAZN4HvctoVrKtCpUjfIz6e0T4PguqRn4Gd5T4cgar
         rQp5u04/R0nGzc7WURY0HDKdPZthRvj3Wsi6v7kxkv08WDwaHG0CxLuaoqP7uOyHdl3+
         nlDSeQbqIUJnt2Eltc0qPtkzZYYzbdZ9OiDnzBFy8OY9iaI6Cat2igqwbxaoO+/nuhbO
         3K8g==
X-Gm-Message-State: AOAM532uLHjQzN6Ha3YAOyR8Y8SmGlhXzA6+LcmSmFB5tgmbBbI+uMfM
	0b1t5MEr9cpdcEGWNO7nypMFcg==
X-Google-Smtp-Source: ABdhPJx7diJv/d54IyxKFBchJSjtOAAi2ziN/kD9VMqO/lLKm5SI1yxOL21+T6gqIMDDQl4pdnaO1w==
X-Received: by 2002:a1c:b741:: with SMTP id h62mr337084wmf.85.1614289538471;
        Thu, 25 Feb 2021 13:45:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id j11sm9435630wrm.13.2021.02.25.13.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:45:38 -0800 (PST)
Message-ID: <48564a078483f9cf2710252df2704d293e22f39d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/pam: Fix tests to work with busybox
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2021 21:45:37 +0000
In-Reply-To: <20210225211758.176441-1-raj.khem@gmail.com>
References: <20210225211758.176441-1-raj.khem@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-25 at 13:17 -0800, Khem Raj wrote:
> Distros may not use shadow for login manager
> secondly login --help return 0 not 1 so adjust the check accordingly
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/pam.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
> index 271a1943e3..a61b5a881e 100644
> --- a/meta/lib/oeqa/runtime/cases/pam.py
> +++ b/meta/lib/oeqa/runtime/cases/pam.py
> @@ -17,7 +17,7 @@ class PamBasicTest(OERuntimeTestCase):
>          status, output = self.target.run('login --help')
>          msg = ('login command does not work as expected. '
>                 'Status and output:%s and %s' % (status, output))
> -        self.assertEqual(status, 1, msg = msg)
> +        self.assertEqual(status, 0, msg = msg)

Surely just changing the exit status to the opposite will cause the 
autobuilder to fail this instead?

Cheers,

Richard

