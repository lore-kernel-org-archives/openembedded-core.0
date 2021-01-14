Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1284.1610655363890118974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 12:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o3oVoMvy;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id my11so4376762pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DIELkt5tzjtkH7KmjmNSwzyiOLYn+YiDkF8Urcd6vko=;
        b=o3oVoMvyMWbRavtQO7oGyz8ZIJ+gm4Kbuloc4lkeHMnLCKR+QNMlqBgVUFMroJtx+6
         lbqe71De6h+p5WVla0uIQrq3S3ZeGZiN15FeDZNu6S5Xr+UIkftakoWC641tPFBPG62p
         xEotSF2JJy3fS+PsAhnuWaLrbjk9IEk4MmszAXUpG75LyKxIAAkyN73jmMZ3ECTf3zDX
         +6GlpKXGx94rD6C77xdW2fNIqwJDN96XAyWQCtbbTUZ0zpD2rZM+QgyVCD49w9KM/20H
         sIO0kul16DQwbx2oEsaxgwj9kW9XOq/VVZF0YkbfzMF06xnqDM4pfySY7tJeTi75fR23
         z6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DIELkt5tzjtkH7KmjmNSwzyiOLYn+YiDkF8Urcd6vko=;
        b=bLbLCEBjblLAgvSVqOBZlH4pdeW1TZTJisCgKYCrvP2UjvoKbLfs9gsCeG4oMSbLR3
         fxeZvenMxDitBTj0tjKb39E3G/RJ9XDfYOcAimfHx/FSLu+YfnabukjbCBp46JAVDbId
         AXK9PBVC9TDp1n72nXH0lj8lb4NOQclDT0qg+nojLz4oGoMnsP3Z+NwBY1kud2j6dyOe
         2KAjjkndyFd4DSb/2aerX1jj8FxKMiyMR8WhPXl345VbKC1nLh+/0oE8F7/6lZ5rShkV
         eJ7yfQWKL3LzKta4UYLIhzRAr/sFMbhJTnKt8G4i/QJUQESQsqwkOaZFqj+DINWPu5sz
         lZdg==
X-Gm-Message-State: AOAM530g5veZN37nyI35WX7PXjQpQcaxhhzc/MfObuTqtDa2lf7PdvJk
	mwzZNc3Rn5XfwCSlKthmiD4=
X-Google-Smtp-Source: ABdhPJwf2UsE9mQhYqL85pfltxjWCL24lNNPihjGZRaOik9Rcw13mUd98J4HbUorLXUoejk6Z2XcTw==
X-Received: by 2002:a17:90a:df12:: with SMTP id gp18mr6653412pjb.43.1610655363330;
        Thu, 14 Jan 2021 12:16:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:db81:2f56:60e4:2c64? ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id 193sm6181922pfz.36.2021.01.14.12.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 12:16:02 -0800 (PST)
Subject: Re: [OE-core][PATCH] fetch2: git: Append the password to the username on git URI reassembling
To: Joshua Watt <JPEWhacker@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Dominik Schmidt <ds@technokrat.ch>
References: <20210114161153.17719-1-JPEWhacker@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <ebf409f9-54d8-177d-a19f-3f7e3ad0a539@gmail.com>
Date: Thu, 14 Jan 2021 12:16:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210114161153.17719-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/14/21 8:11 AM, Joshua Watt wrote:
> From: Dominik Schmidt <ds@technokrat.ch>
> 
> This allows the users to specify SRC_URIs of the form
> git://user:password@host.tld/path/to/repo.git
> 
> which allows pulling in private repositories.
> 

will this appear in package metadata in rpms/ipks etc ?

> [YOCTO #14065]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   bitbake/lib/bb/fetch2/git.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
> index df9538a60d..a1356ed9f0 100644
> --- a/bitbake/lib/bb/fetch2/git.py
> +++ b/bitbake/lib/bb/fetch2/git.py
> @@ -606,7 +606,10 @@ class Git(FetchMethod):
>           # removing the password. ssh keys, ~/.netrc and ~/.ssh/config files can be used as
>           # alternatives so we will not take patches adding password support here.
>           if ud.user:
> -            username = ud.user + '@'
> +            username = ud.user
> +            if ud.pswd:
> +                username += ":" + ud.pswd
> +            username += "@"
>           else:
>               username = ""
>           return "%s://%s%s%s" % (ud.proto, username, ud.host, ud.path)
> 
> 
> 
> 
> 
