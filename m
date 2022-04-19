Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF050C47084
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.2799.1650365869662306024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 03:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vpf+brSS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id w4so21873188wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=35hwtt9/zYlVDXoKaOIsDTpxogbiEOl94RZWUDdGOiU=;
        b=Vpf+brSSnSd/A3uUsDGvHGMOU6n2iGLRs3VftkXUTyAlX8R/EfCETGfSAmbuzXbjD+
         1HshZG6zSJce//l2niIeaRUT/8tHQn6o5R1K5t/+5n2Y4FMng+k5FXjQmJkzKMFCv1qV
         IdD/xgK5hSDUjpt+6jyxEklZSnpQfXYXG5cps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=35hwtt9/zYlVDXoKaOIsDTpxogbiEOl94RZWUDdGOiU=;
        b=OgJKAu0m9mubqr+AW1XZIpDI21xYxiqtJD8JGtNVJiOpPG1kPpcKgCvLthCUKYqnne
         TX2nA5J8YDLT9yMH/UOHLNy37idV3hphhcPn8P+/8IiwHS2lbsnWEEBopWxbIQQsP5Ph
         GoWM7xGePgnSUHmvp/kQRM0XtEapJVw0GjGC8tt7AqLNum0LqLmdRrT2GNOoT5jAtZwo
         HPhe1funfFSypLdx5SDuBdlfqAlu16stA9t9FcGNNwXWTdOTjcp5OstcUYRFWHPQTiax
         4S3ftF4y63MhTJRHzCun/KYL6aaFTOMXeVdYp1nWXZzVugU2yLCW192u+flkURLW43mx
         YJBw==
X-Gm-Message-State: AOAM531REJ7GKgAhg55P3yN/sMm/BOzaygr3TMxMTDbpK+Z5JWLphfY/
	X7a6Avc5IyYO6+L01Nx/Ai2dWw==
X-Google-Smtp-Source: 
 ABdhPJxnfbIsEwtCmN1s2pXjemRXljPWhsowDLgNM5WtDr37prtDDWACLuweRcehIRhSniAoTF7ifg==
X-Received: by 2002:adf:fe88:0:b0:20a:8e38:1255 with SMTP id
 l8-20020adffe88000000b0020a8e381255mr9305705wrr.218.1650365868056;
        Tue, 19 Apr 2022 03:57:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:224f:e0f5:68e1:5371?
 ([2001:8b0:aba:5f3c:224f:e0f5:68e1:5371])
        by smtp.gmail.com with ESMTPSA id
 b14-20020a7bc24e000000b003899c8053e1sm17475976wmj.41.2022.04.19.03.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 03:57:47 -0700 (PDT)
Message-ID: 
 <6f880050d15a2b07d1d9a6d766c5f74bd6f07772.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] sstate: reuse the localdata copy on the
 mirror thread pool
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2022 11:57:45 +0100
In-Reply-To: <20220419094616.433632-2-quaresma.jose@gmail.com>
References: <20220419094616.433632-1-quaresma.jose@gmail.com>
	 <20220419094616.433632-2-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164623

On Tue, 2022-04-19 at 10:46 +0100, Jose Quaresma wrote:
> We don't need a new copy of the bitbake data [localdata2] in each running
> thread of the pool.
> 
> We can do the copy on the startup of the thread pool in each thread worker
> and reuse it in each running thread, this is the same we did for the
> connection_cache which is reused by fetcher.
> 
> May be related with [YOCTO #14775] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

It is a standard coding practise where you're changing the data store and don't
want changes to persist, to use createCopy() on the datastore. It is fast and
cheap and I'm not sure we need to make this thread specific?

Was there a reason you thought we should change that to fix some specific issue?

Cheers,

Richard


