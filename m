Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.1378.1610699854187698202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 00:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RDqB8Q/i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id d13so8352224wrc.13
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=17/MAwevzibV5GMBLcc2uCslgLuKH9EzqB0bx+N2cM8=;
        b=RDqB8Q/ie6yaStkW3uOgeIOO79f7nQNKte3PDXbcUtWoPaieqPHGb8HN7jofUn49lY
         yWG8ZJfsstcx8XygNDf9zJ3b11rjU7Msk4LfpDW7v6R9Yb4x0Zmd1cqA8x0eq0Ndqbpo
         PvmR+9TJGec1euRRbzkeQXWvY2tfqrXGazy0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=17/MAwevzibV5GMBLcc2uCslgLuKH9EzqB0bx+N2cM8=;
        b=fOENRJRagqgDIg/DuIQtCm+hICUolWA00xCfE9lohJXx+X5yCHu+eiw9ekckiut+hw
         KU3/0LcJ4dLC0z8KF1VnGT/WC0QZIhFMPpRMK3wKXkgQZjwk52Pk9oLDuEJIxc3BU6e5
         8i/JY5hh3dbEr5wfX5moizf7iexYlusnshK2ocWjE/cqfyBRK7E/566cM7ivKneuzFb6
         BHVfg7vtMLZIi+YhDWK7o7SuOy3g5kKZFLjFLonc0B9FjcQ36JXflFuasUW8VO+T5Ijv
         7q65uvBCMNwlafAT9/j0jW6aeTjmJabL7HzYo5oQw/8VFvpzMIfsujH2KiTWGtiD63wg
         vQBQ==
X-Gm-Message-State: AOAM533CFCFrbZZMwnZl0qw/iG1KQ5uEKl7A+PnlixlWaZqCW28BPyVr
	a9/XjqElXjdC7k6qkvWtKj5oPg==
X-Google-Smtp-Source: ABdhPJy7JsDTJxIK/M3IMySQntek77UyHfy2xSz41ajnkxf1pxfTIhW69PichsGj/Q9D3XeGLsWYTA==
X-Received: by 2002:a05:6000:1088:: with SMTP id y8mr7694347wrw.380.1610699852454;
        Fri, 15 Jan 2021 00:37:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id x18sm15917625wrg.55.2021.01.15.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 00:37:31 -0800 (PST)
Message-ID: <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
Date: Fri, 15 Jan 2021 08:37:28 +0000
In-Reply-To: <20210115052615.29893-1-paul.gortmaker@windriver.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> Recent systemd started using ascii args to "hidepid=" mount options
> for proc fs - unconditionally -- even though kernels older than v5.8
> emit an error message on each attempt:
> 
> root@qemux86-64:~# cat /proc/version
> Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> root@qemux86-64:~# dmesg|grep proc:
> [   29.487995] proc: Bad value for 'hidepid'
> [   43.170571] proc: Bad value for 'hidepid'
> [   44.175615] proc: Bad value for 'hidepid'
> [   46.213300] proc: Bad value for 'hidepid'
> root@qemux86-64:~#
> 
> Simply ignoring them as the systemd maintainer unconditionally says
> is the resolution is clearly not acceptable, given the above.
> 
> Add a kernel version check to avoid calling mount with invalid args.
> Further details are within the enclosed systemd commit.
> 
> Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> new file mode 100644
> index 000000000000..65e7eca32d05
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> @@ -0,0 +1,126 @@
> +From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Date: Wed, 13 Jan 2021 21:09:33 +0000
> +Subject: [PATCH] proc: dont trigger mount error with invalid options on old
> + kernels
> +
> +As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core: introduce
> +ProtectProc= and ProcSubset= to expose hidepid= and subset= procfs
> +mount options") kernels older than v5.8 generate multple warnings at
> +boot, as seen in this Yocto build from today:
> +
> +     qemux86-64 login: root
> +     [   65.829009] proc: Bad value for 'hidepid'
> +     root@qemux86-64:~# dmesg|grep proc:
> +     [   16.990706] proc: Bad value for 'hidepid'
> +     [   28.060178] proc: Bad value for 'hidepid'
> +     [   28.874229] proc: Bad value for 'hidepid'
> +     [   32.685107] proc: Bad value for 'hidepid'
> +     [   65.829009] proc: Bad value for 'hidepid'
> +     root@qemux86-64:~#
> +
> +The systemd maintainer has dismissed this as something people should
> +simply ignore[1] and has no interest in trying to avoid it by
> +proactively checking the kernel version, so people can safely assume
> +that they will never see this version check commit upstream.
> +
> +However, as can be seen above, telling people to just ignore it is not
> +an option, as we'll end up answering the same question and dealing with
> +the same bug over and over again.
> +
> +The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
> +systemd 247 and above plus kernel v5.7 or older will need this.
> +
> +[1] https://github.com/systemd/systemd/issues/16896
> +
> +Upstream-Status: Actively hostile

The status needs to be

Upstream-Status: Denied [Actively hostile https://github.com/systemd/systemd/issues/16896]

(so our tools have an idea of what status patches are in)

https://wiki.yoctoproject.org/wiki/Best_Known_Methods_(BKMs)_for_Package_Updating#Patch_Comments

Cheers,

Richard


