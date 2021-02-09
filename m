Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.11128.1612881246532645764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V41CUybu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id o24so3671302wmh.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 06:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QuLf53xMejcJDeSQZ9K47zdjBjieF32jfiu8CIyZu9A=;
        b=V41CUybuIfcQrgcMprEucGxMMqLk1qbvhmKEeWGASyMTzY9txXACBrHrpEm43un3J1
         X6zL77NVWVEbb1oCX9yaddmYoiEmwciOnFBVbfJO3Nb4crdi3XzU23hy5VeX38fIGBZg
         kirvy0fX6TBwq0+Vdagc5FKwgzvpkmCcfOl1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QuLf53xMejcJDeSQZ9K47zdjBjieF32jfiu8CIyZu9A=;
        b=KTggNeGAX8kgEQTMmZGfOlZisrUfvH4lV0QjuiuAwFf7qe4U9/1iUY9sSFOBny/zDf
         K09Mlw4QD7g8GiuiTXuVUE/GN2q+Xm7NAsYyz+I5BPWHK5wsvQxn0Dh/jLCMga1STlWJ
         gdDk+nDum7RyVOZWH3y8OqANEmcnGZtLW3xiMeDU4vPUKTUXRnKFl9sR6iCNtzWE2Ul/
         B+Y2Mx97TWlIDN+kHHdnrFN9e4O3u7bnl/MIJhn27HgjZiMqDYzwf4cA+We1ZEmpYAMD
         SpJhMIJiRFG/lLzOLmIrI5NhYIkWy/Azju7Xo1zmeMyHTn0NrtNsEaWVqmKZGqwFLlU0
         GZnw==
X-Gm-Message-State: AOAM530Wz4JzBQWKWikN29ttQ8+ogXMeEU5s4hYo9GQXOd743/qQNlAo
	P6UxvupZja2uvDg2oM2XLNNV3w==
X-Google-Smtp-Source: ABdhPJzHmJ9ucxoKscgMiUiKBYlHnPxgAd+wRdZpdhUzng+vOaFmW3v9eT/60+CWEY5kUwp9AjqUtw==
X-Received: by 2002:a1c:107:: with SMTP id 7mr3729127wmb.28.1612881244944;
        Tue, 09 Feb 2021 06:34:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c? ([2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c])
        by smtp.gmail.com with ESMTPSA id m16sm4290501wmq.36.2021.02.09.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 06:34:04 -0800 (PST)
Message-ID: <efcd1bc6ff5c0f4ec4b6111d51b292c629b2ce58.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 23/28] opkg: Fix build reproducibility issue
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2021 14:34:01 +0000
In-Reply-To: <bc1f08f0202b1ea3780b72dc9b2e7bc339581fcc.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
	 <bc1f08f0202b1ea3780b72dc9b2e7bc339581fcc.1612792088.git.steve@sakoman.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-08 at 03:52 -1000, Steve Sakoman wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> A build date was leaking into the generated docs and makefile used for
> ptests leading to reproducibility issues each time the month changed.
> 
> Add a patch to use SOURCE_DATE_EPOCH to derive it if available.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 6a9ca7aec4991eabd425e32fdf85f51bb1686b8b)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../opkg/opkg/sourcedateepoch.patch           | 25 +++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.4.2.bb      |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch

I'd hold this one until I get the patch fixed...

Cheers,

Richard

