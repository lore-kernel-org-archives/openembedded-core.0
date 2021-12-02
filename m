Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B037BC433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 23:16:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4669.1638486991596218521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 15:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ETWMVfAy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id l16so1865038wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 15:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xVOOsRsQpxW0VsB3pbGNJbf4uaaU73Q4SORu8fjLnXY=;
        b=ETWMVfAyMnfiiRMltIHQEkRXbOFeVHocPNJYmZIewGrKv4O/WprqJE7bpb8u9nDax+
         fCKxmULykq5CJr9GtpiPQdgj6+pq+zfFrrvOd1SGWowzF4qb2V1V8eQlxvTPv6GJOqIY
         x1bnNIJ2uiT35fymilbuIRAEveX1d1MKayYs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xVOOsRsQpxW0VsB3pbGNJbf4uaaU73Q4SORu8fjLnXY=;
        b=xJHaXRwg0/cDG459wvbd7uxSdX8abaGySuUuVl9Tq6DbJ/iDTiX5YrmCe2AEN37ol4
         Xl1RSGakl9p/Ol5AZJ3YK8ElXKn+iNwtz2gLqSS40SL0lP59b1GQ6lMLCxABpdVOLAJz
         FpxRZMczKLMHGz4NRZXwbg8BiR/2iqCV5S+SfdMnFwAoGDiPXoD2c3u29YYfEzLf/gqx
         p8dPaJtjCPn7zHNv2G4LplCboxBsvpNwpgZxf+OrOHhKWICgwrvc1wiNuRhzWuMkz/92
         +Ucxedqg1ZVvpAF9HdGi+eXNZTtcJ+VBGlm/KhLuqTCr9fiKDm6MLHXWbVvSlcre4gj1
         s83A==
X-Gm-Message-State: AOAM530aJqb0Y/5J4EDqnQmQq1P6bbtu4V7IRT2d9zWSloi4gMTZw3Hp
	DKeX4j+Tf4Cd7xgMygL27J9nOg==
X-Google-Smtp-Source: 
 ABdhPJyIhXxF73OKqr5R1bkXZOgzV2vmSc9dg23TOnt3eO7k8E40UAmb8vM4YmXDc8Zu729HznGURw==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr16629894wru.89.1638486989973;
        Thu, 02 Dec 2021 15:16:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:99d4:2d39:57c3:1ae0?
 ([2001:8b0:aba:5f3c:99d4:2d39:57c3:1ae0])
        by smtp.gmail.com with ESMTPSA id
 j18sm4350871wmq.44.2021.12.02.15.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 15:16:29 -0800 (PST)
Message-ID: 
 <4ba740e7876974703d351f941eaf2e67cc3688e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] sstate: don't limit the thread pool size
 when checking mirrors
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Dec 2021 23:16:27 +0000
In-Reply-To: <20211202220517.2106590-1-quaresma.jose@gmail.com>
References: <20211202220517.2106590-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 23:16:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159109

On Thu, 2021-12-02 at 22:05 +0000, Jose Quaresma wrote:
> This improves the time needed to check the mirrors,
> reducing it from 50s to 8s when building the core-image-minimal
> using the yocto upstream sstate and hashequivlance servers
> on a machine with 8 cpu cores.
> 
> Tested with:
> 
>  SSTATE_MIRRORS = "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
>  BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
>  bitbake core-image-minimal
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0326d27c74..5e404d7cd8 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1005,7 +1005,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>              tasklist.append((tid, sstatefile))
>  
>          if tasklist:
> -            nproc = min(int(d.getVar("BB_NUMBER_THREADS")), len(tasklist))
> +            nproc = len(tasklist)
>  
>              progress = len(tasklist) >= 100
>              if progress:

No, we're not doing that. That opens a ton (thousands) of parallel connections
to the servers and isn't fair on the systems hosting the data. In many cases
that would look like a DoS attack.

Cheers,

Richard




