Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.14521.1594225168401773710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 09:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WeUIu3fC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id z2so27363708wrp.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=M1y0xnlItWx87LiKmvBftkx/l3iDRdzShQOTf8ef1uw=;
        b=WeUIu3fCtmgyKmBYVanw8y12QaQWjt2O5vY1LBF3JK1GYDiIZoGR6IFDSLwO5EiFVf
         ijRnA1HWSulsvN0YQfvTj2CFradvsbMxAkSxOOwLfGeXmOdc30iYi9luehN/S0f+Lkss
         KpzYB46SecZQZC+04wcjoxAjuqDsTPsNc7ziw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M1y0xnlItWx87LiKmvBftkx/l3iDRdzShQOTf8ef1uw=;
        b=RZeuNWtfnnkQyYz9jpyREhQkVzwiwb2+Dqt//e1E3MLfuNl4iZtiu8xz/2VVHdN0nN
         +7ojPMYILMUN3eFk1s1rnWXgVNugJinFuChPkkxIcI7EILiLfmi3Aez/L0rKb6cn+Rxr
         wz3ptXBdOmj8Gl/2BEtAoJLdQW5LX/Mu/huGfpJ5dhbxMgpzues+eCk2p0hv04jsneTj
         YgQeRi4g9pz/yz5ZXuBKvU/x80JlZo9LDbhZBH34FEAuG393yn0HyeuZ1YEko/tAgvkN
         5Wc/yFZ0zQ97s3ZEz0IImT6lX2JASne6+jyoBQJSLRFfXlYn4lILtn4qdI53pb+xzQnV
         5qrg==
X-Gm-Message-State: AOAM532kJKPoF9x/kWw69JBn//dUbJckQA1TcBnpEro4J8y/vEgUFBDN
	O8zc9fXKCBxOitnAnscXw9YjyA==
X-Google-Smtp-Source: ABdhPJwMv7TYESsO388NH6cUzkw3oItVg4kJ4/lVxNf5fausd6mla56BdHHgXKr3gU0NuAjCf7qgLQ==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr59841683wrn.269.1594225166867;
        Wed, 08 Jul 2020 09:19:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r28sm693581wrr.20.2020.07.08.09.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 09:19:26 -0700 (PDT)
Message-ID: <87ad1d67a94200b7cafd75a88661814037fcf393.camel@linuxfoundation.org>
Subject: Re: [OE-core] license.manifest misses header-only libraries
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christian Eggers <ceggers@arri.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 17:19:24 +0100
In-Reply-To: <15493295.j7L6bUlEPz@n95hx1g2>
References: <15493295.j7L6bUlEPz@n95hx1g2>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 17:48 +0200, Christian Eggers wrote:
> According to [1], a license manifest is generated during image
> creation:
> 
> "The Yocto Project generates a license manifest during image creation
> that is located in ${DEPLOY_DIR}/licenses/image_name-datestamp to
> assist with any audits."
> 
> This manifest lists all packages installed on the target (either
> being installed
> directly via IMAGE_INSTALL or due to other packages RDEPENDS).
> 
> The manifest seems to miss header-only libraries (like tclap or big
> parts
> of boost), which were used during compilation (headers) but do not
> contain dynamic libraries required at runtime. I guess that the same
> may be true for libraries linked statically.
> 
> Setting RDEPENDS_${PN} += "tclap" in my own applications recipe
> seems to improve the situation as now the (empty) package tclap
> is included in my image and in the license.manifest. But this
> requires
> manual work and cannot do this for all recipes shipped by OE.
> Additionally this doesn't work for boost, as rdepending on boost
> will pull in ALL boost library packages.
> 
> Is there a reliable way to get the header-only/static libraries into
> the manifest file?

The image manifest is a list of the things actually shipping in the
image and their corresponding licenses. Most images don't ship
development headers so they'll not be included there.

You can certainly get a list of everything used during the build
instead. I'm not sure how you'd decide that a set of headers were used
or not, compared to say the cross toolchain binaries or a native tool
though so anything in between these two is harder.

There is some work I did a while back which traces all SPDX identifiers
referenced by debug symbols in the code to better audit license
information but the lack of SPDX headers in much of the code we use
makes that less useful right now.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/license-experiments-osls
(and a presentation/slides at OSLS 2019)

Cheers,

Richard

