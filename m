Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.14885.1611078592186550862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ectvqn6t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id u14so532721wmq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kzUEOdrWJmX3NaBuleJSn++oKi4y4zZ2v+HebnH2RNc=;
        b=ectvqn6tqD7IdSZh8XGVepd7cuUvkLUhllge1qLhDOVeq5PZ6b4n8zImnuGSTYnGhO
         WnDhyZTpRRaEqJOrb7mkmLtGA8yADypxZrhvlNvQWknJOt/q5zeN8bZszn5KBEtFcaDm
         QTzYST9YACzST96QDYkiODprzfl/+a3kZw5F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kzUEOdrWJmX3NaBuleJSn++oKi4y4zZ2v+HebnH2RNc=;
        b=iP+TwNyJ03U41H2VFplJSBH6p+bi8z9JiqeyOD8gS9DJgYOESLUOrVbfQXKC13gV2G
         HZixMFUjrsWdcm/6cufEuXM4h0F6U0mCvO/gZDKQIcKCCiodGLR2oPHqjxvNHkkBqgsH
         hkpwSyrEue9XdpjrVTthj3CKywJek7fw9pZzObvxSM2PQYdNWyGknNKIy4Xh/wMobv37
         gDuNcsgzEQu02epvw1vizVl/xIBc6is3qUljunT7IEa5Zbq5ES/Xdx4vb4xcPD8HsNud
         Hiw+aZM0eK/pvw2EcUQeHkAekXJ4OlIxshwj2Vc+H1Pd+RA6cpwwiOoOtousiSgy1i0d
         JFNA==
X-Gm-Message-State: AOAM530f4HjweiHKDkqEQJ5AP1CIToKoOic6ObpyUQCtuQ7cbecl5WEw
	XdrzO06r9dOfyjUCDfelowZlpw==
X-Google-Smtp-Source: ABdhPJxKtlb/3ETr2uEpbCAprHWlWxYClIp0BizsxWq8I7f2wJxRZKieAKgszh1P549dCfuajPV3hw==
X-Received: by 2002:a1c:1b48:: with SMTP id b69mr697474wmb.95.1611078590619;
        Tue, 19 Jan 2021 09:49:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id q63sm5730370wma.43.2021.01.19.09.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:49:50 -0800 (PST)
Message-ID: <107314c0428cf791bc195dd27d3cfe11bb9a4c3e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: Fix source extraction for gcc shared source
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 17:49:47 +0000
In-Reply-To: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
References: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 16:53 +0100, Tomasz Dziendzielski wrote:
> If do_patch task is disabled then prepare do_configure dependencies to
> fetch external sources and create symlink to ${S} in devtool workspace.
> 
> [YOCTO #13036]
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  .../gcc/gcc-shared-source.inc                 |  1 +
>  scripts/lib/devtool/standard.py               | 30 ++++++++++++++++---
>  2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> index aac4b49313..9ef80f2074 100644
> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> @@ -2,6 +2,7 @@ do_fetch() {
>  	:
>  }
>  do_fetch[noexec] = "1"
> +do_patch[noexec] = "1"
>  deltask do_unpack
>  deltask do_patch

This is in itself a little odd. The "deltask do_patch" line deletes the
task, so there is no task to set as noexec?

Cheers,

Richard


