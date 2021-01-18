Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.4164.1611012885344071477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 15:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C/StZE1R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q18so18018582wrn.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 15:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Jxa8YlvQG/wHi1ngao3diBg+c3dovU1EYwWdA5cp3yA=;
        b=C/StZE1RO8fKhZRO6uKcdpT0D81c44g54Chm2E4kR6ngZcVxa4xnk81TS+AEAi/ckp
         hrCFSpK7FoPDb/A2+UD2YDLM5C0jrS21nXy2XhaASRXJC0MguLj4uU0+C0IibuybqMtk
         7omCjVgdRIB8sENVGKBow43OXVUR4o4KKTV0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Jxa8YlvQG/wHi1ngao3diBg+c3dovU1EYwWdA5cp3yA=;
        b=nHV8o2Qc7iATw093ZDtcLrN5DHmWalXSV2jPF+bsnQjhowy89VN496y0ZI3zY0sbsD
         lPaIHP4niCiEuXwyu/gO7pdzU83Nb2kcXIgmIkUS5rIJgNbWbjAR1ByMmHXSrdZz2Fki
         9xD5mZHqQeQYGmQvtTKFMJPWoNLZETgzkjuxQsdlIzKBb4WdzTLz+A2iLWHKskIemDNZ
         xE/keBM3trmyJnCLY+KaenwN78nbJonOQGacQ7VCxHZk0wGIcP5OqzxYCZK7VWMj6IFG
         6b2v/TZYkd+dD64Mb0DmdyrjFyMP4CTSgAb6YLIJvTs0oHxkOjpoPnK6SvDJdykL569t
         SKCw==
X-Gm-Message-State: AOAM531bYLWKYI6i4qKB4FP0jRV5uXec3k8UX1EQf57QixBWDfr+w2iY
	kJJcxPDQmde3d/QvlhoQaRyptw==
X-Google-Smtp-Source: ABdhPJwh8mkOkKJtnGxMoqcCl2knhlF0K1CmsJYQIw2u7uxjo9aHJEQuKBfV0c+J0twIsDLQ4gjH3w==
X-Received: by 2002:adf:f081:: with SMTP id n1mr1605086wro.228.1611012883880;
        Mon, 18 Jan 2021 15:34:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id o8sm31532384wrm.17.2021.01.18.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 15:34:43 -0800 (PST)
Message-ID: <1ad7a514c13dacf9169e27e18f309b78ca5c3621.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 08/19] buildstats.bbclass: add functionality to collect build system stats
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2021 23:34:42 +0000
In-Reply-To: <d01d149f6cb6fb86b8fafd1424bd37682aa9e76b.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>
	 <d01d149f6cb6fb86b8fafd1424bd37682aa9e76b.1611009050.git.steve@sakoman.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-18 at 12:36 -1000, Steve Sakoman wrote:
> From: Sakib Sajal <sakib.sajal@windriver.com>
> 
> There are a number of timeout and hang defects where
> it would be useful to collect statistics about what
> is running on a build host when that condition occurs.
> 
> This adds functionality to collect build system stats
> on a regular interval and/or on task failure. Both
> features are disabled by default.
> 
> To enable logging on a regular interval, set:
> BB_HEARTBEAT_EVENT = "<interval>"
> BB_LOG_HOST_STAT_ON_INTERVAL = <boolean>
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats
> 
> To enable logging on a task failure, set:
> BB_LOG_HOST_STAT_ON_FAILURE = "<boolean>"
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats
> 
> The list of commands, along with the desired options, need
> to be specified in the BB_LOG_HOST_STAT_CMDS variable
> delimited by ; as such:
> BB_LOG_HOST_STAT_CMDS = "command1 ; command2 ;... ;"
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit edb7098e9e0a8978568a45057c1c3ad2c6cacd67)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/buildstats.bbclass | 40 ++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)

Not sure this is backport material. We should probably see how it goes
in master and try using it there first?

Cheers,

Richard

