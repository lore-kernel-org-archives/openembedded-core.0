Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7011DC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 23:17:35 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.973.1641597454121720942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g9CGZ7NU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id q8so13738243wra.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5j6xkHUo0N6/fPz0zzqXeodZXWunkUGdLCHHkPmUQdw=;
        b=g9CGZ7NUW9D/CY0YdY464WqgEnLegAmwLV2MwBRKYJJ12rNZ8jrBFSOeZxSm5fHWiy
         D35Lyx03oU+jqcACo63KTn0ae4Q5TGd4mPFbycSHNwcySam2Dwo2RYesk16jnSxlg56j
         Bn249lrmfC4Xt0tWGcFYkkaYowB7KvMrC1oyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5j6xkHUo0N6/fPz0zzqXeodZXWunkUGdLCHHkPmUQdw=;
        b=Cpgdbf4zh27Jxx1ZaitGO+QvNmlfd9Hjd7vO2QZS8qRquiLZzt11wI/8kaiJ/ks0YQ
         GUmSMoPH0cMRQTtXgLnrMhgXhRJPBRyXcLdZddfWtVVhs2ae+mTIb6mEsRILU9wvibDL
         b9WYdVRnBrr5/GeX8sHmSL8ZH+cWPlbwnadffFpO9sDFvgjFgcDW8kGEcCCFoWsRqpgj
         WlzteKQQu90D1MVabDDxexXAGtGVnRnHBnCu2mmYC1VTw3tFnjHdPy1Z/2bgcZ8gmISV
         3PRu7iuzy+iB3J3e28vQcBwkWYVddn80erBlIAhEUvnI0v6t3JBcTXj/oxb8MrORoryH
         CE8A==
X-Gm-Message-State: AOAM533zel/ix3tGRCnCQEgZzxXFEOeSZpZcskL8CQuKIW7zgJMd4uPL
	M+O0y24t5/SYD5bE9QuWohgPGACWcQR81A==
X-Google-Smtp-Source: 
 ABdhPJz/5iYdqQEMr2GW/5QvYVXh091GJut+c20yEIR5k1lt9TZh76w2t4Wjq3RlRAfqONVhawZsng==
X-Received: by 2002:a5d:6d0a:: with SMTP id
 e10mr54569076wrq.327.1641597452615;
        Fri, 07 Jan 2022 15:17:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82?
 ([2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82])
        by smtp.gmail.com with ESMTPSA id c7sm72247wri.21.2022.01.07.15.17.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:17:32 -0800 (PST)
Message-ID: 
 <9939e5e346e6f543f065a52d06dbfa4e017f0d69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: Only allow network in existing
 network accessing code
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 07 Jan 2022 23:17:30 +0000
In-Reply-To: <16C8200D7F471EEB.16815@lists.openembedded.org>
References: <16C8200D7F471EEB.16815@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 23:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160272

On Fri, 2022-01-07 at 23:15 +0000, Richard Purdie via lists.openembedded.org
wrote:
> Use the newly added network task flag against tasks where network
> access is expected. This is do_fetch, do_checkuri, do_testimage, do_testsdk
> and do_testsdkext.
> 
> We can't disable networking in sstate tasks due to sstate downloads and
> also so we can report hash equivalence to the server so network access
> is enabled in sstate tasks.
> 
> Access within build-appliance do_image is also allowed due to the use
> of pip, this is a poor example made rather obvious now and needs to be reworked.
> 
> Network access anywhere else in any other task isn't allowed.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass                                | 1 +
>  meta/classes/sstate.bbclass                              | 2 ++
>  meta/classes/testimage.bbclass                           | 1 +
>  meta/classes/testsdk.bbclass                             | 2 ++
>  meta/classes/utility-tasks.bbclass                       | 1 +
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 ++
>  6 files changed, 9 insertions(+)

This patch (and corresponding bitbake patches) does the opposite of the previous
version, it uses a network flag which allows network access in a task and
network access is otherwise disabled. I've shared it since several people
requested this form of patch instead of the other.

I think this version may be easier to "abuse". It does highlight the rather poor
design choices to support toaster in build-appliance.

Cheers,

Richard


