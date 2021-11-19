Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137CFC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 10:36:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.7125.1637318200444803594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GOAMPFr5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u1so17303148wru.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=a02n2weNeIPI+vMN5bbyDJY1Mq2IFWxSF7J727urJbE=;
        b=GOAMPFr5ZGegM9SxuGVWuqq6Am8GEXmT9Ysk3ryGoKDZbREzJshAnBNwyVVjmS/VRk
         lTiQkLnXbZS3DKMf2lTAqWU2S4ljag8zMlpD15jfN2m6edECVai5MHeSSixbMn/qWvFd
         loW9bmEZ3rRFTuxBb12a1EM+tHb3byfNdRXbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=a02n2weNeIPI+vMN5bbyDJY1Mq2IFWxSF7J727urJbE=;
        b=kd0P5t8tdF2SlXFr6untN4XF3hILDgJ0y8E5I61e1uaNOXiPzP3ErMNhw2GNqd5Q/W
         5D1iYTidJQkpC00T7rHJoiGxv8tbieAl7/FgzTL+J6fCYDgvb3gR9VyechnKMVKQTNZc
         I7VJxUYCBTwk/6QEt0s/6bmb7LCEx+C1OBNCjrG4iGl7rfpuU8k8nzlz/uV/eibgyeaU
         S+3bTQVofMclXv2Bj5qKoSojSMyJ3BxKoQUuHwm48lwd3MMTEBDvTNocuCg1OM46ZANU
         jqCKXA5j4He59/DoegOJszyPUlPGGA7sIlQeeLHoWnLFp7wIjYLYG3iG1UKyWkyn/cDw
         D0iQ==
X-Gm-Message-State: AOAM530JyUZe4cuiEgkxK6thAy/wXctWsMa8ov/Tv22P0DbJiFqNWOLK
	mWE27ktzYZ+0Io7aLJDXsiEbhw==
X-Google-Smtp-Source: 
 ABdhPJxtUOMm+3VN6L6xphf1waF/Ab4mye4xLykSmeZXnKwQnpQZQ5SeSxejNRgdAM+Vz7NXtayvzQ==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr6253939wrp.20.1637318198850;
        Fri, 19 Nov 2021 02:36:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:423a:6c9:d9d0:129f?
 ([2001:8b0:aba:5f3c:423a:6c9:d9d0:129f])
        by smtp.gmail.com with ESMTPSA id
 u15sm2911632wmq.13.2021.11.19.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 02:36:38 -0800 (PST)
Message-ID: 
 <48a9d317343b09d0ccb0d791617ef4582643765b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: fix regression from
 FILES_INFO changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Nov 2021 10:36:36 +0000
In-Reply-To: <20211117010634.GI13720@codepurple>
References: <20211117010634.GI13720@codepurple>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 10:36:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158502

On Tue, 2021-11-16 at 17:06 -0800, S. Lockwood-Childs wrote:
> Started getting a stack trace during packagedata task for a
> recipe that built fine in hardknott
> 
>  *** 0002:buildhistory_emit_pkghistory(d)
>      0003:
> File: 'meta/classes/buildhistory.bbclass', lineno: 313, function: buildhistory_emit_pkghistory
>      0309:            pkginfo.filevars[filevar] = localdata.getVar(filevar) or ""
>      0310:
>      0311:        # Gather information about packaged files
>      0312:        val = localdata.getVar('FILES_INFO') or ''
>  *** 0313:        dictval = json.loads(val)
>      0314:        filelist = list(dictval.keys())
>      0315:        filelist.sort()
>      0316:        pkginfo.filelist = " ".join([shlex.quote(x) for x in filelist])
>  ...
>  Exception: json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)
> 
> which turns out to mean FILES_INFO is undefined for the main package built by
> this recipe (FILES_INFO lookup for other packages such as -dev seemed to work fine).
> 
> Tracked the regression down to this commit:
>     package/scripts: Fix FILES_INFO handling
>     OE-Core rev: a1190903e0a61a12c9854c96af918ae8d12c6327
> 
> If buildhistory.bbclass uses the same per-package syntax to read
> FILES_INFO as package.bbclass uses now when setting it, then
> this regression goes away.
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta/classes/buildhistory.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 7c44fec2d1..99300ab431 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -309,7 +309,7 @@ python buildhistory_emit_pkghistory() {
>              pkginfo.filevars[filevar] = localdata.getVar(filevar) or ""
>  
>          # Gather information about packaged files
> -        val = localdata.getVar('FILES_INFO') or ''
> +        val = localdata.getVar('FILES_INFO:%s' % pkg) or ''
>          dictval = json.loads(val)
>          filelist = list(dictval.keys())
>          filelist.sort()

Which revision of the project are you seeing that on? This shouldn't be needed
since a number of lines above there it says:

        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)

i.e. pkg is in OVERRIDES and therefore FILES_INFO should be FILES_INFO:pkg if
that is set.

I think this is masking some other issue and isn't the correct fix.

Cheers,

Richard





