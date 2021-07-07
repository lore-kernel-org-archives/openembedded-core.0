Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.20321.1625660721686140271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 05:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YxpJyY5e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u8so2818471wrq.8
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FTZOJeZBkUsa8rcyrrukkKVJ5QwBZ9tyUtvegjV6fiI=;
        b=YxpJyY5ekoeDZtILUsmOgrrNA37n6xdYQYDDzTJbHaS+3qm/5Dm+F+6oqEiABuONO1
         fIWKMiomF2Rzzk+0ppWN5nFNCA92eLfHXj2izrbY8hqiNo0GEW/kYS+iwp+c29oHvKIU
         /6ETFd7hKCd+NALfRT6QG4fTJyWByDKl5IMC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FTZOJeZBkUsa8rcyrrukkKVJ5QwBZ9tyUtvegjV6fiI=;
        b=ZV0dBNfaCbtg9Dw9xHAOZJUMj5oZrXmAn6wLpjI8DakjTAr41gXQYcIakkba6YOC7v
         MtsfnN1jtxmAbNcX9R7zA0hT5EHiu9NF7XkTE07gR+UNB0Fg9v0Mb2HA+nVa5OVoXF2V
         VBXcJ0vmPKn/QbPpHUGHqYPU0N2MEdMLPgOb7i7XaYsa/clLH2M3G3FgZYc1pWTDxI/p
         K3WTm1bjMNoFmL4NGoblOKwUU8YP/dMUTHVSaAYZdR0NbCnWLRGgq+InuRtg+8kPH5Ug
         hJMSyNJW0o+3bYxV4pskcM7dR91K+nSDBOTLV9fWbUwQ56wbXvFTCCUoMB/aXh9G8q6a
         vvgg==
X-Gm-Message-State: AOAM533vyNXKNkPag0Tul6ekBmHYxh5QiWxtHpbZDQrt5HsM5bCSSR/X
	LkNCU80gy3B63No8Ez2S1oh5Og==
X-Google-Smtp-Source: ABdhPJzRtWBBMGXzXgWnmcxc7CyilCv79DkfumKeIlnQWYEyJ8GSDNCx5etA0Ln/LtCK+6CxJsmxXw==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr27621894wrt.132.1625660720107;
        Wed, 07 Jul 2021 05:25:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id u1sm6252890wmn.23.2021.07.07.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 05:25:19 -0700 (PDT)
Message-ID: <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] license.bbclass does not add recommends to dynamic packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: yocto@mac.mcrowe.com, openembedded-core@lists.openembedded.org
Date: Wed, 07 Jul 2021 13:25:17 +0100
In-Reply-To: <20210707115334.GA498@mcrowe.com>
References: <20210707115334.GA498@mcrowe.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-07 at 12:53 +0100, Mike Crowe via lists.openembedded.org wrote:
> We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
> relying on the automatically generated recommends to cause them to be
> installed in the image. This works well for most packages, but fails for
> packages where we only install package created using PACKAGES_DYNAMIC.
> 
> For example, liborc is being installed in our image but that package lacks
> a recommends for orc-lic, so the licences that apply to it are not being
> installed. This is because license.bbclass:add_package_and_files iterates
> only over the packages listed in PACKAGES.
> 
> Steps to reproduce on current master:
> 
> $ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
> $ bitbake orc
> $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
>  Recommends: orc-lic
> $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> $
> 
> (I would have expected the last command to produce the same output as the
> penultimate one.)
> 
> Even if I could fathom out how to fix orc and any other recipes so that they
> did add the ${PN}-lic dependency, I'd be worried about not noticing that
> the problem affected other recipes in the future.
> 
> Is there a way to teach license.bbclass:add_package_and_files to add the
> ${PN}-lic recommends for dynamic packages, or would it be necessary to
> teach package.bbclass to do so?

That all sounds rather horrible :/.

Would IMAGE_INSTALL_COMPLEMENTARY += "*-lic" work instead?

Cheers,

Richard

