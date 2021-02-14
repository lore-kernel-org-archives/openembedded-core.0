Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.19549.1613322784568501559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 09:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YywF3XYT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id n4so2953059wrx.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Jhhp0WMTeTNDsEkw4InnWvamCUPEOgJhmv37OdQukUg=;
        b=YywF3XYTJClkxtlKa+A6LwTcnwKTUbaQTWIHbGcPvUqqZyD9WNifyGsyIbhfdumO6f
         rnN9l7qT7+zFddjbX/Z0lZSGxWnae+pnRN9ELHxNYh7gEXxUg/QjclPpuBJjYwWsgL11
         GBD82KH3OheNEDsFGNDAXX9KWebMV9QrB8RuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Jhhp0WMTeTNDsEkw4InnWvamCUPEOgJhmv37OdQukUg=;
        b=gyGGKwT8oNApyT6rM9YNIOgLlQu7BIdcKabxBbX2OubZ1rbBsR5Cdcs7EMWx62Ebj0
         VO32f6m6AdcdS6U94bDZ+STD0SkVvEmPEMW2keq/KWZR8L0HT2BRynFRb9uFcgrdSE36
         WdiSjRpROTMwNPpwuUpho0oAzG3ZTzVuAXtlri7m/Vy1Y2Iwsu7c/eg+Eyqmirf4WfdO
         l4+SZD+Zoh1IxnuN7Vhgg2jYArh+WmnYKo9WstojlKzjQOACZ//GTsM1apQiFMD/eK4V
         72b6qDcpgCTUmZlOfY2AfSBleiGe8mVJSXqZ55Kt3Oj32XV3lyIq1fY4BBTCiqZgbbbr
         qPkg==
X-Gm-Message-State: AOAM531sMCRCIHlEjqZ2ARZlU2ikGYIjuptlmwbf9vYcRuf+xTQTEvq6
	dsCf/tjT1JqQuoYC0ckqj/eeIQ==
X-Google-Smtp-Source: ABdhPJwY6XlNUXLcALIoRy3xV1AHtuDNlxQ6049QbFQm8mjrOSaC3xsPaCp76XW+HcdxRXkp/DZboA==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr14846293wrv.104.1613322783118;
        Sun, 14 Feb 2021 09:13:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6c46:cb67:3902:3f00? ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id a186sm11074305wme.17.2021.02.14.09.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 09:13:02 -0800 (PST)
Message-ID: <497b1ddfe6674b14fd241a32c832edad62ec79be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: add cloning
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2021 17:12:59 +0000
In-Reply-To: <20210214155305.1797370-1-akuster808@gmail.com>
References: <20210214155305.1797370-1-akuster808@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-14 at 15:53 +0000, akuster wrote:
> Provide a method to clone and push to a git repo
> Provide a method to pre-populate buildhistory
> Maybe remove the need for external scripts to do the same
> 
> Three new variables:
> BUILDHISTORY_CLONE - Enable the cloning function
> BUILDHISTORY_BRANCH - branch used for checkout and pushing
> BUILDHISTORY_REPO_URI - git repo uri
> 
> example:
> BUILDHISTORY_CLONE = "1"
> BUILDHISTORY_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
> BUILDHISTORY_REPO_URI = "git@gitlab.com:akuster/oe-buildhistory"
> BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 59 +++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

Whether or not this is a good idea I'm not sure but I don't like the
variable names. How about configuring as:

BUILDHISTORY_CLONE = "git@gitlab.com:akuster/oe-buildhistory"
BUILDHISTORY_CLONE_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"

?

You're unlikely to not set a repo uri if you set clone...

Cheers,

Richard



