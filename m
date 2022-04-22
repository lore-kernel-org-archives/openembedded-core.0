Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE625C54F3B
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.8008.1650630936527716190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 05:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ct1SdL/z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id h25so4833977wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Q1G6fUJmEhrsi58YeF+Xt+nE66cCgoeamx1oqtHa9xg=;
        b=ct1SdL/zjgUBF4WqTlPLi5ATIOG9GYF6jsFZ0+n+qMMYWEeOmIor72Qpixife/nc6N
         ScSxyjAFu9C/UeAL0hXbfSJLx3mZg5ZJDX4kNRwH85qxQAGR5+LCv6lRlRY2/Kj8E+4E
         lSFmhe/VU7e1+5ZYBZLgWOxF4TpOgxuUeewOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Q1G6fUJmEhrsi58YeF+Xt+nE66cCgoeamx1oqtHa9xg=;
        b=AJCjnC/YxCAvrtG1eFfK6aMs96DXN6CTsHGu+vuLmv9EqyefaOuQU/7AGLBUvrpVdK
         RM5311ftwzQi55tDukGCfbAb/+FzHd5LFiOswTHZGi+8CYPn6hR87L83+AUd2YubJ1he
         6b4wHxDwOlR5kES7ueLZpBQ/09WJEcRucNphhjNp/68zG0LXnkWBny5pMBOaYI3AauQa
         17UA1L6SFAsNj6CWi/GYSgjr1qwB+JMiBc0/iyGIIFJJM/pc7CeNpe1rJsmFtLwYsA7U
         xIgiSnSVh29oXT3lRkaedrA3Fdk4SlM1fd9b2eWfZgrdeiPQCP8Dyyc/QKUcQEHmLMGO
         A9zg==
X-Gm-Message-State: AOAM532pWFO6FAOXUw/CLu96uq+NpmoJGArXR1vohpTytmjlBDkXjHoQ
	RzXYMbjUcrlRJeaYPOVkFgKSng==
X-Google-Smtp-Source: 
 ABdhPJxV+LibGLJeVSKGJPHFSR95uKwteQYs20BthPdMjFoPxN/LIE/+9kacxqfXY46gG98AaG7TlA==
X-Received: by 2002:a5d:4e07:0:b0:207:9a41:842f with SMTP id
 p7-20020a5d4e07000000b002079a41842fmr3579456wrt.232.1650630935097;
        Fri, 22 Apr 2022 05:35:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e?
 ([2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a5d6c6e000000b0020a9f757708sm2001775wrz.33.2022.04.22.05.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 05:35:33 -0700 (PDT)
Message-ID: 
 <29824cc1ce9b51dfada9fe8aeae12dca8124b6dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] Fix permissions when splitting rootfs
 folders across partitions.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Felix Moessbauer <felix.moessbauer@siemens.com>,
	openembedded-core@lists.openembedded.org
Cc: jan.kiszka@siemens.com, henning.schild@siemens.com,
	adriaan.schmidt@siemens.com
Date: Fri, 22 Apr 2022 13:35:32 +0100
In-Reply-To: <20220421160543.2718864-1-felix.moessbauer@siemens.com>
References: <20220421160543.2718864-1-felix.moessbauer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164790

On Thu, 2022-04-21 at 18:05 +0200, Felix Moessbauer wrote:
> This patches ensures that the file database containing the file and
> folder usernames and permissions is always located relative to the
> source and not to the appended rootfs-dir.
> 
> Prior to this patch, the database was not found when using -rootfs-dir
> in the WIC script, leading to erronous file permissions and ownership.
> 
> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> ---
>  scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As well as fixing the test failure, for future reference the shortlog for this
also needs to read something like:

wic/plugins/rootfs: Fix permissions when splitting rootfs folders across partitions

just so we can easily see which area of the code a change is related to.

Cheers,

Richard


