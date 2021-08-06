Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.2931.1628244157812909063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 03:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b96bBThI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so5712919wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3537v5HdIXbsg72fBd8J4yO39M54PljdpdvyaaWYJ/8=;
        b=b96bBThIA0ksm/ive47PXiv21abrcxTP/H1PldugIZHs+KceAlcOSr9DnXm9P1Zu+0
         Xv7ie7ttwoM9ktfOrOg45vGy4LFWdx0DcoiBAeleIbPa03+x/ZsqJxAzmCHIarcE/esF
         gntZEFgu62g/UQN5Lttt7ENwVRQAw8zaU/Ouw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3537v5HdIXbsg72fBd8J4yO39M54PljdpdvyaaWYJ/8=;
        b=NEm54OKhlhmtCmnmguACe7hJR9ytFUV/xecNgfeZlw/DXb/XDyCY/1Sd1BAzpHYjZU
         i/6JR8zwbOEtt5dJVr9EIYTL/zeaHqrCaFU6O/nDpWyr97QaO+q0YdKq2Sqdoz1qJv2A
         N2WTClawiY333yMYx+XrTUKtzD0o1Sl6s6DzuIqn7NvoN8tlWU869Wby7Qrh1OJU7cSD
         Sqj9dqvSJrkr2wQpk6MYPeFKDDDVSwz9MJMJawclfHgKG93E4iCK+Q2/AdhLO/TZ/h5P
         katVz86tm97soph+lkXC8jnORUmx71ENWGFo1ESqGdJt4IQlyIGjsqWN3Z4SmH8ibTIQ
         H/+g==
X-Gm-Message-State: AOAM531zn0WFt7au5wF5nWAGs81+jz62m0hiPT26JxAZOMi6u25xcGib
	ECkZjQkVceQ1PtLwz4vNYwVLEw==
X-Google-Smtp-Source: ABdhPJzeDBH9/ORarzmw/TKY+nEdHPhrhUkHqbldbeFtnG53ma9cMKpWaYdRO9tQeLvb++2kski0Bw==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr19213292wmb.178.1628244156262;
        Fri, 06 Aug 2021 03:02:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id n18sm9126013wrt.78.2021.08.06.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 03:02:36 -0700 (PDT)
Message-ID: <e4a85225a389df03ac9ceafa3387360af83be9aa.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC][PATCH][dunfell] wic: Add --use-stock-fstab option
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Daniel Gomez <daniel@qtec.com>, openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com, paul@pbarker.dev
Date: Fri, 06 Aug 2021 11:02:34 +0100
In-Reply-To: <20210806092337.81924-1-daniel@qtec.com>
References: 
	<f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
	 <20210806092337.81924-1-daniel@qtec.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-06 at 11:23 +0200, Daniel Gomez wrote:
> When embeddding rootfs image (e.g. 'rootfs-dir') as a partition we
> might want to keep the stock fstab for that image. In such case, use
> this option to not update the fstab and use the stock one instead.
> 
> This option allows to specify which partitions get the updated fstab
> and which get the stock fstab.
> 
> Example:
>     part /export --source rootfs --rootfs-dir=hockeycam-image
>     --fstype=ext4 --label export --align 1024 --use-stock-fstab
> 
>     part / --source rootfs --fstype=ext4 --label rootfs --align 1024
> 
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
> 
> The commit-id ce682a73b7447652f898ce1d1d0416a456df5416 reverted the
> functionality to restore the stock/original fstab file in a rootfs
> partition image (wic plugin).
> 
> Add back such functionality with an option to the user to select which
> fstab will be used for each partition by adding the --use-stock-fstab.
> In this case, the user will select whether or not the stock fstab will
> be updated or kept.
> 
> If you agree with the patch I'll adapt it to the master branch.

It seems reasonable to me. It would need to go to master first and
ideally we'd add some kind of test to oe-selftest -r wic (see 
meta/lib/oeqa/selftest/cases/wic.py).

Cheers,

Richard

