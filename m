Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B1EC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 10:32:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.14071.1636713134134148604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 02:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tp+PXuHZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso6383145wme.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 02:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=V4lYbR6bwwv+IWehRgMbTdQt8gwYJo8fHL9LduviA8Q=;
        b=Tp+PXuHZVH9zkh0QMYiB4XmgX0B2GF5ZW65ZBwpUPq788uFRleRgnNRJVEa55DFL/i
         Hb7Az2U/f0mfl6Cl4MyscJ08jMRicZM8xGi3qxNIFc3u5StblICGTpWPm32mn81F8urj
         q/IHGJw62cB6odls1Ea8BECNVBHhKQwXL6NI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V4lYbR6bwwv+IWehRgMbTdQt8gwYJo8fHL9LduviA8Q=;
        b=LXgzwLOtS0c4H6N7RPL4IWg+DcDHpjrN5pOKhgrr8L9uqfQ8PM8fkY0Cs4gLP8NzaM
         yWhz1SKxG9e/pAdb8dyEISDgTvWsCdLRQIdNO7osQfTb4b/SzzmC0dkUlyK2pDJvrKhP
         TctLIuQ+r9QBD1JKR2Lgeq5+mRYygrsUKbbgav9gM6t1Qa2XHwHaonUrCQ5GqAtk64EK
         i9DEajmbQiF0hzZwvig30nIqd4x+5hpkzSV1tYr35xdKih3dm46jtHoTtekS5bbi9Htd
         Bj1/tENYElIetfomRMZhi6f4uQFbf0GOaMbv2u6x4gcg+eSz5Kygr1IMJp1ceOKKOIEO
         CLVg==
X-Gm-Message-State: AOAM530+6+EgVFFk7j5NXEr/lakQRpQBnC55s03lltetkBW7lgNKxKpJ
	BZgxbLa95KnktwB2JlBbjMusHg==
X-Google-Smtp-Source: 
 ABdhPJyD8Sju0t6imNty9SZOE4XeDEENHNaNY63NAZ1cIlFbiHIgN1LRWXqHu/EOLaCv1c8SEXxaug==
X-Received: by 2002:a05:600c:4f10:: with SMTP id
 l16mr16185982wmq.47.1636713132563;
        Fri, 12 Nov 2021 02:32:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0bd:72b4:105a:2914?
 ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 m14sm7552137wrp.28.2021.11.12.02.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 02:32:12 -0800 (PST)
Message-ID: 
 <896e6085c5f109c969a04ae65887bde5c0018ceb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: fix tabfiles-tags case failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Nov 2021 10:32:09 +0000
In-Reply-To: <20211112100333.13948-1-mingli.yu@windriver.com>
References: <20211112100333.13948-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 10:32:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158215

On Fri, 2021-11-12 at 18:03 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Pass "--use-system-commands" option when run tabfiles-tags case as
> we don't deploy the command under /usr/lib64/util-linux/ptest folder
> by default.
>  Fixes:
>  # cd /usr/lib64/util-linux/ptest/
>  # ./tests/ts/libmount/tabfiles-tags
>  [snip]
>  ./ts/libmount/../../functions.sh: line 652: /usr/lib64/util-linux/ptest/blkid: No such file or directory
>  FAILED (libmount/tabfiles-tags)'
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  ...-tags-add-use-system-commands-option.patch | 35 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch

I don't really want to carry a patch for this forever. Could we create a symlink
in do_install_ptest that handles this instead?

Also, why isn't isn't failure showing up on the autobuilder test runs?

Cheers,

Richard


