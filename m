Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web09.688.1603314741874325145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 14:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DIz2Q6gp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d81so3543478wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=B+56ppcGSvBOp+in7NOiY2QElizb/lJwJ+h4wdZspQw=;
        b=DIz2Q6gpmBBDJchTpv+RX9oMRYgs9VUPv0rt7TWY/q6DD5XstxD66HV2RwmyRdDoiT
         w1hrcYe1eu5ZztOIXDPfBwMHBZ2JgHnh8XIYLkRJ4rKRbq4nEm+ovIiGs09DHgxupZB1
         WI8IJq5IntbZVtz4esqY/XlFwxPDy+sjW/Q8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=B+56ppcGSvBOp+in7NOiY2QElizb/lJwJ+h4wdZspQw=;
        b=XgL6hS81zsneSZ3AWWe7V2wC1ywa+IVeWUNzsCMEWDMAkmEwWvXx+m9j4bok5NsJ/8
         qVMqFijYU064bTN7WEiG1mHPZrxpVx9wyETY9LU22Lqby6QYXkin3M7SolDx5wZ2uxdy
         Na44ad+ld1GDLrbOEtkkM+SjpS0JiHHABey543m8JbVnbDNsrrEV6f443IiBEOZa3j8X
         u3soh5fxaup6c9oaoXqthWcPxZRN+mFGg8nbp8zPwIEJGnX077Sp0ylR8U3lz2W4D+z/
         ZSreQ0cKt3wQ+cBdcJsv7/LhGZoOL8uQATHIBkm8FmZk5WlzqBH45rt1uEUYtioTI/ld
         qw2Q==
X-Gm-Message-State: AOAM531bvBN9UsSw4xTN2M2q4gohDp4lReDETsekMwy7OVUt02pxPcdr
	YZ/jMLbQxyP0zKaOMgWz1OaBnA==
X-Google-Smtp-Source: ABdhPJy1zYhg5WaQrATTqmlJmAa/ECGRy/uH87SL/Qyl/Mx1XOKFktPI1w/im5UCpoxFEam9bWaO9w==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr5432117wmi.127.1603314740471;
        Wed, 21 Oct 2020 14:12:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f1f8:2967:87fb:6241])
        by smtp.gmail.com with ESMTPSA id y7sm5257873wmg.40.2020.10.21.14.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:12:20 -0700 (PDT)
Message-ID: <d5ea6aa20bab3286b4a372e01418a5cbddd79653.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC][PATCH] buildstats-summary-native: add bbclass for tracking native sstate reuse
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2020 22:12:18 +0100
In-Reply-To: <20201021193009.3279776-1-trevor.gamblin@windriver.com>
References: <20201021193009.3279776-1-trevor.gamblin@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 15:30 -0400, Trevor Gamblin wrote:
> buildstats-summary doesn't distinguish between native and non-native
> sstate reuse, where native sstate reuse in particular may be useful to
> track when sharing sstate caches across multiple target architectures.
> We can tweak buildstats-summary and add a buildstats-summary-native
> bbclass that is more explicit in reporting sstate reuse, as well as
> making the output more readable for parsing by other scripts.
> 
> Note that (as far as my tests have gone, anyway) do_package* tasks
> haven't had any native reuse at all, so that result should always
> be zero unless something has gone horribly wrong.
> 
> An example, where core-image-full-cmdline has been built after the
> sstate-cache has been filled by a core-image-minimal build:
> 
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: native from source 5 of 139 (96.4% sstate reuse), target from source 35 of 161 (78.3% sstate reuse), 300 total
> NOTE:   do_deploy_source_date_epoch: native from source 5 of 139 (96.4% sstate reuse), target from source 36 of 162 (77.8% sstate reuse), 301 total
> NOTE:   do_package_qa: native from source 0 of 0 (0% sstate reuse), target from source 37 of 159 (76.7% sstate reuse), 159 total
> NOTE:   do_package: native from source 0 of 0 (0% sstate reuse), target from source 37 of 37 (0.0% sstate reuse), 37 total
> NOTE:   do_packagedata: native from source 0 of 0 (0% sstate reuse), target from source 37 of 159 (76.7% sstate reuse), 159 total
> NOTE:   do_package_write_rpm: native from source 0 of 0 (0% sstate reuse), target from source 37 of 159 (76.7% sstate reuse), 159 total
> NOTE:   do_populate_lic: native from source 5 of 139 (96.4% sstate reuse), target from source 37 of 165 (77.6% sstate reuse), 304 total
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

I'm probably ok with adding something like this but I don't think its
generally usable for people and that will probably lead to confusion.

Why? Its a wall of numbers which are useful when examining a particular
problem you happen to be working closely with at the moment but which
aren't particularly helpful under other circumstances.

Its also confusing as there is no mention of "already existed in the
build directory" here for tasks which didn't need to rerun at all.

The reason do_package* don't have native versions is that those tasks
do not exist for native recipes. That does mean about 33% of the screen
real estate you're using for the message is effectively useless :/.

I could then be really awkward and ask how hash equivalence matching
fits into this report? :) I ask that just to highlight there are a ton
of numbers we could show, but knowing which information the user is
looking for is actually really hard :(.

Cheers,

Richard

