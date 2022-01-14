Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF08C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 09:30:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.5155.1642152634042048844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ppbp01II;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id c2so60988wml.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RBhiFtVSSCXmXUphcBolYtCA9lGICzRjw6B65s7oOcg=;
        b=Ppbp01II87McRvOoV5dGCa0goPjb2L1g9EKjvda9Cd2A7/yhl8d+gpI9noWkLL8iKh
         4cIDDHnxdz4MGYlnScuGp+HgX2AfK+5cCAcbJq+6UW04hc/jOSkKYkHi3sxycvX75ppb
         /0v7BNxG3t1rvRyN8HmNDCgWUTmZI8Ryd+Yto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RBhiFtVSSCXmXUphcBolYtCA9lGICzRjw6B65s7oOcg=;
        b=U0Hq1WiYOg7Oe21DobucLaQc7T0+gkPC8M9OBxFA9Z2m8f+TtP1NDowo62KKZ78UT3
         /lmDIAOnbpSs9cTA5r/W1HcR0Bu+HkvzCncLH0hGBN1wx+Ywt7fINq/kBpWp1BhohToG
         2o9w8HCAQZq37m72QsgU2j6F748pPW4v8qYGS7KvvedalW7nx/6WbZVf4P1WJzzyCtha
         Flr3QfUfWlUnYDiVIvNP+CR0CWRtjp8ViQ7AguWMV4uUPwWwCHhOMlAJ8J/2r0tBl5qU
         k9Zh20OpDcescJhkZDjZ6CuN1Ig9xwTM2HaOxyt2W0YSU9Ez+AnSvRwFdlEsDRo5N0UJ
         EIWg==
X-Gm-Message-State: AOAM532XMNxlDLTjF4TpxEzLgmg35b62ChE4a2sUuRqmyRNP2zvc6KAO
	1rATccpPfiRW3fzVz2M0B8p19A==
X-Google-Smtp-Source: 
 ABdhPJzMC6eLJjrBu38bta5k5PiEJlacOR/RcBrauwGA9M5mQs3/KJpZWtQQmDXvMd4xXr1Weh667Q==
X-Received: by 2002:a05:600c:a06:: with SMTP id
 z6mr14760740wmp.9.1642152632452;
        Fri, 14 Jan 2022 01:30:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b80b:58a:dabd:3794?
 ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 o12sm5798987wrc.69.2022.01.14.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 01:30:32 -0800 (PST)
Message-ID: 
 <e7af2d1bc07a34544fde79db8f181d002081da32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] wic: support 512 byte size granularity
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Igor Opaniuk <igor.opaniuk@foundries.io>,
	openembedded-core@lists.openembedded.org
Cc: mike@foundries.io, ricardo@foundries.io, tim.anderson@foundries.io,
	JPEWhacker@gmail.com
Date: Fri, 14 Jan 2022 09:30:29 +0000
In-Reply-To: <20220113222552.2811705-1-igor.opaniuk@foundries.io>
References: <20220113222552.2811705-1-igor.opaniuk@foundries.io>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 09:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160560

On Fri, 2022-01-14 at 00:25 +0200, Igor Opaniuk wrote:
> Since 938595d1dc("wic: Add 512 Byte alignment to --offset") wic
> parser supports "s"/"S" suffixes, that can be used to align partition
> on 512 byte boundary. Nevertheless, the minimum value of size is still
> 1Kb.
> 
> Introduce support for "s"/"S" suffixes for --size/--fixes-size.
> This is required for some SoCs (like i.MX8M/MM, where SIT image is
> stored on 0x8200, and actual boot image is at 0x8400).
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py      | 11 +++++++++++
>  scripts/lib/wic/ksparser.py              | 19 +++++++------------
>  scripts/lib/wic/plugins/imager/direct.py |  6 +++---
>  3 files changed, 21 insertions(+), 15 deletions(-)

Should there be some tests added to "oe-selftest -r wic" for this?

Cheers,

Richard


