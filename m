Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.34743.1607952662824367552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 05:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FuinOhXX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id c5so12780056wrp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 05:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=O9T7L2KqGkFlwVs89TpKj72+JqzSEnkhFA0mcVHcq70=;
        b=FuinOhXXVGogDVlvRnosDkqdWbNZ/l0k0Eha4nOlqUc86X+GrrRfVjF1iuW532bOiy
         P+K16a+3hiUHjK/MwOHqHJdMYm+chR7hJX5O61rnZpGgJdjVXTKI7wGoK2zUOY8y7vjl
         ep6o748AHcAfpY15zOUkLyNmSnS4UW0MnZ/qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=O9T7L2KqGkFlwVs89TpKj72+JqzSEnkhFA0mcVHcq70=;
        b=PRefoxxUDKwlNp++y20BkJUhktR67gYUOV/r+sMT8ipFjdnP7HmWtwFj/dMOiJ+k3+
         RpFGVBCE6YntOJWbBXsjvWRkVfS+ZxZ/W4MivKUfLH4LXb98sGJjYuXBUiD+8UxJmznn
         OrFGMsF8jBxkVfovW0L0cpbpP0zkUWGjGTldfLPubWXkBo2xppUtbWvU5rnYki9JLpvg
         4DuwkwXnWgh6mQcWM8TwP+eywGSZHwUJfirV91MswevMamvuOkAv9bw3LviS9Rzc9UBa
         IvCP9fXtz+UKb4N6MTcqdhG82VS9lp4vCu5BAarn0FWoMIRXXwhQDMLT97ov3IqDNZTR
         FJqQ==
X-Gm-Message-State: AOAM533hfAqsasx5g/WK6SGdEGXXNexaDo7HHomcFv5uS4/Aep6VT6ou
	p7yzAjAEUkBSMPQFrRhIQdMY/Q==
X-Google-Smtp-Source: ABdhPJwW0nPSw8prmQMoPX+AVHE0xcF+waNaPgSOTnw/cdJWum1cgM2Xpj4J1PKqVcmHQPP6gWn0QA==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr20939099wrt.404.1607952661304;
        Mon, 14 Dec 2020 05:31:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id 64sm31783704wmd.12.2020.12.14.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 05:31:00 -0800 (PST)
Message-ID: <46755a3c09815c2083f65c090406711ac5114e03.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] yocto-check-layer: make argument parsing unambiguous
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez <alhe@linux.microsoft.com>
Date: Mon, 14 Dec 2020 13:30:57 +0000
In-Reply-To: <20201210162023.3239592-1-ross.burton@arm.com>
References: <20201210162023.3239592-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 16:20 +0000, Ross Burton wrote:
> Currently the argument parser uses nargs=+ for both the layers
> (positional arguments) and machines/dependencies/addition layers
> (optional arguments).  This means it's impossible to determine what is
> meant by:
> 
> $ yocto-check-layer --machines a b c
> 
> Is this machines=(a,b) and layers=(c), or machines=(a) and layers=(b,c)?
> Or even machines=(a,b,c) and layers=(), which results in a parse failure
> as the layers are mandatory?
> 
> The workaround is to re-order the arguments to an unambiguous form:
> 
> $ yocto-check-layer b c --machines a
> 
> However this means the user needs to know the problem and how to work
> around it.  Instead, change the parser to require an explicit --layers
> argument:
> 
> $ yocto-check-layer --machines a --layers b c
> 
> Also improve the other arguments by adding clearer metavars and short
> options.
> 
> [ YOCTO #14148 ]
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  scripts/yocto-check-layer | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/2825

Do we need to update the way we're calling it on the autobuilder?

Cheers,

Richard

