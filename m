Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.5859.1591705356247430719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 05:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cV6uLfIT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r7so21095924wro.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=U28MXxValpZgA/9JI9HbZe96KD8+kPUxqVD4SgvfIjg=;
        b=cV6uLfITilWze2+Nfurx1LSUPi48Glmyn8ijgmDect6IVEHUoJdqkKG6Zb1YlwxTVI
         FhengGfdgollw1lMSnQX5S63J/lzJaT3nW1bCiD8pI+AWFl0kEye2bZaY8Zku4/73cYg
         5LuIIEKxRYQTB8j6+4zrwC979pYRovedZN2yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=U28MXxValpZgA/9JI9HbZe96KD8+kPUxqVD4SgvfIjg=;
        b=KtgQaVTaZkqQ7PAIBWQq6WXLO0BA0VPON9gFwhAsUUAiNadoDXLLp4Kvw00DVGSGI5
         T/T5PRYISM5RDwU7fsdv9tKqCADNnjc+A2xT/NKEyqo4KJ8ZqLXs5XOENfQirr1R1+L0
         Eg1HsZXJwlb9hJ/haezfVKxHe/TzUaBTYDxHaPx3dvYBUAmr6LmcphpOl5XhAkDrGbEe
         k+NMee2BpaK1hllPxP1iVhkUVhWMeUFyuZLHxPudtexvrExcdFH9FDnvPBXFe5FRXQJ2
         +8KSb9rIdT6wTAjr3ITaktJVxmrWjtD+ReAxue+e0Ji23QeT2EZIEQTdGF6kNwc3Zq5T
         hnjA==
X-Gm-Message-State: AOAM533kjac0epCqdjmXJFNEcN7TeGIek0But1klq7t1bGWqY2PmrWTd
	rQlhxaiyqeH+8iZ0zc116e+wmQ==
X-Google-Smtp-Source: ABdhPJxzgo4VqXNCjGfopP/TPe9SkZttB/tl6pRDoAipN0IgGx2IAnVAd1GUnOOr+j8MQPuhciXdbg==
X-Received: by 2002:adf:feca:: with SMTP id q10mr3856938wrs.380.1591705354725;
        Tue, 09 Jun 2020 05:22:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k12sm3226787wrn.42.2020.06.09.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 05:22:33 -0700 (PDT)
Message-ID: <bdd4e8601d116c135dba9fc04095e7d634294689.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][dunfell] Revert "prservice.py: fix do_package with newer Python in Ubuntu 20.04"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2020 13:22:32 +0100
In-Reply-To: <20200605155012.7175-1-pkj@axis.com>
References: <20200605155012.7175-1-pkj@axis.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-05 at 17:50 +0200, Peter Kjellerstedt wrote:
> This reverts commit 4b26eaf7152fb712aba47a0c746333578f58ee8d.
> 
> Since the problem occurred while importing prserv, the solution has
> been moved into it instead so it is solved for all cases where prserv
> is imported, most notably when using devtool.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

I can see why you've done this however it really is a bit of a hack :(.

At least in this code its all together with the OE code which uses it.
With it moved into bitbake, its moving "OE" knowledge over there and
that worries me a lot as people won't find it when changing OE-Core.

Chris did have some ideas about this which seemed on the right track:

https://lists.yoctoproject.org/g/yocto/message/49571

although it seems that solution didn't work.

I'd like to better understand this issue before we merge things to
bitbake.

Cheers,

Richard

