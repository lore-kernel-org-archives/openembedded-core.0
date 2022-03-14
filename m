Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B9DC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 13:38:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.26378.1647265117139134181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 06:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TELFcMa4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j17so24109637wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 06:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aMwLo6Vu43YR0lrK04WrVLZgT8hvQLIlja12b05kfbA=;
        b=TELFcMa4bqrIAhawWt6Kx49l8jOYcht10UWyNJ4FzqrY4KnrpO/PMZcxUA7FJwA+pc
         iMEZ4yIvdgnZs8K9g2CyRyANFFGqER58CwZqvVexPEpaSLcucWxXWlYfQtPAHHE43Xkz
         DAzTIVGUZJ1w5hUyGH7EA3pnMsUd2LLkUbZ5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aMwLo6Vu43YR0lrK04WrVLZgT8hvQLIlja12b05kfbA=;
        b=tsWCQpylJzwbqhDV8NFAExovYpO+rNZ7UOtoLMsQLX3pWk4I3wuZtyIFch/r21fjjA
         uyskBnxVIxYg8FvdrBdp+cq60x/Ni8nEcTCeLO3RqEtFnOSBl4BIAMr8vGXNtX+Cj8A5
         oQpC1rlM7YEtrpxA73CKS/kxXckbCOjFi6AlEvdN89S5I43twZUuIbzqDMxcm/1FRBsC
         KzNZIEV+MwcqbxV9yTKMYqd0w2glczawOS9TZhiUlrXgKI60SXQmeJz250wXQ+qswnya
         lu8kx8khcYm214vgC5/X/X3BkfFPE1kocZQ9kQPdFLN3ZGhNy3SBgyXMnJndknSXDEPl
         yA4Q==
X-Gm-Message-State: AOAM533s0M+A9GqsGQsLavz3PV8ileNKkwBlw6T+++W5VsDL/7KW2aSq
	4r+YwyiZ26Px9Hfan8BPyuCWEA==
X-Google-Smtp-Source: 
 ABdhPJwYyU0MiygCKiXCx0OxYQFWxTRReIrcHhQb5TjzkXv/QpNWWUodRa9cnJb1hYVBicB8e1zm0A==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id
 p15-20020adfba8f000000b001e94afb179bmr16964417wrg.57.1647265115584;
        Mon, 14 Mar 2022 06:38:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5edf:6bc1:541a:c26f?
 ([2001:8b0:aba:5f3c:5edf:6bc1:541a:c26f])
        by smtp.gmail.com with ESMTPSA id
 m2-20020adff382000000b001f022ef0375sm13320987wro.102.2022.03.14.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 06:38:35 -0700 (PDT)
Message-ID: 
 <e980e648dc47fd3f9566c05742bf82bd88cea461.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] re2c: backport of partial fix for
 CVE-2018-21232
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Davide Gardenal <davidegarde2000@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>, Steve Sakoman
	 <steve@sakoman.com>
Date: Mon, 14 Mar 2022 13:38:32 +0000
In-Reply-To: <20220314112006.478573-1-davide.gardenal@huawei.com>
References: <20220314112006.478573-1-davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 13:38:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163137

On Mon, 2022-03-14 at 12:20 +0100, Davide Gardenal wrote:
> Backport commits from the following issue (assigned CVE-2018-21232):
> https://github.com/skvadrik/re2c/issues/219
> 
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  .../re2c/re2c/CVE-2018-21232-1.patch          | 345 ++++++++++++++++++
>  .../re2c/re2c/CVE-2018-21232-2.patch          | 241 ++++++++++++
>  .../re2c/re2c/CVE-2018-21232-3.patch          | 154 ++++++++
>  .../re2c/re2c/CVE-2018-21232-4.patch          | 164 +++++++++
>  meta/recipes-support/re2c/re2c_1.0.1.bb       |   6 +-
>  5 files changed, 909 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
>  create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch

Is this for dunfell?

Cheers,

Richard


