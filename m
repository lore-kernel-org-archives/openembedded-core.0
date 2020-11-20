Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.23828.1605870034422349766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 03:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bNQ7DfaF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id c198so8066646wmd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 03:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9I938NPlt6UbDayCnRIWB6Ju+4pzNeRI2UfS+Zu+5cQ=;
        b=bNQ7DfaFwZTtrwBTcl1QupocIkJW6nU7FL0HE5ZHXwqz1nWQd6w3ZoqcauH7j0NJTB
         Owl4uDpGHOSLRu6kNN9wyVUwwZmJ8JTf1NrTqTmWiegtWw2XNTVQfAAPkqknl89B/qSg
         b1yOEXlOej3k2R2WmffEyMhPq3tfQDZUhuf8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9I938NPlt6UbDayCnRIWB6Ju+4pzNeRI2UfS+Zu+5cQ=;
        b=Gu3/eggRJEqonQm7g9Eo1oA/66T62NLEgxAlRr/kr/JIQJTqwOEOy59EC3TRTQGElg
         ypZcTphTh31mD8aRnRpjmyqwpcaXrT/gyfVdmKOwMhyQmRP+hbtIy5+m8ZEiAT7JI2Ou
         eNDRLNpra8MDoGnryb8opZ5OV5RDgq4P2A5yJhzj5idEUlvgyGwKOa8ASHCJgmrVXYD5
         w2fuaL7BFKvyVz3tnLRQkgRZINdt12I3qPDwLUFhqAPK1qJuhkj5WUfUcBH2VV0xRvwS
         KC/SzTvFWOm9k4wWoAu8kUZhgShbHd89X6tpFssO4OEYV5gPegWB1lkPdAoWWW/14KPZ
         AjIQ==
X-Gm-Message-State: AOAM531p1n2WgbWhSC65HSgdqhTFIxW/qJbJx3ZB+S73mj5NRutw6T71
	1WAn6SjLwVeWyEBeRHhBKvQJVQ==
X-Google-Smtp-Source: ABdhPJxLPA+qqjYYBwE+xZ+EOduFXG/2DG9xhWl5eRB7DImdSneuivaHDRh5O/aUIuROH4Xa/PdTUg==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr9186094wmh.88.1605870032858;
        Fri, 20 Nov 2020 03:00:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id e1sm3896315wmd.16.2020.11.20.03.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 03:00:32 -0800 (PST)
Message-ID: <2eb614e4e90ed6e18a89c695401f922d2be6969d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] valgrind: helgrind: Intercept libc functions
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>
Date: Fri, 20 Nov 2020 11:00:29 +0000
In-Reply-To: <20201119183151.16752-1-stacy.gaikovaia@windriver.com>
References: <20201119183151.16752-1-stacy.gaikovaia@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-19 at 10:31 -0800, Stacy Gaikovaia wrote:
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> 
> PTH_FUNC definition needs to be modified in order to
> intercept posix thread functions in both libc and libpthread.
> In order to handle this in helgrind, weak alias the pthread functions in glibc.
> This also prevents any need for a special case for musl, where
> these definitions aren't duplicated.
> 
> See https://bugs.kde.org/show_bug.cgi?id=428909 for additional
> discussion.
> 
> Signed-off-by: Paul Floyd <paulf@free.fr>
> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> ---
>  ...01-helgrind-Intercept-libc-functions.patch | 45 +++++++++++++++++++
>  .../valgrind/valgrind_3.16.1.bb               |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
> new file mode 100644
> index 0000000000..b3ab329bd8
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
> @@ -0,0 +1,45 @@
> +From d02cafce8dd29df0309935beefbfbca1d8e29862 Mon Sep 17 00:00:00 2001
> +From: Paul Floyd <paulf@free.fr>
> +Date: Wed, 18 Nov 2020 12:49:20 -0400
> +Subject: [PATCH] helgrind: Intercept libc functions
> +
> +Signed-off-by: Paul Floyd <paulf@free.fr>
> +
> +PTH_FUNC definition needs to be modified in order to
> +intercept posix threa functions in both libc and
> +libpthread. In order to handle this in helgrind, weak alias
> +the pthread functions in glibc.
> +
> +Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>

The patch in OE needs an Upstream-Status which would be Submitted in
this case I guess. I've added as I queued the patch to save you
resubmitting, thanks for the fix.

Anuj: This should fix a ptest regression in gatesgarth that QA
highlighted at release.

Cheers,

Richard

