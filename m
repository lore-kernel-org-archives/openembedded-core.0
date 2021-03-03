Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.316.1614810616369528345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g2wXCS5P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o7-20020a05600c4fc7b029010a0247d5f0so3629358wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 14:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=09SVLND+4Q3XguNYE/9azR9YVAvAC4ri8Zd62Hz2oLM=;
        b=g2wXCS5PZocd5Nq5Xpw+x5mCtdz1uHXuMRa9+XXvhLKFy80RVkGN2K6HqWYxxqbsCz
         CvPArY9iS6rmUc5OnjeMG1RNcphzDztc7F4H4S2SGxfDwbAIN0pIIV+UPDyciGLU+1Z2
         S7DXvXLkpy0HW7ci53tvMD1lAqRi90Md1+i5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=09SVLND+4Q3XguNYE/9azR9YVAvAC4ri8Zd62Hz2oLM=;
        b=hhooNjb+WYIyFbAAP1BH6rELHwug1Kvb2DSvuItq1M52cl5Ai5f5gb7D5LszSFizrN
         fVpnP2sEao5yIGYt3SLuihQYfydahqensfkKNWL8epK9VbyxGUnzavLNbkiWOSDoL4Rc
         vWI0Ey4O28QWNoWdXLf3Blbusr1Gcq4tkXU2ZNwEEUTNNPWxrvbH0pVRzcmTb5dWc64M
         sv2l8Uv/jhZD5pIL2HIbEYNOt4Fqu+xvgepdNvQPoFvmdSyx326mMAQSbd0qY6tHAElH
         Jaou4TToPDTtDUMx3YjCJLaq6roQqt11WIx1LeuYSkO5Kpc/qLjdB95HoqEmyyRflvn7
         dDEg==
X-Gm-Message-State: AOAM530rLPRjA3Ey+tpkwIRnkiUkXo/oI2is/KZ5I9r36q+J3Yb6Uoml
	E2Fc9X3wa86ZIKN0ndk03rNNbg==
X-Google-Smtp-Source: ABdhPJxoKMi2Y74rk0i3E2d3cgvJIcw4Aeqq1fexNhdghI6z/796EW00QPZyE9KxUOdinS5lBpyjig==
X-Received: by 2002:a05:600c:4844:: with SMTP id j4mr914703wmo.179.1614810614789;
        Wed, 03 Mar 2021 14:30:14 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff8e:990c:9a0d:f693? ([2001:8b0:aba:5f3c:ff8e:990c:9a0d:f693])
        by smtp.gmail.com with ESMTPSA id p11sm21004519wrs.80.2021.03.03.14.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:30:14 -0800 (PST)
Message-ID: <09c1419c406fa4c00ad7496b096b18a7f2d28777.camel@linuxfoundation.org>
Subject: Re: [PATCH v5] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Wed, 03 Mar 2021 22:30:13 +0000
In-Reply-To: <20210225153035.1239276-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210225153035.1239276-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-25 at 15:30 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> new file mode 100644
> index 0000000000..ffb2c87270
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> @@ -0,0 +1,22 @@
> 
[...]
> +S = "${WORKDIR}/util-linux-${PV}"
> +EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
> +DEBIAN_NOAUTONAME_util-linux-libuuid = "1"
> +DEBIAN_NOAUTONAME_util-linux-libuuid-dev = "1"
> +DEBIAN_NOAUTONAME_util-linux-libuuid-dbg = "1"
> +PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"
> +FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
> +FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
> +FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
> +
[...]
> diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> index 19950a2726..d4406695f6 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> @@ -1,46 +1,8 @@
> [...]
> 
> +RDEPENDS_${PN}_append += " util-linux-uuid"
> +

I know this patch has caused a bit of confusion as it blew up in testing. 
I can't explain why you didn't see that but I did spot why its breaking. 
I've cut this email to the bare bones of the problem for clarity.

In util-linux-uuid, you set PACKAGES as above with util-linux-libuuid.

In util-linux, you set it to refer to a util-linux-uuid package which 
does not exist. It needs s/uuid/libuuid/. RDEPENDS refer to PACKAGES 
namespace so need to be consistent.

Why the tools haven't been clearer about the issue, I don't know but
that is no doubt causing many of the issues.

Cheers,

Richard



