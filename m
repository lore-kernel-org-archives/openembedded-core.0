Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.7661.1602579743131983349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 02:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OFgI6SB1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id h5so12961778wrv.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=k0jAqABQYT7GTa+Z1AEurj21/bW2fIS2EpvyksyoaNI=;
        b=OFgI6SB1lFqCwvUSusDeOhdd7ymL0F8Pcujdp2OAK/Ey899tTDwlEJ3qVJWm27DSWi
         bx9puq86fYlS+1206QndlxHBZiy21stkFy+9FlbwQCDHsqPAyrIfhBuK82A+DhNkZBdc
         dgOnCcpHQvD5wmwhijeOE8ajy8qS/w1ZE32aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k0jAqABQYT7GTa+Z1AEurj21/bW2fIS2EpvyksyoaNI=;
        b=HxDKvFq+xFt58HSmojsI8XwwS2FjNTQi1+UdHyPafcHP+yqPRyyeD1lnToooIRcgLO
         qUtnpvfVryGEzEcytDqk3hg4wBEVosG7krMtVS1aHQmc4wgnuV0+0viIjqEUwdA8SgN/
         u2NFhl+sHchpT8ObeBPDfKbMEDDb/jSgP0qzt7Waze3NGkvhAPcpVE2uqpLJqqjtwACi
         r/+xrGqK4nJ8mRUARXi6BAipwU5AcnZIm0S4yKp5Rq38zPQ9ko/KIh5TRPodxcr5a/iH
         vSGI9/qEdU0ZMd6WE5vMsrFnASF8StS9FhCJQclxijTgpS+B7cIj4iO9wgpr4o6XSsuU
         PPCg==
X-Gm-Message-State: AOAM533BwlTa9oMfevdWwX5jNyk9B+FR3aTiSyeGBDgJE7LP5S3mWCXW
	ZNhZK1oaJR/VjF4m8bzN5Qxs5g==
X-Google-Smtp-Source: ABdhPJwPnk0koj8VpdqciQlbdhbo7Vw7WhI6EZxp12g5B8O2yiVxrHvN2nKWBv+DejgLUyLYL34g4w==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr36087087wro.357.1602579741569;
        Tue, 13 Oct 2020 02:02:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id l1sm7963905wrb.1.2020.10.13.02.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 02:02:21 -0700 (PDT)
Message-ID: <70e6251e77a670b27d5f615f17b5e6ade4b9af90.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sourabh Banerjee <sbanerje@codeaurora.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2020 10:02:20 +0100
In-Reply-To: <1602403005-20733-1-git-send-email-sbanerje@codeaurora.org>
References: <1602403005-20733-1-git-send-email-sbanerje@codeaurora.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-10-11 at 13:26 +0530, Sourabh Banerjee wrote:
> Sanity checker reports following error for the PATH variable,
> when bitbake -e <recipe> command is run in an extensible SDK workspace.
>    PATH contains '.', './' or '' (empty element), which will break the build
> 
> In case of extensible SDK, PATH variable is formed with two consecutive ':'
> as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.
> 
> This change adds the ':' only if the bb.utils.which(d.getVar('PATH'),'bitbake')
> returns a valid path.
> 
> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
> ---
>  meta/conf/layer.conf | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 38df0f3..75d2ee0 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -102,4 +102,12 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
>  SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
>  
>  # We need to keep bitbake tools in PATH
> -PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
> +# The ':' separator is conditionally added only if 'bitbake' is in environment.
> +# In case of extensible SDK, bitbake is not in environment, which results in
> +# two consecutive ':'. Sanity checker reports "empty element" error when it
> +# encounters two consecutive ':' for PATH variable in the extensible SDK.
> +PATH := "\
> +${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}\
> +${@(':', '')[bb.utils.which(d.getVar('PATH'),'bitbake') is ""]}\
> +${HOSTTOOLS_DIR}\
> +"

I think we need to try and find something a little neater than this.
How about:

# Need to avoid empty path entries
BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
PATH := "${@'${BITBAKEPATH}:' if ${BITBAKEPATH} is not ""}${HOSTTOOLS_DIR}"

Cheers,

Richard



